# BuildingAndInstalling

:warning: this page content is outdated w.r.t to currently supported releases of Wireshark, and very limited. You may want to first consult the [Wireshark User's Guide](http://www.wireshark.org/docs/wsug_html_chunked/), the [Wireshark Developers Guide](http://www.wireshark.org/docs/wsdg_html_chunked/) and the various [README files](https://gitlab.com/wireshark/wireshark/-/tree/master/doc) provided with Wireshark for up to date build and installation information.

[[_TOC_]]

## Windows

### Windows 2000

How to avoid some problems:

  - Make sure to use nmake/cl/link from VS8 not 2003 server SDK R2, Use `which <cmd>` to test. Otherwise XP function `GetModuleHandleExA` in nmake of SDK will be called to display annoying pop-up window.

  - Use `dos2unix win32-setup.sh win32-setup.sh` to fix `$'\r' command not found` problem.

  - Put cygwin path after sdk to avoid `link.exe` shadowing.

  - Use full path such as `"c:/WINNT/system32/xcopy"` to replace xcopy in if statement of Makefile.nmake

  - Problem `tshark is not a valid win32 application`. DO NOT run this `"C:\Program Files\Microsoft Platform SDK for Windows Server 2003 R2\SetEnv.Cmd"`. Instead, when install 2003 server SDK R2, select register environment.

## OpenBSD

### OpenBSD 3.8

Here's a description of [building Wireshark on OpenBSD 3.8](http://www.linbsd.org/ethereal_on_openbsd38.html) This may evolve into a real README.openbsd or something.

### OpenBSD 4.1

There is a problem when building with gcc 3.3.5, so using gcc 4.x works with no changes.

## macOS

### Building without a third-party package source

To build Wireshark on macOS without a third-party package source such as Homebrew:

1.  [Get the source](https://wireshark.org/develop.html) either from the git repository or a tarball distribution.

2.  Install all the necessary and optional libraries and tools with the `macosx-setup.sh` script (from within the source directory): `./macosx-setup.sh`

3.  Build it (from within the source directory): `mkdir build && cd build && cmake ../ && make`

4.  Run it with `./run/wireshark`

### Building with Homebrew

Experimental steps for "easy" building Wireshark on macOS with the Homebrew package system.

1.  If you don't already have homebrew installed, install it by running `ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"` in the command prompt.

2.  Install all the necessary development packages using homebrew: `brew install c-ares cmake glib gnutls lua qt5`.

3.  Special step to work around bug in Qt/Homebrew: `export PATH=/usr/local/opt/qt5/bin:$PATH`

4.  [Get the source](https://wireshark.org/develop.html) either from the git repository or a tarball distribution.

5.  Build it (from within the source directory): `mkdir build && cd build && cmake ../ && make`

6.  Run it with `./run/wireshark`

## Solaris

Pre-compiled packages are available from [Sunfreeware.com](http://Sunfreeware.com). After downloading and extracting the files, you can install using the following commands:

    pkgadd -d wireshark-0.10.7-sol8-sparc-local
    pkgadd -d pcre-4.5-sol8-sparc-local
    pkgadd -d glib-1.2.10-sol8-sparc-local
    pkgadd -d gtk+-1.2.10-sol8-sparc-local
    pkgadd -d libgcc-3.3-sol8-sparc-local
    pkgadd -d libpcap-0.8.3-sol8-sparc-local

Although the pre-compiled packages from Sunfreeware.com are convenient, they are missing [SNMP](/SNMP) symbolic OID decoding which I find to be tremendously useful. To get this feature, you need to build Wireshark from source. As an example for Solaris 7, the following build environment is required:

    pkgadd -d gcc-2.95.3-sol7-sparc-local
    pkgadd -d glib-1.2.10-sol7-sparc-local
    pkgadd -d grep-2.5-sol7-sparc-local
    pkgadd -d gtk+-1.2.10-sol7-sparc-local
    pkgadd -d gzip-1.3.5-sol7-sparc-local
    pkgadd -d libgcc-3.3-sol7-sparc-local
    pkgadd -d libpcap-0.8.3-sol7-sparc-local
    pkgadd -d make-3.80-sol7-sparc-local
    pkgadd -d net-snmp-5.1.1-sol7-sparc-local
    pkgadd -d openssl-0.9.7d-sol7-sparc-local
    pkgadd -d sed-4.1.1-sol7-sparc-local
    pkgadd -d zlib-1.2.1-sol7-sparc-local

To compile the source code, enter the following commands with particular attention to the "configure" command.

    PATH=/usr/local/bin:/usr/bin:/usr/sbin:/usr/ccs/bin
    export PATH
    LD_LIBRARY_PATH=/usr/local/lib
    export LD_LIBRARY_PATH
    gunzip -c wireshark-0.10.7.tar.gz | tar xvf -
    cd wireshark-0.10.7
    ./configure -disable-gtk2 -with-ssl=/usr/local/ssl
    make

Finally, to install, use the standard "make install" as "root" with PATH and LD\_LIBRARY\_PATH as above.

## Linux

### Red Hat Enterprise Linux, Fedora Core, CentOS

Although these distributions include official builds of Wireshark, they are sometimes behind the current release. Therefore, it is sometimes desirable to build the current version from the TAR source tree.

Trying to build from the TAR source tree using the standard `./configure && make` command will give the following error:

    /usr/include/ucd-snmp/version.h:9:2: error: #error "Please update your headers or configure using --enable-ucd-snmp-compatibility"

Unfortunately, adding "--enable-ucd-snmp-compatibility" just gives the same error.

To solve this, make one of the following changes to your "./configure" command:

1\. Add "--without-net-snmp --without-ucd-snmp":

    ./configure --without-net-snmp --without-ucd-snmp

2\. Add "--with-ssl" (Note: this is disabled by default because of potential licensing issues. See <https://www.wireshark.org/lists/ethereal-dev/200407/msg00402.html>)

    ./configure --with-ssl

## Lightweight Tshark

Wireshark and Tshark support a huge number of protocols but tend to be too heavy for embedded environment. The following patches ( [lightweight-0.11.tgz](uploads/__moin_import__/attachments/BuildingAndInstalling/lightweight-0.11.tgz) for 0.99.5 and [lightweight-1.3.3-1.tgz](uploads/__moin_import__/attachments/BuildingAndInstalling/lightweight-1.3.3-1.tgz) for 1.3.3 ) disable a lot of dissectors in Tshark and to make it about 75% smaller.

## Known Problems

Even though Wireshark doesn't use C++, if the compiler isn't installed, configure might issue these messages:

    checking how to run the C++ preprocessor... /lib/cpp
    configure: error: C++ preprocessor "/lib/cpp" fails sanity check
    See `config.log' for more details.

with config.log containing:

    configure:4981: /lib/cpp  conftest.cc
    cpp: installation problem, cannot exec 'cc1plus': No such file or directory

This is due to a bug in libtool, fixed in version 1.5.10. The bug was introduced in version 1.5, and is not present in earlier versions.

If you fix the problem by installing a later version of libtool rather than a C++ compiler, be aware that it's not sufficient to install libtool in /usr/local, say, with $PATH set appropriately to override the older version in /usr. Libtool invokes the aclocal perl script, part of Automake, which hardwires the aclocal directory. E.g., if aclocal is installed in /usr/bin, it includes the line:

    $acdir = '/usr/share/aclocal';

which means that /usr/share/aclocal/libtool.m4 is invoked instead of the latest version installed in /usr/local/share/aclocal/libtool.m4.

A simple way around *this* problem is to install Automake in /usr/local as well (or wherever you install libtool).

### Discussion

I don't know if it's such a good idea to add **another** place which describes Build and Install. In addition, putting it at a very prominent place at the [FrontPage](home) and having next to no content, is a **very bad** idea in my eyes. - *[UlfLamping](/UlfLamping)*

Well, where is the other place? I did look and I've looked again, unsuccessfully. My thought in putting the link under *Things not (yet) part of the User's Guide* was, indeed, to follow the layout of the User's Guide. -- [GraemeHewson](/GraemeHewson)

Well, we have the various README's, the User's Guide, the Developer's Guide ... - *[UlfLamping](/UlfLamping)*

What is the point of this wiki? Is it really a temporary repository, with all articles destined to be moved into the documentation distributed with Wireshark? -- [GraemeHewson](/GraemeHewson)

Unfortunately, there's no current concept about this. However, at other pages I tried (at least) to link from the wiki the other interesting places, so the user get's at least an idea that there's other places he also might be interested to look at. There's a drawback in this, having too much links often gives the user a sense of being lost in a wiki :frowning:

The main problem I have with this page is: the user gets to the [FrontPage](home), finds: "oh, building and installing, I'll start there" jump to it and will be left with a nearly empty page with only a minor topic, but not explaining the main steps and no links to **any other explanation**. It seems this is all we have to say about bulding and installing of Wireshark\!\!\!

There's another thing that's questioning here - where do you draw the line between the building and installing and the Development section? As it's getting more and more common today to use binary installers even on UNIX (yes, I know about Gentoo and a lot of others), I tend to drop these topics into the Development section.

So at least you should add links to **all other interesting places** regarding this topic. - *[UlfLamping](/UlfLamping)*

I'd say the front page "Building and Installing" page should be solely for those downloading an Wireshark source tarball and configuring, building, and installing it, as an alternative to downloading a binary package (either because they don't know about binary packages, or because the latest version isn't available in a binary package, or because binary packages aren't available for their OS, or because they prefer to build from source). I wouldn't use it for anything other than than - if somebody has Wireshark source and is building it because they're doing development work, any issues they might have should be dealt with under Development.

I'd also say what you do with the release tarball (i.e., configure/make/make install), and perhaps also link to the section of the main Web site for binary packages.

If we keep this page, I'd also put at least some of the items in the "Building Wireshark" section of the Wireshark FAQ here instead, in the "Known Problems" section. -*Guy Harris*

I don't mind -- I created this page just as a convenient place to put my comment about libtool, thinking others might expand it as they see fit. If the comment belongs in a README, so be it. -*[GraemeHewson](/GraemeHewson)*

I wish the anonymous svn service was also available on https since I cannot access via http because of the upstream web proxy that I cannot control blocking some webDav so I get this:

    $svn co http://anonsvn.wireshark.org/wireshark/trunk-1.0/ wireshark
    svn: REPORT request failed on '/wireshark/!svn/vcc/default'
    svn: REPORT of '/wireshark/!svn/vcc/default': 400 Bad Request (http://anonsvn.wireshark.org)

---

Imported from https://wiki.wireshark.org/BuildingAndInstalling on 2020-08-11 23:11:40 UTC
