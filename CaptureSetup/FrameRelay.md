# Frame Relay capture setup

On some platforms, you might be able to capture raw Frame Relay traffic on an interface; on others, you might only be able to capture PPP, Cisco HDLC, etc. traffic running on the Frame Relay link.

## Table of contents

[[_TOC_]]

## Capturing on a link between the machine running Wireshark and the central office

### Linux

It should be possible to capture raw Frame Relay traffic on some devices.

### macOS, Solaris, FreeBSD, NetBSD, OpenBSD, DragonFly BSD, and others

*Unknown. We welcome any information you have.*

## Capturing on a link between another machine and the central office

### Endace DAG Cards (Linux, FreeBSD, Windows)

It might be possible, on some operating systems, to attach a machine running Wireshark to an Frame Relay link between another machine and the central office, using a DAG card from [Endace Measurement Systems](http://www.endace.com/). You would need a version of libpcap or [WinPcap](/WinPcap) that supports the DAG API, and would also have to have Endace's software for the DAG card providing that API installed. For libpcap, you'd probably have to install the DAG software and then download the libpcap source from [the tcpdump.org Web site](http://www.tcpdump.org/), configure, build, and install that software. The DAG cards are supported with libpcap only on Linux and FreeBSD. For further help on this you should contact Endace.

### Logix Mocha Wan Card (Windows)

Logix Communications' [Mocha Wan adapter](http://www.logixcomms.co.uk/t_mocha.htm) can be used to capture traffic on a number of interface types, including Frame Relay. For further details you should contact Logix Communications.

## See Also

  - [Capturing on Ethernet Networks](/CaptureSetup/Ethernet)

  - [Capturing on 802.11 Wireless Networks](/CaptureSetup/WLAN)

  - [Capturing on Token Ring Networks](/CaptureSetup/TokenRing)

  - [Capturing on VLAN Protected Networks](/CaptureSetup/VLAN)

  - [Capturing on PPP Networks](/CaptureSetup/PPP)

  - [Capturing on the Loopback Device](/CaptureSetup/Loopback)

  - [Capturing DOCSIS Traffic](/CaptureSetup/DOCSIS)

  - [Capturing Bluetooth Traffic](/CaptureSetup/Bluetooth)

  - [Capturing on ATM Networks](/CaptureSetup/ATM)

  - [Capturing USB Traffic](/CaptureSetup/USB)

  - [Capturing IrDA Traffic](/CaptureSetup/IrDA)

  - [Capturing on Cisco HDLC Networks](/CaptureSetup/CiscoHDLC)

  - [Capturing SS7 Traffic](/CaptureSetup/SS7)

-----

---

Imported from https://wiki.wireshark.org/CaptureSetup/FrameRelay on 2020-08-11 23:11:54 UTC
