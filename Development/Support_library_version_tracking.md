This page exists to help us make educated decisions about how far we can bump our minimum library versions by letting us know what Linux distributions we'll lose support for when we bump the version. (Linux is somewhat special here because it tends to be hard to upgrade these libraries without changing entire versions. Of course if someone wants to put other OS's here, that's fine too.)

[[_TOC_]]

# Library and tool versions

This sections tracks versions and release dates of various libraries and tools.

## Qt

Release dates can be found in Qt-X.Y-release articles at <https://wiki.qt.io/Category:Release>

The Qt Company officially supports the following [platforms and configurations](http://doc.qt.io/qt-5/supported-platforms-and-configurations.html).

The highlighted Wireshark versions below mark the Qt version that is shipped with the macOS and Windows installers. For supported macOS hardware and maximum macOS versions, see also <https://en.wikipedia.org/wiki/MacOS#Hardware_compatibility>

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Qt version</strong></p></td>
<td><p><strong>Date</strong></p></td>
<td><p><strong>Notes</strong></p></td>
</tr>
<tr class="even">
<td><p>4.6.0</p></td>
<td><p>Dec 2009</p></td>
<td><p>Minimum required version in initial porting effort</p></td>
</tr>
<tr class="odd">
<td><p>4.7.0</p></td>
<td><p>Sep 2010</p></td>
<td><p>Minimum required version since v1.99.10rc0-296-gcc9de69</p></td>
</tr>
<tr class="even">
<td><p>4.8.0</p></td>
<td><p>Dec 2011</p></td>
<td><p>Minimum required version since v2.3.0rc0-1002-g1cd2255 (Qt Long Term Support (LTS) release)</p></td>
</tr>
<tr class="odd">
<td><p>5.0.0</p></td>
<td><p>Dec 2012</p></td>
<td><p>Minimum required version on Windows and macOS since v2.3.0rc0-1178-ge858829</p></td>
</tr>
<tr class="even">
<td><p>5.1.0</p></td>
<td><p>Jul 2013</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>5.2.0</p></td>
<td><p>Dec 2013</p></td>
<td><p>Minimum required version since v2.9.0rc0-27-g5d8964cd3b</p></td>
</tr>
<tr class="even">
<td><p>5.3.0</p></td>
<td><p>May 2014</p></td>
<td><p>Last to support 10.6 Snow Leopard. <a href="https://github.com/qt/qtdoc/blob/5.3/doc/src/platforms/supported-platforms.qdoc#L113" class="https">OS X 10.6 Snow Leopard through 10.9 Mavericks</a>, <strong>Wireshark 2.6.x</strong>.</p></td>
</tr>
<tr class="odd">
<td><p>5.4.0</p></td>
<td><p>Dec 2014</p></td>
<td><p><a href="https://web.archive.org/web/20141227001541/http://doc.qt.io:80/qt-5/osx.html" class="https">Mac OS X 10.7 Lion through 10.10 Yosemite, "limited" support for 10.6 Snow Leopard</a></p></td>
</tr>
<tr class="even">
<td><p>5.5.0</p></td>
<td><p>Jul 2015</p></td>
<td><p><a href="https://web.archive.org/web/20160101135637/http://doc.qt.io:80/QtSupportedPlatforms/index.html" class="https">Mac OS X 10.7 Lion through 10.10 Yosemite</a></p></td>
</tr>
<tr class="odd">
<td><p>5.6.0</p></td>
<td><p>Mar 2016</p></td>
<td><p>Long Term Support (LTS) release, <a href="https://web.archive.org/web/20160430172052/http://doc.qt.io:80/qt-5/supported-platforms.html" class="https">OS X 10.8 Mountain Lion through 10.11 El Capitan</a></p></td>
</tr>
<tr class="even">
<td><p>5.7.0</p></td>
<td><p>Jun 2016</p></td>
<td><p>Requires C++11, <a href="https://web.archive.org/web/20161027230721/http://doc.qt.io:80/qt-5/supported-platforms.html" class="https">OS X Mountain Lion through El Capitan</a></p></td>
</tr>
<tr class="odd">
<td><p>5.8.0</p></td>
<td><p>Jan 2017</p></td>
<td><p><a href="https://web.archive.org/web/20170309222635/http://doc.qt.io/qt-5/supported-platforms.html" class="https">OS X Mavericks through Sierra</a></p></td>
</tr>
<tr class="even">
<td><p>5.9.0</p></td>
<td><p>May 2017</p></td>
<td><p>Long Term Support (LTS) release, <a href="https://web.archive.org/web/20170603192036/http://doc.qt.io/qt-5/supported-platforms.html" class="https">OS X 10.10 Yosemite through 10.12 Sierra</a>, <strong>Wireshark 3.0.0rc1</strong> (macOS only)</p></td>
</tr>
<tr class="odd">
<td><p>5.10.0</p></td>
<td><p>Dec 2017</p></td>
<td><p><a href="https://web.archive.org/web/20171222025417/http://doc.qt.io/qt-5/supported-platforms.html" class="https">OS X El Capitan through High Sierra</a></p></td>
</tr>
<tr class="even">
<td><p>5.11.0</p></td>
<td><p>May 2018</p></td>
<td><p><a href="https://web.archive.org/web/20180906124900/http://doc.qt.io/qt-5/supported-platforms.html" class="https">OS X 10.11 El Capitan through 10.13 High Sierra</a></p></td>
</tr>
<tr class="odd">
<td><p>5.12.0</p></td>
<td><p>Dec 2018</p></td>
<td><p>Long Term Support (LTS) release, <a href="https://web.archive.org/web/20181208121833/http://doc.qt.io:80/qt-5/supported-platforms.html" class="https">macOS 10.12 Sierra through 10.14 Mojave</a>, <strong>Wireshark 3.0.x, 3.2.x</strong></p></td>
</tr>
<tr class="even">
<td><p>5.13.0</p></td>
<td><p>Jun 2019</p></td>
<td><p><a href="https://web.archive.org/web/20190705173826/https://doc.qt.io/qt-5/supported-platforms.html" class="https">macOS Sierra through Mojave</a></p></td>
</tr>
<tr class="odd">
<td><p>5.14.0</p></td>
<td><p>Dec 2019</p></td>
<td><p><a href="https://doc.qt.io/qt-5/supported-platforms.html" class="https">macOS 10.13 High Sierra through 10.15 Catalina</a></p></td>
</tr>
<tr class="even">
<td><p>5.15.0</p></td>
<td><p>May 2020</p></td>
<td><p><a href="https://doc.qt.io/qt-5/supported-platforms.html" class="https">macOS 10.13 High Sierra through 10.15 Catalina</a></p></td>
</tr>
</tbody>
</table>

</div>

## GLib and GTK+

Note: GTK+ support is completely dropped in Wireshark 3.0 (v2.9.0rc0-33-g36dc5781ba)

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>GLIB version</strong></p></td>
<td><p><strong>Gtk2 version</strong></p></td>
<td><p><strong>Gtk3 version</strong></p></td>
<td><p><strong>Date</strong></p></td>
<td><p><strong>Notes</strong></p></td>
</tr>
<tr class="even">
<td><p>2.12</p></td>
<td><p>2.10</p></td>
<td></td>
<td><p>Jul 2006</p></td>
<td><p>GTK+ 2.12 is min. req. since 11 July 2011</p></td>
</tr>
<tr class="odd">
<td></td>
<td><p>2.14</p></td>
<td></td>
<td><p>Aug 2007</p></td>
<td><p>GLib 2.14 is min. req. since 11 July 2011 (old)</p></td>
</tr>
<tr class="even">
<td><p>2.22</p></td>
<td><p>2.18</p></td>
<td></td>
<td><p>Sep 2009</p></td>
<td><p>GLib 2.22 is min. req. since Aug 2016 (v2.3.0rc0-201-gd21295f); SLES11 has GLib 2.22.5</p></td>
</tr>
<tr class="odd">
<td><p>2.24</p></td>
<td><p>2.20</p></td>
<td></td>
<td><p>Apr 2010</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>2.26</p></td>
<td><p>2.22</p></td>
<td></td>
<td><p>Oct 2010</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>2.26</p></td>
<td><p>2.24</p></td>
<td></td>
<td><p>Dec 2010</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>2.28</p></td>
<td></td>
<td><p>3.0</p></td>
<td><p>Feb 2011</p></td>
<td><p>GTK+ 3.0 is the minimum supported version next to GTK+ 2).</p></td>
</tr>
<tr class="odd">
<td><p>2.30</p></td>
<td></td>
<td><p>3.2</p></td>
<td><p>Sep 2011</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>2.32</p></td>
<td></td>
<td><p>3.4</p></td>
<td><p>Feb 2012</p></td>
<td><p>GLib 2.32 is min. req. since April 2018 (v2.9.0rc0-34-gb30e3d4267)</p></td>
</tr>
<tr class="odd">
<td><p>2.34</p></td>
<td></td>
<td><p>3.6</p></td>
<td><p>Sep 2012</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>2.36</p></td>
<td></td>
<td><p>3.8</p></td>
<td><p>Mar 2013</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>2.38</p></td>
<td></td>
<td><p>3.10</p></td>
<td><p>Oct 2014</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>2.40</p></td>
<td></td>
<td><p>3.12</p></td>
<td><p>Mar 2014</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>2.42</p></td>
<td></td>
<td><p>3.14</p></td>
<td><p>Sep 2014</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>2.44</p></td>
<td></td>
<td><p>3.16</p></td>
<td><p>Mar 2015</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>2.46</p></td>
<td></td>
<td><p>3.18</p></td>
<td><p>Sep 2015</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>2.48</p></td>
<td></td>
<td><p>3.20</p></td>
<td><p>Mar 2016</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>2.50</p></td>
<td></td>
<td><p>3.22</p></td>
<td><p>Sep 2016</p></td>
<td></td>
</tr>
</tbody>
</table>

