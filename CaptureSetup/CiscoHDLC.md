# Cisco HDLC capture setup

Some ISDN connections or T1/E1 or other high-speed serial lines might use Cisco HDLC encapsulation rather than PPP encapsulation.

## Table of contents

[[_TOC_]]

## Capturing on a link to which the machine running Wireshark is connected

On some platforms, Wireshark supports capturing on a Cisco HDLC link to which the machine running Wireshark is connected, so that it can capture Cisco HDLC traffic that the machine in question sends and receives.

### Linux

It should be possible to capture on serial links using Cisco HDLC. (XXX - will you see SLARP traffic?)

### {Free,Net,Open,DragonFly}BSD

It should be possible to capture on serial links using Cisco HDLC. (XXX - will you see SLARP traffic?)

## Capturing on a link between two "other" machines

### Endace DAG Cards (Linux, FreeBSD, Windows)

It might be possible, on some operating systems, to attach a machine running Wireshark to a Cisco HDLC link between two other machines, using a DAG card from [Endace Measurement Systems](http://www.endace.com/). You would need a version of libpcap or [WinPcap](/WinPcap) that supports the DAG API, and would also have to have Endace's software for the DAG card providing that API installed. For libpcap, you'd probably have to install the DAG software and then download the libpcap source from [the tcpdump.org Web site](http://www.tcpdump.org/), configure, build, and install that software. The DAG cards are supported with libpcap only on Linux and FreeBSD. For further help on this you should contact Endace.

### Logix Mocha Wan Card (Windows)

Logix Communications' [Mocha Wan adapter](http://www.logixcomms.co.uk/t_mocha.htm) can be used to capture traffic on a number of interface types, including HDLC. For further details you should contact Logix Communications.

## See Also

  - [Capturing on Ethernet Networks](/CaptureSetup/Ethernet)

  - [Capturing on 802.11 Wireless Networks](/CaptureSetup/WLAN)

  - [Capturing on Token Ring Networks](/CaptureSetup/TokenRing)

  - [Capturing on VLAN Protected Networks](/CaptureSetup/VLAN)

  - [Capturing on PPP Networks](/CaptureSetup/PPP)

  - [Capturing on the Loopback Device](/CaptureSetup/Loopback)

  - [Capturing on Frame Relay Networks](/CaptureSetup/FrameRelay)

  - [Capturing DOCSIS Traffic](/CaptureSetup/DOCSIS)

  - [Capturing Bluetooth Traffic](/CaptureSetup/Bluetooth)

  - [Capturing on ATM Networks](/CaptureSetup/ATM)

  - [Capturing USB Traffic](/CaptureSetup/USB)

  - [Capturing IrDA Traffic](/CaptureSetup/IrDA)

  - [Capturing SS7 Traffic](/CaptureSetup/SS7)

-----

---

Imported from https://wiki.wireshark.org/CaptureSetup/CiscoHDLC on 2020-08-11 23:11:51 UTC
