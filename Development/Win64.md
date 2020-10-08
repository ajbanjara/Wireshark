Wireshark 1.2.0 introduced official support for 64-bit Windows. This requires extra care when writing code for Wireshark, as described below.

# ILP32, LP64, and LLP64

32-bit UN\*X platforms, and 32-bit Windows, use the ILP32 data model. 64-bit UN\*X platform use the LP64 data model; however, 64-bit Windows uses the LLP64 data model. If you assume that long ints and pointers have the same number of bits, you're in trouble:

| Data model | char | short | int | long | long long | pointers | OSes                                                               |
| ---------- | ---- | ----- | --- | ---- | --------- | -------- | ------------------------------------------------------------------ |
| ILP32      | 8    | 16    | 32  | 32   | 64?       | 32       | Windows, Linux, Solaris, macOS, \*BSD, AIX, HP-UX, other UN\*Xes   |
| LP64       | 8    | 16    | 32  | 64   | 64        | 64       | Linux, Solaris, macOS, \*BSD, AIX, HP-UX, other UN\*Xes, \!Windows |
| LLP64      | 8    | 16    | 32  | 32   | 64        | 64       | Windows                                                            |

# sizeof(size\_t) \!= sizeof(int) and sizeof(size\_t) \!= sizeof(long)

We use int and size\_t interchangeably in a lot of places. Other compilers may not care, but this breaks compilation in Visual C++ (2008, at least). This also can cause problems on LP64 platforms - most objects won't be of a size \> 2^31-1, but printing a size\_t can't always be done with %d or %u. Using long and size\_t interchangeably may work on LP64 platforms, but it doesn't work on LLP64 platforms such as Win64.

GLib documents "gsize" and "gssize" data types, and offers G\_GSIZE\_MODIFIER, G\_GSSIZE\_FORMAT, and G\_GSIZE\_FORMAT \#defines; if they're supported by all the versions of GLib that we support, if we use "gsize" instead of "size\_t" and "gssize" instead of "ssize\_t", and use G\_GSIZE\_FORMAT and G\_GSSIZE\_FORMAT to print them, that should handle that problem.

# Compiling for Win64

In order to compile 64-bit applications in Visual C++ you must set your target appropriately. Instead of running `Microsoft Visual Studio 9.0\VC\bin\vcvars32.bat` as specified in the [Developer's Guide](http://www.wireshark.org/docs/wsdg_html_chunked/ChToolsMSChain.html#id4740240) you must set up your environment using `Microsoft Visual Studio 9.0\VC\vcvarsall.bat`. According to [an Howto on MSDN](http://msdn.microsoft.com/en-us/library/9yb4317s\(VS.80\).aspx) you must install the .NET Framework SDK if you are using Visual C++ Express Edition.

You must also set the WIRESHARK\_TARGET\_PLATFORM environment variable to "win64" in order to enable 64-bit support in Wireshark's makefiles. You might want to do this in a batch script in order to save some typing, e.g.

    @echo off
    echo Adding things to the path...
    
    set WIRESHARK_TARGET_PLATFORM=win64
    
    echo Setting up Visual Studio environment...
    call "c:\Program Files\Microsoft Visual Studio 9.0\VC\vcvarsall.bat" x86_amd64
    
    title Command Prompt (VC++ 2008 / 64)

Setting WIRESHARK\_TARGET\_PLATFORM=win64 tells Wireshark's makefiles to download libraries from the "wireshark-win64-libs" SVN repository instead of "wireshark-win32-libs", and to use the libraries defined in the Win64 portion of config.nmake.

The Win64 build uses the [Microsoft Visual C++ 2008 SP1 Redistributable Package (x64)](http://www.microsoft.com/downloads/details.aspx?familyid=BA9257CA-337F-4B40-8C14-157CFDFFEE4E&displaylang=en) to install necessary CRT DLLs. You **must** download it yourself and place it in c:\\wireshark-win64-libs. You should probably run the installer on your development machine as well.

# Libraries

Not all of the libraries we use have Win64 versions.

| Library             | Win64 support?                                                                               |
| ------------------- | -------------------------------------------------------------------------------------------- |
| GLib/GTK+           | [Yes](http://ftp.gnome.org/pub/GNOME/binaries/win64/)                                        |
| [WinPcap](/WinPcap) | Yes                                                                                          |
| [AirPcap](/AirPcap) | Yes                                                                                          |
| Zlib                | Yes? (compiled locally)                                                                      |
| c-ares              | Yes                                                                                          |
| GeoIP               | Yes                                                                                          |
| PCRE/GRegex         | Yes (GRegex)                                                                                 |
| GNUTLS              | [Yes](http://download.opensuse.org/repositories/windows:/mingw:/win64/openSUSE_11.2/noarch/) |
| Kerberos            | Yes (since Wireshark 1.99.1)                                                                 |
| Lua                 | Yes                                                                                          |
| Portaudio           | Unknown (compiled and linked locally)                                                        |
| Gettext             | [Yes](http://ftp.gnome.org/pub/GNOME/binaries/win64/dependencies/)                           |
| LIBSMI              | Yes                                                                                          |

See the [Win64 README.txt](http://anonsvn.wireshark.org/viewvc/trunk/README.txt?root=Wireshark-win64-libs&view=log) file for the change history of when Wireshark got support for various libraries.

# Links

[Introduction to Win32/Win64](http://technet.microsoft.com/en-us/library/bb496995.aspx)

[Chapter 1: Introduction to Win32/Win64](http://msdn.microsoft.com/en-us/library/3b2e7499.aspx)

[Why did the Win64 team choose the LLP64 model?](http://blogs.msdn.com/oldnewthing/archive/2005/01/31/363790.aspx)

[64-Bit Programming Models](http://www.unix.org/version2/whatsnew/lp64_wp.html)

# Comments

---

Imported from https://wiki.wireshark.org/Development/Win64 on 2020-08-11 23:13:25 UTC
