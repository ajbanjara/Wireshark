# Protocol Reference

This page contains a description for numerous protocols seen in diverse communication networks. See [HowToEdit](/HowToEdit) for some tips about adding a missing protocol.

## Protocol Families

There are families of protocols, where the protocols relate to each other:

  - [AmateurRadioProtocolFamily](/AmateurRadioProtocolFamily): Protocols used in Amateur Radio: [AX.25](/AX.25), [NETROM](/NETROM), [Flexnet](/Flexnet), [ROSE](/ROSE)

  - [AppleTalkProtocolFamily](/AppleTalkProtocolFamily): The suite of AppleTalk protocols, including: [LLAP](/LLAP), [AARP](/AARP), [DDP](/DDP), [NBP](/NBP), [ZIP](/ZIP), [ATP](/ATP), [ASP](/ASP), [AFP](/AFP), ...

  - [FieldbusProtocolFamily](/FieldbusProtocolFamily): Fieldbus related protocols, including: [BACnet](/BACnet), [PROFIBUS](/PROFIBUS), [PROFINET](/PROFINET), ...

  - [FinanceIndustryProtocolFamily](/FinanceIndustryProtocolFamily): Protocols for interaction with financial exchanges, brokers, etc: [OUCH](/OUCH), [SoupBinTCP](/SoupBinTCP), ...

  - [InternetProtocolFamily](/InternetProtocolFamily): The famous [TCP](/TCP)/[IP](/IP) suite of protocols, including: [ARP](/ARP), [IP](/IP), [ICMP](/ICMP), [TCP](/TCP), [UDP](/UDP), [DCCP](/DCCP), [HTTP](/HTTP), [HTTP2](/HTTP2), [FTP](/FTP), [WebSocket](/WebSocket)...

  - [InstantMessengerFamily](/InstantMessengerFamily): Instant Messaging Protocols, including [AIM](/AIM), [MSN](/MSNMS), [Jabber](/Jabber), [YMSG](/YMSG), [Paltalk](/Paltalk) ...

  - [IPCProtocolFamily](/IPCProtocolFamily): Inter Process Communication Protocols used e.g. in clusters, including: [TIPC](/TIPC), [LINX](/LINX), ...

  - [IPMIProtocolFamily](/IPMI): Intelligent Platform Management Interface Protocol used in board including: [IPMB](/IPMB_protocol)...

  - [IsoProtocolFamily](/IsoProtocolFamily): The OSI suite of protocols from [ISO](/ISO), including: [CLNP](/CLNP) (ISO8473), [COTP](/COTP) (ISO8073), [FTAM](/FTAM), ...

  - [LanProtocolFamily](/LanProtocolFamily): Protocols for LANs and MANs, including: [Ethernet](/Ethernet), [FDDI](/FDDI), [TokenRing](/TokenRing), [IEEE\_802.11](/IEEE_802.11), ...

  - [MediaTransportProtocols](/MediaTransportProtocols): Protocols for transporting media, such as [RTP](/RTP), [RDT](/RDT), [MSMMS](/MSMMS), ...

  - [MediaTypesFamily](/MediaTypesFamily): A set of media types dissected by Wireshark, including: [GIF](/GIF), [JPEG\_JFIF](/JPEG_JFIF), [MIME\_multipart](/MIME_multipart), [WBXML](/WBXML), ...

  - [MobileTelephonyProtocolFamily](/MobileTelephonyProtocolFamily): Protocols used in [GSM](/GSM), WCDMA, [CDMA2000](/CDMA2000), etc: (Some one with better knowledge in this area please add info here)

  - [NetworkFilesystemFamily](/NetworkFilesystemFamily): Suites of protocols related to [NAS](/NAS) such as [NFS](/NFS), [SMB](/SMB) ([CIFS](/CIFS)), [AFS](/AFS), [DCE/DFS](/DCE/DFS), [Intermezzo](/Intermezzo), [PVFS](/PVFS)...

  - [NovellProtocolFamily](/NovellProtocolFamily): The suite of [Novell](/Novell) protocols, including: [IPX](/IPX), [SPX](/SPX), [NCP](/NCP), ...

  - [OPC](/OPC): Protocols used in automation technology to access process data in a standardized way: OPC Data Access, OPC Alarm & Events, OPC Historical Data Access, OPC XML-DA, OPC Unified Architecture

  - [P2pProtocols](/P2pProtocols): Protocols used by Peer-2-Peer applications, including [BitTorrent](/BitTorrent), [eDonkey](/eDonkey), [Jabber](/Jabber) and [JXTA](/JXTA)

  - [RPC](/RPC): Suites of protocols related to Remote Procedure Calls, including [ONC-RPC](/ONC-RPC), [DCE/RPC](/DCE/RPC), ...

  - [SIGTRAN](/SIGTRAN): The suite of protocols used to transport packet-based [PSTN](/PSTN) signaling over IP Networks, including [Q.931](/Q.931), [ISUP](/ISUP), ...

  - [StorageProtocolFamily](/StorageProtocolFamily): Suites of protocols related to block storage ([SAN](/SAN)) and backup applications, including [SCSI](/SCSI), [iSCSI](/iSCSI), [NDMP](/NDMP), [FibreChannel](/FibreChannel), ...

  - [VendorLanProtocolFamily](/VendorLanProtocolFamily): Proprietary L2 protocols by various vendors, including: [CDP](/CDP), [EDP](/EDP), [ISMP](/ISMP), [PAPI](/PAPI) ...

  - [VOIPProtocolFamily](/VOIPProtocolFamily): The suite(s) of Voice over IP protocols, including: [SIP](/SIP), [H323](/H323), [H225](/H225), [H245](/H245), ...

  - [WanProtocolFamily](/WanProtocolFamily): Protocols for WANs, including: [PPP](/PPP), [ATM](/ATM), [FrameRelay](/FrameRelay), ...

  - [WapProtocolFamily](/WapProtocolFamily): The suite of [WAP](/WAP) protocols for enabling Internet services on wireless networks, including: [WTP](/WTP), [WSP](/WSP), ...

  - [WiMaxProtocolFamily](/WiMaxProtocolFamily): Suite of protocols for WiMAX wireless broadband access, including [WIMAXASNCP](/WIMAXASNCP).

  - [WPANFamily](/WPANFamily): Protocols for wireless personal area networks, including IEEE 802.15.4, ZigBee, and 6LoWPAN

  - Identifier-Locator split protocols: [HIP](/HIP), LISP, SHIM6

  - LTE [ProtocolFamily](/ProtocolFamily): Protocols for the 4G LTE, including S1AP,NAS,Diameter, GTPv2,GTPv1.GTP-U

