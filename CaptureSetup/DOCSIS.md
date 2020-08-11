# DOCSIS capture setup

Cisco's Cable Modem Termination System in various of its head-end broadband routers supports a `cable monitor` command that causes it to forward packets on the cable interface to the Ethernet interface, for use by external LAN analyzers. The [Cable Monitor and Intercept Features for the Cisco CMTS](http://www.cisco.com/en/US/docs/cable/cmts/feature/guide/ufg_cmon.html) chapter in the [Cisco CMTS Feature Guide](http://www.cisco.com/en/US/docs/cable/cmts/feature/guide/cmtsfg.html), and [the Cable Monitor and Intercept Features for the Cisco CMTS Routers](http://www.cisco.com/en/US/docs/ios/cable/configuration/guide/cmts_mon_intrcpt_ps2209_TSD_Products_Configuration_Guide_Chapter.html) section in the [Cisco CMTS Cable Software Configuration Guide, Release 12.2SC](http://www.cisco.com/en/US/docs/ios/cable/configuration/guide/12_2sc/cbl_12_2sc_book.html), describe this in more detail.

It can be configured to encapsulate raw DOCSIS packets in Ethernet framing, using the `data docsis` and `mac` suboptions of the `packet-type` option. "Ethernet framing" here refers only to the very low-level framing that marks the start and end of an Ethernet frame, not to Ethernet link-layer headers - the frames sent on the Ethernet do not have the standard Ethernet 14-octet link-layer header, with a destination address, source address, and type/length field, they have only a DOCSIS header and payload.

***DO NOT*** combine the `data ethernet` option with the `data docsis` or `mac` suboptions, as that will mix DOCSIS packets and Ethernet packets in the same capture, and Wireshark will not be able to interpret both types of packets correctly; it will also cause data packets to appear twice in the same capture, once with a DOCSIS header and once with an Ethernet header. The "Cable Monitor Configuration Example (Ethernet, MAC-Layer, and DOCSIS-Data Packets)" example in the Cable Monitor and Intercept Features for the Cisco CMTS chapter of the Cisco CMTS Feature Guide combines those options; ignore the `cable monitor timestamp int e2/0 mac-address 0003.e3fa.5e8f packet-type data ethernet` command in that example.

Libpcap 0.9.1 and later, on most platforms, and [WinPcap](/WinPcap) 3.1 and later, on Windows, can capture on an Ethernet link but claim that the packets are DOCSIS packets, for convenience when capturing on an Ethernet segment to which a Cisco CMTS is forwarding DOCSIS packets. If Wireshark is using a version of libpcap that supports this, in the "Capture Options" dialog box the "Link-layer header type" field should offer a choice of "Ethernet" or "DOCSIS". The default is Ethernet; if you're capturing on an Ethernet link to which the CMTS is forwarding DOCSIS packets, choose DOCSIS instead. If you do this, Wireshark will treat the packets in the capture file as DOCSIS packets - even if you save the capture file and read it later.

Earlier versions of libpcap don't support that, so the traffic will be marked as Ethernet traffic, and you'll have to turn on the "Treat all frames as DOCSIS frames" preference for the Frame protocol in order to see those packets as DOCSIS packets.

## See Also

  - [Capturing on Ethernet Networks](/CaptureSetup/Ethernet)

  - [Capturing on 802.11 Wireless Networks](/CaptureSetup/WLAN)

  - [Capturing on Token Ring Networks](/CaptureSetup/TokenRing)

  - [Capturing on VLAN Protected Networks](/CaptureSetup/VLAN)

  - [Capturing on PPP Networks](/CaptureSetup/PPP)

  - [Capturing on the Loopback Device](/CaptureSetup/Loopback)

  - [Capturing on Frame Relay Networks](/CaptureSetup/FrameRelay)

  - [Capturing Bluetooth Traffic](/CaptureSetup/Bluetooth)

  - [Capturing on ATM Networks](/CaptureSetup/ATM)

  - [Capturing USB Traffic](/CaptureSetup/USB)

  - [Capturing IrDA Traffic](/CaptureSetup/IrDA)

  - [Capturing on Cisco HDLC Networks](/CaptureSetup/CiscoHDLC)

  - [Capturing SS7 Traffic](/CaptureSetup/SS7)

-----

---

Imported from https://wiki.wireshark.org/CaptureSetup/DOCSIS on 2020-08-11 23:11:52 UTC
