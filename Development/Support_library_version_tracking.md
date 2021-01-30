This page exists to help us make educated decisions about how far we can bump our minimum library versions by letting us know what Linux distributions we'll lose support for when we bump the version. (Linux is somewhat special here because it tends to be hard to upgrade these libraries without changing entire versions. Of course if someone wants to put other OS's here, that's fine too.)

[[_TOC_]]

# Library and tool versions

This sections tracks versions and release dates of various libraries and tools.

## Qt

Release dates can be found in Qt-X.Y-release articles at <https://wiki.qt.io/Category:Release>

The Qt Company officially supports the following [platforms and configurations](http://doc.qt.io/qt-5/supported-platforms-and-configurations.html).

The highlighted Wireshark versions below mark the Qt version that is shipped with the macOS and Windows installers. For supported macOS hardware and maximum macOS versions, see also <https://en.wikipedia.org/wiki/MacOS#Hardware_compatibility>

| Qt version | Date     | Notes                                                                                                      |
|------------|----------|------------------------------------------------------------------------------------------------------------|
| 4.6.0      | Dec 2009 | Minimum required version in initial porting effort |
| 4.7.0      | Sep 2010 | Minimum required version since v1.99.10rc0-296-gcc9de69b |
| 4.8.0      | Dec 2011 | Minimum required version since v2.3.0rc0-1002-g1cd22559 (Qt Long Term Support (LTS) release) |
| 5.0.0      | Dec 2012 | Minimum required version on Windows and macOS since v2.3.0rc0-1178-ge8588294 |
| 5.1.0      | Jul 2013 | |
| 5.2.0      | Dec 2013 | Minimum required version since v2.9.0rc0-27-g5d8964cd |
| 5.3.0      | May 2014 | Minimum required version since v3.3.0rc0-111-g14e4759b56 Last to support 10.6 Snow Leopard. [OS X 10.6 Snow Leopard through 10.9 Mavericks](https://github.com/qt/qtdoc/blob/5.3/doc/src/platforms/supported-platforms.qdoc#L113), **Wireshark 2.6.x**. |
| 5.4.0      | Dec 2014 | [Mac OS X 10.7 Lion through 10.10 Yosemite, "limited" support for 10.6 Snow Leopard](https://web.archive.org/web/20141227001541/http://doc.qt.io:80/qt-5/osx.html) |
| 5.5.0      | Jul 2015 | [Mac OS X 10.7 Lion through 10.10 Yosemite](https://web.archive.org/web/20160101135637/http://doc.qt.io:80/QtSupportedPlatforms/index.html) |
| 5.6.0      | Mar 2016 | Long Term Support (LTS) release, [OS X 10.8 Mountain Lion through 10.11 El Capitan](https://web.archive.org/web/20160430172052/http://doc.qt.io:80/qt-5/supported-platforms.html) |
| 5.7.0      | Jun 2016 | Requires C++11, [OS X Mountain Lion through El Capitan](https://web.archive.org/web/20161027230721/http://doc.qt.io:80/qt-5/supported-platforms.html) |
| 5.8.0      | Jan 2017 | [OS X Mavericks through Sierra](https://web.archive.org/web/20170309222635/http://doc.qt.io/qt-5/supported-platforms.html) |
| 5.9.0      | May 2017 | Long Term Support (LTS) release, [OS X 10.10 Yosemite through 10.12 Sierra](https://web.archive.org/web/20170603192036/http://doc.qt.io/qt-5/supported-platforms.html), **Wireshark 3.0.0rc1** (macOS only) |
| 5.10.0     | Dec 2017 | [OS X El Capitan through High Sierra](https://web.archive.org/web/20171222025417/http://doc.qt.io/qt-5/supported-platforms.html) |
| 5.11.0     | May 2018 | [OS X 10.11 El Capitan through 10.13 High Sierra](https://web.archive.org/web/20180906124900/http://doc.qt.io/qt-5/supported-platforms.html) |
| 5.12.0     | Dec 2018 | Long Term Support (LTS) release, [macOS 10.12 Sierra through 10.14 Mojave](https://web.archive.org/web/20181208121833/http://doc.qt.io:80/qt-5/supported-platforms.html), **Wireshark 3.0.x, 3.2.x** |
| 5.13.0     | Jun 2019 | [macOS Sierra through Mojave](https://web.archive.org/web/20190705173826/https://doc.qt.io/qt-5/supported-platforms.html) |
| 5.14.0     | Dec 2019 | [macOS 10.13 High Sierra through 10.15 Catalina](https://doc.qt.io/qt-5/supported-platforms.html) |
| 5.15.0     | May 2020 | Long Term Support (LTS) release, [macOS 10.13 High Sierra through 10.15 Catalina](https://doc.qt.io/qt-5/supported-platforms.html), **Wireshark Windows 3.4.x** |

## GLib and GTK+

Note: GTK+ support was completely dropped in Wireshark 3.0 (v2.9.0rc0-33-g36dc5781ba)

| GLIB version | Gtk2 version | Gtk3 version | Date     | Notes                                                                                   |
|--------------|--------------|--------------|----------|-----------------------------------------------------------------------------------------|
| 2.12         | 2.10         |              | Jul 2006 | GTK+ 2.12 is min. req. since 11 July 2011                                               |
|              | 2.14         |              | Aug 2007 | GLib 2.14 is min. req. since 11 July 2011 (old)                                         |
| 2.22         | 2.18         |              | Sep 2009 | GLib 2.22 is min. req. since Aug 2016 (v2.3.0rc0-201-gd21295f9)                         |
| 2.24         | 2.20         |              | Apr 2010 |                                                                                         |
| 2.26         | 2.22         |              | Oct 2010 |                                                                                         |
| 2.26         | 2.24         |              | Dec 2010 |                                                                                         |
| 2.28         |              | 3.0          | Feb 2011 | GTK+ 3.0 is the minimum supported version next to GTK+ 2).                              |
| 2.30         |              | 3.2          | Sep 2011 |                                                                                         |
| 2.32         |              | 3.4          | Feb 2012 | GLib 2.32 is min. req. since April 2018 (v2.9.0rc0-34-gb30e3d42)                        |
| 2.34         |              | 3.6          | Sep 2012 |                                                                                         |
| 2.36         |              | 3.8          | Mar 2013 | GLib 2.36 is min. req. since Nov 2020 (v3.5.0rc0-201-g15d315c2ae)                     |
| 2.38         |              | 3.10         | Oct 2014 |                                                                                         |
| 2.40         |              | 3.12         | Mar 2014 |                                                                                         |
| 2.42         |              | 3.14         | Sep 2014 |                                                                                         |
| 2.44         |              | 3.16         | Mar 2015 |                                                                                         |
| 2.46         |              | 3.18         | Sep 2015 |                                                                                         |
| 2.48         |              | 3.20         | Mar 2016 |                                                                                         |
| 2.50         |              | 3.22         | Sep 2016 |                                                                                         |

## GnuTLS

Note: GnuTLS has a stable branch, and sometimes a development branch and/or a previous stable branch. These are not always obvious, as the development branch becomes the stable branch when it is deemed ready; *e.g.* in July 2018 3.5.x was the stable branch ([announcement](https://lists.gnupg.org/pipermail/gnutls-devel/2018-July/008583.html)), 3.6.x was the development branch ([announcement](https://lists.gnupg.org/pipermail/gnutls-devel/2018-July/008584.html)), 3.3.x was the previous stable branch receiving bug-fixes ([announcement](https://lists.gnupg.org/pipermail/gnutls-devel/2018-July/008582.html)), and 3.4.x was unsupported.

| Version | Date     | Notes                                                                                                                     |
|---------|----------|---------------------------------------------------------------------------------------------------------------------------|
| 1.2.0   | Jan 2005 | Min. req. since at least Jun 2009 (old)                                                                                   |
| 2.8.0   | May 2009 |                                                                                                                                |
| 2.10.0  | Jun 2010 |                                                                                                                           |
| 2.12.0  | Mar 2011 | Min. req. since Oct 2015 (v2.1.0rc0-244-gfe1ab42f). Last of the 2.x series. |
| 3.0.0   | Jul 2011 | License changed from LGPLv2.1+ to LGPLv3 (incompatible license)                                                           |
| 2.12.18 | Mar 2012 | Windows releases from Wireshark 1.4.13+, 1.6.7+, 1.8+ (r330)                                                              |
| 3.1.10  | Mar 2013 | License changed back to LGPLv2.1+ (development version)                                                                   |
| 3.2.0   | May 2013 | Min. req. since Nov 2018 (v2.9.0rc0-2678-gbcd32b07)                                                                       |
| 3.1.22  | Mar 2014 | Windows releases from Wireshark 1.12+ (r400)                                                                              |
| 3.2.15  | May 2014 | Windows releases from Wireshark 1.12.2+, 2.0+ (r409)                                                             |
| 3.3.0   | Apr 2014 | Min. req. since Jan 2021 (v3.5.0rc0-530-gfbd3fb3138)                                                                                                           |
| 3.3.27  | Mar 2017 | SLES 12SP3 (and later)                                                                                                                |
| 3.3.29  | Feb 2018 | RHEL7                                                                                                                     |
| 3.4.0   | Apr 2015 | (gnutls_pubkey_import_privkey is working now for PKCS#11, [commit](https://gitlab.com/gnutls/gnutls/commit/4a8bcb9331d109e31f1b63f5df3ed67c0746619c))                                                         |
| 3.4.10  | Mar 2016 | Ubuntu 16.04                                                                                                              |
| 3.4.11  | Apr 2016 | Windows releases from Wireshark v2.3.0rc0-2384-g0b8a12fd                                                                  |
| 3.5.8   | Jan 2016 | Debian Stretch                                                                                                            |
| 3.5.18  | Feb 2018 | Ubuntu 18.04                                                                                                              |
| 3.6.2   | Feb 2018 | New flag: GNUTLS_PKCS11_TOKEN_PROTECTED_AUTHENTICATION_PATH; SLES 15                                                      |
| 3.6.3   | Jul 2018 | Addition of low-level PKCS#11 API: gnutls_pkcs11_token_get_ptr                                                           |
| 3.6.4   | Sep 2018 | Ubuntu 18.10, Fedora 28, 29                                                                                               |
| 3.6.5   | Dec 2018 | Replaces 3.5.x as stable releases branch ([announcement](https://lists.gnupg.org/pipermail/gnutls-help/2018-December/004465.html)).                                                                  |
| 3.6.7   | Mar 2019 | Debian Buster                                                                                                             |
| 3.6.8   | May 2019 | RHEL8                                                                                                                     |
| 3.6.13  | Mar 2020 | Ubuntu 20.04LTS                                                                                                           |

## Libgcrypt

| Version | Date     | Notes                                                                                            |
|---------|----------|--------------------------------------------------------------------------------------------------|
| 1.1.92  | Feb 2004 | Min. req. since Jul 2008 (old)                                                                   |
| 1.4.0   | Dec 2007 |                                                                                                  |
| 1.4.2   | Sep 2008 | Min. req. since Oct 2015 (v2.1.0rc0-189-g82ec0bb0)                                               |
| 1.4.6   | Jul 2010 | Windows releases from Wireshark 1.4.13+, 1.6.7+, 1.8+ (r330)                                     |
| 1.5.0   | Jun 2011 | Min. req. since Jan 2021 (v3.5.0rc0-512-g5c936174c6). Needed for simpler PKCS#1 padding handling in SSL                |
| 1.5.3   | Jul 2013 | RHEL7                                                                                            |
| 1.6.0   | Dec 2013 | Windows releases from 1.12+ (r400). Needed for AEAD support in ISAKMP (AESCCM) and TLS (CCM/GCM) |
| 1.6.1   | Jan 2014 | SLES 12                                                                         |
| 1.6.2   | Aug 2014 | Windows releases from Wireshark 1.12.2, 2.0+ (r409) until 2.6                                    |
| 1.6.5   | Feb 2016 | Ubuntu 16.04LTS                                                                                  |
| 1.7.0   | Apr 2016 | Needed for ChaCha20-Poly1305 support (TLS 1.3 decryption)                                        |
| 1.7.2   | Jul 2016 | Ubuntu 16.10                                                                                     |
| 1.7.6   | Jan 2017 | Debian Stretch, Windows releases from v2.3.0rc0-2384-g0b8a12fd                                   |
| 1.8.0   | Jul 2017 | Needed for Blake2s support (WireGuard decryption)                                                |
| 1.8.1   | Aug 2017 | Ubuntu 18.04LTS                                                                                  |
| 1.8.2   | Dec 2017 | SLES 15                                                                                          |
| 1.8.3   | Jun 2018 | Windows releases from v2.9.0rc0-1361-g4d015678, Debian Buster, RHEL8                             |
| 1.8.5   | Aug 2019 | Ubuntu 20.04LTS                                                                                  |

## CMake

See also <https://gitlab.kitware.com/cmake/community/wikis/doc/cmake/Life-Cycle-Considerations> for a longer list of distributions. See also <https://github.com/curl/curl/pull/990#issuecomment-245112823> for a history of CMake version + changes.

| Version | Date     | Notes                                                                                                                                                                                 |
|---------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 2.8.3   | Nov 2010 | Minimum required version for non-Windows (before Feb 2016) |
| 2.8.8   | Apr 2012 | Minimum required version for non-Windows (as of Feb 2016, v2.1.0rc0-2202-g6b54fbf3) |
| 2.8.11  | May 2013 | Minimum required version for non-Windows (as of Oct 2017, v2.5.0rc0-1352-gf19a2c0b) |
| 2.8.12  | Nov 2013 | Last 2.8 release (2.8.12.2 is used in Ubuntu 14.04, RHEL/CentOS 6/7 and SLES 12) |
| 3.1.3   | Feb 2015 | Minimum required version for Windows (as of Apr 2015, v1.99.6rc0-369-g0d37980a) |
| 3.5.1   | Mar 2016 | Minimum required version for non-Windows (as of May 2018, v2.9.0rc0-547-g4c1690ac). Ubuntu 16.04 (cmake3 in Ubuntu 14.04), SLES12 SP2 (*1). In RHEL 7 install cmake3 from EPEL. |
| 3.7.0   | Jan 2017 | Minimum required version for Windows (as of Jun 2017, v2.5.0rc0-92-g4edc6115)                                                                                                      |
| 3.7.2   | Jan 2017 | Debian Stretch |
| 3.8.0   | Apr 2017 | |
| 3.9.0   | Jul 2017 | Travis Trusty (3.9.2) (*2) |
| 3.10.0  | Nov 2017 | Ubuntu 18.04 (3.10.2) |
| 3.12.2  | Sep 2018 | EPEL7: available as cmake3; Ubuntu 18.10 (3.12.1); Travis Xenial (3.12.4) (*2) |
| 3.13.0  | Nov 2018 | Debian Stretch-backports (3.13.2); Debian Buster (3.13.4); Minimum required version for Windows (as of Sep 2019, v3.1.1rc0-398-g990e409273) |
| 3.14.0  | Mar 2019 | Initial VS 2019 generator |
| 3.15.0  | Jul 2019 |  |
| 3.16.0  | Nov 2019 |  |
| 3.17.0  | Mar 2020 |  |
| 3.18.0  | Jul 2020 |  |
| 3.19.2  | Dec 2020 | Apple Silicon first supported |

(\*1) SLES12 SP2 includes CMake 3.5 according to <https://www.suse.com/media/presentation/TUT88458_suse_linux_enterprise_server_12_sp_whats_new.pdf>

(\*2) Travis versions per distro: <https://docs.travis-ci.com/user/languages/cpp/#cmake>

## Python

Python 3.4 or newer has become required since v2.9.0rc0-2460-ge9f7bb5127. The test suite currently does not depend on pytest, but can be used with it.

| Distro         | package version                                      |
|----------------|------------------------------------------------------|
| RHEL/CentOS 7  | (unavailable, EPEL python34-pytest 2.8.5 is too old) |
| RHEL/CentOS 8  | python3-pytest 3.4.2                                 |
| Debian Stretch | python3-pytest 3.0.6                                 |
| Ubuntu 17.10   | python3-pytest 3.1.3                                 |
On older systems, you can install it via: `pip3 install pytest pytest-xdist`

## Lua

Lua 5.1 and 5.2 are the only supported versions since Wireshark 3.0. Lua 5.3 is not supported due to the bitop library ([Bug 10881](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=10881)). LuaJIT was being considered for 3.1 ([Bug 15745](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=15745)) and is API/ABI compatible with Lua 5.1 and supports many new 5.2 library functions since LuaJIT 2.0.0-beta11 (2012-10-16). However since LuaJIT upstream appeared inactive in 2019, it was decided not to merge the [LuaJIT patch](https://code.wireshark.org/review/33047).

| Platform                                      | LuaJIT       | Lua 5.1 | Lua 5.2 | Lua 5.3 |
|-----------------------------------------------|--------------|---------|---------|---------|
| SLES 11                                       | no           | 5.1.4   | no      | no      |
| RHEL/CentOS 6/7                               | 2.0.4 (EPEL) | 5.1.4   | no      | no      |
| RHEL/CentOS 8                                 | no           | 5.1.5 (EPEL compat-lua package)      | no      | 5.3.4   |
| SLES 12                                       | no           | 5.1.5   | 5.2.2   | no      |
| Ubuntu 16.04                                  | 2.0.4        | 5.1.5   | 5.2.4   | 5.3.1   |
| macOS (homebrew)                              | 2.0.5        | 5.1.5   | no      | 5.3.5   |
| Ubuntu >= 18.04 / Debian >= stretch-backports | 2.1.0~beta3  | 5.1.5   | 5.2.4   | 5.3.3   |

## Nghttp2

nghttp2 is required for complete HTTP/2 support. It also powers HTTP/2 support in curl, and should be increasingly available. The package name is typically "libnghttp2".

| Platform             | version |
|----------------------|---------|
| RHEL/CentOS 7 (EPEL) | 1.31.1  |
| RHEL/CentOS 8        | 1.33.0  |
| Fedora 29            | 1.39.2  |
| Debian Stretch       | 1.18.1  |
| Ubuntu 16.04         | 1.7.1   |
| Ubuntu 18.04         | 1.30.0  |
| macOS (homebrew)     | 1.39.2  |
| SLES 12 SP5          | 1.7.1   |
| SLES 15              | 1.40.0  |

If the minimum version can be bumped to 1.11.0, we can remove use of a deprecated function.

# Linux Distributions

Note: [This site](http://rpms.famillecollet.com/rpmphp/) allows you to enter a package name and see which Red Hat-based distributions use what version of the package.

<https://pkgs.org/> also provided a service to identify the latest versions.

<https://distrowatch.com/> is also another good source for seeing package versions in various distributions.

## RHEL/CentOS

Latest versions are listed, earlier versions are between parentheses.

| Distribution        | Initial Release | End of Normal Support | GLIB version            | Gtk2 version             | Gtk3 version    | Qt4 version   | Qt5 version            |
|---------------------|-----------------|-----------------------|-------------------------|--------------------------|-----------------|---------------|------------------------|
| Red Hat EL/CentOS 6 | 2010/11         | 2020/11               | 2.28.8 (2.26.1, 2.22.5) | 2.24.23 (2.20.1, 2.18.9) | (none)          | 4.6.2         | base:(none) EPEL:5.6.1 |
| Red Hat EL/CentOS 7 | 2014/6          | 2024/6                | 2.50.3 (2.40.0, 2.36.3) | 2.24.22                  | 3.22.26 (3.8.4) | 4.8.7 (4.8.5) | 5.9.7 (5.6.2)          |
| Red Hat EL/CentOS 8 | 2019/5          | 2029/5                | 2.56.4                  | 2.24.32                  | 3.22.30         | (none)        | 5.12.15 (5.11.1)        |

Note: [EPEL](https://fedoraproject.org/wiki/EPEL) is an optional repository for extra packages.

Note: RHEL 6.6 and Qt5 is [supported](https://blog.qt.io/blog/2015/06/24/qt-is-coming-to-red-hat-enterprise-linux/) by Qt (version 5.5.0).

## Fedora

Releases can be found at <https://fedoraproject.org/wiki/Releases>. Every 6 months a new version is released with 13 months of support.

| Distribution | GLIB version | Gtk2 version | Gtk3 version | Qt4 version | Qt5 version |
|--------------|--------------|--------------|--------------|-------------|-------------|
| Fedora 23    | 2.46         | 2.24.28      | 3.18.2       | 4.8.7       | 5.5.0       |
| Fedora 24    | 2.48         | 2.24.30      | 3.20.6       | 4.8.7       | 5.6.2       |
| Fedora 25    | 2.50.3       | 2.24.31      | 3.22.2       | 4.8.7       | 5.7.1       |
| Fedora 26    | 2.52.3       | x            | x            | x           | 5.9.4       |
| Fedora 27    | 2.54.3       | x            | x            | x           | 5.9.6       |
| Fedora 28    | 2.56.4       | x            | x            | x           | 5.11.3      |
| Fedora 29    | 2.58.3       | x            | x            | x           | 5.11.3      |
| Fedora 30    | 2.60.7       | x            | x            | x           | 5.12.5      | 
| Fedora 31    | 2.62.6       | x            | x            | x           | 5.13.2      | 
| Fedora 32    | 2.64.6       | x            | x            | x           | 5.14.2      | 
| Fedora 33    | 2.66.4       | x            | x            | x           | 5.15.2      | 

## SUSE Linux Enterprise Server

Ten years of General Support for a major version, with a six month window to upgrade to the latest Service Pack after it is released. Version numbering skipped from 12 to 15. As of version 15 openSUSE and SLES closely track each other.

| Distribution | Initial release       | End of Normal Support | GLIB version    | Gtk2 version      | Gtk3 version     | Qt4 version   | Qt5 version          |
|--------------|-----------------------|-----------------------|-----------------|-------------------|------------------|---------------|----------------------|
| SLES 12      | 2014/10 (SP5 2019/12) | 2024/10               | 2.48.2 (2.38.2) | 2.24.31 (2.24.24) | 3.20.10 (3.10.9) | 4.8.7 (4.8.6) | 5.6.2 (5.5.1, 5.3.1) |
| SLES 15      | 2018/07               | 2019/12               | 2.54.3          | x             | x            | (none)            | 5.9.4                |
| SLES 15 SP1  | 2019/06               | 2021/01               | 2.54.3          | x             | x            | (none)            | 5.9.4                |
| SLES 15 SP2  | 2020/07               | 2028/07               | 2.62.5          | x             | x            | (none)            | 5.12.7               |

## openSUSE

Version numbering changed over time: ..., 13.2, Leap 42.1, ..., Leap 42.3, Leap 15.0. From openSUSE Leap: Each major version at least 36 months lifetime, until the next major Leap version is available, with a six month window to upgrade to the latest minor release. Minor releases are expected to be roughly annually, thus giving approximately an 18 months total lifetime. Until openSUSE 13.2: 8 month release cycle, 18 months lifetime, see <https://en.opensuse.org/Lifetime>

Search for packages in openSUSE here: <https://software.opensuse.org/search>

| Distribution       | GLIB version | Gtk2 version | Gtk3 version | Qt4 version | Qt5 version |
|--------------------|--------------|--------------|--------------|-------------|-------------|
| openSUSE 13.2      | 2.42.2       | 2.24.28      | 3.14.13      | 4.8.6       | 5.4.1       |
| openSUSE Leap 42.3 | 2.48.2       | x            | x            | 4.8.7       | 5.6.2       |
| openSUSE Leap 15.0 | 2.54.3       | x            | x            | 4.8.7       | 5.9.4       |
| openSUSE Leap 15.2 | 2.62.5       | x            | x            | 4.8.7       | 5.12.7      |

## Debian

[Release EOL information](https://wiki.debian.org/LTS)

| Distribution       | GLIB version | Gtk2 version | Gtk3 version | Qt4 version | Qt5 version |
|--------------------|--------------|--------------|--------------|-------------|-------------|
| jessie             | 2.42.1       | 2.24.25      | 3.14.5       | 4.8.6       | 5.3.2       |
| stretch            | 2.50.3       | 2.24.31      | 3.22.11      | 4.8.7       | 5.7.1       |
| buster             | 2.58.3       | x            | x            | x           | 5.11.3      |
| bullseye (testing) | 2.62.4       | x            | x            | x           | 5.12.5      |

Since GTK+ and Qt4 are no longer supported, it is not being tracked anymore (x).

## Ubuntu

[Releases](https://wiki.ubuntu.com/Releases) are on a 6 month release cycle, 9 month (regular), 5 years (LTS) lifetime.

| Distribution       | GLIB version | Gtk2 version | Gtk3 version | Qt4 version | Qt5 version |
|--------------------|--------------|--------------|--------------|-------------|-------------|
| trusty (14.04LTS)  | 2.40.2       | 2.24.23      | 3.10.8       | 4.8.5       | 5.2.1       |
| xenial (16.04LTS)  | 2.48.0       | 2.24.30      | 3.18.9       | 4.8.7       | 5.5.1       |
| yakkety (16.10)    | 2.50.0       | 2.24.30      | 3.20.9       | 4.8.7       | 5.6.1       |
| zesty (17.04)      | 2.52.0       | 2.24.31      | 3.22.11      | 4.8.7       | 5.7.1       |
| artful (17.10)     | 2.54.1       | 2.24.31      | 3.22.25      | 4.8.7       | 5.9.1       |
| bionic (18.04LTS)  | 2.56.4       | x            | x            | x           | 5.9.5       |
| cosmic (18.10)     | 2.58.1       | x            | x            | x           | 5.11.1      |
| disco (19.04)      | 2.60.4       | x            | x            | x           | 5.12.2      |
| eoan (19.10)       | 2.62.4       | x            | x            | x           | 5.12.4      |
| focal (20.04LTS)   | 2.64.2       | x            | x            | x           | 5.12.8      |

Since GTK+ and Qt4 are no longer supported, it is not being tracked anymore (x).

# macOS

Third party libraries can be installed on macOS using the `tools/macos-setup.sh` script in the Wireshark sources (or `macosx-setup.sh` in the top-level directory in source releases up to 2.4.x). You can show a list of libraries and their versions by running `grep '_VERSION=[0-9]' tools/macos-setup.sh`.

Many developers also install libraries using [Homebrew](https://brew.sh/) and the `tools/macos-setup-brew.sh` script.

# Windows

FOSS library packaging and distribution on Windows has historically been [a mess](https://twitter.com/geraldcombs/status/735870968451629056), but things are improving.
Two notable projects that might fix this are [vcpkg](https://github.com/Microsoft/vcpkg) and [Conan](https://www.conan.io/).
Neither of them provide packages for all of the libraries that we use, so we maintain repositories of [32-bit](https://anonsvn.wireshark.org/wireshark-win32-libs/) and [64-bit](https://anonsvn.wireshark.org/wireshark-win64-libs/) packages which are installed using `tools/win-setup.ps1` in the Wireshark sources.

| Library | vcpkg | Conan | Notes |
|---------|----|----|----|
| Bcg729  | [yes](https://github.com/microsoft/vcpkg/tree/master/ports/bcg729) | no | |
| Brotli                | [yes](https://github.com/microsoft/vcpkg/tree/master/ports/brotli) | [yes](https://conan.io/center/brotli) | |
| c-ares                | [yes](https://github.com/microsoft/vcpkg/tree/master/ports/c-ares) | [yes](https://conan.io/center/c-ares) | |
| GLib                  | [yes](https://github.com/microsoft/vcpkg/tree/master/ports/glib) | [yes](https://conan.io/center/glib) | |
| GnuTLS                | no | no | |
| iLBC                  | [yes](https://github.com/microsoft/vcpkg/tree/master/ports/libilbc) | no | |
| Kerberos (krb5)       | no | no | |
| libgcrypt             | [almost](https://github.com/microsoft/vcpkg/tree/master/ports/libgcrypt) | no | vcpkg port is Linux / macOS only. |
| libmaxminddb          | [yes](https://github.com/microsoft/vcpkg/tree/master/ports/libmaxminddb) | no | |
| libpcap               | [yes](https://github.com/microsoft/vcpkg/tree/master/ports/libpcap) | [yes](https://conan.io/center/libpcap) | |
| libsmi                | no | no | |
| libssh | [yes](https://github.com/microsoft/vcpkg/tree/master/ports/libssh) | no | This is not the same as libssh2. |
| libxml2               | [yes](https://github.com/microsoft/vcpkg/tree/master/ports/libxml2) | [yes](https://conan.io/center/libxml2) | |
| Lua                   | [yes](https://github.com/microsoft/vcpkg/tree/master/ports/lua) | [yes](https://conan.io/center/lua) | |
| lz4                   | [yes](https://github.com/microsoft/vcpkg/tree/master/ports/lz4) | [yes](https://conan.io/center/lz4) | |
| minizip               | [yes](https://github.com/microsoft/vcpkg/tree/master/ports/minizip) | [yes](https://conan.io/center/minizip) | |
| Nghttp2               | [yes](https://github.com/microsoft/vcpkg/tree/master/ports/nghttp2) | [yes](https://conan.io/center/libnghttp2) | |
| opus                  | [yes](https://github.com/microsoft/vcpkg/tree/master/ports/opus) | [yes](https://conan.io/center/opus) | |
| Qt                    | [yes](https://github.com/microsoft/vcpkg/tree/master/ports/qt5) | no | |
| SBC                   | no | no | |
| Snappy                | [yes](https://github.com/microsoft/vcpkg/tree/master/ports/snappy) | [yes](https://conan.io/center/snappy) | |
| WinSparkle            | no | no | |
| Zlib                  | [yes](https://github.com/microsoft/vcpkg/tree/master/ports/zlib) | [yes](https://conan.io/center/zlib) | |
| zstd                  | [yes](https://github.com/microsoft/vcpkg/tree/master/ports/zstd) | [yes](https://conan.io/center/zstd) | |

---

Imported from https://wiki.wireshark.org/Development/Support_library_version_tracking on 2020-08-11 23:13:11 UTC
