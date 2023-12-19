[Npcap](https://npcap.com) and [WinPcap](http://www.winpcap.org) are Windows versions of the [libpcap](http://www.tcpdump.org/) library. One of them must be installed in order to capture live network traffic on Windows. Npcap supports Windows 7 through Windows 11. WinPcap is for Windows 95 through Windows 8.

The Wireshark installer from 3.0 onwards includes Npcap, where versions before included WinPcap.  
Even with the older Wireshark versions, Npcap might work better for you, especially if you run Windows 10.  
Npcap has a Yes/No comparison chart - [Npcap or WinPcap?](https://nmap.org/npcap/vs-winpcap.html)

See [CaptureSetup/CapturePrivileges](/CaptureSetup/CapturePrivileges) for information about using Npcap and WinPcap with Wireshark.

The libpcap file format description can be found at: [Development/LibpcapFileFormat](/Development/LibpcapFileFormat)

## Npcap Versions

Npcap gets regular [bug fixes and upgrades](https://github.com/nmap/npcap/blob/master/CHANGELOG.md) on its own release schedule, which means the version bundled with the Wireshark installer may not be the latest. 
Please use an [updated version](https://npcap.com/#download) when possible.

See the "Add or Remove Programs" list of the "Control Panel" for the installed version.

## WinPcap Versions

:warning: **We strongly recommend that you use [Npcap](/Npcap). If you must use WinPcap, use version 4.1.3. Some annoying bugs are fixed in these versions\!**

See the "Add or Remove Programs" list of the "Control Panel" for the installed version.

### Last Stable Release: 4.1.3

The last WinPcap release version was 4.1.3. The 4.1.x versions contain the following improvements:

  - Support for Windows XP, Vista, 2008, Windows 7, 2008R2 64 bit, Windows 8 and Server 2012
  - Allows remote capture to work with Wireshark
  - Based on libpcap 1.0

WinPcap 4.x does not support Windows 3.1, 95, 98, or ME.

### Previous Stable Release: 3.1

This version contains substantial bug fixes and extensions above the 3.0 release:

  - based on libpcap 0.9.3, with many fixes and extensions above the older version
  - dial-up connections (e.g. PPP) can be captured on Windows 2000, Windows XP, and Windows Server 2003, as well as Windows 95, Windows 98, and Windows Me, which were supported by previous releases
  - "can't get a list of interfaces" error fixed

See [the change log for WinPcap](http://www.winpcap.org/misc/changelog.htm) for a more complete list (although some of those bugs might be bugs in older 3.1 betas rather than in 3.0).

## Installation

The Wireshark installer will copy the Npcap installer and call it, so you get installation done "all in one place". This is the same Npcap installer that you can get from [Npcap's download page](https://npcap.com/#download).

## Windows Versions

[Npcap](/Npcap) supports Windows 7 SP1 through Windows 11. The list of supported Windows versions for WinPcap is available in [WinPcap FAQ \#14](http://www.winpcap.org/misc/faq.htm#Q-14).

---

Imported from https://wiki.wireshark.org/WinPcap on 2020-08-11 23:27:29 UTC
