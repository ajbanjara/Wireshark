# Network media specific capturing

The capture library [libpcap](/libpcap) / [WinPcap](/WinPcap), and the underlying packet capture mechanisms it uses, don't support capturing on all network types on all platforms; Wireshark and TShark use libpcap/WinPcap, and thus have the same limitations it does.

This is a table giving the network types supported on various platforms:

| Interface                                        | AIX                | FreeBSD            | HP-UX              | Irix               | Linux                          | macOS              | NetBSD             | OpenBSD            | Solaris            | Tru64 UNIX         | Windows            |
| ------------------------------------------------ | :----------------: | :----------------: | :----------------: | :----------------: | :----------------------------: | :----------------: | :----------------: | :----------------: | :----------------: | :----------------: | :----------------: |
| **[ATM](/CaptureSetup/ATM)**                     | :grey_question:    | :grey_question:    | :grey_question:    | :grey_question:    | :white_check_mark:             | :x:                | :grey_question:    | :grey_question:    | :white_check_mark: | :grey_question:    | :grey_question:    |
| **[Bluetooth](/CaptureSetup/Bluetooth)**         | :x:                | :x:                | :x:                | :x:                | :white_check_mark:<sup>1</sup> | :x:                | :x:                | :x:                | :x:                | :x:                | :x:                |
| **[CiscoHDLC](/CaptureSetup/CiscoHDLC)**         | :grey_question:    | :white_check_mark: | :grey_question:    | :grey_question:    | :white_check_mark:             | :grey_question:    | :white_check_mark: | :white_check_mark: | :grey_question:    | :grey_question:    | :grey_question:    |
| **[Ethernet](/CaptureSetup/Ethernet)**           | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark:             | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| **FDDI**                                         | :grey_question:    | :grey_question:    | :grey_question:    | :grey_question:    | :white_check_mark:             | :x:                | :grey_question:    | :grey_question:    | :white_check_mark: | :grey_question:    | :grey_question:    |
| **[FrameRelay](/CaptureSetup/FrameRelay)**       | :grey_question:    | :grey_question:    | :x:                | :x:                | :white_check_mark:             | :x:                | :grey_question:    | :grey_question:    | :x:                | :x:                | :x:                |
| **[IrDA](/CaptureSetup/IrDA)**                   | :x:                | :x:                | :x:                | :x:                | :white_check_mark:             | :x:                | :x:                | :x:                | :x:                | :x:                | :x:                |
| **[PPP](/CaptureSetup/PPP)<sup>2</sup>**         | :grey_question:    | :grey_question:    | :grey_question:    | :grey_question:    | :white_check_mark:             | :white_check_mark: | :grey_question:    | :grey_question:    | :x:                | :grey_question:    | :white_check_mark: |
| **[TokenRing](/CaptureSetup/TokenRing)**         | :white_check_mark: | :white_check_mark: | :grey_question:    | :x:                | :white_check_mark:             | :x:                | :white_check_mark: | :white_check_mark: | :white_check_mark: | :grey_question:    | :white_check_mark: |
| **[USB](/CaptureSetup/USB)**                     | :x:                | :x:                | :x:                | :x:                | :white_check_mark:<sup>3</sup> | :x:                | :x:                | :x:                | :x:                | :x:                | :x:                |
| **[WLAN](/CaptureSetup/WLAN)<sup>4</sup>**       | :grey_question:    | :white_check_mark: | :grey_question:    | :grey_question:    | :white_check_mark:             | :white_check_mark: | :white_check_mark: | :white_check_mark: | :grey_question:    | :grey_question:    | :white_check_mark: |
| **[Loopback](/CaptureSetup/Loopback)** (virtual) | :grey_question:    | :white_check_mark: | :x:                | :grey_question:    | :white_check_mark:             | :white_check_mark: | :white_check_mark: | :white_check_mark: | :x:                | :white_check_mark: | N/A<sup>5</sup>    |
| **[VLAN](/CaptureSetup/VLAN) Tags** (virtual)    | :white_check_mark: | :white_check_mark: | :white_check_mark: | :grey_question:    | :white_check_mark:             | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |


1.  Linux Affix Bluetooth stack only.
2.  PPP non-control frames only.
3.  Latest libpcap CVS required (which exact version?).
4.  On some platforms: WLAN non-control frames only, with fake Ethernet headers, and only traffic to and from the machine doing the capturing.
5.  Windows does not have a UNIX-style loopback interface.

The following discuss various capture issues for particular types of networks

### Physical interfaces

  - [ATM](/CaptureSetup/ATM) - capture [ATM](/ATM) traffic

  - [Bluetooth](/CaptureSetup/Bluetooth) - capture Bluetooth traffic - currently limited to [affix](http://affix.sourceforge.net/) stack on linux

  - [CiscoHDLC](/CaptureSetup/CiscoHDLC) links - capture on synchronous links using Cisco HDLC encapsulation

  - [DOCSIS](/CaptureSetup/DOCSIS) - capture raw Cisco [DOCSIS](/DOCSIS) cable modem traffic forwarded to [Ethernet](/Ethernet)

  - [Ethernet](/CaptureSetup/Ethernet) - capture on different [Ethernet](/Ethernet) topologies, including switched networks

  - [FrameRelay](/CaptureSetup/FrameRelay) - capture [FrameRelay](/FrameRelay) traffic

  - [IrDA](/CaptureSetup/IrDA) - capture IrDA traffic - currently limited to Linux.

  - [PPP](/CaptureSetup/PPP) links - capture on dial-up lines, ISDN connections and PPP-over-Ethernet (PPPoe, e.g. ADSL)

  - [SS7](/CaptureSetup/SS7) - capture [SS7](/SS7) traffic on TDM (T1/E1/J1/T3/E3/J3) links

  - [TokenRing](/CaptureSetup/TokenRing) - capture on [TokenRing](/TokenRing) adapters, including promiscuous mode and switched networks

  - [USB](/CaptureSetup/USB) - capture of raw USB traffic

  - [WLAN](/CaptureSetup/WLAN) - capture on 802.11 ([WLAN](/WLAN), [Wi-Fi](/Wi-Fi)) interfaces, including "monitor mode" , raw 802.11 headers and radio information

### Virtual interfaces

  - [Loopback](/CaptureSetup/Loopback) - capture traffic from a machine to itself, including the IP address 127.0.0.1

  - [Pipes](/CaptureSetup/Pipes) - use UNIX pipes to capture from other applications (even remote\!)

  - [VLAN](/CaptureSetup/VLAN) - capture [VLAN](/VLAN) traffic, including VLAN tags

  - [WinPcapRemote](/CaptureSetup/WinPcapRemote) - [WinPcap](/WinPcap) remote capturing (client for Win32, daemons for Win32 and Linux) - currently not working\!

### Unsupported media

There are several networks / busses from which Wireshark cannot capture raw data.

However, if the operating system supports it, Wireshark can usually capture network media it knows that "travel" on top of that network / bus.

Example: Wireshark can usual capture *Ethernet data* from a PCI [Ethernet](/Ethernet) adapter but it cannot capture the *raw PCI* data transferred over the PCI bus.

Here is an assortment of such networks / busses:

  - IEEE 1394/\![FireWire](/FireWire)

  - Fibre Channel

  - PCI, ISA, PCMCIA (Cardbus) ... and similar busses

-----

---

Imported from https://wiki.wireshark.org/CaptureSetup/NetworkMedia on 2020-08-11 23:11:57 UTC
