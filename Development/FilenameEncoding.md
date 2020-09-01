# Filename Encoding

The various character encodings that are possible for filenames can be quite confusing; see ["Character Encodings"](/Development/Character-encodings) for encodings that can be used in file names both as stored on a file system and as used in file access APIs used by Wireshark.

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
