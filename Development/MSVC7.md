# Building Wireshark using Microsoft VC 7 and above

**The info on this page is now ****obsolete**; none of the compilers listed here are still used to build Wireshark releases or supported by the Wireshark build process. [Section 2.2 "Win32/64: Step-by-Step Guide"](https://www.wireshark.org/docs/wsdg_html_chunked/ChSetupWindows.html) in the [Wireshark Developer's Guide](https://www.wireshark.org/docs/wsdg_html_chunked/) contains detailed information on building Wireshark with newer versions of Visual Studio.**

This page describes how Wireshark can be compiled with recent Microsoft compilers (Version 7 and higher):

  - Visual C++ .NET 2002 (C++ 7.0)

  - Visual C++ .NET 2003 (C++ 7.1)

  - Visual C++ .NET 2005 (C++ 8.0) (Express Edition [free download](http://msdn.microsoft.com/vstudio/express/visualc/))

  - .NET Framework SDK 1.0 (C++ 7.0)

  - .NET Framework SDK 1.1 (C++ 7.1) ([free download](http://www.microsoft.com/downloads/details.aspx?FamilyID=9B3A2CA6-3647-4070-9F41-A333C6B9181D&displaylang=en))

  - .NET Framework 2.0 SDK (C++ 8.0) ([free download](http://www.microsoft.com/downloads/details.aspx?FamilyID=fe6f2099-b7b4-4f47-a244-c96d69c35dec&DisplayLang=en))

For the different Studios, see: (<http://en.wikipedia.org/wiki/Microsoft_Visual_Studio>)

One of the reasons for this is that the myriad of [Win32 support lib](http://anonsvn.wireshark.org/wireshark-win32-libs/tags/) port projects all seem to believe there are legal issues involved in using newer versions of Visual Studio. This FUD essentially stems from two misconceptions:

1.  Unfortunately, it is believed by many that the Microsoft Visual Studio 2003 EULA explicitly forbids linking with GPL'ed programs. This belief is probably due to an improper interpretation of the [Visual Studio 2003 Toolkit EULA](http://msdn.microsoft.com/visualc/vctoolkit2003/eula.aspx), which places redistribution restrictions only on SOURCE CODE SAMPLES which accompany the toolkit.

2.  Other maintainers believe that the GPL itself forbids using Visual Studio 2003, since one of the required support libraries (MSVCR71.DLL) does not ship with the Windows operating system. This is also a wrongful interpretation, and the [GPL FAQ](http://www.gnu.org/licenses/gpl-faq.html#WindowsRuntimeAndGPL) explicitly addresses this issue.

The build process under newer versions of the Microsoft build environment should work "out of the box" now.

## Prerequisites

Follow the common installation guidelines from the Developer Guide first: [Win32: Installation](http://www.wireshark.org/docs/wsdg_html_chunked/ChToolsInstallWin32.html)

  - [.NET Framework SDK](http://www.microsoft.com/downloads/details.aspx?FamilyID=9B3A2CA6-3647-4070-9F41-A333C6B9181D&displaylang=en) command-line compiler, linker, ...

  - [Platform SDK](http://www.microsoft.com/msdownload/platformsdk/sdkupdate/) nmake, header files, ... (you will need a Microsoft Internet Explorer 5.0 or later to download this)

**Support for MSVC7 and above was significantly improved since 0.99.4 was released. You'll need the latest Wireshark sources (SVN version 20413 or above) for the following to work\!\!\!**

## Setup

First of all, edit **config.nmake** in the wireshark src dir and find the **MSVC\_VARIANT** setting that best suits your compiler (MSVC 6 is still the default). Uncomment the corresponding MSVC\_VARIANT= line. For example, if you use the .NET Framework SDK 1.1 this should look like:

    # "Microsoft .Net Framework SDK Version 1.1" - WORKS
    # needs additional Platform SDK installation
    # Visual C++ 7.1, _MSC_VER 1310, msvcr71.dll
    MSVC_VARIANT=DOTNET11

If you intend to build from the free SDK components as opposed to Visual Studio 7, you will need to call the two path/environment scripts for the .NET SDK and the Plaform SDK. One way to do this is to edit your **cygwin.bat** startup script and add:

    call "C:\Program Files\Microsoft Platform SDK for Windows Server 2003 R2\SetEnv.Cmd"
    call "C:\Program Files\Microsoft.NET\SDK\v1.1\Bin\sdkvars.bat"

Or, if you are just using VS7, add :

    call "c:\Program Files\Microsoft Visual Studio .NET 2003\Common7\Tools\vsvars32.bat"

to cygwin.bat. Make sure all SDK/Toolkit paths precede your cygwin paths. In particular, `which link` from within cygwin should give you the SDK version.

At this point you can run <span id="setup" class="anchor"></span>`nmake -f Makefile.nmake setup` from within the wireshark src dir.

## Compilation

At this point you should cleanup things first (removing UNIX related config.h and alike) by running:

`nmake -f Makefile.nmake distclean`

Then you can start building with:

`nmake -f Makefile.nmake all`

## Build Installer

The ideal way to build is to create an installer.

To build an installer that works on all target platforms, you need a redistributable msvcr\*.dll. Unfortunately, it's only part of the commercial Visual Studio versions - it's not part of the free packages.

  - VC++ 2002, VC++ 2003, VC++ 2005, VC++ 2005 SP1: included

  - .NET SDK 2.0 and VC++ 2005 Express (pre-SP1): download [vcredist\_x86.exe](http://www.microsoft.com/downloads/details.aspx?FamilyId=32BC1BEE-A3F9-4C13-9C99-220B62A191EE&displaylang=en) and copy this exe into the C:\\wireshark-win32-libs folder

  - .NET SDK 1.0 and .NET SDK 1.1: no redistributables available - you cannot build an installer\!

Then run `nmake -f Makefile.nmake packaging`

This will build a wireshark-setup executable that will install all the libs you need to run it.

XXX - is there a known source to get msvcr70.dll or msvcr71.dll from, which can be - legally - redistributed?

-----

This wiki entry was based upon [this mailinglist thread](http://thread.gmane.org/gmane.network.wireshark.devel/12491).

## Discussion

Can someone knowledgeable add a section about how to compile a dissector ? *Manfred Nelles*

Should we split this page into separate pages for building with MSVC7 and the free tools?

Should someone attempt to create a step-by-step guide for compiling, or is that doomed to fail due to differences in system setup? *Erik Sternerson*

The cygwin tools are described in the developers guide, so it might be a better way to link to the developer's guide (and probably update it) and link from here instead of duplicating information in the wiki. The developer's guide was an attempt to provide detailed information about setting up a build environment. I don't know if another step-by-step guide is a good idea. - *[UlfLamping](/UlfLamping)*

*<span class="u">Some Notes on my experience using this page</span>*

My setup: Cygwin + all free tools.

  - Microsoft (R) Incremental Linker Version 7.10.3077
  - Microsoft (R) 32-bit C/C++ Standard Compiler Version 13.10.3077 for 80x86

Comments on the **Setup** section

By default Cygwin seems to put the MS PATH values at the end of the cygwin PATH variable. To make sure all SDK/Toolkit paths preceded my cygwin paths I just added the following to my .bash\_profile. Saving the ORIGPATH is optional.

    # Move MS compiler stuff to the front for Wireshark
    ORIGPATH=$PATH
    MSPATH="`echo $PATH | tr : '\n' | grep Microsoft | tr '\n' :`"
    UPATH="`echo $PATH | tr : '\n' | grep -v Microsoft | tr '\n' :`"
    PATH="`echo $MSPATH:$UPATH | sed -e s/::\*/:/ -e s/^:// -e s/:\$//`"

Currently I can build Wireshark, but it blows up while initializing dissectors. I'll add the solution to that when I find it... - *[AndrewFeren](/AndrewFeren)*

---

Imported from https://wiki.wireshark.org/Development/MSVC7 on 2020-08-11 23:12:54 UTC
