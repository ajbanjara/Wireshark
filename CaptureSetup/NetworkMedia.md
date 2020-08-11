# Network media specific capturing

The capture library [libpcap](/libpcap) / [WinPcap](/WinPcap), and the underlying packet capture mechanisms it uses, don't support capturing on all network types on all platforms; Wireshark and TShark use libpcap/WinPcap, and thus have the same limitations it does.

This is a table giving the network types supported on various platforms:

<div>

<table>

<tbody>

<tr>

<td>

</div>

</td>

<td>

**AIX**

</td>

<td>

**FreeBSD**

</td>

<td>

**HP-UX**

</td>

<td>

**Irix**

</td>

<td>

**Linux**

</td>

<td>

**macOS**

</td>

<td>

**NetBSD**

</td>

<td>

**OpenBSD**

</td>

<td>

**Solaris**

</td>

<td>

**Tru64 UNIX**

</td>

<td>

**Windows**

</td>

</tr>

<tr>

<td colspan="12" style="text-align: left">

Physical Interfaces

</td>

</tr>

<tr>

<td>

**[ATM](/CaptureSetup/ATM)**

</td>

<td>

Unknown

</td>

<td>

Unknown

</td>

<td>

Unknown

</td>

<td>

Unknown

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #FF8080">

No

</td>

<td>

Unknown

</td>

<td>

Unknown

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td>

Unknown

</td>

<td>

Unknown

</td>

</tr>

<tr>

<td>

**[Bluetooth](/CaptureSetup/Bluetooth)**

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #80FF80">

Yes<sup>1</sup>

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

</tr>

<tr>

<td>

**[CiscoHDLC](/CaptureSetup/CiscoHDLC)**

</td>

<td>

Unknown

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td>

Unknown

</td>

<td>

Unknown

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td>

Unknown

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td>

Unknown

</td>

<td>

Unknown

</td>

<td>

Unknown

</td>

</tr>

<tr>

<td>

**[Ethernet](/CaptureSetup/Ethernet)**

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

</tr>

<tr>

<td>

**FDDI**

</td>

<td>

Unknown

</td>

<td>

Unknown

</td>

<td>

Unknown

</td>

<td>

Unknown

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #FF8080">

No

</td>

<td>

Unknown

</td>

<td>

Unknown

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td>

Unknown

</td>

<td>

Unknown

</td>

</tr>

<tr>

<td>

**[FrameRelay](/CaptureSetup/FrameRelay)**

</td>

<td>

Unknown

</td>

<td>

Unknown

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #FF8080">

No

</td>

<td>

Unknown

</td>

<td>

Unknown

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

</tr>

<tr>

<td>

**[IrDA](/CaptureSetup/IrDA)**

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

</tr>

<tr>

<td>

**[PPP](/CaptureSetup/PPP)<sup>2</sup>**

</td>

<td>

Unknown

</td>

<td>

Unknown

</td>

<td>

Unknown

</td>

<td>

Unknown

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td>

Unknown

</td>

<td>

Unknown

</td>

<td style="background-color: #FF8080">

No

</td>

<td>

Unknown

</td>

<td style="background-color: #80FF80">

Yes

</td>

</tr>

<tr>

<td>

**[TokenRing](/CaptureSetup/TokenRing)**

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td>

Unknown

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td>

Unknown

</td>

<td style="background-color: #80FF80">

Yes

</td>

</tr>

<tr>

<td>

**[USB](/CaptureSetup/USB)**

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #80FF80">

Yes<sup>3</sup>

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #FF8080">

No

</td>

</tr>

<tr>

<td>

**[WLAN](/CaptureSetup/WLAN)<sup>4</sup>**

</td>

<td>

Unknown

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td>

Unknown

</td>

<td>

Unknown

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td>

Unknown

</td>

<td>

Unknown

</td>

<td style="background-color: #80FF80">

Yes

</td>

</tr>

<tr>

<td colspan="12" style="text-align: left">

Virtual Interfaces

</td>

</tr>

<tr>

<td>

**[Loopback](/CaptureSetup/Loopback)**

</td>

<td>

Unknown

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #FF8080">

No

</td>

<td>

Unknown

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #FF8080">

No

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td>

N/A<sup>5</sup>

</td>

</tr>

<tr>

<td>

**[VLAN](/CaptureSetup/VLAN) Tags**

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td>

Unknown

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

<td style="background-color: #80FF80">

Yes

</td>

</tr>

</tbody>

</table>

</div>

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
