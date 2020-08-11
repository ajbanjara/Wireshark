# ATM capture setup

As ATM traffic is cell-oriented rather than packet-oriented, the support for capturing ATM traffic on various platforms is a bit more complicated than support on, for example, various LAN types.

ATM interfaces might only support capturing at the "classical IP" layer. If you're using LANE, you might only be able to capture on the Ethernet or Token Ring layer on the emulated LAN, not on the raw ATM layer or even the raw LANE layer, so you might not see LANE headers or LE Control traffic.

## Table of contents

[[_TOC_]]

## Capturing on a link between the machine running Wireshark and the switch

### Solaris

On Solaris, with libpcap 0.8.1 or later, it should be possible to directly capture on a SunATM device (such as `ba0`). You will get reassembled AAL5 and Signalling AAL traffic, rather than raw cells. (XXX - what will you get for other AALs?)

Note that most versions of Wireshark for Solaris are statically linked with libpcap; that means that they have to have been built with libpcap 0.8.1 or later in order to support ATM captures. If a version of Wireshark was statically linked with a version of libpcap earlier than 0.8.1, downloading and installing 0.8.1 or a later version of libpcap will not give that version of Wireshark the ability to capture on SunATM devices.

### FreeBSD

XXX - what do you get here?

### NetBSD

XXX - what do you get here?

### OpenBSD

XXX - what do you get here?

### DragonFly BSD

XXX - what do you get here?

### Linux

There is currently no support for capturing "raw" ATM traffic (in the sense that only SAR is done, but you see the traffic on various AAL5/Signalling AAL VC's with a pseudo-header of some sort giving VPI/VCI information, etc.) on Linux. It should be possible to capture on interfaces supporting Classical IP.

### AIX

XXX - what do you get here?

### HP-UX

HP-UX's ATM interfaces aren't supported by DLPI in a fashion that allows libpcap to capture on them, so there's no support for capturing ATM traffic on HP-UX.

### Windows

Has anybody tried this? Network Monitor supports ATM captures with a type of [NdisMediumAtm](/NdisMediumAtm), so perhaps it works either with raw NDIS or with the [NetMon](/NetMon) driver (as is currently used by [WinPcap](/WinPcap) for PPP).

## Capturing on a link between another machine and the switch

It might be possible, on some operating systems, to attach a machine running Wireshark to an ATM link between another machine and an ATM switch, using a DAG card from [Endace Measurement Systems](http://www.endace.com/). You would need a version of libpcap or [WinPcap](/WinPcap) that supports the DAG API, and would also have to have Endace's software for the DAG card providing that API installed. For libpcap, you'd probably have to install the DAG software and then download the libpcap source from [the tcpdump.org Web site](http://www.tcpdump.org/), configure, build, and install that software. The DAG cards are supported with libpcap only on Linux and FreeBSD. For further help on this you should contact Endace.

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

  - [Capturing USB Traffic](/CaptureSetup/USB)

  - [Capturing IrDA Traffic](/CaptureSetup/IrDA)

  - [Capturing on Cisco HDLC Networks](/CaptureSetup/CiscoHDLC)

  - [Capturing SS7 Traffic](/CaptureSetup/SS7)

-----

---

Imported from https://wiki.wireshark.org/CaptureSetup/ATM on 2020-08-11 23:11:48 UTC
