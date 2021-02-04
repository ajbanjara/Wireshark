# SS7-over-TDM capture setup

Recent versions of libpcap/WinPcap support capturing [SS7](/SS7) transported over TDM links (E1/T1/J1/E3/T3/J3). This page describes how to do that with various types of hardware.

## Table of contents

[[_TOC_]]

## Capturing with DAG cards from Endace Measurement Systems

With libpcap 0.9.2 or later on Linux, if libpcap has been built with support for the DAG API from [Endace Measurement Systems](http://www.endace.com/), it should be possible to capture SS7 traffic with DAG cards from Endace.

## Capturing with Septel or NetStructure SS7 cards from Intel

With libpcap 0.9.1 or later on Linux, if libpcap has been built with support for the Septel API from [Intel](http://www.intel.com/), it should be possible to capture SS7 traffic with Septel or NetStructure cards from Intel.

## Capturing with E1/T1/J1 PCMCIA and PCI boards from Utel Systems

As indicated in this message: <https://marc.info/?l=ethereal-dev&m=112892915122025&w=2>, it is possible to use PCMCIA or PCI form hardware from [Utel Systems](http://www.utelsystems.com/) to capture SS7 traffic with Wireshark on Windows. (The message was sent before the rename of Ethereal to Wireshark.) This requires a patched version of [WinPcap](/WinPcap).

BUT, according to [this message](http://www.wireshark.org/lists/wireshark-users/201001/msg00097.html), Utel no longer supports Ethereal/Wireshark.

## Discussion

More detail is needed for all of these, e.g. notes on building libpcap with DAG/Septel support (if the vendor doesn't supply information on that), links to the specific hardware supported, names of the devices on which to capture, and directions on how to say "I'm capturing MTP2 on this device" (you should just get that by default for the Septel/\![NetStructure](/NetStructure) cards, you'd have to select it for the Endace cards).

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

  - [Capturing on Cisco HDLC Networks](/CaptureSetup/CiscoHDLC)

-----

---

Imported from https://wiki.wireshark.org/CaptureSetup/SS7 on 2020-08-11 23:12:02 UTC
