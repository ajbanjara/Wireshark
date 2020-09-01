# Character encodings

A character string is a sequence of "code points" from a character set. It's represented as a sequence of octets (bytes) using a particular encoding for that character set, wherein each character is represented as a 1-or-more-octet subsequence in that sequence.

A given sequence of octets doesn't necessarily correspond to the same character string in all encodings.  Most character set encodings are based on ASCII and encode the 128 code points of ASCII as a single octet whose value is the code point value.  For example, the code point value for the letter 'A' is decimal 65, or hexadecimal 41 (0x41), so, in most of these character set encodings, the letter 'A' is encoded as a single octet with the value 0x41.

The main exceptions are:

- variants of IBM's [EBCDIC](https://en.wikipedia.org/wiki/EBCDIC) encoding, which is incompatible with ASCII, so that, for example, the code point value in EBCDIC is 0xC1;

- national variants, other than the US variant, of the [ISO 646 standard](https://en.wikipedia.org/wiki/ISO/IEC_646), which is mostly ASCII-based, but which reserves a small set of code point values, such as the ASCII code points for '#' and '$', for assignment to different characters in different national variants, such as the British national variant, which assigns the code point value 0x23 to '£' rather than to '#' (the US national variant is ASCII);

- UTF-16, which is ASCII-based, but in which each character is represented as one or two *2*-octet subsequences, and its subset UCS-2, in which each character is represented as one 2-octet subsequence;

- UTF-32, which is ASCII-based, but in which each character is represented as a *4*-octet subsequence.

In Wireshark, EBCDIC and the ISO 646 variances are used only when dissecting packets from protocols using those character encodings, so, in places other than dissectors, only ASCII-based encodings are used.

ASCII is sufficient for most strings in US English, but is *not* sufficient for languages other than English (for example, German, which requires, among other characters, the "lower case 'u' with umlaut" character 'ü), and even for English in other countries (for example, it does not include the '£' character, so it does not suffice for the United Kingdom).

Thus, various extensions were made to ASCII.

Until the development of [Unicode](https://en.wikipedia.org/wiki/Unicode), there was no single extended version of ASCII that could be used in all cases.  There were, instead, both proprietary extensions of ASCII, such as the [HP Roman](https://en.wikipedia.org/wiki/HP_Roman) encodings and the [Mac Roman](https://en.wikipedia.org/wiki/Mac_OS_Roman) encoding, and standard extensions, such as the [ISO 8859](ISO/IEC 8859) encodings, the [JIS X 0208](https://en.wikipedia.org/wiki/JIS_X_0208) encoding for Japanese, the [GB 2312](https://en.wikipedia.org/wiki/GB_2312) encodings for Simplified Chinese, and the [KS X 1001](https://en.wikipedia.org/wiki/KS_X_1001) encodings for Korean.

All of those encodings are based on ASCII and encode the 128 code points of ASCII as a single octet whose value is the code point value.

The Unicode project started, as an attempt to devise a single encoding to handle all characters, in the late 1980's, and released the first Unicode standard in 1991. It is also ASCII-based, with the first 128 code points of Unicode having the same value as the ASCII code point values for the same characters.  It was originally intended to be a 16-bit character encoding, in which every character was encoded as 2 octets.  However, the Unicode developers realized that there would eventually be more than 65536 code points, and came up with a mechanism to allow that, reserving some 16-bit values for use as "surrogate pairs", where a surrogate pair can be used to represent code point values not fitting in 16 bits.

Furthermore, adding support for 16-bit character encodings in systems that had traditionally used character encodings with multi-octet sequences for non-ASCII characters, such as most UN\*X systems, would have been difficult, so extensions to ASCII in which ASCII characters are encoded as a single octet with its value being the code point value of that ASCII character were devised; the one currently being used is UTF-8.

The ASCII-based encodings Wireshark has to handle in filenames and other strings supplied by and provided to the underlying operating system, as well as in packets in a network capture, include:

  - Pre-Unicode encodings, often referred to as "code pages":  Non-ASCII characters are represented as a single octet with the 8th bit set in "single-byte character sets", which are used for most languages using a small alphabet; for example, the ISO 8859-1 code point for the German lower case 'u' with umlaut 'ü' is a single byte with the value 0xFC. Non-ASCII characters are represented as two bytes in "double-byte character sets", which are used for Chinese, Japanese, and Korean scripts.  Some "multiple-byte character sets" are also used for Asian scripts, which use more than two bytes for some or all non-ASCII characters. These have the big disadvantage of being ambiguous between code pages (the same sequence of octets has different meanings in different code pages), which means, for example, that a file name viewed on a system using a code page different from the one on which the file was created will not show up as the file's creator intended, unless the file name contains only ASCII characters. These encodings were used for quite a while in the past; they are being replaced by encodings of Unicode, which do not have that problem,
  - UTF-8 (Unicode): ASCII characters are encoded as a single byte containing the 7-bit ASCII code for the character; all other characters are encoded by multiple bytes with their most significant bit set. UTF-8 will need between 1-6 bytes for each character, depending on the char itself (most used chars will usually need fewer bytes). This encoding is more and more used on UN*Xes and applications for UN*Xes.
  - UTF-16 / UCS-2 (Unicode): Most characters used for text are encoded as two byte values. All other characters, including many emoji, are encoded in four bytes. Those encoding are predominantly used in Windows, although some libraries used in UN*Xes also use it.  These encoding has the main disadvantage that ASCII characters are encoded as two octets, one of which has the value 0x00, which classically indicates the end of a string, so common functions like strcpy() cannot be used to work with UTF-16/UCS-2. The UCS-2 encoding is used by Windows NT 3.1 through 4.0 for the wide char functions; Windows 2000 and above use UTF-16. UCS-2 can handle only characters in the Basic Multilingual Plane (BMP) of Unicode; UTF-16 handles characters outside the BMP by encoding them as a "surrogate pair" of 2 2-byte code points.
  - UTF-32 / UCS-4 (Unicode): Using 4 bytes for each character, not widely used. They are two names for the same encoding.

## External references

[UTF-8 and Unicode FAQ for Unix/Linux (including macOS and the BSDs)](http://www.cl.cam.ac.uk/~mgk25/unicode.html)

[The Absolute Minimum Every Software Developer Absolutely, Positively Must Know About Unicode and Character Sets (No Excuses\!)](http://www.joelonsoftware.com/articles/Unicode.html)

[Wikipedia article about Unicode](http://en.wikipedia.org/wiki/Unicode)

[Wikipedia article about UTF-8](http://en.wikipedia.org/wiki/UTF-8)

[Wikipedia article about UTF-16 and UCS-2](http://en.wikipedia.org/wiki/UTF-16/UCS-2)

[Wikipedia article about UTF-32 and UCS-4](http://en.wikipedia.org/wiki/UTF-32/UCS-4)
