# Filename Encoding

The various character encodings that are possible for filenames can be quite confusing.

## Character encodings

Character encoding: a specific byte order represents a specific character. For the classical ASCII character encoding, one byte represents a specific character unambiguously (and when I remember correct, ASCII only specifies the chars 0-127, so only 7 bits are actually needed).

The problem starts, as several languages need special characters not available from ASCII, e.g. to encode the German lower case 'u' with umlaut 'ü'. Obviously many other characters are needed as there are many languages out there.

Some possible encodings of non-ASCII characters:

  - (currently selected) system code page (e.g. ISO 8859-1): basically the same as ASCII.  Non-ASCII characters are represented as a single byte with the 8th bit set in "single-byte character sets", which are used for most languages using a small alphabet; for example, the ISO 8859-1 code point for the German lower case 'u' with umlaut 'ü' is a single byte with the value 0xFC. Non-ASCII characters are represented as two bytes in "double-byte character sets", which are used for Chinese, Japanese, and Korean scripts.  Some "multiple-byte character sets" are also used for Asian scripts, which use more than two bytes for some or all non-ASCII characters. System code pages have the big disadvantage of being ambiguous between code pages (the same character code has different meanings in different code pages). These encodings were used for quite a while in the past, it's slowly being replaced as a the interpretation of a string in one code page may be different from its interpretation in a different code page, so that a file name viewed on a system using a code page different from the one on which the file was created will not show up as the file's creator intended, unless the file name contained only ASCII characters.
  - UTF-8 (Unicode): ASCII characters are encoded as a single byte containing the 7-bit ASCII code for the character; all other characters are encoded by multiple bytes with their most significant bit set. UTF-8 will need between 1-6 bytes for each character, depending on the char itself (most used chars will usually need fewer bytes). This encoding is more and more used on UNIX based systems and applications.
  - UTF-16 / UCS-2 (Unicode): Most characters used for text are encoded as two byte values. All other characters, including many emoji, are encoded in four bytes. This encoding has the main disadvantage, that e.g. the ASCII characters will contain a 0x00 in each character, which classically indicating the end of a string, so common functions like strcpy() cannot be used to work with UTF-16/UCS-2. The UCS-2 encoding is used by Windows NT 3.1 through 4.0 for the wide char functions; Windows 2000 and above use UTF-16. UCS-2 can handle only characters in the Basic Multilingual Plane (BMP) of Unicode; UTF-16 handles characters outside the BMP by encoding them as a "surrogate pair" of 2 2-byte code points.
  - UTF-32 / UCS-4 (Unicode): Using 4 bytes for each character, not widely used. They are two names for the same encoding.

## GLib filenames

Until GLib 2.6, the filenames were kept in the code page encoding. This is easy to implement, but unfortunately the char codes are ambiguous, so there's a problem if you have currently selected a japanese code page and want to read a file with a "french filename".

Since GLib 2.6, the char encoding of the filenames splitted into:

  - Win32: using UTF-8 encoding everywhere, but need to use e.g. g\_open() instead of open() where filenames are handed over to GLib, see: <http://www.gtk.org/api/2.6/glib/glib-File-Utilities.html>

  - UNIX: uses UTF-8 encoding by default; for UNIX systems still using code pages, the encoding can be adjusted with the "G\_FILENAME\_ENCODING" environment variable, see: <http://www.gtk.org/api/2.6/glib/glib-Character-Set-Conversion.html>

This requires the following changes compared to GLib versions prior to 2.6:

  - all calls to file operations with filename parameters must use the corresponding GLib functions: e.g. open() -\> g\_open()

  - Win32: filenames from the "outside" must be converted to UTF-8 (e.g. environment settings, command line parameters, ...)

As the GTK+ standard widgets in question (e.g. gtk\_file\_chooser) will work internally with the correct filename encoding, there's no need to change things here.

## Wireshark

Wireshark gets filename input from several points:

  - Open/Save/... dialogs: uses the GLib filename encodings

  - command line parameters: locale encoded (Win32 & GLib\>2.6: converted to UTF-8 while reading)

  - environment settings: getenv() locale encoded (Win32 \>= NT & GLib\>2.6: converted from \_wgetenv() UCS-2 to UTF-8 while reading)

  - Preferences/Recent files: GLib filename encodings (might contain locale encodings until next save, no conversion done)

I currently don't know if encoding conversions are done properly on all (especially old) \*nix versions. - *[UlfLamping](/UlfLamping)*

## External references

[UTF-8 and Unicode FAQ](http://www.cl.cam.ac.uk/~mgk25/unicode.html)

[The Absolute Minimum Every Software Developer Absolutely, Positively Must Know About Unicode and Character Sets (No Excuses\!)](http://www.joelonsoftware.com/articles/Unicode.html)

[Wikipedia article about Unicode](http://en.wikipedia.org/wiki/Unicode)

[Wikipedia article about UTF-8](http://en.wikipedia.org/wiki/UTF-8)

[Wikipedia article about UTF-16 and UCS-2](http://en.wikipedia.org/wiki/UTF-16/UCS-2)

[Wikipedia article about UTF-32 and UCS-4](http://en.wikipedia.org/wiki/UTF-32/UCS-4)

---

Imported from https://wiki.wireshark.org/Development/FilenameEncoding on 2020-08-11 23:12:48 UTC
