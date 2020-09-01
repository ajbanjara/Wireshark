# String Handling

(Much but not all of the content of this page is taken directly from [Guy's email](https://www.wireshark.org/lists/wireshark-dev/201401/msg00177.html) to the wireshark-dev mailing list.)

Character strings can use various encodings to represent characters, such as system code pages, UTF-8, and UTF-16; see [Character encodings](/Development/Character-encodings) for details about those encodings.
 
String handling in many applications is relatively straightforward. A library is used for reading/writing text in the locale-appropriate encoding, and everything is handled in Unicode (usually UTF-8) internally. Wireshark doesn't get things quite so easy.

The primary problem is that Wireshark has to be able to gracefully process and handle invalid strings in all sorts of encodings. If a packet contains a malformed string in some obscure encoding, Wireshark has to be able to flag it as such and then continue processing that packet. We're not there yet.

This page is half proposal, half documentation for how Wireshark's string handling engine does or ought to work. Much of the contents came from discussions on the wireshark-dev mailing list (such as [this one](https://www.wireshark.org/lists/wireshark-dev/201401/msg00177.html) or [this one](https://www.wireshark.org/lists/wireshark-dev/201310/msg00260.html)) and on bugzilla bugs like [this one](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8382).

If you have questions, suggestions or ideas on this topic, please send an email to the <wireshark-dev@wireshark.org> mailing list.

## First Principles

A character string is a sequence of code points from a character set. It's represented as a sequence of octets using a particular encoding for that character set, wherein each character is represented as a 1-or-more-octet subsequence in that sequence.

In many of those encodings, not all subsequences of octets correspond to code points in the character set. For example:

  - the 8-bit encoding of ASCII encodes each code point as an octet, and octets with the uppermost bit set don't correspond to ASCII code points;
  - the 8-bit encodings of "8-bit" character sets encode each code point as an octet and, in some of those character sets, there are fewer than 256 code points, and some octet values don't correspond to code points in the character set;
  - UTF-8 encodes each Unicode code point as 1 or more octets, and:
      - an octet sequence that begins with an octet with the uppermost bit set and the bit below it clear is invalid and doesn't correspond to a code point in Unicode;
      - an octet sequence that begins with an octet with the uppermost two bits set, and where the 1 bits below it indicate that the sequence is N bytes long, but that has fewer than N-1 octets-with-10-at-the-top following it (either because it's terminated by an octet that doesn't have 10 at the top or it's terminated by the end of the string), is invalid and doesn't correspond to a code point in Unicode;
      - an octet sequence doesn't have the two problems above but that produces a value that's not a valid Unicode code point is invalid and (by definition) doesn't correspond to a code point in Unicode;
  - UCS-2 encodes each code point in the Unicode Basic Multilingual Plane as 2 octets (big-endian or little-endian), and not all values from 0 to 65535 correspond to Unicode code points (see next item...);
  - UTF-16 encodes each Unicode code point as 2 or 4 octets (big-endian or little-endian), with code points in the Basic Multilingual Plane encoded as 2 octets and other code points encoded as a 2-octet "leading surrogate" followed by a 2-octet "trailing surrogate" (those are values between 0 and 65535 that are \*not\* Unicode code points; see previous item), and:
      - a leading surrogate not followed by a trailing surrogate (either because it's followed by a 2-octet Unicode code point value or because it's at the end of the string) is not a valid UTF-16 sequence and doesn't correspond to a code point in Unicode;
      - a trailing surrogate not preceded by a leading surrogate (either because it's at the beginning of the string or because it's preceded by a 2-octet Unicode code point value) is not a valid UTF-16 sequence and doesn't correspond to a code point in Unicode;
      - a leading surrogate followed by a trailing surrogate that gives a value that's not a valid Unicode code point is invalid and (by definition) doesn't correspond to a code point in Unicode;
  - UCS-4 encodes each Unicode code point directly as 4 octets (big-endian or little-endian), and any value that corresponds to a surrogate or a value larger than the largest possible Unicode code point value is invalid and doesn't correspond to a code point in Unicode;

etc..

## Wireshark String Use Cases

Strings in Wireshark are:

  - displayed to users, either directly in the packet containing them as part of the packet summary or detail, or indirectly, for example, by being stored as a pathname or pathname component for a file and shown in packets referring to the file by some ID rather than by pathname;
  - matched by packet-matching expressions (display filters, color filters, etc.);
  - processed internally by dissectors and taps (whether in C, Lua, or some other language);
  - handed to other programs by, for example, "tshark -T fields -e ...".

In all of these cases, we need to do *something* with the invalid octet sequences.

### Displayed to Users

In the display case, invalid octet sequences should be displayed as a sequence of \\xNN escape sequences, one octet at a time. Non-printable characters are an orthogonal issue; they \*can\* be represented in our UTF-8 encoding of Unicode, but they shouldn't be displayed in the UI as themselves. They should also be replaced, when displaying, with escape sequences:

  - for code points \>= 0x80, display them as a \\uXXXXXX escape sequence (whether to trim leading zeroes, and how many of them to trim, is left as an exercise for the reader; probably trim no more than two leading zeroes, but I'm not sure what to do if there's only one leading zero) - note that this won't show the value(s) of the octet(s) that make up the code point, it'll show the Unicode code point;

  - for 0x7F and most code points \< 0x20, display them either as \\uXX, \\xXX, or \\ooo (whether to stick with Traditional Octal(TM), hex, or Unicode is left as an exercise for the reader);

  - for the characters that have their own C string escape sequences (e.g., tab, CR, LF), I'd display them as that escape sequence

(For the future, we might want to have the "value", in a protocol tree, of a string be a combination of the encoding and the raw octets; if some code wants the value for processing purposes, it'd call a routine that converts the value to UTF-8 with REPLACEMENT CHARACTER replacing invalid sequences, and if it wants the value for display purposes, it'd call a routine that converts it to UTF-8 with escape sequences replacing invalid sequences \*and\* with non-printable characters shown as the appropriate escape sequence.

That raises the question of whether, when building a protocol tree, we need to put the value into the protocol tree item at all if the item is created with proto\_tree\_create\_item(), or whether we just postpone extracting the value until we actually need it. Lazy processing FTW....)

### Packet-Matching Expressions

When using a string field in a packet-matching expression:

  - *all* comparison operations in which a string value from the packet is compared with a constant text string should fail if the string has invalid octet sequences (so 0x20 0xC0 0xC0 0xC0, as a purportedly-UTF-8 string, is neither equal to nor unequal to " " or "hello" or....);

  - comparison operations in which a string value from the packet is compared with an octet string (comparing against something such as 20:c0:c0:c0) should do an octet-by-octet comparison of the raw octets of the string (so 0x20 0xC0 0xC0 0xC0, no matter what the encoding, compares equal to 20:c0:c0:c0);

  - equality comparison operations between two string values from the packet succeed if either
    
    1.  the two string values are valid in their encoding and translate to the same UTF-8 string or
    2.  the two string values have the same encoding and have the same octets.

In addition, there should be a monadic function "valid" which takes a string field and returns a boolean whether or not the string contains any invalid octet sequences.

Again, non-printing characters is an orthogonal question. Users should be able to specify both C-style escapes ("\\n", etc) and unicode escapes (\\uXXXX) in string comparison constants. This means that if you want to match a literal "\\" and you're typing in the shell, you need to type "\\\\\\\\" for all the escapes to process correctly. Yuck.

### Internal Processing

In the "processed internally" case, if the part of the string that's being looked at contains an invalid octet sequence, the processing should fail, otherwise the processing should still work. For example, an HTTP request beginning with 0x47 0x45 0x54 0x20 0xC0 should be treated as a GET request with the operand being invalid, but an HTTP request beginning with 0x47 0x45 0x54 0xC0 should be treated as an invalid request.

### Exporting to Other Programs

There seem to be two probable use cases:

  - the program is interested in the raw bytes, in which case that's what we should send; if the string isn't valid, the reading program will deal with it
  - the program is interested in the string, in which case we should send it in the locale-appropriate encoding (most frequently UTF-8) with invalid sequences mapped to the encoding-appropriate replacement character

These two should cover 99% of cases I can think of with relatively minimal effort on our part. The second should be default, since the most frequent case of "other program" is probably "stdout of a shell" or "text file".

## API Design

### Invalid Sequences

The functions that get strings from packets should not map invalid octet sequences to a sequence of \\xNN escape sequences, as that would interfere with proper handling of the string when doing packet matching and internal processing. For those cases, perhaps a combination of

1.  replacing invalid sequences with REPLACEMENT CHARACTER and
2.  providing a separate indication that this was done

would be the right thing to do. However, this throws away information, so that you can't *display* that string with the invalid sequences shown as \\xNN sequences.

For now, my inclination is to continue with the "replace invalid sequences with REPLACEMENT CHARACTER in tvb\_get\_string\* routines" strategy, but not treat that as the ultimate solution.

### Buffer Length

Functions get strings either by length (tvb\_get\_string) or by stopping on the first null-terminator (tvb\_get\_stringz). When fetching by length, the function passes along embedded nulls as-is. This leads to a small problem though, since there is no other way to reliably determine the size of the returned buffer (if the input is a non-UTF8 encoding that may include code points beyond the basic set, it is impossible to predict the number of bytes taken by the UTF-8 encoding of that string).

Therefore, the tvb\_get\_string function should eventually be converted to return a counted string (wmem\_strbuf\_t).

---

Imported from https://wiki.wireshark.org/Development/StringHandling on 2020-08-11 23:13:08 UTC
