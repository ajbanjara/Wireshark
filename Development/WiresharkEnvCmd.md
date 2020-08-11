## Windows Environment Setup

**This page is only valid for nmake builds, i.e. 1.12.x or earlier and has no relevance for CMake builds, i.e. 2.0.x and later.**

This script adds entries to the PATH environment variable that make it easier to develop Wireshark under Windows. It assumes that

You're running Wireshark from the top-level source directory.

You've checked out the [wireshark-win32-libs](http://anonsvn.wireshark.org/wireshark-win32-libs/) Subversion repository into C:\\wireshark-win32-libs, and that you've initialized it by running "nmake -f makefile.nmake setup". Cygwin is installed in C:\\cygwin. You have [Debugging Tools for Windows](http://www.microsoft.com/whdc/devtools/debugging/default.mspx) a.k.a. windbg.exe installed.

To use this script, simply copy the code below into a batch or command file (I use "wsenv.cmd") and run it at the beginning of your development session.

    @echo off
    echo Adding things to the path...
    set WIRESHARK_DEV_PATH=.
    set PATH=%PATH%;%WIRESHARK_DEV_PATH%\wiretap
    set PATH=%PATH%;%WIRESHARK_DEV_PATH%\epan
    set PATH=%PATH%;c:\wireshark-win32-libs\glib\bin
    set PATH=%PATH%;c:\wireshark-win32-libs\gtk+\lib
    set PATH=%PATH%;c:\wireshark-win32-libs\gtk2\bin
    set PATH=%PATH%;c:\wireshark-win32-libs\adns-1.0-win32-04\adns_win32\lib
    set PATH=%PATH%;c:\wireshark-win32-libs\pcre-6.3\bin
    set PATH=%PATH%;c:\wireshark-win32-libs\zlib123-dll/
    set PATH=%PATH%;c:\wireshark-win32-libs\gettext-runtime-0.13.1\bin
    set PATH=%PATH%;c:\wireshark-win32-libs\libiconv-1.9.1.bin.woe32\bin
    set PATH=%PATH%;c:\cygwin\bin
    set PATH=%PATH%;"c:\Program Files\Debugging Tools for Windows"
    
    echo Setting up Visual Studio environment...
    "c:\program files\microsoft visual studio\vc98\bin\vcvars32.bat"

Note: With Wireshark Revision 14259 (post 0.10.10) the new target "install-deps" is available. By calling "nmake -f makefile.nmake install-deps" all files which are neccessary to run wireshark are copied to the source tree, instead of adding entries of their location to the PATH environment variable. Having called "nmake -f makefile.nmake install-deps", you should use the following script instead.

    @echo off
    echo Adding things to the path...
    set PATH=%PATH%;c:\cygwin\bin
    set PATH=%PATH%;"c:\Program Files\Debugging Tools for Windows"
    
    echo Setting up Visual Studio environment...
    "c:\program files\microsoft visual studio\vc98\bin\vcvars32.bat"

## Discussion

0.10.11 is now some months ago. Remove the first script completely and add the line "nmake -f makefile.nmake install-deps" to the second script? - *[UlfLamping](/UlfLamping)*

If you run "nmake -f makefile.nmake install-deps", you have to remember to re-run it each time you change the code, otherwise you end up with stale DLLs. E.g., if you change a dissector and recompile Wireshark, the older "./libwireshark.dll" will take precedence over the newer "epan/libwireshark.dll". This has cause me a little confusion and consternation, so I prefer the first script. -- *[GeraldCombs](/GeraldCombs)*

*[Appending cygwin\\bin to the end of the path may not be the prefered option. Because the make files use several cygwin tools, you may get unexpected behavior if you have similar named tools on your path. If the make files do not run, try an alternate environment where Cygwin tools take precedence by prepending to the path:](/GeraldCombs)*

*[set PATH=c:\\cygwin\\bin;%PATH%](/GeraldCombs)*

*[GeraldCombs](/GeraldCombs)*

---

Imported from https://wiki.wireshark.org/Development/WiresharkEnvCmd on 2020-08-11 23:13:26 UTC
