# Filename Encoding

The various character encodings that are possible for filenames, command line arguments, environment variables, and other strings provided by, or provided to, system and C-language APIs used by Wireshark can be quite confusing; see ["Character Encodings"](/Development/Character-encodings) for encodings that may be used in those strings.

## UN*X

In UN*X systems (Linux, macOS, the BSDs, Solaris, etc.), Wireshark currently assumes all such strings are encoded in UTF-8, and that the locale uses UTF-8 as its encoding; all Wireshark programs initialize the C-language locale to the default, early in the main routine, by calling `setlocale(LC_ALL, "")`.

## Windows

In Windows, most system and C-language APIs have two variants, one of which accepts or supplies strings in the current "ANSI code page" and one of which accepts or supplies strings in UTF-16-encoded Unicode.  Wireshark attempts to use the UTF-16 variants when possible, with wrapper routines that translate between the UTF-8 strings used inside Wireshark and the UTF-16 strings used in the APIs, so that Unicode is fully supported.

All Wireshark programs initialize the C-language locale to use UTF-8, early in the main routine, by calling `setlocale(LC_ALL, ".UTF-8")`.  See [the "UTF-8 Support" section](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/setlocale-wsetlocale?view=vs-2019#utf-8-support) of [the Microsoft documentation for Visual C's `setlocale()` routine](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/setlocale-wsetlocale?view=vs-2019).  This causes the "ANSI code page" versions of all routines in the C runtime support to accept and supply strings encoded in UTF-8.

That change was originally made in order to fix [bug 16649](https://gitlab.com/wireshark/wireshark/-/issues/16649).

We do *not* change the "ANSI code page" to UTF-8 (code page 65001), as [that will cause `more /?` to fail on Windows 7](https://twitter.com/geraldcombs/status/876145159343292416); the UTF-8 code page is not well supported on older versions of Windows.

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

---

Imported from https://wiki.wireshark.org/Development/FilenameEncoding on 2020-08-11 23:12:48 UTC
