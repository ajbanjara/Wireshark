# Filename Encoding

The various character encodings that are possible for filenames can be quite confusing.

## Character encodings

Character encoding: a specific byte order represents a specific character. For the classical ASCII character encoding, one byte represents a specific character unambiguously (and when I remember correct, ASCII only specifies the chars 0-127, so only 7 bits are actually needed).

The problem starts, as several languages need special characters not available from ASCII, e.g. to encode the German lower case 'u' with umlaut 'ü'. Obviously many other characters are needed as there are many languages out there.

Some possible encodings of non-ASCII characters:

  - (currently selected) system code page (e.g. ISO-8859-1): basically the same as ASCII, some code points above 127 have special meanings which are selected by the current system code page, e.g. for the German lower case 'u' with umlaut 'ü'. (XXX - mention double-byte character sets here?) This has the big disadvantage of being ambiguous between code pages (the same character code has different meanings in different code pages). This encoding was used for quite a while in the past, it's slowly being replaced as its char codes are not ambiguous.
  - UTF-8 (Unicode): Most characters are encoded as 7 bit ASCII, the special characters are encoded by multiple bytes with their most significant bit set. UTF-8 will need between 1-6 bytes for each character, depending on the char itself (most used chars will usually need fewer bytes). This encoding is more and more used on UNIX based systems and applications.
  - UTF-16 / UCS-2 (Unicode): Most characters are encoded as two byte values. Some rare characters are again encapsulated into even more bytes. This encoding has the main disadvantage, that e.g. the ASCII characters will contain a 0x00 in each character, which classically indicating the end of a string, so common functions like strcpy() cannot be used to work with UTF-16/UCS-2. The UCS-2 encoding is used by Windows NT (and above) for the wide char functions. UCS-2 can handle only characters in the Basic Multilingual Plane (BMP) of Unicode; UTF-16 handles characters outside the BMP by encoding them as a "surrogate pair" of 2 2-byte code points.
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