</div>

## GnuTLS

Note: odd numbers are development versions, even are stable. Exception: 3.5.x at some point became the stable branch.

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Version</strong></p></td>
<td><p><strong>Date</strong></p></td>
<td><p><strong>Notes</strong></p></td>
</tr>
<tr class="even">
<td><p>1.2.0</p></td>
<td><p>Jan 2005</p></td>
<td><p>Min. req. since at least Jun 2009 (old)</p></td>
</tr>
<tr class="odd">
<td><p>2.4.1</p></td>
<td><p>Jun 2008</p></td>
<td><p>SLES 11 Initial release to SP4</p></td>
</tr>
<tr class="even">
<td><p>2.8.0</p></td>
<td><p>May 2009</p></td>
<td><p>Debian Squeeze has 2.8.6</p></td>
</tr>
<tr class="odd">
<td><p>2.10.0</p></td>
<td><p>Jun 2010</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>2.12.0</p></td>
<td><p>Mar 2011</p></td>
<td><p>Min. req. since Oct 2015 (v2.1.0rc0-244-gfe1ab42). Last of the 2.x series. Debian Wheezy has 2.12.20. RHEL6 has 2.12.23.</p></td>
</tr>
<tr class="odd">
<td><p>3.0.0</p></td>
<td><p>Jul 2011</p></td>
<td><p>License changed from LGPLv2.1+ to LGPLv3 (incompatible license)</p></td>
</tr>
<tr class="even">
<td><p>2.12.18</p></td>
<td><p>Mar 2012</p></td>
<td><p>Windows releases from Wireshark 1.4.13+, 1.6.7+, 1.8+ (r330)</p></td>
</tr>
<tr class="odd">
<td><p>3.1.10</p></td>
<td><p>Mar 2013</p></td>
<td><p>License changed back to LGPLv2.1+ (development version)</p></td>
</tr>
<tr class="even">
<td><p>3.2.0</p></td>
<td><p>May 2013</p></td>
<td><p>Min. req. since Nov 2018 (v2.9.0rc0-2678-gbcd32b07e7)</p></td>
</tr>
<tr class="odd">
<td><p>3.1.22</p></td>
<td><p>Mar 2014</p></td>
<td><p>Windows releases from Wireshark 1.12+ (r400)</p></td>
</tr>
<tr class="even">
<td><p>3.2.11</p></td>
<td><p>Feb 2014</p></td>
<td><p>Ubuntu 14.04</p></td>
</tr>
<tr class="odd">
<td><p>3.2.15</p></td>
<td><p>May 2014</p></td>
<td><p>SLES 12; Windows releases from Wireshark 1.12.2+, 2.0+ (r409)</p></td>
</tr>
<tr class="even">
<td><p>3.3.8</p></td>
<td><p>Sep 2014</p></td>
<td><p>Debian Jessie</p></td>
</tr>
<tr class="odd">
<td><p>3.3.27</p></td>
<td><p>Mar 2017</p></td>
<td><p>SLES 12SP5</p></td>
</tr>
<tr class="even">
<td><p>3.3.29</p></td>
<td><p>Feb 2018</p></td>
<td><p>RHEL7</p></td>
</tr>
<tr class="odd">
<td><p>3.4.0</p></td>
<td><p>Apr 2015</p></td>
<td><p>(gnutls_pubkey_import_privkey is working now for PKCS#11, <a href="https://gitlab.com/gnutls/gnutls/commit/4a8bcb9331d109e31f1b63f5df3ed67c0746619c" class="https">commit</a>)</p></td>
</tr>
<tr class="even">
<td><p>3.4.10</p></td>
<td><p>Mar 2016</p></td>
<td><p>Ubuntu 16.04</p></td>
</tr>
<tr class="odd">
<td><p>3.4.11</p></td>
<td><p>Apr 2016</p></td>
<td><p>Windows releases from Wireshark v2.3.0rc0-2384-g0b8a12fd51</p></td>
</tr>
<tr class="even">
<td><p>3.5.8</p></td>
<td><p>Jan 2016</p></td>
<td><p>Debian Stretch</p></td>
</tr>
<tr class="odd">
<td><p>3.5.18</p></td>
<td><p>Feb 2018</p></td>
<td><p>Ubuntu 18.04</p></td>
</tr>
<tr class="even">
<td><p>3.6.2</p></td>
<td><p>Feb 2018</p></td>
<td><p>New flag: GNUTLS_PKCS11_TOKEN_PROTECTED_AUTHENTICATION_PATH; SLES 15</p></td>
</tr>
<tr class="odd">
<td><p>3.6.3</p></td>
<td><p>Jul 2018</p></td>
<td><p>Addition of low-level PKCS #11 API: gnutls_pkcs11_token_get_ptr</p></td>
</tr>
<tr class="even">
<td><p>3.6.4</p></td>
<td><p>Sep 2018</p></td>
<td><p>Ubuntu 18.10, Fedora 28, 29</p></td>
</tr>
<tr class="odd">
<td><p>3.6.5</p></td>
<td><p>Dec 2018</p></td>
<td><p>Replaces 3.5.x as stable releases branch (<a href="https://lists.gnupg.org/pipermail/gnutls-help/2018-December/004465.html" class="https">announcement</a>).</p></td>
</tr>
<tr class="even">
<td><p>3.6.7</p></td>
<td><p>Mar 2019</p></td>
<td><p>Debian Buster</p></td>
</tr>
<tr class="odd">
<td><p>3.6.8</p></td>
<td><p>May 2019</p></td>
<td><p>RHEL8</p></td>
</tr>
<tr class="even">
<td><p>3.6.13</p></td>
<td><p>Mar 2020</p></td>
<td><p>Ubuntu 20.04LTS</p></td>
</tr>
</tbody>
</table>

</div>

## Libgcrypt

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Version</strong></p></td>
<td><p><strong>Date</strong></p></td>
<td><p><strong>Notes</strong></p></td>
</tr>
<tr class="even">
<td><p>1.1.92</p></td>
<td><p>Feb 2004</p></td>
<td><p>Min. req. since Jul 2008 (old)</p></td>
</tr>
<tr class="odd">
<td><p>1.4.0</p></td>
<td><p>Dec 2007</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>1.4.1</p></td>
<td><p>Apr 2008</p></td>
<td><p>SLES 11 Initial release and SP1</p></td>
</tr>
<tr class="odd">
<td><p>1.4.2</p></td>
<td><p>Sep 2008</p></td>
<td><p>Min. req. since Oct 2015 (v2.1.0rc0-189-g82ec0bb)</p></td>
</tr>
<tr class="even">
<td><p>1.4.5</p></td>
<td><p>Dec 2009</p></td>
<td><p>Debian Squeeze, RHEL6</p></td>
</tr>
<tr class="odd">
<td><p>1.4.6</p></td>
<td><p>Jul 2010</p></td>
<td><p>Windows releases from Wireshark 1.4.13+, 1.6.7+, 1.8+ (r330)</p></td>
</tr>
<tr class="even">
<td><p>1.5.0</p></td>
<td><p>Jun 2011</p></td>
<td><p>Debian Wheezy, SLES 11 SP2-SP3. Needed for simpler PKCS#1 padding handling in SSL</p></td>
</tr>
<tr class="odd">
<td><p>1.5.3</p></td>
<td><p>Jul 2013</p></td>
<td><p>RHEL7</p></td>
</tr>
<tr class="even">
<td><p>1.6.0</p></td>
<td><p>Dec 2013</p></td>
<td><p>Windows releases from 1.12+ (r400). Needed for AEAD support in ISAKMP (AESCCM) and TLS (CCM/GCM)</p></td>
</tr>
<tr class="odd">
<td><p>1.6.1</p></td>
<td><p>Jan 2014</p></td>
<td><p>SLES 12, Ubuntu 14.04LTS</p></td>
</tr>
<tr class="even">
<td><p>1.6.2</p></td>
<td><p>Aug 2014</p></td>
<td><p>Windows releases from Wireshark 1.12.2, 2.0+ (r409) until 2.6</p></td>
</tr>
<tr class="odd">
<td><p>1.6.3</p></td>
<td><p>Feb 2015</p></td>
<td><p>Debian Jessie</p></td>
</tr>
<tr class="even">
<td><p>1.6.5</p></td>
<td><p>Feb 2016</p></td>
<td><p>Ubuntu 16.04LTS</p></td>
</tr>
<tr class="odd">
<td><p>1.7.0</p></td>
<td><p>Apr 2016</p></td>
<td><p>Needed for ChaCha20-Poly1305 support (TLS 1.3 decryption)</p></td>
</tr>
<tr class="even">
<td><p>1.7.2</p></td>
<td><p>Jul 2016</p></td>
<td><p>Ubuntu 16.10</p></td>
</tr>
<tr class="odd">
<td><p>1.7.6</p></td>
<td><p>Jan 2017</p></td>
<td><p>Debian Stretch, Windows releases from v2.3.0rc0-2384-g0b8a12fd51</p></td>
</tr>
<tr class="even">
<td><p>1.8.0</p></td>
<td><p>Jul 2017</p></td>
<td><p>Needed for Blake2s support (WireGuard decryption)</p></td>
</tr>
<tr class="odd">
<td><p>1.8.1</p></td>
<td><p>Aug 2017</p></td>
<td><p>Ubuntu 18.04LTS</p></td>
</tr>
<tr class="even">
<td><p>1.8.2</p></td>
<td><p>Dec 2017</p></td>
<td><p>SLES 15</p></td>
</tr>
<tr class="odd">
<td><p>1.8.3</p></td>
<td><p>Jun 2018</p></td>
<td><p>Windows releases from v2.9.0rc0-1361-g4d01567812, Debian Buster, RHEL8</p></td>
</tr>
<tr class="even">
<td><p>1.8.5</p></td>
<td><p>Aug 2019</p></td>
<td><p>Ubuntu 20.04LTS</p></td>
</tr>
</tbody>
</table>

</div>

## CMake

See also <https://gitlab.kitware.com/cmake/community/wikis/doc/cmake/Life-Cycle-Considerations> for a longer list of distributions. See also <https://github.com/curl/curl/pull/990#issuecomment-245112823> for a history of CMake version + changes.

<div>

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>Version</strong></p></td>
<td><p><strong>Date</strong></p></td>
<td><p><strong>Notes</strong></p></td>
</tr>
<tr class="even">
<td><p>2.8.3</p></td>
<td><p>Nov 2010</p></td>
<td><p>Minimum required version for non-Windows (before Feb 2016)</p></td>
</tr>
<tr class="odd">
<td><p>2.8.7</p></td>
<td><p>Dec 2011</p></td>
<td><p>Ubuntu 12.04 Precise (EOL April 2017)</p></td>
</tr>
<tr class="even">
<td><p>2.8.8</p></td>
<td><p>Apr 2012</p></td>
<td><p>Minimum required version for non-Windows (as of Feb 2016, v2.1.0rc0-2202-g6b54fbf)</p></td>
</tr>
<tr class="odd">
<td><p>2.8.9</p></td>
<td><p>Aug 2012</p></td>
<td><p>Debian Wheezy (2.8.11.1 in wheezy-backports</p></td>
</tr>
<tr class="even">
<td><p>2.8.11</p></td>
<td><p>May 2013</p></td>
<td><p>Minimum required version for non-Windows (as of Oct 2017, v2.5.0rc0-1352-gf19a2c0b8c)</p></td>
</tr>
<tr class="odd">
<td><p>2.8.12</p></td>
<td><p>Nov 2013</p></td>
<td><p>Last 2.8 release (2.8.12.2 is used in Ubuntu 14.04, RHEL/CentOS 6/7 and SLES 12)</p></td>
</tr>
<tr class="even">
<td><p>3.0.2</p></td>
<td><p>Sep 2014</p></td>
<td><p>Debian Jessie</p></td>
</tr>
<tr class="odd">
<td><p>3.1.3</p></td>
<td><p>Feb 2015</p></td>
<td><p>Minimum required version for Windows (as of Apr 2015, v1.99.6rc0-369-g0d37980a0b)</p></td>
</tr>
<tr class="even">
<td><p>3.5.1</p></td>
<td><p>Mar 2016</p></td>
<td><p>Minimum required version for non-Windows (as of May 2018, v2.9.0rc0-547-g4c1690ac47).<br />
Ubuntu 16.04 (cmake3 in Ubuntu 14.04), SLES12 SP2 (*1). In RHEL 6 and 7 install cmake3 from EPEL.</p></td>
</tr>
<tr class="odd">
<td><p>3.6.2</p></td>
<td><p>Oct 2016</p></td>
<td><p>EPEL6: available as cmake3 (3.6.1), Debian Jessie-backports 3.6.2</p></td>
</tr>
<tr class="even">
<td><p>3.7.0</p></td>
<td><p>Jan 2017</p></td>
<td><p>Minimum required version for Windows (as of Jun 2017, v2.5.0rc0-92-g4edc611526)</p></td>
</tr>
<tr class="odd">
<td><p>3.7.2</p></td>
<td><p>Jan 2017</p></td>
<td><p>Debian Stretch</p></td>
</tr>
<tr class="even">
<td><p>3.8.0</p></td>
<td><p>Apr 2017</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>3.9.0</p></td>
<td><p>Jul 2017</p></td>
<td><p>Travis Trusty (3.9.2) (*2)</p></td>
</tr>
<tr class="even">
<td><p>3.10.0</p></td>
<td><p>Nov 2017</p></td>
<td><p>Ubuntu 18.04 (3.10.2)</p></td>
</tr>
<tr class="odd">
<td><p>3.12.2</p></td>
<td><p>Sep 2018</p></td>
<td><p>EPEL7: available as cmake3; Ubuntu 18.10 (3.12.1); Travis Xenial (3.12.4) (*2)</p></td>
</tr>
<tr class="even">
<td><p>3.13.0</p></td>
<td><p>Nov 2018</p></td>
<td><p>Debian Stretch-backports (3.13.2); Debian Buster (3.13.4)</p></td>
</tr>
<tr class="odd">
<td><p>3.14.0</p></td>
<td><p>Mar 2019</p></td>
<td><p>Initial VS 2019 generator</p></td>
</tr>
</tbody>
</table>

</div>

(\*1) SLES12 SP2 includes CMake 3.5 according to <https://www.suse.com/media/presentation/TUT88458_suse_linux_enterprise_server_12_sp_whats_new.pdf>

(\*2) Travis versions per distro: <https://docs.travis-ci.com/user/languages/cpp/#cmake>

## Python

Python 3.4 or newer has become required since v2.9.0rc0-2460-ge9f7bb5127. The test suite currently does not depend on pytest, but can be used with it.

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Distro</strong></p></td>
<td><p><strong>package version</strong></p></td>
</tr>
<tr class="even">
<td><p>RHEL/CentOS 7</p></td>
<td><p>(unavailable, EPEL python34-pytest 2.8.5 is too old</p></td>
</tr>
<tr class="odd">
<td><p>Debian Stretch</p></td>
<td><p>python3-pytest 3.0.6</p></td>
</tr>
<tr class="even">
<td><p>Ubuntu 17.10</p></td>
<td><p>python3-pytest 3.1.3</p></td>
</tr>
</tbody>
</table>

</div>

On older systems, you can install it via: `pip3 install pytest pytest-xdist`

## Lua

Lua 5.1 and 5.2 are the only supported versions since Wireshark 3.0. Lua 5.3 is not supported due to the bitop library ([Bug 10881](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=10881)). LuaJIT was being considered for 3.1 ([Bug 15745](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=15745)) and is API/ABI compatible with Lua 5.1 and supports many new 5.2 library functions since LuaJIT 2.0.0-beta11 (2012-10-16). However since LuaJIT upstream appeared inactive in 2019, it was decided not to merge the [LuaJIT patch](https://code.wireshark.org/review/33047).

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Platform</strong></p></td>
<td><p><strong>LuaJIT</strong></p></td>
<td><p><strong>Lua 5.1</strong></p></td>
<td><p><strong>Lua 5.2</strong></p></td>
<td><p><strong>Lua 5.3</strong></p></td>
</tr>
<tr class="even">
<td><p>SLES 11</p></td>
<td><p>no</p></td>
<td><p>5.1.4</p></td>
<td><p>no</p></td>
<td><p>no</p></td>
</tr>
<tr class="odd">
<td><p>RHEL/CentOS 6/7</p></td>
<td><p>2.0.4 (EPEL)</p></td>
<td><p>5.1.4</p></td>
<td><p>no</p></td>
<td><p>no</p></td>
</tr>
<tr class="even">
<td><p>RHEL/CentOS 8</p></td>
<td><p>no</p></td>
<td><p>no</p></td>
<td><p>no</p></td>
<td><p>5.3.4</p></td>
</tr>
<tr class="odd">
<td><p>SLES 12</p></td>
<td><p>no</p></td>
<td><p>5.1.5</p></td>
<td><p>5.2.2</p></td>
<td><p>no</p></td>
</tr>
<tr class="even">
<td><p>Debian Jessie</p></td>
<td><p>2.0.3</p></td>
<td><p>5.1.5</p></td>
<td><p>5.2.3</p></td>
<td><p>no</p></td>
</tr>
<tr class="odd">
<td><p>Ubuntu 16.04</p></td>
<td><p>2.0.4</p></td>
<td><p>5.1.5</p></td>
<td><p>5.2.4</p></td>
<td><p>5.3.1</p></td>
</tr>
<tr class="even">
<td><p>macOS (homebrew)</p></td>
<td><p>2.0.5</p></td>
<td><p>5.1.5</p></td>
<td><p>no</p></td>
<td><p>5.3.5</p></td>
</tr>
<tr class="odd">
<td><p>Ubuntu &gt;= 18.04 / Debian &gt;= stretch-backports</p></td>
<td><p>2.1.0~beta3</p></td>
<td><p>5.1.5</p></td>
<td><p>5.2.4</p></td>
<td><p>5.3.3</p></td>
</tr>
</tbody>
</table>

</div>

## Nghttp2

nghttp2 is required for complete HTTP/2 support. It also powers HTTP/2 support in curl, and should be increasingly available. The package name is typically "libnghttp2".

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Platform</strong></p></td>
<td><p>version</p></td>
</tr>
<tr class="even">
<td><p>RHEL/CentOS 6 (EPEL)</p></td>
<td><p>1.6.0</p></td>
</tr>
<tr class="odd">
<td><p>RHEL/CentOS 7 (EPEL)</p></td>
<td><p>1.31.1</p></td>
</tr>
<tr class="even">
<td><p>RHEL/CentOS 8</p></td>
<td><p>1.33.0</p></td>
</tr>
<tr class="odd">
<td><p>Fedora 29</p></td>
<td><p>1.39.2</p></td>
</tr>
<tr class="even">
<td><p>Debian Jessie</p></td>
<td><p>0.6.4</p></td>
</tr>
<tr class="odd">
<td><p>Debian Stretch</p></td>
<td><p>1.18.1</p></td>
</tr>
<tr class="even">
<td><p>Ubuntu 16.04</p></td>
<td><p>1.7.1</p></td>
</tr>
<tr class="odd">
<td><p>Ubuntu 18.04</p></td>
<td><p>1.30.0</p></td>
</tr>
<tr class="even">
<td><p>macOS (homebrew)</p></td>
<td><p>1.39.2</p></td>
</tr>
<tr class="odd">
<td><p>SLES 12</p></td>
<td><p>(none)</p></td>
</tr>
</tbody>
</table>

</div>

If the minimum version can be bumped to 1.11.0, we can remove use of a deprecated function.

# Linux Distributions

Note: [This site](http://rpms.famillecollet.com/rpmphp/) allows you to enter a package name and see which Red Hat-based distributions use what version of the package.

<https://pkgs.org/> also provided a service to identify the latest versions.

<https://distrowatch.com/> is also another good source for seeing package versions in various distributions.

## RHEL/CentOS

Latest versions are listed, earlier versions are between parentheses.

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Distribution</strong></p></td>
<td><p><strong>Initial Release</strong></p></td>
<td><p><strong>End of Normal Support</strong></p></td>
<td><p><strong>GLIB version</strong></p></td>
<td><p><strong>Gtk2 version</strong></p></td>
<td><p><strong>Gtk3 version</strong></p></td>
<td><p><strong>Qt4 version</strong></p></td>
<td><p><strong>Qt5 version</strong></p></td>
</tr>
<tr class="even">
<td><p>Red Hat EL/CentOS 5</p></td>
<td><p>2007/3</p></td>
<td><p>2017/3</p></td>
<td><p>2.12.3</p></td>
<td><p>2.10.4</p></td>
<td><p>(none)</p></td>
<td><p>4.2.1</p></td>
<td><p>(none)</p></td>
</tr>
<tr class="odd">
<td><p>Red Hat EL/CentOS 6</p></td>
<td><p>2010/11</p></td>
<td><p>2020/11</p></td>
<td><p>2.28.8 (2.26.1, 2.22.5)</p></td>
<td><p>2.24.23 (2.20.1, 2.18.9)</p></td>
<td><p>(none)</p></td>
<td><p>4.6.2</p></td>
<td><p>base:(none) EPEL:5.6.1</p></td>
</tr>
<tr class="even">
<td><p>Red Hat EL/CentOS 7</p></td>
<td><p>2014/6</p></td>
<td><p>2024/6</p></td>
<td><p>2.50.3 (2.40.0, 2.36.3)</p></td>
<td><p>2.24.22</p></td>
<td><p>3.22.26 (3.8.4)</p></td>
<td><p>4.8.7 (4.8.5)</p></td>
<td><p>5.9.7 (5.6.2)</p></td>
</tr>
<tr class="odd">
<td><p>Red Hat EL/CentOS 8</p></td>
<td><p>2019/5</p></td>
<td><p>2029/5</p></td>
<td><p>2.56.4</p></td>
<td><p>2.24.32</p></td>
<td><p>3.22.30</p></td>
<td><p>(none)</p></td>
<td><p>5.12.15 (5.6.2)</p></td>
</tr>
</tbody>
</table>

</div>

Note: [EPEL](https://fedoraproject.org/wiki/EPEL) is an optional repository for extra packages.

Note: RHEL 6.6 and Qt5 is [supported](https://blog.qt.io/blog/2015/06/24/qt-is-coming-to-red-hat-enterprise-linux/) by Qt (version 5.5.0).

## Fedora

Releases can be found at <https://fedoraproject.org/wiki/Releases>. Every 6 months a new version is released with 13 months of support.

| Distribution | GLIB version | Gtk2 version | Gtk3 version | Qt4 version | Qt5 version |
|--------------|--------------|--------------|--------------|-------------|-------------|
| Fedora 7     | 2.12         | 2.10         | (none)       | (none)      | (none)      |
| Fedora 8     | 2.14         | 2.12         | (none)       | (none)      | (none)      |
| Fedora 9     | 2.16         | 2.12         | (none)       | 4.5.2       | (none)      |
| Fedora 10    | 2.18         | 2.14         | (none)       | 4.5.3       | (none)      |
| Fedora 11    | 2.20         | 2.16         | (none)       | 4.6.2       | (none)      |
| Fedora 12    | 2.22         | 2.18         | (none)       | 4.6.3       | (none)      |
| Fedora 13    | 2.24         | 2.20         | (none)       | 4.6.3       | (none)      |
| Fedora 14    | 2.26         | 2.22         | 2.90.5       | 4.7.4       | (none)      |
| Fedora 15    | 2.28         | 2.24         | 3.0.9        | 4.7.4       | (none)      |
| Fedora 16    | 2.30         | 2.24         | 3.2.1        | 4.8.4       | (none)      |
| Fedora 17    | 2.32         | 2.24         | 3.4.3        | 4.8.5       | 5.0.2       |
| Fedora 18    | 2.34         | 2.24         | 3.6.2        | 4.8.5       | 5.2.0-rc1   |
| Fedora 19    | 2.36         | 2.24.22      | 3.8.2        | 4.8.6       | 5.3.2       |
| Fedora 20    | 2.38         | 2.24.27      | 3.10.9       | 4.8.6       | 5.4.1       |
| Fedora 21    | 2.42         | 2.24.28      | 3.14.14      | 4.8.6       | 5.4.1       |
| Fedora 22    | 2.44         | 2.24.28      | 3.16.5       | 4.8.7       | 5.4.2       |
| Fedora 23    | 2.46         | 2.24.28      | 3.18.2       | 4.8.7       | 5.5.0       |
| Fedora 24    | 2.48         | 2.24.30      | 3.20.6       | 4.8.7       | 5.6.0       |
| Fedora 25    | 2.50.1       | 2.24.31      | 3.22.2       | 4.8.7       | 5.7.0       |
| Fedora 26    | ?            | ?            | ?            | ?           | ?           |
| Fedora 27    | 2.54.3       | x            | x            | x           | 5.9.6       |
| Fedora 28    | 2.56.4       | x            | x            | x           | 5.11.3      |
| Fedora 29    | 2.58.3       | x            | x            | x           | 5.11.3      |
| Fedora 30    | 2.60.1       | x            | x            | x           | 5.12.1      |

## SUSE Linux Enterprise Server

Version numbering skipped from 12 to 15

| Distribution | Initial release       | End of Normal Support | GLIB version    | Gtk2 version      | Gtk3 version     | Qt4 version   | Qt5 version          |
|--------------|-----------------------|-----------------------|-----------------|-------------------|------------------|---------------|----------------------|
| SLES 11      | 2009/03               | 2019/3                | 2.18.2          | 2.14.4            | (none)           | 4.4.3         | (none)               |
| SLES 11 SP1  | 2010/06               | 2019/3                | 2.22.5          | 2.18.9            | (none)           | 4.6.2         | (none)               |
| SLES 11 SP2  | 2012/02               | 2019/3                | 2.22.5          | 2.18.9            | (none)           | 4.6.3         | (none)               |
| SLES 11 SP3  | 2013/07               | 2019/3                | 2.22.5          | 2.18.9            | (none)           | 4.6.3         | (none)               |
| SLES 11 SP4  | 2015/07               | 2019/3                | 2.22.5          | 2.18.9            | (none)           | 4.6.3         | (none)               |
| SLES 12      | 2014/10 (SP5 2019/12) | 2024/10               | 2.48.2 (2.38.2) | 2.24.31 (2.24.24) | 3.20.10 (3.10.9) | 4.8.7 (4.8.6) | 5.6.2 (5.5.1, 5.3.1) |
| SLES 15      | 2018/07               | 2028/7                | 2.54.3          | 2.24.32           | 3.22.30          | (none)        | 5.9.4                |

## openSUSE

Version numbering changed over time: ..., 13.2, Leap 42.1, ..., Leap 42.3, Leap 15.0. From openSUSE Leap: at least 36 months lifetime, until the next major Leap version is available. Until openSUSE 13.2: 8 month release cycle, 18 months lifetime, see <https://en.opensuse.org/Lifetime>

Search for packages in openSUSE here: <https://software.opensuse.org/search>

| Distribution       | GLIB version | Gtk2 version | Gtk3 version | Qt4 version | Qt5 version |
|--------------------|--------------|--------------|--------------|-------------|-------------|
| openSUSE 10.0      | 2.8.1        | 2.8.3        | (none)       | 4.0.1       | (none)      |
| openSUSE 10.2      | 2.12.4       | 2.10.6       | (none)       | 4.2.1       | (none)      |
| openSUSE 10.3      | 2.14.1       | 2.12.0       | (none)       | 4.3.1       | (none)      |
| openSUSE 11.0      | 2.16.3       | 2.12.9       | (none)       | 4.4.0       | (none)      |
| openSUSE 11.1      | 2.18.2       | 2.14.4       | (none)       | 4.4.3       | (none)      |
| openSUSE 11.2      | 2.22.4       | 2.18.6       | (none)       | 4.5.3       | (none)      |
| openSUSE 11.3      | 2.24.1       | 2.20.1       | (none)       | 4.6.3       | (none)      |
| openSUSE 11.4      | 2.28.0       | 2.22.1       | 3.0.0        | 4.7.1       | (none)      |
| openSUSE 12.1      | 2.30.1       | 2.24.7       | 3.2.1        | 4.7.4       | (none)      |
| openSUSE 12.2      | 2.32.4       | 2.24.10      | 3.4.4        | 4.8.1       | (none)      |
| openSUSE 12.3      | 2.34.3       | 2.24.18      | 3.6.5        | 4.8.4       | (none)      |
| openSUSE 13.1      | 2.38.2       | 2.24.23      | 3.10.9       | 4.8.5       | 5.1.1       |
| openSUSE 13.2      | 2.42.2       | 2.24.28      | 3.14.13      | 4.8.6       | 5.4.1       |
| openSUSE Leap 42.3 | 2.48.2       | x            | x            | 4.8.7       | 5.6.2       |
| openSUSE Leap 15.0 | 2.54.3       | x            | x            | 4.8.7       | 5.9.4       |

## Debian

| Distribution       | GLIB version | Gtk2 version | Gtk3 version | Qt4 version | Qt5 version |
|--------------------|--------------|--------------|--------------|-------------|-------------|
| squeeze            | 2.24.2       | 2.20.1       | (none)       | 4.6.3       | (none)      |
| wheezy             | 2.33.12      | 2.24.10      | 3.4.2        | 4.8.2       | (none)      |
| jessie             | 2.42.1       | 2.24.25      | 3.14.5       | 4.8.6       | 5.3.2       |
| stretch            | 2.50.3       | 2.24.31      | 3.22.11      | 4.8.7       | 5.7.1       |
| buster             | 2.58.3       | x            | x            | x           | 5.11.3      |
| bullseye (testing) | 2.62.4       | x            | x            | x           | 5.12.5      |

Since GTK+ and Qt4 are no longer supported, it is not being tracked anymore (x).

## Ubuntu

6 month release cycle, 9 month (regular), 5 years (LTS) lifetime.

| Distribution       | GLIB version | Gtk2 version | Gtk3 version | Qt4 version | Qt5 version |
|--------------------|--------------|--------------|--------------|-------------|-------------|
| precise (12.04LTS) | 2.32.4       | 2.24.10      | 3.4.2        | 4.8.1       | (none)      |
| trusty (14.04LTS)  | 2.40.2       | 2.24.23      | 3.10.8       | 4.8.5       | 5.2.1       |
| utopic (14.10)     | 2.42.1       | 2.24.25      | 3.12.2       | 4.8.6       | 5.3.0       |
| vivid (15.04)      | 2.44.1       | 2.24.27      | 3.14.13      | 4.8.6       | 5.4.1       |
| wily (15.10)       | 2.46.2       | 2.24.28      | 3.16.7       | 4.8.6       | 5.4.2       |
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

FOSS library packaging and distribution on Windows is (to put it mildly) [a mess](https://twitter.com/geraldcombs/status/735870968451629056). There is no centralized, mature packaging system similar to what you will find in a typical Linux distribution. As a result we've created our own repository of packages from various sources including the [openSUSE Build Service](https://build.opensuse.org/project/show?project=windows%3Amingw%3Awin64), the [Lua Binaries](http://luabinaries.sourceforge.net/) project, ourselves (i.e. via manual compilation) and others. Packages are installed using `tools/win-setup.ps1` in the Wireshark sources.

There are a few projects that aim to fix the packaging problem on Windows including [vcpkg](https://github.com/Microsoft/vcpkg), [Conan](https://www.conan.io/), and [Win-builds](http://win-builds.org/doku.php). Hopefully we can use one of them in the future.

---

Imported from https://wiki.wireshark.org/Development/Support_library_version_tracking on 2020-08-11 23:13:11 UTC
