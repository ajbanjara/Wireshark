# Dario's tips and tricks

# An army of monkeys

I maintain some builders that help me fix bugs in wireshark as soon as they appear:

| Platform | Status |
|----------|--------|
| Gitlab CI | [![pipeline status](https://gitlab.com/wireshark/wireshark/badges/master/pipeline.svg)](https://gitlab.com/wireshark/wireshark/-/pipelines) |
| Travis CI | [![pipeline status](https://www.travis-ci.com/crondaemon/wireshark.svg?branch=master)](https://www.travis-ci.com/gitlab/crondaemon/wireshark) |
| Semaphore CI | [![pipeline status](https://semaphoreci.com/api/v1/crondaemon/wireshark/branches/master/badge.svg)](https://semaphoreci.com/crondaemon/wireshark) |
| AppVeyor | [![pipeline status](https://ci.appveyor.com/api/projects/status/00oc33lud6bq3x5f?svg=true)](https://ci.appveyor.com/project/crondaemon/wireshark/) |
| Cirrus CI | [![pipeline status](https://api.cirrus-ci.com/github/crondaemon/wireshark.svg)](https://cirrus-ci.com/) |
| Github Actions - CMake Options Test | [![Github Actions - CMake Options Test](https://github.com/crondaemon/wireshark/workflows/CMake%20Options%20Test/badge.svg)](https://github.com/crondaemon/wireshark/actions?query=workflow%3A%22CMake+Options+Test%22) |
| Github Actions - MacOS | [![Build MacOS](https://github.com/crondaemon/wireshark/workflows/Build%20MacOS/badge.svg) ](https://github.com/crondaemon/wireshark/actions?query=workflow%3A%22Build+MacOS%22)| 
| GitHub Actions - Windows | [![Build Windows](https://github.com/crondaemon/wireshark/workflows/Build%20Windows/badge.svg)](https://github.com/crondaemon/wireshark/actions?query=workflow%3A%22Build+Windows%22) | 
| Github Actions -Ubuntu | [![Build Ubuntu](https://github.com/crondaemon/wireshark/workflows/Build%20Ubuntu/badge.svg)](https://github.com/crondaemon/wireshark/actions?query=workflow%3A%22Build+Ubuntu%22) |


I've been a core developer since 2016. During my Wireshark development I've collected a bunch of tips and tricks that I'm putting here. Maybe others than me can find them useful.

  - [Nflog Traffic](/dario/nflog-traffic)
  - [Activate debug messages](/dario/debug-messages)
  - [Gerrit ninja tricks](/dario/gerrit)
  - [Test on a secondary X display](/dario/secondary-x-display)
  - [Wireshark's components graph](/dario/graphviz)
  - [Import hex dump of a payload](/dario/import_payload)
  - [OSS fuzz reproducer](/dario/oss-fuzz)

# Other random resources

  - [Clang's automated analysis](https://www.wireshark.org/download/automated/analysis/).
  - [Coverity defects page](https://scan.coverity.com/projects/wireshark/view_defects).
  - [Balint's lintian output](https://lintian.debian.org/maintainer/rbalint@ubuntu.com.html)

