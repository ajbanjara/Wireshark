# Capture File Format Reference

Wireshark supports a variety of capture file formats.

Some of these formats are well-documented and therefore well-known, such as the [PcapNg](/Development/PcapNg) and [Libpcap](/Development/LibpcapFileFormat) formats.

Other formats are added to Wireshark by reverse engineering, so the support of these formats is done through "sophisticated guesswork". This is the reason why support of these file types might be incomplete and inaccurate at some parts.

  - [PcapNg](/Development/PcapNg) captures (Wireshark native; readable by [Libpcap](/libpcap) 1.1.0 and later and thus by [TcpDump](/TcpDump) and other tools that use it)

  - [/libpcap](/FileFormatReference/libpcap) captures (Wireshark native; readable and writable by [Libpcap](/libpcap) and thus by [TcpDump](/TcpDump) and other tools that use it)

  - [snoop](http://tools.ietf.org/rfcmarkup?rfc=1761) and atmsnoop captures

  - Shomiti/Finisar Surveyor captures

  - Novell LANalyzer captures

  - Microsoft Network Monitor captures

  - AIX's iptrace captures

  - Cinco Networks NetXRay captures

  - Network Associates Windows-based Sniffer captures

  - Network General/Network Associates DOS-based Sniffer (compressed or uncompressed) captures

  - AG Group/WildPackets/Savvius EtherPeek/TokenPeek/AiroPeek/EtherHelp/PacketGrabber captures

  - RADCOM's WAN/LAN analyzer captures

  - Network Instruments Observer version 9 captures

  - Lucent/Ascend router debug output

  - [RedBack](/RedBack) SE400/800 tcpdump pcap format

  - HP-UX's [nettl captures](http://docs.hp.com/en/B2355-60105/nettl.1M.html)

  - Toshiba's ISDN routers dump output

  - the output from i4btrace from the ISDN4BSD project

  - traces from the EyeSDN USB S0.

  - the output in IPLog format from the Cisco Secure Intrusion Detection System

  - pppd logs (pppdump format)

  - the output from VMS's TCPIPtrace/TCPtrace/UCX$TRACE utilities

  - the text output from the DBS Etherwatch VMS utility

  - Visual Networks' Visual UpTime traffic capture

  - the output from CoSine L2 debug

  - the output from Accellent's 5Views LAN agents

  - Endace Measurement Systems' [ERF](/ERF) format captures

  - Bluetooth Linux Bluez stack hcidump -w traces

  - Bluetooth BTSNOOP

  - Bluetooth BTSNOOP with BlueZ btmon -w traces

  - Android Logcat binary logs (adb logcat -B)

  - Tektronix [K12](/K12)/K15 captures

  - ASCII trace output from the IBM iSeries (AS/400) Ethernet Communications Trace

  - [DCT2000](/DCT2000) .out files

  - The output from the Juniper [NetScreen](/NetScreen) snoop command

  - TamoSoft's CommView files

  - [PDML](/PDML) Wireshark can write a Packet Description Markup Language file

  - 3GPP TS 32.423 ("nettrace") XML files (as per [TS 32.423 spec](https://portal.3gpp.org/desktopmodules/Specifications/SpecificationDetails.aspx?specificationId=2010))

---

Imported from https://wiki.wireshark.org/FileFormatReference on 2020-08-11 23:14:05 UTC
