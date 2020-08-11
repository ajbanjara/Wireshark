# Dario's tips and tricks

I've been a core developer since 2016. During my Wireshark development I've collected a bunch of tips and tricks that I'm putting here. Maybe others than me can find them useful.

  - [Nflog Traffic](/dario/nflog-traffic)

  - [Activate debug messages](/dario/debug-messages)

  - [Gerrit ninja tricks](/dario/gerrit)

  - [Test on a secondary X display](/dario/secondary-x-display)

  - [Wireshark's components graph](/dario/graphviz)

  - [Import hex dump of a payload](/dario/import_payload)

  - [OSS fuzz reproducer](/dario/oss-fuzz)

# An army of monkeys

I maintain some builders that help me fix bugs in wireshark as soon as they appear:

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Platform</strong></p></td>
<td><p><strong>Builds</strong></p></td>
<td><p><strong>Details</strong></p></td>
<td style="text-align: right;"><p><strong>Status</strong></p></td>
</tr>
<tr class="even">
<td><p><a href="https://gitlab.com/crondaemon/wireshark/pipelines" class="https">Gitlab CI</a></p></td>
<td><p>8</p></td>
<td><p>multiple versions of gcc and clang, pcap/nopcap, ubuntu &amp; redhat</p></td>
<td style="text-align: right;"><p><a href="https://gitlab.com/crondaemon/wireshark/pipelines" class="https"><img src="https://gitlab.com/crondaemon/wireshark/badges/master/pipeline.svg" title="https://gitlab.com/crondaemon/wireshark/pipelines" class="external_image" alt="https://gitlab.com/crondaemon/wireshark/pipelines" /></a></p></td>
</tr>
<tr class="odd">
<td><p><a href="https://travis-ci.org/crondaemon/wireshark/builds" class="https">Travis CI</a></p></td>
<td><p>9</p></td>
<td><p>ubuntu + osx, gcc + clang, pcap/nopcap</p></td>
<td style="text-align: right;"><p><a href="https://travis-ci.org/crondaemon/wireshark/builds" class="https"><img src="https://api.travis-ci.org/crondaemon/wireshark.svg?branch=master" title="https://travis-ci.org/crondaemon/wireshark/builds" class="external_image" alt="https://travis-ci.org/crondaemon/wireshark/builds" /></a></p></td>
</tr>
<tr class="even">
<td><p><a href="https://semaphoreci.com/crondaemon/wireshark" class="https">Semaphore CI</a></p></td>
<td><p>2</p></td>
<td><p>ubuntu with interactive shell</p></td>
<td style="text-align: right;"><p><a href="https://semaphoreci.com/crondaemon/wireshark" class="https"><img src="https://semaphoreci.com/api/v1/crondaemon/wireshark/branches/master/badge.svg" title="https://semaphoreci.com/crondaemon/wireshark" class="external_image" alt="https://semaphoreci.com/crondaemon/wireshark" /></a></p></td>
</tr>
<tr class="odd">
<td><p><a href="https://ci.appveyor.com/project/crondaemon/wireshark/" class="https">AppVeyor CI</a></p></td>
<td><p>3</p></td>
<td><p>Windows 32/64 bit</p></td>
<td style="text-align: right;"><p><a href="https://ci.appveyor.com/project/crondaemon/wireshark/" class="https"><img src="https://ci.appveyor.com/api/projects/status/00oc33lud6bq3x5f?svg=true" title="https://ci.appveyor.com/project/crondaemon/wireshark/" class="external_image" alt="https://ci.appveyor.com/project/crondaemon/wireshark/" /></a></p></td>
</tr>
<tr class="even">
<td><p><a href="http://139.178.84.177:8010/" class="http">Buildbot on FreeBSD</a></p></td>
<td><p>1</p></td>
<td><p>FreeBSD</p></td>
<td style="text-align: right;"><p><a href="http://139.178.84.177:8010" class="http"><img src="http://139.178.84.177:8010/badges/runtests.svg" title="http://139.178.84.177:8010" class="external_image" alt="http://139.178.84.177:8010" /></a></p></td>
</tr>
<tr class="odd">
<td><p><a href="https://cirrus-ci.com" class="https">Cirrus CI</a></p></td>
<td><p>3</p></td>
<td><p>FreeBSD</p></td>
<td style="text-align: right;"><p><a href="https://cirrus-ci.com/" class="https"><img src="https://api.cirrus-ci.com/github/crondaemon/wireshark.svg" title="https://cirrus-ci.com/" class="external_image" alt="https://cirrus-ci.com/" /></a></p></td>
</tr>
<tr class="even">
<td><p><a href="https://github.com/crondaemon/wireshark/actions?query=workflow%3A%22Build+MacOS%22" class="https">Github actions</a></p></td>
<td><p>1</p></td>
<td><p>MacOS</p></td>
<td style="text-align: right;"><p><a href="https://github.com/crondaemon/wireshark/actions?query=workflow%3A%22Build+MacOS%22" class="https"><img src="https://github.com/crondaemon/wireshark/workflows/Build%20MacOS/badge.svg" title="https://github.com/crondaemon/wireshark/actions?query=workflow%3A%22Build+MacOS%22" class="external_image" alt="https://github.com/crondaemon/wireshark/actions?query=workflow%3A%22Build+MacOS%22" /></a></p></td>
</tr>
<tr class="odd">
<td><p><a href="https://github.com/crondaemon/wireshark/actions?query=workflow%3A%22Build+Windows%22" class="https">Github actions</a></p></td>
<td><p>1</p></td>
<td><p>Windows</p></td>
<td style="text-align: right;"><p><a href="https://github.com/crondaemon/wireshark/actions?query=workflow%3A%22Build+Windows%22" class="https"><img src="https://github.com/crondaemon/wireshark/workflows/Build%20Windows/badge.svg" title="https://github.com/crondaemon/wireshark/actions?query=workflow%3A%22Build+Windows%22" class="external_image" alt="https://github.com/crondaemon/wireshark/actions?query=workflow%3A%22Build+Windows%22" /></a></p></td>
</tr>
<tr class="even">
<td><p><a href="https://github.com/crondaemon/wireshark/actions?query=workflow%3A%22Build+Ubuntu%22" class="https">Github actions</a></p></td>
<td><p>1</p></td>
<td><p>Ubuntu</p></td>
<td style="text-align: right;"><p><a href="https://github.com/crondaemon/wireshark/actions?query=workflow%3A%22Build+Ubuntu%22" class="https"><img src="https://github.com/crondaemon/wireshark/workflows/Build%20Ubuntu/badge.svg" title="https://github.com/crondaemon/wireshark/actions?query=workflow%3A%22Build+Ubuntu%22" class="external_image" alt="https://github.com/crondaemon/wireshark/actions?query=workflow%3A%22Build+Ubuntu%22" /></a></p></td>
</tr>
<tr class="odd">
<td><p><a href="https://github.com/crondaemon/wireshark/actions?query=workflow%3A%22CMake+Options+Test%22" class="https">CMake Options Test</a></p></td>
<td><p>1</p></td>
<td><p>Ubuntu</p></td>
<td style="text-align: right;"><p><a href="https://github.com/crondaemon/wireshark/actions?query=workflow%3A%22CMake+Options+Test%22" class="https"><img src="https://github.com/crondaemon/wireshark/workflows/CMake%20Options%20Test/badge.svg" title="https://github.com/crondaemon/wireshark/actions?query=workflow%3A%22CMake+Options+Test%22" class="external_image" alt="https://github.com/crondaemon/wireshark/actions?query=workflow%3A%22CMake+Options+Test%22" /></a></p></td>
</tr>
</tbody>
</table>

</div>

# Other random resources

  - [Clang's automated analysis](https://www.wireshark.org/download/automated/analysis/).

  - [Coverity defects page](https://scan.coverity.com/projects/wireshark/view_defects).

  - [Balint's lintian output](https://lintian.debian.org/maintainer/rbalint@ubuntu.com.html)

---

Imported from https://wiki.wireshark.org/DarioLombardo on 2020-08-11 23:12:32 UTC