A protocol can belong to more than one family.

## General

  - [OsiModel](/OsiModel): The famous ISO/OSI 7 layer protocol stack reference model, see the definition at [wikipedia.org](http://en.wikipedia.org/wiki/Osi_model).

  - [RFC](/RFC): Request For Comments: Not a protocol itself, but the place where a lot of the internet protocol standards can be found.

## Organizations

  - [ANSI](/ANSI): American National Standards Institute: Some protocol specifications like [FDDI](/FDDI). The ANSI accredited standards developer for information technology standards, including protocol standards is the InterNational Committee for Information Technology Standards, [INCITS](http://www.incits.org/).

  - [Bluetooth SIG](https://www.bluetooth.org): Bluetooth Special Interest Group: Organization leading the development and promotion of Bluetooth, provide specifications, organizing events, testing events.

  - [CableLabs](/CableLabs): Cable Television Laboratories: nonprofit research and development consortium founded by Cable MSOs, develops Cable-related standards, e.g. DOCSIS and [PacketCable](/PacketCable).

  - [EPCglobal](http://www.epcglobalinc.org): Organization leading the development of industry-driven standards for the Electronic Product Code™ (EPC) to support the use of Radio Frequency Identification (RFID).

  - [ETSI](/ETSI): European Telecommunications Standards Institute: Here you can find some protocol specifications.

  - [IANA](/IANA): Internet Assigned Numbers Authority: Where you can find numbering used in different protocols, e.g. well known [TCP](/TCP) ports, etc.

  - [IEEE](/IEEE): Various standards, e.g. [Ethernet](/Ethernet), [TokenRing](/TokenRing), [IEEE\_802.11](/IEEE_802.11), ...

  - [IETF](/IETF): Internet Engineering Task Force: Where you can find the [RFC](/RFC)'s and [InternetDrafts](/InternetDrafts)

  - [ISO](/ISO): The International Organization for Standardization, e.g. famous [OsiModel](/OsiModel) and [IsoProtocolFamily](/IsoProtocolFamily)

  - [ITU-T](/ITU-T): International Telecommunication Union Telecommunication Standardization Sector (formerly CCITT): Specifies some of the protocols used in e.g. the [VOIPProtocolFamily](/VOIPProtocolFamily), as well as [X.25](/X.25), [SS7](/SS7), [ASN.1](/ASN.1), ...

  - The [OpenGroup](/OpenGroup): Specifies the DCE family, including [DCE/RPC](/DCE/RPC)

  - [Pro-MPEG Forum](http://www.pro-mpeg.org): Interests in realizing interoperability of professional television equipment. Specifies a [2dParityFEC](/2dParityFEC) for MPEG2-TS transmission.

  - [W3C](/W3C): World Wide Web Consortium: web standards like: [HTTP](/HTTP), CSS, XML, ...

  - [3GPP](/3GPP): 3rd Generation Partnership Project: mobile telephony standards like [GSM](/GSM), GPRS, ...

  - [3GPP2](/3GPP2): 3rd Generation Partnership Project 2 : mobile telephony standards like [CDMA2000](/CDMA2000),...

## Hardware related protocols

  - [ARP](/ARP): [AddressResolutionProtocol](/AddressResolutionProtocol): A protocol to dynamically discover the mapping between layer 2 and layer 3 addresses.

  - [ATM](/ATM): [AsynchronousTransferMode](/AsynchronousTransferMode):

  - [Bluetooth](/Bluetooth): Popular wireless protocols for mobile phone accessories

  - [Bluetooth Low Energy](/Bluetooth-Low-Energy): Newer hardware, not compatible with old, but provide low power consumption

  - [Ethernet](/Ethernet): The most common link layer technology used today.

  - [FDDI](/FDDI): [FiberDistributedDataInterface](/FiberDistributedDataInterface): fiber optical based link layer, obsolete

  - [FibreChannel](/FibreChannel): fibre optical based link layer, used to connect storage devices

  - [FR](/FR): [FrameRelay](/FrameRelay): LAN/WAN technology, obsolete

  - [HSR](/HSR): High-availability Seamless Redundancy: A protocol for network redundancy.

  - [I2C](http://www.nxp.com/documents/user_manual/UM10204.pdf): (sometimes IIC) bi-directional two wires bus used in most of embeded system to transfer data. this include [IPMB](/IPMB_protocol) protocol

  - [IEEE\_802.15.4](/IEEE_802.15.4): Low-power wireless networking protocol intended for sensor networks.

  - [ISDN](/ISDN): Integrated Services Digital Network (digital "telephone line")

  - [MAC Addresses](http://anonsvn.wireshark.org/wireshark/trunk/manuf): Wireshark's list of Ethernet vendor codes and well-known MAC addresses

  - [PRP](/PRP): Parallel Redundancy Protocol: A protocol for network redundancy.

  - [TR](/TR): [TokenRing](/TokenRing): LAN technology, obsolete

  - [USB](/USB): Universal Serial Bus Related [USB-PTP](/USB-PTP) [MTP](/USB-PTP)

  - [Wi-Fi](/Wi-Fi): [WLAN](/WLAN): [IEEE\_802.11](/IEEE_802.11): The standard technology for wireless LANs.

  - [X.25](/X.25): data packet delivery over serial lines, obsolete

## Unsorted

  - [29West](/29West): Ultra-Low Latency Messaging (ULLM) technology.

  - [ACN](/ACN): ANSI BSR E1.17, Architecture for Control Networks.

  - [AMQP](/AMQP): Advanced Message Queueing Protocol.

  - [C12.22](/C12.22): ANSI C12.22, communications protocol used for electric utility meter networks.

  - [Cisco-IPSLA](/Cisco-IPSLA): Cisco IP SLA v1

  - [CIGI](/CIGI): Common Image Generator Interface Protocol

  - [CMP](/CMP): Certificate Management Protocol.

  - [DECT](/DECT): Digital Enhanced Cordless Telecommunications. Popular cordless telephone interface.

  - [DICOM](/DICOM): Digital Imaging and Communications in Medicine.

  - [DVB-S2](/DVB-S2): DVB-S2 Baseband Frames

  - [DVB-CI](/DVB-CI): DVB-CI (Common Interface).

  - [eCPRI](/eCPRI): evolved Common Public Radio Interface

  - [Elasticsearch](/Elasticsearch): Elasticsearch Protocol

  - [FastCGI](/FastCGI): FastCGI is a protocol for interfacing application programs with a web server.

  - [FP Hint](/FP-Hint): Frame Protocol Hints, provides hints for dissecting FP traffic transmitted over the UMTS Iub interface.

  - [gRPC](/gRPC): gRPC is a high performance, open source framework developed by Google to handle remote procedure calls (RPCs).

  - [HART-IP](/HART-IP): Highway Addressable Remote Transducer over IP (HART-IP).

  - [HDCP2](/HDCP2): High bandwidth Digital Content Protection, Version 2 (HDCP2).

  - [HiQnet](/HiQnet): Harman Pro Devices Protocol

  - [HiSLIP](/HiSLIP): High-Speed LAN Instrument Protocol

  - [HYTEC](/HYTEC): Organizational specific protocols and protocol extensions.

  - [Gearman](/Gearman): Gearman provides a generic application framework to farm out work to other machines or processes that are better suited to do the work.

  - [ISMACryp](/ISMACryp): Short for ISMA Encryption & Authentication.

  - [IEEE C37.118](/IEEE-C37.118): Synchrophasors for Power Systems

  - [Kafka](/Kafka): Kafka Protocol

  - [kNet](/kNet): A network protocol for transmitting arbitrary application-specific messages between network hosts.

  - [LDAP](/LDAP): The Lightweight Directory Access Protocol: The protocol accessing data from directory services like OpenLDAP, Microsoft Active Directory, Netscape Directory Server or Novell eDirectory.

  - [LLRP](/LLRP): EPCglobal [Low-Level Reader Protocol](/LLRP) for communication between RFID Readers and Client Applications.

  - [META](/META): TLV-based protocol for adding metadata to frames.

  - [MS-LLTD](/MS-LLTD): Link Layer Topology Discovery (LLTD) Protocol.

  - [Netsync](/Netsync): The Monotone version control systems Netsync protocol.

  - [OMRON-FINS](/OMRON-FINS): SCADA protocol called FINS made by OMRON for controlling industrial devices.

  - [OpenFlow](/OpenFlow): Software Defined Networking southbound protocol

  - [OpenVPN](/OpenVPN): OpenVPN Protocol provides the SSL/TLS connection with a reliable transport layer.

  - [Oracle](/Oracle): Oracle has (apparently) several related protocols for sending SQL over the wire

  - [PCP](/PCP): Performance Co-Pilot protocol (a performance monitoring protocol)

  - [Protobuf](/Protobuf): Google Protocol Buffers are a language-neutral, platform-neutral extensible mechanism for serializing structured data.

  - [SAMETIME](/SAMETIME): The Sametime Protocol (an instant message protocol)

  - [SIMULCRYPT](/SIMULCRYPT): A DVB / ETSI protocol used in IPTV / broadcast TV head-ends to handle multiple key management systems.

  - [SML](/SML): A communication protocol for smart metering.

  - [Snort](/Snort): Snort IDS post-dissector

  - [SSTP](/SSTP): Secure Socket Tunneling Protocol, a ssl based VPN protocol

  - [STANAG\_5066\_SIS](/STANAG_5066_SIS): Subnetwork Interface Sublayer of NATO STANAG 5066 data communication protocol for HF stack.

  - [STANAG\_5066\_DTS](/STANAG_5066_DTS): Data Transfer Sublayer of NATO STANAG 5066 protocol stack.

  - [TeamSpeak2](/TeamSpeak2): The [TeamSpeak2](/TeamSpeak2) VoIP protocol.

  - [Tinkerforge](/Tinkerforge): Tinkerforge Protocol.

  - [Tor](/Tor): The Tor Protocol.

  - [UCP](/UCP): Universal Computer Protocol.

  - [UDT](/UDT): UDP-based Data Transfer.

  - UserLog:user log flow

  - [Ventrilo](/Ventrilo): The well-known VoIP program Ventrilo's own protocol.

  - [VXI-11](/VXI-11): The VXIbus Consortium's TCP/IP Instrument Protocol.

  - [WOL](/WakeOnLAN): [WakeOnLAN](/WakeOnLAN) protocol for remotely waking a remote host via the so-called Magic Packet.

## External links

  - <http://protocolinfo.org/wiki/List_of_protocols> on protocolinfo.org (related to l7-filter)

  - <http://en.wikipedia.org/wiki/Network_protocol> Network protocols on wikipedia.org

  - <http://www.protocols.com/pbook/> protocol directory at protocols.com

  - <http://www.javvin.com/protocolsuite.html> Protocol Dictionary at javvin.com

  - <http://dir.yahoo.com/Computers_and_Internet/Communications_and_Networking/Protocols/> Protocols at Yahoo.com

  - <http://www.rfc-editor.org/rfc-index.html> Index of RFCs at the IANA

  - <http://www.linkbit.com/support-decoder.html> Linkbit online message parser

  - <http://msdn.microsoft.com/en-us/library/jj712081.aspx> Open Specifications for common Windows protocols at Microsoft.com

## Discussion

---

Imported from https://wiki.wireshark.org/ProtocolReference on 2020-08-11 23:18:26 UTC
