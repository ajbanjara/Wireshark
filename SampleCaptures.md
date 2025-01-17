[[_TOC_]]

## Sample Captures

So you're at home tonight, having just installed Wireshark. You want to take the program for a test drive. But your home LAN doesn't have any interesting or exotic packets on it? Here's some goodies to try. Please note that if for some reason your version of Wireshark doesn't have zlib support, you'll have to gunzip any file with a `.gz` extension.

If you don't see what you want here, that doesn't mean you're out of luck; look at some of the other sources listed below, such as http://www.pcapr.net/.

## How to add a new Capture File

If you want to include a new example capture file, you should attach it to this page (click 'Attach a file or image' in the formatting bar above). In the corresponding text, you might explain what this file is doing and what protocols, mechanisms or events it explains. Links from here to the related protocol pages are also welcome.

It's also a very good idea to put links on the related protocol pages pointing to your file. Referring to an attachment on this page from another Wiki page requires to copy the link to the file. For an example of this, see the [NTP](NTP) page.

## Other Sources of Capture Files

If you don't find what you're looking for, you may also try:

* https://www.google.com/
* http://www.icir.org/enterprise-tracing/download.html (unsorted capture of packet headers from enterprise traffic - use the .anon files)
* https://www.openpacket.org/capture/list (open repository of traces particularly related to digital security)
* https://packetlife.net/captures/ (community submissions, organized and moderated)
* http://www.pcapr.net/ (web 2.0 for pcaps with editing, DoS, etc; powered by wireshark)
* https://www.netresec.com/?page=PcapFiles (great list of places to download pcap files from)
* http://sysdoccap.codeplex.com/wikipage?title=System%20Overview%20Document%20Scenario%20Captures (Microsoft System Overview Document captures).
* [Collection of Pcap files from malware analysis](http://contagiodump.blogspot.co.uk/2013/04/collection-of-pcap-files-from-malware.html) (You will need to contact [Mila](https://www.blogger.com/profile/09472209631979859691) for the password to extract the files.)
* https://gitlab.com/wireshark/wireshark/-/issues Added as attachments to recreate bug or test a fix.
* [Malware of the Day](https://www.activecountermeasures.com/category/malware-of-the-day/) Network traffic of malware samples in the lab.
* [Malware-Traffic-Analysis.net](https://www.malware-traffic-analysis.net/about.html) Sharing information on malicious network traffic and malware samples. A source for pcap files and malware samples...
* https://njrusmc.net/jobaid/jobaid.html A collection of network protocols captures (like BGP, OSPF, Netflow etc) by Nick Russo
* https://tshark.dev/search/pcaptable/ A search engine for captures on Wireshark, Wireshark bugs, and PacketLife

## General / Unsorted

[rpl-dio-mc-nsa-optional-tlv-dissector-sample.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/rpl-dio-mc-nsa-optional-tlv-dissector-sample.pcap.gz) (libpcap) ICMPv6 IPv6 Routing Protocol for Low-Power and Lossy Networks (RPL) DODAG Information Object (DIO) control messages with optional type-length-value (TLV) in an Node State and Attributes (NSA) object in a Metric Container (MC).

[ipv4frags.pcap](uploads/__moin_import__/attachments/SampleCaptures/ipv4frags.pcap) (libpcap) ICMP Echo request (1400B) response with Fragments (MTU=1000 on one side).

[tfp_capture.pcapng](uploads/__moin_import__/attachments/SampleCaptures/tfp_capture.pcapng) (libpcap) Tinkerforge protocol captures over TCP/IP and USB.

[Obsolete_Packets.cap](uploads/__moin_import__/attachments/SampleCaptures/Obsolete_Packets.cap) (libpcap) Contains various obscure/no longer in common use protocols, including Banyan VINES, [AppleTalk](/AppleTalk) and DECnet.

[Apple_IP-over-IEEE_1394_Packet.pcap](uploads/__moin_import__/attachments/SampleCaptures/Apple_IP-over-IEEE_1394_Packet.pcap) (libpcap) An ICMP packet encapsulated in Apple's IP-over-1394 (ap1394) protocol

[SkypeIRC.cap](uploads/__moin_import__/attachments/SampleCaptures/SkypeIRC.cap) (libpcap) Some Skype, IRC and DNS traffic.

[ipp.pcap](uploads/__moin_import__/attachments/SampleCaptures/ipp.pcap) (libpcap) CUPS printing via IPP (test page)

[IrDA_Traffic.ntar](uploads/__moin_import__/attachments/SampleCaptures/IrDA_Traffic.ntar) (pcapng) Various IrDA packets, use Wireshark 1.3.0 (SVN revision 28866 or higher) to view

[9p.cap](uploads/__moin_import__/attachments/SampleCaptures/9p.cap) (libpcap) Plan 9 9P protocol, various message types.

[EmergeSync.cap](uploads/__moin_import__/attachments/SampleCaptures/EmergeSync.cap) (libpcap) rsync packets, containing the result of an "emerge sync" operation on a Gentoo system

[afs.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/afs.cap.gz) (libpcap) Andrew File System, based on RX protocol. Various operations.

[ancp.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/ancp.pcap.gz) (libpcap) Access Node Control Protocol (ANCP).

[ascend.trace.gz](uploads/__moin_import__/attachments/SampleCaptures/ascend.trace.gz) (Ascend WAN router) Shows how Wireshark parses special Ascend data

[atm_capture1.cap](uploads/__moin_import__/attachments/SampleCaptures/atm_capture1.cap) (libpcap) A trace of ATM Classical IP packets.

[bacnet-arcnet.cap](uploads/__moin_import__/attachments/SampleCaptures/bacnet-arcnet.cap) (libpcap) Some BACnet packets encapsulated in ARCnet framing

[bfd-raw-auth-simple.pcap](uploads/__moin_import__/attachments/SampleCaptures/bfd-raw-auth-simple.pcap) (libpcap) BFD packets using simple password authentication.

[bfd-raw-auth-md5.pcap](uploads/__moin_import__/attachments/SampleCaptures/bfd-raw-auth-md5.pcap) (libpcap) BFD packets using md5 authentication.

[bfd-raw-auth-sha1.pcap](uploads/__moin_import__/attachments/SampleCaptures/bfd-raw-auth-sha1.pcap) (libpcap) BFD packets using SHA1 authentication.

[BT_USB_LinCooked_Eth_80211_RT.ntar.gz](uploads/__moin_import__/attachments/SampleCaptures/BT_USB_LinCooked_Eth_80211_RT.ntar.gz) (pcapng) A selection of Bluetooth, Linux mmapped USB, Linux Cooked, Ethernet, IEEE 802.11, and IEEE 802.11 [RadioTap](/RadioTap) packets in a pcapng file, to showcase the power of the file format, and Wireshark's support for it. Currently, Wireshark doesn't support files with multiple Section Header Blocks, which this file has, so it cannot read it. In addition, the first packet in the file, a Bluetooth packet, is corrupt - it claims to be a packet with a Bluetooth pseudo-header, but it contains only 3 bytes of data, which is too small for a Bluetooth pseudo-header.

[bootparams.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/bootparams.cap.gz) (libpcap) A couple of rpc.bootparamsd 'getfile' and 'whoami' requests.

[chargen-udp.pcap](uploads/__moin_import__/attachments/SampleCaptures/chargen-udp.pcap) (libpcap) Chargen over UDP.

[chargen-tcp.pcap](uploads/__moin_import__/attachments/SampleCaptures/chargen-tcp.pcap) (libpcap) Chargen over TCP.

[cmp_IR_sequence_OpenSSL-Cryptlib.pcap](uploads/__moin_import__/attachments/SampleCaptures/cmp_IR_sequence_OpenSSL-Cryptlib.pcap) (libpcap) Certificate Management Protocol (CMP) version 2 encapsulated in HTTP. Full "Initialization Request".

[cmp_IR_sequence\_ OpenSSL-EJBCA.pcap](uploads/__moin_import__/attachments/SampleCaptures/cmp_IR_sequence\_-OpenSSL-EJBCA.pcap) (libpcap) Certificate Management Protocol (CMP) version 2 encapsulated in HTTP. Full "Initialization Request". Authentication with CRMF regToken.

[cmp-trace.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/cmp-trace.pcap.gz) (libpcap) Certificate Management Protocol (CMP) certificate requests.

[cmp-in-http-with-errors-in-cmp-protocol.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/cmp-in-http-with-errors-in-cmp-protocol.pcap.gz) (libpcap) Certificate Management Protocol (CMP) version 2 encapsulated in HTTP. Full "Initialization Request" and rejected "Key Update Request". There are some errors in the CMP packages.

[cmp_in_http_with_pkixcmp-poll_content_type.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/cmp_in_http_with_pkixcmp-poll_content_type.pcap.gz) (libpcap) Certificate Management Protocol (CMP) version 2 encapsulated in HTTP. The CMP messages are of the deprecated but used content-type "pkixcmp-poll", so they are using the TCP transport style. In two of the four CMP messages, the content type is not explicitly set, thus they cannot be dissected correctly.

[cigi2.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/cigi2.pcap.gz) (libpcap) Common Image Generator Interface (CIGI) version 2 packets.

[cigi3.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/cigi3.pcap.gz) (libpcap) Common Image Generator Interface (CIGI) version 3 packets.

[cisco-nexus92-erspan-marker.pcap](uploads/0726107c7d22fe6114308c7d395e512b/cisco-nexus92-erspan-marker.pcap) A marker packet sent from a Cisco Nexus switch running NXOS 9.2, with a non-zero ASIC relative timestamp and the corresponding UTC absolute timestamp.

[cisco-nexus10-erspan-marker.pcap](uploads/05f5bd4b68b7aadc166ae4ff9f836de2/cisco-nexus10-erspan-marker.pcap) A marker packet sent from a Cisco Nexus switch running NXOS 10, with a zero ASIC relative timestamp and the corresponding UTC absolute timestamp.

[ciscowl.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/ciscowl.pcap.gz) (libpcap) Cisco Wireless LAN Context Control Protocol ([WLCCP](/WLCCP)) version 0x0

[ciscowl_version_0xc1.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/ciscowl_version_0xc1.pcap.gz) (libpcap) Cisco Wireless LAN Context Control Protocol ([WLCCP](/WLCCP)) version 0xc1. Includes following base message types: SCM Advertisements, EAP Auth., Path Init, Registration

[configuration_test_protocol_aka_loop.pcap](uploads/__moin_import__/attachments/SampleCaptures/configuration_test_protocol_aka_loop.pcap) (libpcap) Example of an Ethernet loopback with a 'third party assist'

[cops-pr.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/cops-pr.cap.gz) (libpcap) A sample of COPS traffic.

[couchbase_subdoc_multi.pcap](uploads/__moin_import__/attachments/SampleCaptures/couchbase_subdoc_multi.pcap) (libpcap) A sample Couchbase binary protocol file including sub-document multipath request/responses.

[couchbase-create-bucket.pcapng](uploads/__moin_import__/attachments/SampleCaptures/couchbase-create-bucket.pcapng) (libpcap) A sample Couchbase binary protocol file that includes a create_bucket command.

[couchbase-lww.pcap](uploads/__moin_import__/attachments/SampleCaptures/couchbase-lww.pcap) (libpcap) A sample Couchbase binary protocol file including set_with_meta, del_with_meta and get_meta commands with last write wins support.

[couchbase-xattr.pcapng](uploads/__moin_import__/attachments/SampleCaptures/couchbase-xattr.pcapng) (libpcap) A sample capture of the XATTR features in the Couchbase binary protocol.

[dct2000_test.out](uploads/__moin_import__/attachments/SampleCaptures/dct2000_test.out) (dct2000) A sample [DCT2000](/DCT2000) file with examples of most supported link types

[dhcp.pcap](uploads/__moin_import__/attachments/SampleCaptures/dhcp.pcap) (libpcap) A sample of DHCP traffic.

[dhcp-and-dyndns.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/dhcp-and-dyndns.pcap.gz) (libpcap) A sample session of a host doing dhcp first and then dyndns.

[dhcp-auth.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/dhcp-auth.pcap.gz) (libpcap) A sample packet with dhcp authentication information.

[PRIV_bootp-both_overload.pcap](uploads/__moin_import__/attachments/SampleCaptures/PRIV_bootp-both_overload.pcap) (libpcap) A DHCP packet with sname and file field overloaded.

[PRIV_bootp-both_overload_empty-no_end.pcap](uploads/__moin_import__/attachments/SampleCaptures/PRIV_bootp-both_overload_empty-no_end.pcap) (libpcap) A DHCP packet with overloaded field and all end options missing.

[dccp_trace.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/dccp_trace.pcap.gz) (libpcap) A trace of [DCCP](/DCCP) packet types.

[dns.cap](uploads/__moin_import__/attachments/SampleCaptures/dns.cap) (libpcap) Various DNS lookups.

[dualhome.iptrace](uploads/__moin_import__/attachments/SampleCaptures/dualhome.iptrace) (AIX iptrace) Shows Ethernet and Token Ring packets captured in the same file.

[dvmrp-conv.cap](uploads/__moin_import__/attachments/SampleCaptures/dvmrp-conv.cap) Shows Distance Vector Multicast Routing Protocol packets.

[eapol-mka.pcap](uploads/__moin_import__/attachments/SampleCaptures/eapol-mka.pcap) (libpcap) EAPoL-MKA (MKA, IEEE 802.1X) traffic.

[epmd.pcap](uploads/__moin_import__/attachments/SampleCaptures/epmd.pcap) Two Erlang Port Mapper Daemon ([EPMD](/EPMD)) messages.

[Ethernet_Pause_Frame.cap](uploads/__moin_import__/attachments/SampleCaptures/Ethernet_Pause_Frame.cap) Ethernet Pause Frame packets.

[exablaze_trailer.pcap](uploads/__moin_import__/attachments/SampleCaptures/exablaze_trailer.pcap) (libpcap) A sample capture with Exablaze timestamp trailers.

[exec-sample.pcap](uploads/__moin_import__/attachments/SampleCaptures/exec-sample.pcap) The [exec](/Exec) (rexec) protocol

[fw1_mon2018.cap](uploads/__moin_import__/attachments/SampleCaptures/fw1_mon2018.cap) (Solaris snoop) [CheckPoint](/CheckPoint) FW-1 fw monitor file (include new Encryption check points). Enable FW-1 interpretation in Ethernet protocol interpretation

[genbroad.snoop](uploads/__moin_import__/attachments/SampleCaptures/genbroad.snoop) (Solaris snoop) Netware, Appletalk, and other broadcasts on an ethernet network.

[Mixed1.cap](uploads/__moin_import__/attachments/SampleCaptures/Mixed1.cap) (MS [NetMon](/NetMon)) Some Various, Mixed Packets.

[small-system-misc-ping.etl](uploads/__moin_import__/attachments/SampleCaptures/small-system-misc-ping.etl) (MS ETL) Various events, ping and browser packets.

[gryphon.cap](uploads/__moin_import__/attachments/SampleCaptures/gryphon.cap) (libpcap) A trace of Gryphon packets. This is useful for testing the Gryphon plug-in.

[hart_ip.pcap](uploads/__moin_import__/attachments/SampleCaptures/hart_ip.pcap) (libpcap) Some HART-IP packets, including both an UDP and TCP session.

[hsrp.pcap](uploads/__moin_import__/attachments/SampleCaptures/hsrp.pcap) (libpcap) Some Cisco HSRP packets, including some with Opcode 3 (Advertise) .

[hsrp-and-ospf-in-LAN](uploads/__moin_import__/attachments/SampleCaptures/hsrp-and-ospf-in-LAN) (libpcap) HSRP state changes and OSPF LSAs sent during link up/down/up.

[ieee802154-association-data.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/ieee802154-association-data.pcap.gz) (libpcap) A device associates to a coordinator, and transmits some data frames.

[ipv4_cipso_option.pcap](uploads/__moin_import__/attachments/SampleCaptures/ipv4_cipso_option.pcap) (libpcap) A few IP packets with CIPSO option.

[imap.cap](uploads/__moin_import__/attachments/SampleCaptures/imap.cap) (libpcap) A short IMAP session using Mutt against an MSX server.

[RawPacketIPv6Tunnel-UK6x.cap](uploads/__moin_import__/attachments/SampleCaptures/RawPacketIPv6Tunnel-UK6x.cap) (libpcap) - Some IPv6 packets captured from the 'sit1' interface on Linux. The IPv6 packets are carried over the UK's UK6x network, but what makes this special, is the fact that it has a Link-Layer type of "Raw packet data" - which is something that you don't see everyday.

[iseries.cap](uploads/__moin_import__/attachments/SampleCaptures/iseries.cap) (IBM iSeries communications trace) FTP and Telnet traffic between two AS/400 LPARS.

[FTPv6-1.cap](uploads/__moin_import__/attachments/SampleCaptures/FTPv6-1.cap) (Microsoft Network Monitor) FTP packets (IPv6)

[FTPv6-2.cap](uploads/__moin_import__/attachments/SampleCaptures/FTPv6-2.cap) (Microsoft Network Monitor) Some more FTP packets (IPv6)

[gearman.cap](uploads/__moin_import__/attachments/SampleCaptures/gearman.cap) Gearman Protocol packets

[isl-2-dot1q.cap](uploads/__moin_import__/attachments/SampleCaptures/isl-2-dot1q.cap) (libpcap) A trace including both ISL and 802.1q-tagged Ethernet frames. Frames 1 through 381 represent traffic encapsulated using Cisco's ISL, frames 382-745 show traffic sent by the same switch after it had been reconfigured to support 802.1Q trunking.

[kafka-testcases-v4.tar.gz](uploads/__moin_import__/attachments/SampleCaptures/kafka-testcases-v4.tar.gz) (libpcap) Apache Kafka dissector testcases (generated with [this scripts](https://github.com/laz2/genpcap)).

[lacp1.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/lacp1.pcap.gz) (libpcap) Link Aggregation Control Protocol (LACP, IEEE 802.3ad) traffic.

[linx-setup-pingpong-shutdown.pcap](uploads/__moin_import__/attachments/SampleCaptures/linx-setup-pingpong-shutdown.pcap) (libpcap) Successive setup of LINX on two hosts, exchange of packets and shutdown.

[llrp.cap](uploads/__moin_import__/attachments/SampleCaptures/llrp.cap) EPCglobal [Low-Level Reader Protocol (LLRP)](/LLRP)

[llt-sample.pcap](uploads/__moin_import__/attachments/SampleCaptures/llt-sample.pcap) Veritas [Low Latency Transport (LLT)](/LLT) frames

[lustre-lnet_sample.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/lustre-lnet_sample.cap.gz) (libpcap) Lustre Filesystem with Lustre Fileystem Network under it (tcp)

[macsec_cisco_trunk.pcap](uploads/__moin_import__/attachments/SampleCaptures/macsec_cisco_trunk.pcap) (libpcap) MACsec/802.1AE session, manual keys, 3750X switch-to-switch (Trustsec) forced across a half-duplex 10M hub connection, destination mac addresses can be seen for Cisco VTP, RSTP (RPVST+), CDP, EIGRP etc.

[messenger.pcap](uploads/__moin_import__/attachments/SampleCaptures/messenger.pcap) (libpcap) a few messenger example packets.

[metamako_trailer.pcap](uploads/__moin_import__/attachments/metamako_trailer.pcap/metamako_trailer.pcap) (libpcap) the Metamako timestamp trailer format.

[mms.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/mms.pcap.gz) (libpcap) Manufacturing Message Specification traffic.

[SITA-Protocols.cap](uploads/__moin_import__/attachments/SampleCaptures/SITA-Protocols.cap) (libpcap) Some SITA WAN (Societe Internationale de Telecommunications Aeronautiques sample packets (contains X.25, International Passenger Airline Reservation System, Unisys Transmittal System and Frame Relay packets)

[msnms.pcap](uploads/__moin_import__/attachments/SampleCaptures/msnms.pcap) (libpcap) MSN Messenger packets.

[MSN_CAP.xlsx](uploads/__moin_import__/attachments/SampleCaptures/MSN_CAP.xlsx) (xlsx) MSN Messenger packets in xlsx format.

[monotone-netsync.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/monotone-netsync.cap.gz) (libpcap) Some fragments (the full trace is > 100MB gzipped) of a checkout of the monotone sources.

[mpeg2_mp2t_with_cc_drop01.pcap](uploads/__moin_import__/attachments/SampleCaptures/mpeg2_mp2t_with_cc_drop01.pcap) (libpcap) MPEG2 (RFC 2250) Transport Stream example with a dropped CC packet (anonymized with tcpurify).

[mpls-basic.cap](uploads/__moin_import__/attachments/SampleCaptures/mpls-basic.cap) (libpcap) A basic sniff of MPLS-encapsulated IP packets over Ethernet.

[mpls-exp.cap](uploads/__moin_import__/attachments/SampleCaptures/mpls-exp.cap) (libpcap) IP packets with EXP bits set.

[mpls-te.cap](uploads/__moin_import__/attachments/SampleCaptures/mpls-te.cap) (libpcap) MPLS Traffic Engineering sniffs. Includes RSVP messages with MPLS/TE extensions and OSPF link updates with MPLS LSAs.

[mpls-twolevel.cap](uploads/__moin_import__/attachments/SampleCaptures/mpls-twolevel.cap) (libpcap) An IP packet with two-level tagging.

[netbench_1.cap](uploads/__moin_import__/attachments/SampleCaptures/netbench_1.cap) (libpcap) A capture of a reasonable amount of NetBench traffic. It is useful to see some of the traffic a NetBench run generates.

[NMap Captures.zip](uploads/__moin_import__/attachments/SampleCaptures/NMap-Captures.zip) (libpcap) Some captures of various [NMap](http://nmap.org/%E2%80%8E) port scan techniques.

[OptoMMP.pcap](uploads/__moin_import__/attachments/SampleCaptures/OptoMMP.pcap) A capture of some OptoMMP read/write quadlet/block request/response packets. [OptoMMP documentation](http://www.opto22.com/site/documents/doc_drilldown.aspx?aid=1875).

[pana.cap](uploads/__moin_import__/attachments/SampleCaptures/pana.cap) (libpcap) PANA authentication session (pre-draft-15a so Wireshark 0.99.5 or before is required to view it correctly).

[pana-draft18.cap](uploads/__moin_import__/attachments/SampleCaptures/pana-draft18.cap) (libpcap) PANA authentication session (draft-18 so Wireshark 0.99.7 or later is required to view it correctly).

[pana-rfc5191.cap](uploads/__moin_import__/attachments/SampleCaptures/pana-rfc5191.cap) (libpcap) PANA authentication and re-authentication sequences.

[pim-reg.cap](uploads/__moin_import__/attachments/SampleCaptures/pim-reg.cap) (libpcap) Protocol Independent Multicast, with IPv6 tunnelled within IPv6

[ptpv2.pcap](uploads/__moin_import__/attachments/SampleCaptures/ptpv2.pcap) (libpcap) various Precision Time Protocol (IEEE 1588) version 2 packets.\
[ptpv2_anon.pcapng](uploads/faca5622d7ec2f07f1a9ee3f062fdfac/ptpv2_anon.pcapng) ptpv2.pcap modified with [TraceWrangler](http://www.tracewrangler.com/) to use non-standard ports (42319,42320)

[Public_nic](uploads/__moin_import__/attachments/SampleCaptures/Public_nic) (libpcap) A bunch of SSDP (Universal Plug and Play protocol) announcements.

[rpl_sample.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/rpl_sample.cap.gz) (libpcap) A RIPL sample capture.

[rtp_example.raw.gz](uploads/__moin_import__/attachments/SampleCaptures/rtp_example.raw.gz) (libpcap) A VoIP sample capture of a [H323](/H323) call (including [H225](/H225), [H245](/H245), [RTP](/RTP) and [RTCP](/RTCP)).

[RTP_L16_monaural_sample.pcapng](uploads/__moin_import__/attachments/SampleCaptures/RTP_L16_monaural_sample.pcapng) (libpcap) A sample L16 monaural (44100Hz) [RTP](/RTP) stream

[rtps_cooked.pcapng](uploads/__moin_import__/attachments/SampleCaptures/rtps_cooked.pcapng) (libpcap) Manually generated RTPS traffic covering a range of submessages and parameters.

[rsvp-PATH-RESV.pcap](uploads/__moin_import__/attachments/SampleCaptures/rsvp-PATH-RESV.pcap) (libpcap) A sample RSVS capture with PATH and RESV messages.

[sbus.pcap](uploads/__moin_import__/attachments/SampleCaptures/sbus.pcap) (libpcap) An [EtherSBus](/EtherSBus) (sbus) sample capture showing some traffic between the programming tool (PG5) and a PCD (Process Control Device, a PLC; Programmable Logic Controller).

[Ether-S-IO_traffic_01.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/Ether-S-IO_traffic_01.pcap.gz) (libpcap) An [EtherSIO](/EtherSIO) (esio) sample capture showing some traffic between a PLC from Saia-Burgess Controls AG and some remote I/O stations (devices called PCD3.T665).

[simulcrypt.pcap](uploads/__moin_import__/attachments/SampleCaptures/SIMULCRYPT.pcap) (libpcap) A SIMULCRYPT sample capture, [SIMULCRYPT](/SIMULCRYPT) over [TCP](/TCP)) on ports 8600, 8601, and 8602.

[TeamSpeak2.pcap](uploads/__moin_import__/attachments/SampleCaptures/TeamSpeak2.pcap) (libpcap) A [TeamSpeak2](/TeamSpeak2) capture

[tipc-publication-payload-withdrawal.pcap](uploads/__moin_import__/attachments/SampleCaptures/tipc-publication-payload-withdrawal.pcap) (libpcap) TIPC port name publication, payload messages and port name withdrawal.

[tipc-bundler-messages.pcap](uploads/__moin_import__/attachments/SampleCaptures/tipc-bundler-messages.pcap) (libpcap) TIPCv2 Bundler Messages

[tipc_v2_fragmenter_messages.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/tipc_v2_fragmenter_messages.pcap.gz) (libpcap) TIPCv2 Fragmenter Messages

[TIPC-over-TCP_disc-publ-inventory_sim-withd.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/TIPC-over-TCP_disc-publ-inventory_sim-withd.pcap.gz) (libpcap) TIPCv2 over TCP (port 666) traffic generated by the inventory simulation of the TIPC demo package.

[TIPC-over-TCP_MTU-discovery.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/TIPC-over-TCP_MTU-discovery.pcap.gz) (libpcap) TIPCv2 over TCP (port 666) - Link State messages with filler bytes for MTU discovery.

[toshiba.general.gz](uploads/__moin_import__/attachments/SampleCaptures/toshiba.general.gz) (Toshiba) Just some general usage of a Toshiba ISDN router. There are three link types in this trace: PPP, Ethernet, and LAPD.

[uma_ho_req_bug.cap](uploads/__moin_import__/attachments/SampleCaptures/uma_ho_req_bug.cap) (libpcap) A "UMA URR HANDOVER REQUIRED" packet.

[unistim_phone_startup.pcap](uploads/__moin_import__/attachments/SampleCaptures/unistim_phone_startup.pcap) (libpcap) Shows a phone booting up, requesting ip address and establishing connection with cs2k server.

[unistim-call.pcap](uploads/__moin_import__/attachments/SampleCaptures/unistim-call.pcap) (libpcap) Shows one phone calling another via cs2k server over unistim

[v6.pcap](uploads/__moin_import__/attachments/SampleCaptures/v6.pcap) (libpcap) Shows IPv6 (6-Bone) and ICMPv6 packets.

[v6-http.cap](uploads/__moin_import__/attachments/SampleCaptures/v6-http.cap) (libpcap) Shows IPv6 (SixXS) HTTP.

[vlan.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/vlan.cap.gz) (libpcap) Lots of different protocols, all running over 802.1Q virtual lans.

[vms_tcptrace.txt](uploads/__moin_import__/attachments/SampleCaptures/vms_tcptrace.txt) (VMS TCPtrace) Sample output from VMS TCPtrace. Mostly NFS packets.

[vms_tcptrace-full.txt](uploads/__moin_import__/attachments/SampleCaptures/vms_tcptrace-full.txt) (VMS TCPtrace) Sample output from VMS TCPtrace/full. Mostly NFS packets.

[vnc-sample.pcap](uploads/__moin_import__/attachments/SampleCaptures/vnc-sample.pcap) Virtual Networking Computing (VNC) session trace

[vxi-11.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/vxi-11.pcap.gz) (libpcap) Scan for instruments attached to an Agilent E5810A VXI-11-to-GPIB adapter.

[WINS-Replication-01.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/WINS-Replication-01.cap.gz) (libpcap) WINS replication trace.

[WINS-Replication-02.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/WINS-Replication-02.cap.gz) (libpcap) WINS replication trace.

[WINS-Replication-03.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/WINS-Replication-03.cap.gz) (libpcap) WINS replication trace.

[wpsdata.cap](uploads/__moin_import__/attachments/SampleCaptures/wpsdata.cap) (libpcap) WPS expanded EAP trace.

[openwire_sample.tar.gz](uploads/__moin_import__/attachments/SampleCaptures/openwire_sample.tar.gz) (libpcap) ActiveMQ [OpenWire](/OpenWire) trace.

[drda_db2_sample.tgz](uploads/__moin_import__/attachments/SampleCaptures/drda_db2_sample.tgz) (libpcap) DRDA trace from DB2.

[starteam_sample.tgz](uploads/__moin_import__/attachments/SampleCaptures/starteam_sample.tgz) (libpcap) [StarTeam](/StarTeam) trace.

[rtmp_sample.tgz](uploads/__moin_import__/attachments/SampleCaptures/rtmp_sample.tgz) (libpcap) RTMP (Real Time Messaging Protocol) trace.

[rtmpt.pcap.bz2](uploads/__moin_import__/attachments/SampleCaptures/rtmpt.pcap.bz2) (libpcap) RTMPT trace with macromedia-fsc TCP-stuff.

[sample-imf.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/sample-imf.pcap.gz) (libpcap) [SMTP](/SMTP) and [IMF](/IMF) capture. Also shows some [MIME_multipart](/MIME_multipart).

[smtp.pcap](uploads/__moin_import__/attachments/SampleCaptures/smtp.pcap) (libpcap) [SMTP](/SMTP) simple example.

[captura.NNTP.cap](uploads/__moin_import__/attachments/SampleCaptures/captura.NNTP.cap) (libpcap) [NNTP](/NNTP) News simple example.

[sample-TNEF.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/sample-TNEF.pcap.gz) (libpcap) [TNEF](/TNEF) trace containing two attachments as well as message properties. Also shows some [SMTP](/SMTP), [IMF](/IMF) and [MIME_multipart](/MIME_multipart) trace.

[wol.pcap](uploads/__moin_import__/attachments/SampleCaptures/wol.pcap) (libpcap) [WakeOnLAN](/WakeOnLAN) sample packets generated from both ether-wake and a Windows-based utility.

[zigbee-join-authenticate.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/zigbee-join-authenticate.pcap.gz) (libpcap) Two devices join a [ZigBee](/ZigBee) network and authenticate with the trust center. Network is encrypted using network keys and trust center link keys.

[IGMP dataset.pcap](uploads/__moin_import__/attachments/SampleCaptures/IGMP-dataset.pcap) (igmp) igmp version 2 dataset

[yami.pcap](uploads/__moin_import__/attachments/SampleCaptures/yami.pcap) (yami) sample packets captured when playing with YAMI4 library

[DHCPv6.pcap](uploads/__moin_import__/attachments/SampleCaptures/DHCPv6.pcap) (dhcpv6) sample dhcpv6 client server transaction solicit(fresh lease)/advertise/request/reply/release/reply.

[dhcpv6_1.pcap](uploads/1b328a71c8c503e5bfdeb2fe143402af/dhcpv6_1.pcap) (dhcpv6) sample dhcpv6 client server transaction solicit(requesting-old-lease)/advertise/request/reply/release/reply.

[ecpri.pcap](uploads/__moin_import__/attachments/SampleCaptures/ecpri.pcap) (libpcap)[eCPRI](/eCPRI) sample file.

[iperf3-udp.pcapng.gz](uploads/__moin_import__/attachments/SampleCaptures/iperf3-udp.pcapng.gz) (pcapng) sample capture for iPerf3 in reverse UDP mode using `iperf3 -u -t 3 -c ping.online.net -p5208 -R`

[220614_ip_flags_google.pcapng](uploads/df619289f2986680173b8cd3035ca4ac/220614_ip_flags_google.pcapng) IPv4 ICMP traffic showing various ip.flags bits. Includes Reserved Bit / Evil Bit packets. ([Nping: add support to set Reserved/Evil bit in ip flags](https://github.com/nmap/nmap/issues/2486))

[ultimate_wireshark_protocols_pcap_220213.pcap.zip](uploads/26c41b5ec1d89343e2979b73ec374bc9/ultimate_wireshark_protocols_pcap_220213.pcap.zip) Capture file containing a wide variety of protocols, useful for fuzzing. Created by Sharon Brizinov. (This is not the same as Johannes Weber's [Ultimate PCAP](https://weberblog.net/the-ultimate-pcap/))

## ADSL CPE

Here are some captures of the data sent on an ADSL line by the Neufbox 6, the CPE provided by french ISP SFR. Capturing was done by running tcpdump via SSH on the 8/35 ATM VC.

Sensitive informations like passwords, phone numbers, personal IP/MAC addresses... were redacted and replaced by equivalent ones (checksums were recalculated too).

Used protocols includes DHCP, PPP, Ethernet, IP, ARP, L2TP, SIP, RTP, DNS, ICMP, DHCPv6, NTP, IGMPv2, ICMPv6, HTTP, HTTPS, Syslog, RADIUS...

[nb6-startup.pcap](uploads/__moin_import__/attachments/SampleCaptures/nb6-startup.pcap) Includes etablishement of IPv4 and IPv6 connections, download of configuration, connection to a VoIP server...

[nb6-http.pcap](uploads/__moin_import__/attachments/SampleCaptures/nb6-http.pcap) Three different HTTP requests: first was sent on the private IPv4 network (IPoE), second was sent on the public IPv4 network, third was sent on the public IPv6 network (L2TP tunnel).

[nb6-telephone.pcap](uploads/__moin_import__/attachments/SampleCaptures/nb6-telephone.pcap) A brief phone call to SFR's voicemail service.

[nb6-hotspot.pcap](uploads/__moin_import__/attachments/SampleCaptures/nb6-hotspot.pcap) Someone connecting to SFR's wireless community network.

A detailed analysis of these captures, along with an explanation of how these captures were realized, is available in French [here](https://lafibre.info/sfr-tutoriels/captures-reseau-du-demarrage-et-fonctionnement-de-la-neufbox-6/).

## Viruses and worms

[slammer.pcap](uploads/__moin_import__/attachments/SampleCaptures/slammer.pcap) Slammer worm sending a DCE RPC packet. bnb

[dns-remoteshell.pcap](uploads/__moin_import__/attachments/SampleCaptures/dns-remoteshell.pcap) Watch frame 22 Ethereal detecting DNS Anomaly caused by remoteshell riding on DNS port - DNS Anomaly detection made easy by ethereal .. Anith Anand

## Crack Traces

[teardrop.cap](uploads/__moin_import__/attachments/SampleCaptures/teardrop.cap) Packets 8 and 9 show the overlapping IP fragments in a Teardrop attack.

[zlip-1.pcap](uploads/__moin_import__/attachments/SampleCaptures/zlip-1.pcap) DNS exploit, endless, pointing to itself message decompression flaw.

[zlip-2.pcap](uploads/__moin_import__/attachments/SampleCaptures/zlip-2.pcap) DNS exploit, endless cross referencing at message decompression.

[zlip-3.pcap](uploads/__moin_import__/attachments/SampleCaptures/zlip-3.pcap) DNS exploit, creating a very long domain through multiple decompression of the same hostname, again and again.

[can-2003-0003.pcap](uploads/__moin_import__/attachments/SampleCaptures/can-2003-0003.pcap) Attack for [CERT advisory CA-2003-03](http://www.cert.org/advisories/CA-2003-03.html)

## PROTOS Test Suite Traffic

The files below are captures of traffic generated by the [PROTOS](http://www.ee.oulu.fi/research/ouspg/protos/) test suite developed at the University of Oulu. They contain malformed traffic used to test the robustness of protocol implementations; they also test the robustness of protocol analyzers such as Wireshark.

[c04-wap-r1.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/c04-wap-r1.pcap.gz) Output from c04-wap-r1.jar

[c05-http-reply-r1.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/c05-http-reply-r1.pcap.gz) Output from c05-http-reply-r1.jar

[c06-ldapv3-app-r1.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/c06-ldapv3-app-r1.pcap.gz) Output from c06-ldapv3-app-r1.jar

[c06-ldapv3-enc-r1.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/c06-ldapv3-enc-r1.pcap.gz) Output from c06-ldapv3-enc-r1.jar

[c06-snmpv1-req-app-r1.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/c06-snmpv1-req-app-r1.pcap.gz) Output from c06-snmpv1-req-app-r1.jar

[c06-snmpv1-req-enc-r1.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/c06-snmpv1-req-enc-r1.pcap.gz) Output from c06-snmpv1-req-enc-r1.jar

[c06-snmpv1-trap-app-r1.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/c06-snmpv1-trap-app-r1.pcap.gz) Output from c06-snmpv1-trap-app-r1.jar

[c06-snmpv1-trap-enc-r1.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/c06-snmpv1-trap-enc-r1.pcap.gz) Output from c06-snmpv1-trap-enc-r1.jar

[c07-sip-r2.cap](uploads/__moin_import__/attachments/SampleCaptures/c07-sip-r2.cap) Output from c07-sip-r2.jar

## Specific Protocols and Protocol Families

3GPP [3gpp_mc.cap](uploads/__moin_import__/attachments/SampleCaptures/3gpp_mc.cap) (libpcap) 3gpp cn mc interface capture file, include megaco and ranap packet

### AirTunes

Apple [AirTunes](/AirTunes) protocol as used by [AirPort](/AirPort). See http://git.zx2c4.com/Airtunes2/about/ [airtunes-1.pcap](uploads/__moin_import__/attachments/SampleCaptures/airtunes-1.pcap)

### Apache Cassandra

[apache-cassandra-cql-v3.pcapng.gz](uploads/__moin_import__/attachments/SampleCaptures/apache-cassandra-cql-v3.pcapng.gz) - CQL binary protocol version 3. Specification at https://raw.githubusercontent.com/apache/cassandra/cassandra-2.1/doc/native_protocol_v3.spec.

### ARP/RARP

[arp-storm.pcap](uploads/__moin_import__/attachments/SampleCaptures/arp-storm.pcap) (libpcap) More than 20 ARP requests per second, observed on a cable modem connection.\
([220703_arp-storm.pcapng](uploads/f59564719471dc67295224d1f18c4857/220703_arp-storm.pcapng) arp-storm.pcap saved as pcapng including Name Resolution Block to speed up display)

[rarp_request.cap](uploads/__moin_import__/attachments/SampleCaptures/rarp_request.cap) (libpcap) A reverse ARP request.

[rarp_req_reply.pcapng](uploads/5786c3aca4f163fdbdcf55d92da6c3f2/rarp_req_reply.pcapng) (pcapng) RARP request and reply.

### ATSC3 Protocols

Standards/Specifications at https://www.atsc.org/atsc-documents/type/3-0-standards/

#### ALP Protocol

Standard/Specification: ATSC3 A/330

[alp-sample1.pcap](uploads/ffedd6b9fa50190e1fd12de2b90f43a4/alp-sample1.pcap) (libpcap) - Collected using SiliconDust box (Multiple PLP channel). Includes LLS (Link Layer Signalling) with LMT table (packet #6), packets with Sony PLP header extension (packets #1,3,5,...) and data packets

[alp-sample2.pcap](uploads/486520825a0a8fb0372a77f70f0afbfc/alp-sample2.pcap) (libpcap) - Collected using SiliconDust box (Single PLP channel). Includes LLS (Link Layer Signalling) with LMT table (packet #2), packet with Sony L1D Time Info header extension (packet #84) and data packets

#### LLS (Low Level Signalling) Protocol

Standard/Specification: ATSC3 A/331

[lls-tables-alp.pcap](uploads/a0884e575b7edb2034948fd1bb13e5fa/lls-tables-alp.pcap) (libpcap) - Collected using SiliconDust box from three ATSC3 stations. Packets #1, #3 - Signed Multi Table (contains SLT and SystemTime tables). Packet #2, #4 - CDT (Certification Data Table). Packet #5 - System Time table. Packet #6 - SLT (Service List Table). Packet #7 - AEAT (Advanced Emergency Information Table). Packet #8 - User Defined table.

#### MP4 init segments and segments

Standards/Specifications: ATSC3 A/331, ISO/IEC 14496-12, ISO/IEC 14496-14, 3GPP TS 26.244

Encapsulation: alp:ip:udp:alc:rmt-lct:mp4

[mp4-ftyp-styp-sidx.pcap](uploads/19568882943f275165a5c314f35c024f/mp4-ftyp-styp-sidx.pcap) (libpcap) - Collected using SiliconDust from different ATSC3 stations (closed captions segments) Packet #1 - MP4 segment (styp mp4 box). Extracted mp4: [styp](uploads/0ee4c561b9c17098957fa9fcb5f2d756/styp.mp4). Packet #2 - MP4 truncated segment (styp mp4 box). Extracted mp4: [styp-trunc](uploads/d43f871dea86caebad5a834d2be1e0ca/styp-trunc.mp4). Packet #3 - MP4 init segment (ftyp mp4 box). Extracted mp4: [ftyp](uploads/fe86a796525ff6599d3c06f363031437/ftyp.mp4). Packet #4 - MP4 truncated segment (sidx mp4 box). Extracted mp4: [sidx](uploads/f980161e5d7b81f29c3eebbc2ea29806/sidx.mp4). Packet #5 - MP4 segment (sidx mp4 box). Extracted mp4: [sidx-trunc](uploads/e7ae787bec782917058013cb79e12ed0/sidx-trunc.mp4).

#### ALC/LCT ROUTE/DASH, MMTP

Standards/Specifications: ATSC3 A/331, RFC 5651, RFC 5775, ISO/IEC 23008-1

Encapsulation: alp:ip:udp:alc

[ch11-25-slt.pcap](uploads/35812d74f0d49a361a36491d69697052/ch11-25-slt.pcap) (libpcap) - Collected using SiliconDust from different ATSC3 stations. Includes signalling and data packets (ROUTE/DASH and MMTP)

### Spanning Tree Protocol

[stp.pcap](uploads/8d3d0627231ab1e2fa5d3fe8be2390a7/stp.pcap) (libpcap)

[STP_UplinkFast.pcapng](uploads/204b8eb1a66421c6f9324d4211f6ed45/STP_UplinkFast.pcapng) (pcapng) Cisco STP UplinkFast proxy multicast frames sent to 0100.0ccd.cdcd. This file contains a capture of proxy (also called dummy) multicast frames sent after a root port switchover on behalf of 3 dynamic unicast MAC addresses to update the "upstream" part of the network about the new path toward them. For each of the MAC addresses (001d.e50a.d740, 0800.2774.b2c5, e4be.ede3.f013), the switch sends out 4 frames using the particular MAC address as a source, and the 0100.0ccd.cdcd as a destination, with each frame using a different type: SNAP (OUI 0x00000c, PID 0x0115), AppleTalk (EtherType 0x809b), IPX (EtherType 0x8137), and ARP (EtherType 0x0806). The frame payload is just a stuffing to the minimal frame length; it has no meaning.

### Bluetooth

[l2ping.cap](uploads/__moin_import__/attachments/SampleCaptures/l2ping.cap) (Linux BlueZ hcidump) Contains some [Bluetooth](/Bluetooth) packets captured using hcidump, the packets were from the l2ping command that's included with the Linux BlueZ stack.

[Bluetooth1.cap](uploads/__moin_import__/attachments/SampleCaptures/Bluetooth1.cap) (Linux BlueZ hcidump) Contains some [Bluetooth](/Bluetooth) packets captured using hcidump.

### CredSSP

[ws-cssp.tgz](uploads/8c35b41dcf37fa3dd795e08f73f15991/ws-cssp.tgz) Contains RDP sessions from Windows and freerdp clients, featuring CredSSP over TLS, GSS-KRB5, SPNEGO and U2U (user-to-user). Certificate key and Kerberos keytab included.

[TSRemoteGuardCreds.tgz](uploads/b268382f9025e0e45501431e33009738/TSRemoteGuardCreds.tgz) Contains an RDP session using remoteguard (TSRemoteGuardCreds).

### UDP-Lite

Several [UDP-Lite](/UDP-Lite) packets, some correct, some wrong.

[udp_lite_full_coverage_0.pcap](uploads/__moin_import__/attachments/SampleCaptures/udp_lite_full_coverage_0.pcap) If coverage=0, the full packet is checksummed over.

[udp_lite_illegal_1-7.pcap](uploads/__moin_import__/attachments/SampleCaptures/udp_lite_illegal_1-7.pcap) Coverage values between 1..7 (illegal).

[udp_lite_normal_coverage_8-20.pcap](uploads/__moin_import__/attachments/SampleCaptures/udp_lite_normal_coverage_8-20.pcap) Normal ones with correct checksums (legal).

[udp_lite_illegal_large-coverage.pcap](uploads/__moin_import__/attachments/SampleCaptures/udp_lite_illegal_large-coverage.pcap) Three traces with coverage lengths greater than the packet length.

[udp_lite_checksum_0.pcap](uploads/__moin_import__/attachments/SampleCaptures/udp_lite_checksum_0.pcap) checksum 0 is illegal.

### NFS Protocol Family

[nfs_bad_stalls.cap](uploads/__moin_import__/attachments/SampleCaptures/nfs_bad_stalls.cap) (libpcap) An NFS capture containing long stalls (about 38ms) in the middle of the responses to many read requests. This is useful for seeing the staircase effect in TCP Time Sequence Analysis.

[nfsv2.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/nfsv2.pcap.gz) (libpcap) Fairly complete trace of all [NFS](/NFS) v2 packet types.

[nfsv3.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/nfsv3.pcap.gz) (libpcap) Fairly complete trace of all [NFS](/NFS) v3 packet types.

[klm.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/klm.pcap.gz) (libpcap) A "fake" trace containing all [KLM](/KLM) functions.

[rquota.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/rquota.pcap.gz) (libpcap) A "fake" trace containing all [RQUOTA](/RQUOTA) functions.

[nsm.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/nsm.pcap.gz) (libpcap) A "fake" trace containing all [NSM](/NSM) functions.

[getsetacl.cap](uploads/f44766777e18d287025137ceab7df83e/getsetacl.cap) (libpcap) A trace containing NFSACL functions.

[nfsv4.1_pnfs.cap](uploads/__moin_import__/attachments/SampleCaptures/nfsv4.1_pnfs.cap) NFSv4.1 trace containing pNFS.

### Server Message Block (SMB)/Common Internet File System (CIFS)

[smbtorture.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/smbtorture.cap.gz) (libpcap) Capture showing a wide range of SMB features. The capture was made using the Samba4 smbtorture suite, against a Windows Vista beta2 server.

See [SMB2#Example_capture_files](/SMB2#Example_capture_files) for more captures.

### Legacy Implementations of SMB

[smb-legacy-implementation.pcapng](uploads/__moin_import__/attachments/SampleCaptures/smb-legacy-implementation.pcapng) NetBIOS traffic from Windows for Workgroups v3.11. Shows NetBIOS over LLC and NetBIOS over IPX.

### Browser Elections

[smb-browser-elections.pcapng](uploads/__moin_import__/attachments/SampleCaptures/smb-browser-elections.pcapng) NetBIOS requires that a Master Browser tracks host announcements and responds to Browser Requests. Master Browser a elected by a list of criteria. The role of a master browser should be taken by a stable system, as browser elections can have a serious performance impact. This trace shows the a client with a misconfigured firewall, blocking incoming UDP port 138. Since the client can not find a master browser, it stalls all other systems by repeated browser elections.

### SMB-Locking

[SMB-locking.pcapng.gz](uploads/__moin_import__/attachments/SampleCaptures/SMB-locking.pcapng.gz) (libpcap) SMB and SMB2 support opportunistic locking. Clients can send a lock request. If necessary, the server has to break conflicting locks by sending a lock request to the client. This is a bit unusual: We see requests from the server. A large number of lock requests is usually an indicator for poor performance. If lock requests are made as blocking IOs, users will experience that their application freezes in a seemingly random manner.

### SMB-Direct

[smb-direct-manin-the-middle-02-reassemble-frames9.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/smb-direct-man-in-the-middle-02-reassemble-frames9.pcap.gz) (libpcap) SMB-Direct over iWarp between two Windows 2012 machines proxied via a port redirector in order to capture the traffic.

### SMB3.1 handshake

[smb-on-windows-10.pcapng](uploads/__moin_import__/attachments/SampleCaptures/smb-on-windows-10.pcapng) (libpcap) Short sample of a SMB3 handshake between two workstations running Windows 10.

### SMB3 encryption

[smb3-aes-128-ccm.pcap](uploads/__moin_import__/attachments/SampleCaptures/smb3-aes-128-ccm.pcap) short sample of a SMB3 connection to an encrypted (AES-128-CCM) share (session id 3d00009400480000, session key 28f2847263c83dc00621f742dd3f2e7b).

### SMB3.1.1 encryption

[smb311-aes-128-ccm-filt.pcap](uploads/__moin_import__/attachments/SampleCaptures/smb311-aes-128-ccm-filt.pcap) short sample of a SMB3.1.1 connection to an encrypted (AES-128-CCM) share (session id 690000ac1c280000, session key b25a135fc3dc14269f20d7cbc8716b6b).

Preauth hash takes these values over the course of the session establishement:

#### Intial value

00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

#### Negotiate protocol request

19 a0 81 73 9c 67 12 6a 6a 5a 68 52 39 63 fb d7 a5 84 cd 40 d5 7d ce af b6 1c c4 06 08 e5 e2 86 9d f7 04 1f 42 4d 39 a6 e1 11 d4 8c 8b 70 a0 51 5a 1d ea ae 7e 29 49 b0 1a 95 d8 b9 ae 22 1c bb

#### Negotiate protocol response

9b 8f 4c 61 dc 66 40 4c 40 1d 09 49 25 c9 9e 20 84 bb 39 15 1e 19 73 ff 65 b0 53 21 f1 da 9f d7 51 d1 9f 3d 90 9d 86 85 cd 1a 6d 5b 94 88 58 61 9f b9 c8 b8 4b ab 8b 59 77 91 89 bd c4 97 26 32

#### Session setup request (1st)

95 31 5f 50 0c 9f 5d c5 d4 a8 39 07 3b 58 02 12 bb 69 b7 cb 40 9e 70 73 ab 8f 3a d0 85 bf 62 ce a5 86 6d 7b 33 79 0f 56 c2 0a cb 38 be 3c 6a 05 48 38 f5 b4 44 a0 1f b5 a0 c1 d2 ce db b5 75 74

#### Session setup response (1st)

b5 00 d2 9c ae e7 8d 7e 75 73 94 c3 e2 41 15 8a bc 53 51 d0 bf c0 d7 89 b9 04 97 d8 15 9b 8a 40 0f 95 91 64 e0 cc 84 2e 32 7d 81 84 c8 53 19 dc e0 39 0c 1d 25 80 f9 d8 bc 1a bc 16 f5 f7 c6 79

#### Session setup request (2nd)

fb 11 6c 80 20 e2 3f d8 e4 e3 07 01 f1 da d7 af d8 e3 ff 22 0d c4 5b ff 1d 7f fb 92 ee a3 a6 89 5f 7f 49 39 b9 75 7e ed 97 a8 1e c4 fa d9 75 91 e8 81 73 de 78 1f 32 82 33 a6 f5 37 45 59 f1 2a

The final server decryption key is: F8 C1 A6 B5 44 E8 22 6F 98 EE 44 77 8E AF 31 6B

The final client decryption key is: 39 40 71 F1 A2 1D B5 BA 68 3E FA 86 8C 36 AE DF

### TCP

See the MPTCP section for MPTCP pcaps.

[200722_win_scale_examples_anon.pcapng](uploads/__moin_import__/attachments/SampleCaptures/200722_win_scale_examples_anon.pcapng) TCP Window Scaling examples - available, no scaling and missing/unknown.

[200722_tcp_anon.pcapng](uploads/__moin_import__/attachments/SampleCaptures/200722_tcp_anon.pcapng) Netcat - string, file and characters.

### MPTCP

[iperf-mptcp-0-0.pcap](uploads/__moin_import__/attachments/SampleCaptures/iperf-mptcp-0-0.pcap) iperf between client and hosts with 2 interfaces and the linux implementation. There are 4 subflows, 2 of them actually successfully connected.

[redundant_stream1.pcapng](uploads/__moin_import__/attachments/SampleCaptures/redundant_stream1.pcapng) iperf with a redundant scheduler, i.e., the same data is sent across several subflows at the same time. Enable all the MPTCP options and you should be able to see Wireshark detect reinjections across subflows. For instance try the filter "tcp.options.mptcp.rawdataseqno == 1822294653": you should see 3 packets sending the same data on 3 different TCP connections.

[mptcp_v1.pcapng](uploads/__moin_import__/attachments/SampleCaptures/mptcp_v1.pcapng) This pcap was generated with the kernel 5.6 and shows the version 1 of MPTCP.

### Parallel Virtual File System (PVFS)

[pvfs2-sample.pcap](uploads/__moin_import__/attachments/SampleCaptures/pvfs2-sample.pcap) (libpcap) PVFS2 copy operation (local file to PVFS2 file system)

### HyperText Transport Protocol (HTTP)

[http.cap](uploads/27707187aeb30df68e70c8fb9d614981/http.cap) A simple HTTP request and response.

[http_gzip.cap](uploads/__moin_import__/attachments/SampleCaptures/http_gzip.cap) A simple HTTP request with a one packet gzip Content-Encoded response.

[http-chunked-gzip.pcap](uploads/__moin_import__/attachments/SampleCaptures/http-chunked-gzip.pcap) A single HTTP request and response for www.wireshark.org (proxied using socat to remove SSL encryption). Response is gzipped and used chunked encoding. Added in January 2016.

[http_with_jpegs.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/http_with_jpegs.cap.gz) A simple capture containing a few JPEG pictures one can reassemble and save to a file.

[tcp-ethereal-file1.trace](uploads/__moin_import__/attachments/SampleCaptures/tcp-ethereal-file1.trace) (libpcap) A large POST request, taking many TCP segments.

[tcp-ecn-sample.pcap](uploads/__moin_import__/attachments/SampleCaptures/tcp-ecn-sample.pcap) A sample TCP/HTTP of a file transfer using ECN (Explicit Congestion Notification) feature per RFC3168. Frame 48 experienced Congestion Encountered.

[http_redirects.pcapng](uploads/__moin_import__/attachments/SampleCaptures/http_redirects.pcapng) A sample TCP/HTTP with many 302 redirects per RFC 3986 ( https://tools.ietf.org/html/rfc3986#section-5.4).

For captures using SSL/TLS, see [#SSL_with_decryption_keys](/SampleCaptures#ssl-with-decryption-keys).

### Telnet

[telnet-cooked.pcap](uploads/__moin_import__/attachments/SampleCaptures/telnet-cooked.pcap) (libpcap) A telnet session in "cooked" (per-line) mode.

[telnet-raw.pcap](uploads/__moin_import__/attachments/SampleCaptures/telnet-raw.pcap) (libpcap) A telnet session in "raw" (per-character) mode.

### TFTP

[tftp_rrq.pcap](uploads/__moin_import__/attachments/SampleCaptures/tftp_rrq.pcap) (libpcap) A TFTP Read Request.

[tftp_wrq.pcap](uploads/__moin_import__/attachments/SampleCaptures/tftp_wrq.pcap) (libpcap) A TFTP Write Request.

### UFTP

[UFTP_v3_transfer.pcapng](uploads/__moin_import__/attachments/SampleCaptures/UFTP_v3_transfer.pcapng) (pcapng) An UFTP v3 file transfer (unencrypted).

[UFTP_v4_transfer.pcapng](uploads/__moin_import__/attachments/SampleCaptures/UFTP_v4_transfer.pcapng) (pcapng) An UFTP v4 file transfer (unencrypted).

[UFTP_v5_transfer.pcapng](uploads/__moin_import__/attachments/SampleCaptures/UFTP_v5_transfer.pcapng) (pcapng) An UFTP v5 file transfer (unencrypted and encrypted).

### Routing Protocols

[bgp.pcapng.gz](uploads/__moin_import__/attachments/SampleCaptures/bgp.pcapng.gz) (pcapng) BGP packets between three peers using communities and announcing six networks. The BGP implementation is FRRouting.

[bgp.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/bgp.pcap.gz) (libpcap) BGP packets, including AS path attributes.

[bgp_shutdown_communication.pcap](uploads/__moin_import__/attachments/SampleCaptures/bgp_shutdown_communication.pcap) (libpcap) Sample packet for BGP Shutdown communication https://tools.ietf.org/html/draft-ietf-idr-shutdown-01.

[bgpsec.pcap](uploads/__moin_import__/attachments/SampleCaptures/bgpsec.pcap) (libpcap) Sample BGPsec OPEN and UPDATE messages. See https://tools.ietf.org/html/rfc8205 for the protocol specification and https://tools.ietf.org/html/rfc8208#appendix-A for more packet examples.

[bmp.pcap](uploads/__moin_import__/attachments/SampleCaptures/bmp.pcap) (libpcap) BGP Monitoring Protocol, including Init, Peer Up, Route Monitoring

[EIGRP_Neighbors.cap](uploads/__moin_import__/attachments/SampleCaptures/EIGRP_Neighbors.cap) Two Cisco EIGRP peers forming an adjacency.

[eigrp-for-ipv6-auth.pcap](uploads/__moin_import__/attachments/SampleCaptures/eigrp-for-ipv6-auth.pcap) Cisco EIGRP packets, including Authentication TLVs

[eigrp-for-ipv6-stub.pcap](uploads/__moin_import__/attachments/SampleCaptures/eigrp-for-ipv6-stub.pcap) Cisco EIGRP packets, including Stub routing TLVs

[eigrp-for-ipv6-updates.pcap](uploads/__moin_import__/attachments/SampleCaptures/eigrp-for-ipv6-updates.pcap) Cisco EIGRP packets, including IPv6 internal and external route updates

[eigrp-ipx.pcap](uploads/__moin_import__/attachments/SampleCaptures/eigrp-ipx.pcap) Cisco EIGRP packets, including IPX internal and external route updates

[ipv6-ripng.gz](uploads/__moin_import__/attachments/SampleCaptures/ipv6-ripng.gz) (libpcap) RIPng packets (IPv6)

[ospf.cap](uploads/__moin_import__/attachments/SampleCaptures/ospf.cap) (libpcap) Simple OSPF initialization.

[ospf-md5.cap](uploads/__moin_import__/attachments/SampleCaptures/ospf-md5.cap) (libpcap) Simple OSPF-MD5 Authentication.

[RIP_v1](uploads/__moin_import__/attachments/SampleCaptures/RIP_v1) A basic route exchange between two RIP v1 routers.

### SNMP

[b6300a.cap](uploads/__moin_import__/attachments/SampleCaptures/b6300a.cap) A collection of SNMP GETs and RESPONSEs

[snmp_usm.pcap](uploads/__moin_import__/attachments/SampleCaptures/snmp_usm.pcap) A series of authenticated and some encrypted SNMPv3 PDUS

* the authPassword for all users is pippoxxx and the privPassword is PIPPOxxx.
* pippo uses MD5 and DES
* pippo2 uses SHA1 and DES
* pippo3 uses SHA1 and AES
* pippo4 uses MD5 and AES

### Network Time Protocol

[NTP_sync.pcap](uploads/__moin_import__/attachments/SampleCaptures/NTP_sync.pcap) (4KB, showing the [NetworkTimeProtocol](/NetworkTimeProtocol))\
Contributor: Gerald Combs\
Description: After reading about the round robin [DNS](/DNS) records set up by the folks at [pool.ntp.org](http://www.pool.ntp.org), I decided to use their service to sync my laptop's clock. The attached file contains the result of running

```plaintext
net time /setsntp:us.pool.ntp.org
net stop w32time
net start w32time
```

at the command prompt. Something to note is that each pool.ntp.org DNS record contains multiple addresses. The Windows time client appears to query all of them.

[MicrosoftNTP.cap](uploads/__moin_import__/attachments/SampleCaptures/MicrosoftNTP.cap) (Microsoft Network Monitor) 2 Packets containing a synchronisation to the Microsoft NTP server.

### SyncE Protocol

[SyncE_bidirectional.pcapng](uploads/__moin_import__/attachments/SampleCaptures/SyncE_bidirectional.pcapng) (1.5KB, showing the [syncE](/syncE) protocol)\
Contributor: [RadhaKrishna](/RadhaKrishna). courtesy:Karsten, RAD, Germany\
Description: SyncE is a synchronization mechanism for Ethernet networks. This mechanism uses SSM packets to qualify the synchronization signal quality.

### PostgreSQL v3 Frontend/Backend Protocol

[pgsql.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/pgsql.cap.gz) (2KB, showing a brief [PostgresProtocol](/PostgresProtocol) session)\
Contributor: Abhijit Menon-Sen

[pgsql-jdbc.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/pgsql-jdbc.pcap.gz) (584KB, showing a PostgreSQL JDBC test session)\
Contributors: Kris Jurka and Abhijit Menon-Sen\\

### MySQL protocol

File: [mysql_complete.pcap](uploads/__moin_import__/attachments/SampleCaptures/mysql_complete.pcap) (6 KB, from bug 2691)

For MySQL captures using SSL, see [#SSL_with_decryption_keys](/SampleCaptures#ssl-with-decryption-keys).

### MS SQL Server protocol - Tabular Data Stream (TDS)

[ms-sql-tds-rpc-requests.cap](uploads/__moin_import__/attachments/SampleCaptures/ms-sql-tds-rpc-requests.cap) (17 KB) RPC requests and a few SQL queries\
Contributor: Emil Wojak

### Netgear NSDP

[ndsp_v2.pcapng.gz](uploads/__moin_import__/attachments/SampleCaptures/ndsp_v2.pcapng.gz) https://en.wikipedia.org/wiki/Netgear_NSDP upload a new Firmware via Netgear [SmartUtility](/SmartUtility). Switch Netgear GS748Tv3 is 192.168.0.239.

### VendorLanProtocolFamily

Extreme Networks

[edp.trace.gz](uploads/__moin_import__/attachments/SampleCaptures/edp.trace.gz) General EDP traffic

[edp1.trace.gz](uploads/__moin_import__/attachments/SampleCaptures/edp1.trace.gz)

[edp.esrp.gz](uploads/__moin_import__/attachments/SampleCaptures/edp.esrp.gz) EDP/ESRP traffic

[edp.eaps.mirror1.trace.gz](uploads/__moin_import__/attachments/SampleCaptures/edp.eaps.mirror1.trace.gz)

[edp.eaps.mirror2.trace.gz](uploads/__moin_import__/attachments/SampleCaptures/edp.eaps.mirror2.trace.gz)

### Cisco

[cdp.pcap](uploads/__moin_import__/attachments/SampleCaptures/cdp.pcap) CDP v2 frame from a Cisco router.

[cdp_v2.pcap](uploads/__moin_import__/attachments/SampleCaptures/cdp_v2.pcap) CDP v2 frame from a Cisco switch.

[DTP.pcapng](uploads/__moin_import__/attachments/SampleCaptures/DTP.pcapng) DTP frames from a Cisco switch.

[cdp-BCM1100.cap](uploads/__moin_import__/attachments/SampleCaptures/cdp-BCM1100.cap)

Mikrotiks [mndp.pcap](uploads/__moin_import__/attachments/SampleCaptures/mndp.pcap)

### DECT

[dump_2009-02-02_23_17_18_RFPI_00_4e_b4_bd_50.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/dump_2009-02-02_23_17_18_RFPI_00_4e_b4_bd_50.pcap.gz) A trace of an unencrypted DECT phonecall with the original Ethernet pseudoheader (see README.DECT). Called number 0800-1507090 (DTMF only?)

### DECT-MITEL-RFP

[new_rfp.pcap](uploads/12dd49a43f7a9e90cbd748d1762cca9a/new_rfp.pcap) First boot up and configuration of a new RFP into the DECT system.

[new_rfp_on_wire.pcap](uploads/806d18a795138d97530ff2d2124e31c5/new_rfp_on_wire.pcap) Same as above but without external decryption.

### Sigtran Protocol Family

Captures of protocols belonging to the [SIGTRAN](/SIGTRAN) family.

[isup.cap](uploads/__moin_import__/attachments/SampleCaptures/isup.cap) A single call's signalling sequence using ISUP/MTP3/M3UA/SCTP/IP. NOTE: The M3UA version preference must be set to "Draft 6" to successfully view this file (Edit->Preferences->Protocols->M3UA->M3UA Version->Internet Draft version 6).

[isup_load_generator.pcap](uploads/__moin_import__/attachments/SampleCaptures/isup_load_generator.pcap) ISUP/MTP3/MTP2 made by a call load generator and captured from an E1 line. The capture includes the frame check sequence at the end of each packet.

[bicc.pcap](uploads/__moin_import__/attachments/SampleCaptures/bicc.pcap) Sample [BICC](/BICC) PDUs.

[camel.pcap](uploads/__moin_import__/attachments/SampleCaptures/camel.pcap) A single call using CAMEL/TCAP/SCCP/MTP3/M2UA/SCTP/IP. This "capture" has been generated using [text2pcap](http://www.wireshark.org/docs/man-pages/text2pcap.1.html) tool, from MTP3 raw data trace. The capture contains the following Camel operations: InitialDP, RequestReportBCSMEvent, ApplyCharging, Continue, EventReportBCSM, ApplyChargingReport, ReleaseCall.

[camel2.pcap](uploads/__moin_import__/attachments/SampleCaptures/camel2.pcap) Same as camel.pcap capture, except that the it is using another Camel phase. The other difference is that the call is rejected. The capture contains the following Camel operations: InitialDP, RequestReportBCSMEvent, Connect, [ReleaseCall](/ReleaseCall).

[gsm_map_with_ussd_string.pcap](uploads/__moin_import__/attachments/SampleCaptures/gsm_map_with_ussd_string.pcap) This "capture" has been generated using [text2pcap](http://www.wireshark.org/docs/man-pages/text2pcap.1.html) tool, from MTP3 raw data trace. It contains a GSM MAP processUnstructuredSS-Request MAP operation with a USSD String (GSM 7 bit encoded).

[ansi_map_ota.pcap](uploads/__moin_import__/attachments/SampleCaptures/ansi_map_ota.pcap) ANSI MAP OTA trace.

[ansi_map_win.pcap](uploads/__moin_import__/attachments/SampleCaptures/ansi_map_win.pcap) ANSI MAP over ANSI MTP3 with WIN messages.

[packlog-example.cap](uploads/__moin_import__/attachments/SampleCaptures/packlog-example.cap) Example capture of Cisco ITP's Packet Logging Facility packets (SS7 MSU encapsulated in syslog messages). It contains a few random MSUs: MTP3MG, TCAP and GSM_MAP. There aren't any complete dialogs in the capture.

[japan_tcap_over_m2pa.pcap](uploads/__moin_import__/attachments/SampleCaptures/japan_tcap_over_m2pa.pcap) Example of TCAP over Japan SCCP/MTP over M2PA (RFC version).

[ansi_tcap_over_itu_sccp_over_mtp3_over_mtp2.pcap](uploads/__moin_import__/attachments/SampleCaptures/ansi_tcap_over_itu_sccp_over_mtp3_over_mtp2.pcap) Example of ANSI TCAP carried over ITU SCCP/MTP3/MTP2. Really this should be in an "SS7" section of the SampleCaptures page.

### Stream Control Transmission Protocol (SCTP)

[sctp.cap](uploads/__moin_import__/attachments/SampleCaptures/sctp.cap) Sample [SCTP](/SCTP) PDUs, Megaco.

[sctp-test.cap](uploads/__moin_import__/attachments/SampleCaptures/sctp-test.cap) Sample [SCTP](/SCTP) handshaking and DATA/SACK chunks.

[sctp-addip.cap](uploads/__moin_import__/attachments/SampleCaptures/sctp-addip.cap) Sample [SCTP](/SCTP) ASCONF/ASCONF-ACK Chunks that perform Vertical Handover.

[sctp-www.cap](uploads/__moin_import__/attachments/SampleCaptures/sctp-www.cap) Sample [SCTP](/SCTP) DATA Chunks that carry HTTP messages between Apache2 HTTP Server and Mozilla.

[SCTP-INIT-Collision.cap](uploads/__moin_import__/attachments/SampleCaptures/SCTP-INIT-Collision.cap) Sample [SCTP](/SCTP) trace showing association setup collision (both peers trying to connect to each other).

### IPMI

[ipmi.SDR.FRU.SEL.pcap](uploads/__moin_import__/attachments/SampleCaptures/ipmi.SDR.FRU.SEL.pcap) Opens and closes a session and retrieves the SDR, SEL and FRU. This "capture" has been generated using [text2pcap](http://www.wireshark.org/docs/man-pages/text2pcap.1.html) tool, from RMCP raw data trace.

[ipmi.sensor.event.RR.pcap](uploads/__moin_import__/attachments/SampleCaptures/ipmi.sensor.event.RR.pcap) Opens and closes a session and does different Sensor/Event requests and responses. This "capture" has been generated using [text2pcap](http://www.wireshark.org/docs/man-pages/text2pcap.1.html) tool, from RMCP raw data trace.

### IPMB

[ipmb.multi.packets.pcap](uploads/__moin_import__/attachments/SampleCaptures/ipmb.multi.packets.pcap) (libpcap). IPMB interface capture file, include multiple request and response packets.

### SIP and RTP

[aaa.pcap](uploads/__moin_import__/attachments/SampleCaptures/aaa.pcap) Sample SIP and RTP traffic.

[SIP_CALL_RTP_G711](uploads/__moin_import__/attachments/SampleCaptures/SIP_CALL_RTP_G711) Sample SIP call with RTP in G711.

[SIP_DTMF2.cap](uploads/__moin_import__/attachments/SampleCaptures/SIP_DTMF2.cap) Sample SIP call with RFC 2833 DTMF

[DTMFsipinfo.pcap](uploads/__moin_import__/attachments/SampleCaptures/DTMFsipinfo.pcap) Sample SIP call with SIP INFO DTMF

[h223-over-rtp.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/h223-over-rtp.pcap.gz) (libpcap) A sample of H.223 running over RTP, following negotiation over SIP.

[h263-over-rtp.pcap](uploads/__moin_import__/attachments/SampleCaptures/h263-over-rtp.pcap) (libpcap) A sample of RFC 2190 H.263 over RTP, following negotiation over SIP.

[metasploit-sip-invite-spoof.pcap](uploads/__moin_import__/attachments/SampleCaptures/metasploit-sip-invite-spoof.pcap) Metasploit 3.0 SIP Invite spoof capture.

[FAX-Call-t38-CA-TDM-SIP-FB-1.pcap](uploads/__moin_import__/attachments/SampleCaptures/FAX-Call-t38-CA-TDM-SIP-FB-1.pcap) Fax call from TDM to SIP over Mediagateway with declined T38 request, megaco H.248.

[Asterisk_ZFONE_XLITE.pcap](uploads/__moin_import__/attachments/SampleCaptures/Asterisk_ZFONE_XLITE.pcap) Sample SIP call with ZRTP protected media.

[MagicJack+ Power On sequence](uploads/__moin_import__/attachments/SampleCaptures/MagicJack-\_pwr_up.pcap) SIP and RTP traffic generated by power on the MagicJack+

[MagicJack+ short test call](uploads/__moin_import__/attachments/SampleCaptures/MagicJack-\_short_call.pcap) A complete telephone call example

[sip-rtp-opus-hybrid.pcap](uploads/1868d73fee89fce9d77c6ba21929e773/sip-rtp-opus-hybrid.pcap) SIP and OPUS hybrid payloads, include OPUS-multiple frames packets.

[rtp-opus-only.pcap](uploads/1d5d8e249b46a446eaecc7970b8d129d/rtp-opus-only.pcap) RTP Opus payloads only (without SIP/SDP).

SIP calls between SIPp ([scenario file](https://git.lekensteyn.nl/peter/wireshark-notes/tree/sipsim/uac_media.xml)) and FreeSWITCH 1.6.12, playing [ivr-on_hold_indefinitely.wav](https://freeswitch.org/stash/projects/FS/repos/freeswitch-sounds/commits/d55f6602be073fda2138febf286954ad125c6878#sounds/trunk/fr/ca/june/48000/ivr/ivr-on_hold_indefinitely.wav) in one direction using various codecs:

* [sip-rtp-dvi4.pcap](uploads/__moin_import__/attachments/SampleCaptures/sip-rtp-dvi4.pcap)
* [sip-rtp-g711.pcap](uploads/__moin_import__/attachments/SampleCaptures/sip-rtp-g711.pcap) - has both G.711A (PCMA) and G.711U (PCMU)
* [sip-rtp-g722.pcap](uploads/__moin_import__/attachments/SampleCaptures/sip-rtp-g722.pcap)
* [sip-rtp-g726.pcap](uploads/__moin_import__/attachments/SampleCaptures/sip-rtp-g726.pcap) - has eight variants: (AAL2-)G726-16/24/40/40
* [sip-rtp-gsm.pcap](uploads/__moin_import__/attachments/SampleCaptures/sip-rtp-gsm.pcap)
* [sip-rtp-ilbc.pcap](uploads/__moin_import__/attachments/SampleCaptures/sip-rtp-ilbc.pcap)
* [sip-rtp-l16.pcap](uploads/__moin_import__/attachments/SampleCaptures/sip-rtp-l16.pcap) - four variants: 8000/2, 16000/2, 11025, 48000
* [sip-rtp-lpc.pcap](uploads/__moin_import__/attachments/SampleCaptures/sip-rtp-lpc.pcap)
* [sip-rtp-opus.pcap](uploads/__moin_import__/attachments/SampleCaptures/sip-rtp-opus.pcap) - Opus mono session with 48kHz clock rate
* [sip-rtp-speex.pcap](uploads/__moin_import__/attachments/SampleCaptures/sip-rtp-speex.pcap) - three sample rates: 8/16/32kHz
* [sip-rtp-g729a.pcap](uploads/__moin_import__/attachments/SampleCaptures/sip-rtp-g729a.pcap)

[sip-tls-1.3-and-rtcp.zip](uploads/__moin_import__/attachments/SampleCaptures/sip-tls-1.3-and-rtcp.zip) SIP call over TLS 1.3 transport with enabled RTCP. Used [openssl 1.1.1 prerelease version](https://github.com/openssl/openssl/commit/bdcacd93b14ed7381a922b41d74c481224ef9fa1)

### RTSP Protocol

Here's a few RTSP packets in Microsoft Network Monitor format: [RTSPPACKETS1.cap](uploads/__moin_import__/attachments/SampleCaptures/RTSPPACKETS1.cap)

[rtsp_with_data_over_tcp.cap](uploads/__moin_import__/attachments/SampleCaptures/rtsp_with_data_over_tcp.cap) (libpcap) An RTSP reply packet.

### H.223

[h223-over-iax.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/h223-over-iax.pcap.gz) (libpcap) A sample of H.223 running over IAX, including H.263 and AMR payloads.

[h223-over-tcp.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/h223-over-tcp.pcap.gz) (libpcap) A sample of H.223 running over TCP. You'll need to select 'Decode as... H.223'.

[h223-over-rtp.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/h223-over-rtp.pcap.gz) (libpcap) A sample of H.223 running over RTP, following negotiation over SIP.

### H.265/HEVC

[1920x1080_H.265.pcapng](uploads/__moin_import__/attachments/SampleCaptures/1920x1080_H.265.pcapng) (libpcap) A sample of H.265 running over RTP, following negotiation over RTSP.

### MGCP

[MGCP.pcap](uploads/__moin_import__/attachments/SampleCaptures/MGCP.pcap) (libpcap) A sample of the Media Gateway Control Protocol (MGCP).

### USB Raw (dlt 186)

[VariousUSBDevices.pcap](uploads/__moin_import__/attachments/SampleCaptures/VariousUSBDevices.pcap) (libpcap) Various USB devices on a number of busses

Usb packets exchanged while unpluggin and replugging a mouse: [mouse_replug2.pcap](uploads/__moin_import__/attachments/SampleCaptures/mouse_replug2.pcap)

[usbstick3.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/usbstick3.pcap.gz) (libpcap) Plug in a USB2.0 stick, mount it, list the contents.

[usbhub.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/usbhub.pcap.gz) (libpcap) Plug in a usb2.0 4-port hub without external powersupply, plugin a logitech presenter into one of the ports, press a button, unplug presenter, unplug hub. Repeat with externally powered hub.

### USB with Linux encapsulation (dlt 189)

[usb_memory_stick.pcap](uploads/__moin_import__/attachments/SampleCaptures/usb_memory_stick.pcap) Plug in an usb stick and mount it

[usb_memory_stick_create_file.pcap](uploads/__moin_import__/attachments/SampleCaptures/usb_memory_stick_create_file.pcap) Create a new file in a previusly mounted memory stick and write some text into it

[usb_memory_stick_delete_file.pcap](uploads/__moin_import__/attachments/SampleCaptures/usb_memory_stick_delete_file.pcap) Delete the file previusly created from the memory stick.

[Bluetooth_HCI_and_OBEX_Transaction_over_USB.ntar.gz](uploads/__moin_import__/attachments/SampleCaptures/Bluetooth_HCI_and_OBEX_Transaction_over_USB.ntar.gz) contains a Bluetooth session (including connecting the USB adaptor used, pairing with a mobile phone, receiving a file over RFCOMM/L2CAP/OBEX, and finally removing the USB Bluetooth adaptor) over USB

[xrite-i1displaypro-argyllcms-1.9.2-spotread.pcapng](uploads/__moin_import__/attachments/SampleCaptures/xrite-i1displaypro-argyllcms-1.9.2-spotread.pcapng) ArgyllCMS 1.9.2 making a single measurement (spotread) using an X-Rite i1 Display Pro color sensor. Some other sensors, such as the near-identical ColorMunki Display, use the same protocol.

### USB with USBPcap encapsulation

[usb_u3v_sample.pcapng](uploads/__moin_import__/attachments/SampleCaptures/usb_u3v_sample.pcapng) Sample control and video traffic with a USB3Vision camera

[xrite-i1displaypro-i1profiler.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/xrite-i1displaypro-i1profiler.pcap.gz) X-Rite i1Profiler v1.6.6.19864 measuring a display profile using an X-Rite i1 Display Pro color sensor, captured using USBPcap 1.0.0.7. Some other sensors, such as the near-identical ColorMunki Display, use the same protocol.

### USB Link Layer

[SB1240-via-hub_usbll.7z](uploads/__moin_import__/attachments/SampleCaptures/SB1240-via-hub_usbll.7z) USB Audio class device SB1240 (Full-Speed) connected via High-Speed USB Hub to host. Contains simultaneous captures on the HS link between Hub and Host, FS link between SB1240 and Hub and usbmon capture on the USB Host.

[STM32L053-Nucleo-via-hub.7z](uploads/__moin_import__/attachments/SampleCaptures/STM32L053-Nucleo-via-hub.7z) Composite device (ST-LINK Vendor specific protocol, Mass Storage class, CDC Class) STM32L053 Nucleo (Full-Speed) connected via High-Speed USB Hub to host. Contains simultaneous captures on the HS link between Hub and Host, FS link between SB1240 and Hub and usbmon capture on the USB Host. Only the Mass Storage class interface was actively used.

[USBMSC-USBLL.7z](uploads/36d216660e18783c8d2229ddc372f746/USBMSC-USBLL.7z) USB memory stick connected and mounted on Windows. Includes both link layer capture and matching USBPcap capture.

### USB packets with Darwin (macOS, etc.) headers

[XHC1-SanDiskExtremePortableSSD.pcapng](uploads/e7f404a74a805bd809b8ec565bacb031/XHC1-SanDiskExtremePortableSSD.pcapng)

[XHC20-LogitechUnifying.pcapng.gz](uploads/1ca2e5ae2519eda3a0d2328a2b5d8222/XHC20-LogitechUnifying.pcapng.gz)

[XHC20-MicrosoftKeyboard.pcapng.gz](uploads/4e4c7e04ffc237af7b09e1e890e884ee/XHC20-MicrosoftKeyboard.pcapng.gz)

[XHC20-OpenVizsla.pcapng.gz](uploads/b35172e69ec15d2c36f3edb41c71e610/XHC20-OpenVizsla.pcapng.gz)

### FreeBSD usbdump format file

[test.usbdump](uploads/__moin_import__/attachments/SampleCaptures/test.usbdump) Sample FreeBSD usbdump capture file.

### WAP Protocol Family

[WAP_WBXML_Provisioning_Push.pcap](uploads/__moin_import__/attachments/SampleCaptures/WAP_WBXML_Provisioning_Push.pcap) contains a [WSP](/WSP) Push PDU with a Client Provisioning document encoded in [WBXML](/WBXML). This example comes from the WAP Provisioning specifications.

[wap_google.pcap](uploads/__moin_import__/attachments/SampleCaptures/wap_google.pcap) contains two [WSP](/WSP) request-response dialogs.

### X.509 Digital Certificates

[x509-with-logo.cap](uploads/__moin_import__/attachments/SampleCaptures/x509-with-logo.cap) contains (packet 18) an X.509 digital certificate containing RFC3709 [LogotypeCertificateExtensions](/LogotypeCertificateExtensions).

### Lightweight Directory Access Protocol (LDAP)

[ldap-controls-dirsync-01.cap](uploads/__moin_import__/attachments/SampleCaptures/ldap-controls-dirsync-01.cap) Sample [LDAP](/LDAP) PDU with DIRSYNC CONTROLS

[ldap-krb5-sign-seal-01.cap](uploads/__moin_import__/attachments/SampleCaptures/ldap-krb5-sign-seal-01.cap) Sample [GSSAPI](/GSSAPI)-[KRB5](/KRB5) signed and sealed [LDAP](/LDAP) PDU

[ldap-and-search.pcap](uploads/__moin_import__/attachments/SampleCaptures/ldap-and-search.pcap) Sample search filter with AND filter, filter

[ldap-attribute-value-list.pcap](uploads/__moin_import__/attachments/SampleCaptures/ldap-attribute-value-list.pcap) Sample search filter with an attribute value list

[ldap-extensible-match-with-dn.pcap](uploads/__moin_import__/attachments/SampleCaptures/ldap-extensible-match-with-dn.pcap) Sample search filter with an extensible match with dnAttributes

[ldap-extensible-match.pcap](uploads/__moin_import__/attachments/SampleCaptures/ldap-extensible-match.pcap) Sample search filter with a simple extensible match

[ldap-substring.pcap](uploads/__moin_import__/attachments/SampleCaptures/ldap-substring.pcap) Sample search filter with substring matches

[ldap-ssl.pcapng](uploads/__moin_import__/attachments/SampleCaptures/ldap-ssl.pcapng) Encrypted LDAP traffic, see [#SSL_with_decryption_keys](/SampleCaptures#ssl-with-decryption-keys) for more details.

### Link Layer Discovery Protocol (LLDP)

[lldp.minimal.pcap](uploads/__moin_import__/attachments/SampleCaptures/lldp.minimal.pcap) (libpcap) Simple LLDP packets.

[lldp.detailed.pcap](uploads/__moin_import__/attachments/SampleCaptures/lldp.detailed.pcap) (libpcap) LLDP packets with more details.

[lldpmed_civicloc.pcap](uploads/__moin_import__/attachments/SampleCaptures/lldpmed_civicloc.pcap) (libpcap) LLDP-MED packet with TLV entries, including civic address location ID, network policy and extended power-via-MDI.

[D-Link Ethernet Switch Smart Console Utility LLDP](uploads/__moin_import__/attachments/SampleCaptures/D-Link-Ethernet-Switch-Smart-Console-Utility-LLDP) (libpcap) D-Link LLDP [SmartConsole](/SmartConsole) Utility.

[lldp-shutdown-pdu.pcapng.gz](uploads/09c7a71f677512671fb39343f9eba69e/lldp-shutdown-pdu.pcapng.gz) (libpcap) LLDP capture in GNS3 between two SONiC devices while configuring `no lldp enable` on an interface.

### SAN Protocol Captures (iSCSI, ATAoverEthernet, FibreChannel, SCSI-OSD and other SAN related protocols)

[iscsi-scsi-data-cdrom.zip](uploads/__moin_import__/attachments/SampleCaptures/iscsi-scsi-data-cdrom.zip) contains a complete log of iSCSI traffic between MS iSCSI Initiator and Linux iSCSI Enterprise Target with a real SCSI CD-ROM exported. The CD-ROM has a Fedora Core 3 installation CD in it.

[iscsi-scsi-10TB-data-device.zip](uploads/__moin_import__/attachments/SampleCaptures/iscsi-scsi-10TB-data-device.zip) contains a complete log of iSCSI traffic between MS iSCSI Initiator and Linux iSCSI Enterprise Target with a 10TB block device exported. See the use of READ_CAPACITY_16, READ_16, and WRITE_16.

[iscsi-tapel.gz](uploads/__moin_import__/attachments/SampleCaptures/iscsi-tapel.gz) contains some operation log of iSCSI traffic between Linux open-iscsi initiator and Linux iSCSI Enterprise Target. The target is a EXABYTE EXB480 Tape library. Various mtx operations are executed.

[fcip_trace.cap](uploads/__moin_import__/attachments/SampleCaptures/fcip_trace.cap) from http://www.wireshark.org/lists/ethereal-dev/200212/msg00080.html containing fcip traffic but unfortunately no SCSI over FCP over FCIP

[fcoe-t11.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/fcoe-t11.cap.gz) has the FCoE encapsulation, showing a host adapter doing fabric and port logins, discovery and SCSI Inquiries, etc. This uses the August 2007 T11 converged frame format.

[fcoe1.cap](uploads/__moin_import__/attachments/SampleCaptures/fcoe1.cap) has a similar set of frames using an older FCoE frame format proposed prior to the August 2007 version.

[fcoe-t11-short.cap](uploads/__moin_import__/attachments/SampleCaptures/fcoe-t11-short.cap) is a trace of part of a SCSI write with only the first 64 bytes of each frame captured.

[fcoe-drop-rddata.cap](uploads/__moin_import__/attachments/SampleCaptures/fcoe-drop-rddata.cap) is a trace of a SCSI read with REC and SRR recovery performed.

FIP is the FCoE Initialization Protocol. [fip-adv.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/fip-adv.cap.gz) shows advertisement, discovery and FLOGI. [fip-ka.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/fip-ka.cap.gz) shows keep-alives and a clear-virtual-link. Note that the host and gateway are not necessarily using FIP correctly.

[scsi-osd-example-001.pcap](uploads/__moin_import__/attachments/SampleCaptures/scsi-osd-example-001.pcap) is a trace of the IBM osd_initiator_3_1_1 (an OSD tester application) exercising IBM's ibm-osd-sim (an emulation of an OSD target device). The transport involved is iSCSI, and makes use of the relatively unusual new SCSI feature of bidirectional data transfer. The trace captures the initial iSCSI Logins, through INQUIRY and REPORT LUNS, followed by a number of commands from the SCSI-OSD command set such as FORMAT OSD, LIST, CREATE PARTITION, CREATE, WRITE, READ, REMOVE, REMOVE PARTITION, and SET ROOT KEY.

### Peer-to-peer protocols

#### MANOLITO Protocol

[PioletSearch.Manolito.cap](uploads/__moin_import__/attachments/SampleCaptures/PioletSearch.Manolito.cap) (Microsoft Network Monitor) Here's a Piolet/Blubster (MANOLITO) capture for your enjoyment: It is a few packets I captured whilst looking for some Dr. Alban songs using Piolet.

[Manolito2.cap](uploads/__moin_import__/attachments/SampleCaptures/Manolito2.cap) (Microsoft Network Monitor) Here's some more Manolito packets (this time, it's just general sign-in).

#### BitTorrent Protocol

[BitTorrent.Transfer1.cap](uploads/__moin_import__/attachments/SampleCaptures/BitTorrent.Transfer1.cap) (Microsoft Network Monitor) Here's a capture with a few [BitTorrent](/BitTorrent) packets; it contains some small packets I got whilst downloading something on [BitTorrent](/BitTorrent).

[BITTORRENT.pcap](uploads/__moin_import__/attachments/SampleCaptures/BITTORRENT.pcap) (libpcap) Capture file of two torrent clients communicationg without DHT or peer exch.

#### SoulSeek Protocol

[SoulSeekRoom.cap](uploads/__moin_import__/attachments/SampleCaptures/SoulSeekRoom.cap) (Microsoft Network Monitor) Here's a capture with a few [SoulSeek](/SoulSeek) packets; it contains some small packets I got whilst browsing through some [SoulSeek](/SoulSeek) rooms.

#### JXTA Protocol

[jxta-sample.pcap](uploads/__moin_import__/attachments/SampleCaptures/jxta-sample.pcap) (libpcap) A trace of a JXTA client and rendezvous doing some chatting using several JXTA pipes.

[jxta-mcast-sample.pcap](uploads/__moin_import__/attachments/SampleCaptures/jxta-mcast-sample.pcap) (libpcap) A trace of a JXTA client and rendezvous doing some chatting using several JXTA pipes with UDP multicast enabled.

#### SMPP (Short Message Peer-to-Peer) Protocol

[smpp.cap](uploads/__moin_import__/attachments/SampleCaptures/smpp.cap) (libpcap) An SMPP capture showing a Bind_transmitter, Submit_sm and Unbind request flow.

### Kaspersky Update Protocol

Some examples of packets used by the Kaspersky AntiVirus Updater: [KasperskyPackets.CAP](uploads/__moin_import__/attachments/SampleCaptures/KasperskyPackets.CAP)

### Kerberos and keytab file for decryption

[krb-816.zip](uploads/__moin_import__/attachments/SampleCaptures/krb-816.zip) An example of Kerberos traffic when 2 users logon domain from a Windows XP. keytab file is included. With Kerberos decryption function in wireshark 0.10.12, some encrypted data can be decrypted.

[kpasswd_tcp.cap](uploads/__moin_import__/attachments/SampleCaptures/kpasswd_tcp.cap) An example of a Kerberos password change, sent over TCP.

[kerberos-Delegation.zip](uploads/__moin_import__/attachments/SampleCaptures/kerberos-Delegation.zip) An example of Kerberos Delegation in Windows Active Diretory.Keytaf file is also included.Please use Wireshark 0.10.14 SVN 17272 or above to open the trace.

[constained-delegation.zip](uploads/__moin_import__/attachments/SampleCaptures/constained-delegation.zip) An example of Kerberos constrained delegation (s4U2Proxy) in Windows 2003 domain.

[win_s4u2self.pcap](uploads/__moin_import__/attachments/SampleCaptures/win_s4u2self.pcap) An example of Kerberos protocol transition (s4U2Self) with W2k8 server and Win7 client (no keys).

[s4u2self_with_keys.tgz](uploads/__moin_import__/attachments/SampleCaptures/s4u2self_with_keys.tgz) Another example of Kerberos protocol transition (s4U2Self) with W2k16 server and MIT client (with keys).

[S4U2Self_with_certificate.tgz](uploads/__moin_import__/attachments/SampleCaptures/S4U2Self_with_certificate.tgz) Kerberos protocol transition (s4U2Self) using X509 certificate (with keys).

[rbcd_win_with_keys.tgz](uploads/__moin_import__/attachments/SampleCaptures/rbcd_win_with_keys.tgz) Kerberos s4U2Proxy resource-based-constrained-delegation (with keys).

[rbcd_win_two_transits_with_keys.tgz](uploads/__moin_import__/attachments/SampleCaptures/rbcd_win_two_transits_with_keys.tgz) Kerberos s4U2Proxy resource-based-constrained-delegation two transit (with keys).

[krb5_tgs_fast.tgz](uploads/__moin_import__/attachments/SampleCaptures/krb5_tgs_fast.tgz) Kerberos TGS with FAST padata.

### mDNS & Apple Rendezvous

ZIP Compressed mDNS (Apple Rendezvous) Dumps - MS [NetMon](/NetMon) Format: [mDNS1.zip](uploads/__moin_import__/attachments/SampleCaptures/mDNS1.zip)

### Point-To-Point (PPP)

[PPPHandshake.cap](uploads/__moin_import__/attachments/SampleCaptures/PPPHandshake.cap) PPP Handshake using Microsoft Windows VPN - MS [NetMon](/NetMon) Format

[PPP-config.cap](uploads/__moin_import__/attachments/SampleCaptures/PPP-config.cap) LCP and IPCP configuration of a Direct Cable Connection (WinXP)

[ppp-dialup-munged.pppd](uploads/__moin_import__/attachments/SampleCaptures/ppp-dialup-munged.pppd) Linux pppd async dialup connect/disconnect; (The capture file generated by pppd has been munged slightly to hide login info, thus certain HDLC checksums are incorrect)

[ppp_lcp_ipcp.pcap](uploads/__moin_import__/attachments/SampleCaptures/ppp_lcp_ipcp.pcap) PPP LCP and IPCP traffic w/a protocol reject for CCP.

### Point-To-Point over Ethernet

File: [telecomitalia-pppoe.pcap](uploads/__moin_import__/attachments/SampleCaptures/telecomitalia-pppoe.pcap)

PPPoE exchange between a Telecom Italia ADSL CPE and one of their Juniper (ex-Unisphere) BNASes.

1. CPE sends a discovery initiation frame (PADI) and receives an offer (PADO).
2. CPE sends an authentication request with dummy credentials "aliceadsl" both for username and password. These are useless, since the actual authentication is performed thanks to the DSLAM intercepting the PPPoE discovery frames and adding in a Circuit-ID/NAS-Port-ID tag, which is unique for the customer DSLAM port. This tag is then verified against a RADIUS server on Telecom Italia's premises. This process is hidden and transparent to the user and cannot be shown here.
3. Post-authentication, our CPE receives back IPCP messages containing configuration information, such as public IP, default gateway and DNS configuration.
4. We're now on the Internet. PPP LCP Echo requests and Echo replies are sent as session keep-alive check.

Contributed by [Lorenzo Cafaro](https://github.com/lcafaro).

### X.400

These captures exercise the Session (SES), Presentation(PRES), Assocation Control (ACSE), Reliable Transfer (RTSE), Remote Operations (ROSE), X.400 P1 Transfer (X411), X.400 Information Object [X420](/X420) and STANAG 4406 [S4406](/S4406) dissectors.

Contributor: Graeme Lunt

File: [x400-ping-refuse.pcap](uploads/__moin_import__/attachments/SampleCaptures/x400-ping-refuse.pcap) (2KB)\
Description: An X.400 bind attempt using RTS in normal mode generating an authentication error from the responder.

File: [x400-ping-success.pcap](uploads/__moin_import__/attachments/SampleCaptures/x400-ping-success.pcap) (2KB)\
Description: An X.400 bind attempt using RTS in normal mode with a bind result from the responder.

File: [p772-transfer-success.pcap](uploads/__moin_import__/attachments/SampleCaptures/p772-transfer-success.pcap) (4KB)\
Description: An X.400 bind attempt using RTS in normal mode with a bind result from the responder, and then the successful transfer of a P772 message.

### Direct Message Protocol

Contributor: Stig Bjorlykke

File: [dmp-examples.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/dmp-examples.pcap.gz) (667B)\
Description: Some example [DMP](/DMP) messages. Note that the examples uses port number 24209, which must be configured in the protocol page.

### STANAG 5066 SIS

These captures show a succeful and unsuccesful transfer of a simple line of text with STANAG 5066 Subnetwork Interface Sublayer (S5066_SIS).

Contributor: Menno Andriesse

File: [S5066-HFChat-1.pcap](uploads/__moin_import__/attachments/SampleCaptures/S5066-HFChat-1.pcap) (4KB)\
Description: A line of text is send and acknowledged

File: [S5066-HFChat-Rejected.pcap](uploads/__moin_import__/attachments/SampleCaptures/S5066-HFChat-Rejected.pcap) (2KB)\
Description: A line of text is send and rejected because the other node does not respond.

Contributor: Taner Kurtulus

File: [S5066-Expedited.pcap](uploads/__moin_import__/attachments/SampleCaptures/S5066-Expedited.pcap) (2KB)\
Description: A line of text is sent/received with Expedited S_Prims and confirmed

### STANAG 5066 DTS

These captures show a successful BFTP transfer over a hardlink between two peers.

Contributor: İbrahim Can Yüce

File: [Stanag5066-TCP-ENCAP-Bftp-Exchange-tx-rx.pcapng](uploads/__moin_import__/attachments/SampleCaptures/Stanag5066-TCP-ENCAP-Bftp-Exchange-tx-rx.pcapng)\
Description: BFTP file transfer exchange D_PDUs captured directly from the line.

File: [Stanag5066-RAW-ENCAP-Bftp-Exchange-tx.pcap](uploads/__moin_import__/attachments/SampleCaptures/Stanag5066-RAW-ENCAP-Bftp-Exchange-tx.pcap)\
Description: BFTP file transfer exchange D_PDUs encapsulated in TCP, then handed off to S5066 dissector.

### RTP Norm

These captures show samples of RTP NORM transfers.

Contributor: Julian Onions

File: [rtp-norm-transfer.pcap](uploads/__moin_import__/attachments/SampleCaptures/rtp-norm-transfer.pcap) (291.2 KB)\
Description: A norm file transfer over multicast (to one acking host).

File: [rtp-norm-stream.zip](uploads/__moin_import__/attachments/SampleCaptures/rtp-norm-stream.zip) (673.4 KB)\
Description: A portion of a NORM stream transfer.

### DCE/RPC and MSRPC-based protocols

Captures in this section show traffic related to various DCE/RPC-based and MSRPC-based interfaces.

File: [dcerpc-fault-stub-data-02.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/dcerpc-fault-stub-data-02.pcap.gz)\
Description: A DCERPC Fault pdu with extended error information (MS-EERR).

#### DSSETUP MSRPC interface

File: [dssetup_DsRoleGetPrimaryDomainInformation_standalone_workstation.cap](uploads/__moin_import__/attachments/SampleCaptures/dssetup_DsRoleGetPrimaryDomainInformation_standalone_workstation.cap) (1.0 KB)\
Description: [DsRoleGetPrimaryDomainInformation](/DsRoleGetPrimaryDomainInformation) operation (DSSETUP) against a standalone workstation.

File: [dssetup_DsRoleGetPrimaryDomainInformation_ad_member.cap](uploads/__moin_import__/attachments/SampleCaptures/dssetup_DsRoleGetPrimaryDomainInformation_ad_member.cap) (1.5 KB)\
Description: [DsRoleGetPrimaryDomainInformation](/DsRoleGetPrimaryDomainInformation) operation (DSSETUP) against an Active Directory domain member workstation.

File: [dssetup_DsRoleGetPrimaryDomainInformation_ad_dc.cap](uploads/__moin_import__/attachments/SampleCaptures/dssetup_DsRoleGetPrimaryDomainInformation_ad_dc.cap) (1.0 KB)\
Description: [DsRoleGetPrimaryDomainInformation](/DsRoleGetPrimaryDomainInformation) operation (DSSETUP) against an Active Directory DC.

File: [dssetup_DsRoleDnsNameToFlatName_w2k3_op_rng_error.cap](uploads/__moin_import__/attachments/SampleCaptures/dssetup_DsRoleDnsNameToFlatName_w2k3_op_rng_error.cap) (1.0 KB)\
Description: In Windows Server 2003, there is only one operation ([DsRoleGetPrimaryDomainInformation](/DsRoleGetPrimaryDomainInformation)) in the DSSETUP interface. This capture shows that the [DsRoleDnsNameToFlatName](/DsRoleDnsNameToFlatName) is not supported in Windows Server 2003.

File: [dssetup_DsRoleDnsNameToFlatName_w2k.cap](uploads/__moin_import__/attachments/SampleCaptures/dssetup_DsRoleDnsNameToFlatName_w2k.cap) (1.0 KB)\
Description: [DsRoleDnsNameToFlatName](/DsRoleDnsNameToFlatName) operation against a Windows 2000 system without MS04-011 applied

File: [dssetup_DsRoleUpgradeDownlevelServer_MS04-011_exploit.cap](uploads/__moin_import__/attachments/SampleCaptures/dssetup_DsRoleUpgradeDownlevelServer_MS04-011_exploit.cap) (5.0 KB)\
Description: traffic of an exploit for the security vulnerabillity exploitable using the [DsRoleUpgradeDownlevelServer](/DsRoleUpgradeDownlevelServer) operation (Windows 2000 and Windows XP systems without MS04-011 applied)

#### NSPI MSRPC Interface

File [nspi.pcap](uploads/__moin_import__/attachments/SampleCaptures/nspi.pcap) (7.2 KB)\
Description: MAPI Profile creation between Microsoft Exchange 2003 and the mail applet in the configuration panel (Windows 2003 Server and Windows XP Professional) Name Service Provider Interface is a MAPI:ROP MSRPC protocol.

#### ROP MSRPC Interface

File [ShortMAPI.pcapng](uploads/53dc45c557cf877642381b8e9b964671/ShortMAPI.pcapng) Description: This is a short (failed) MAPI conversation, showing connect, ROP, and disconnect. The conversation fails because of an authentication/encryption mismatch. (Windows 2003 SBS Server and Outlook 2003 on Win10)

File [mapi.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/mapi.cap.gz) (libpcap) MAPI session w/ Outlook and MSX server, not currently decoded by Wireshark.

#### WINREG Interface

File [dcerpc-winreg-with-rpc-sec-verification-trailer.pcap](uploads/__moin_import__/attachments/SampleCaptures/dcerpc-winreg-with-rpc-sec-verification-trailer.pcap)\
Description: smbtorture in Samba's make test. Frame 34 contains a rpc_sec_verification_trailer.

#### WITNESS Interface

File [dcerpc_witness.pcapng](uploads/__moin_import__/attachments/SampleCaptures/dcerpc_witness.pcapng)\
Description: Sample Witness traffic

#### MS-TSCH Interface

Create two scheduled tasks with the `SchRpcRegisterTask` method, then listing all the tasks using the `SchRpcEnumTasks` methods. Trafic is in cleartext. See equivalent files with encrypted trafic [#ntlmssp](below)

[create_two_tasks_then_enum_RPC_C_AUTHN_LEVEL_CONNECT_NTLMv2.pcapng](uploads/40d16f2106f8f5bd3e2b7bb19547f43e/create_two_tasks_then_enum_RPC_C_AUTHN_LEVEL_CONNECT_NTLMv2.pcapng)

### IPsec

#### Example 1: [ESP](/ESP) Payload Decryption and Authentication Checking Examples

Archive: [ipsec_esp.tgz](uploads/21afad41e961b83b9e74cf1fd500a9be/ipsec_esp.tgz)

Some examples for ESP payload decryption and authentication checking from 2006. The four archives have been joined and the SAs have been converted from the Ethereal preferences format into an `esp_sa` uat file. Other from that, the examples are unchanged.

Contents:

* ipsec_esp_capture_1: ESP payload decryption and authentication checking for simple transport mode in v4/v6.
* ipsec_esp_capture_2: ESP payload decryption and authentication checking for tunnel mode in v4.
* ipsec_esp_capture_3: ESP payload decryption with authentication checking for some more encryption algorithms not defined in RFC4305.
* ipsec_esp_capture_5: Authentication checking and decryption using binary keys specified as hexadecimal values

Contributors: Frederic Roudaut (2006), Matthias St. Pierre (2021)

#### Example 2: Dissection of encrypted (and UDP-encapsulated) [IKEv2](/IKEv2) and [ESP](/ESP) messages

Archive: [ipsec_ikev2+esp_aes-gcm_aes-ctr_aes-cbc.tgz](uploads/dc5b30a117424e6ed21c726771a4006b/ipsec_ikev2+esp_aes-gcm_aes-ctr_aes-cbc.tgz)

A VPN client (192.168.245.131) behind a NAT device connects three times to a VPN gateway (172.16.15.92) using IKEv2, the user sends some pings through the VPN tunnel (192.168.225.0/24) to the gateway (192.168.225.1), which are returned successfully, and disconnects. The three connections differ by the AES operation modes (AES-GCM, AES-CTR, and AES-CBC, in that order) used for encrypting the IKE_AUTH and ESP messages:

| Nr | Encryption | Authentication |
|----|------------|----------------|
| 1 | AES-GCM with 16 octet ICV \[RFC4106\] | NULL |
| 2 | AES-CTR \[RFC3686\] | HMAC-SHA-256-128 \[RFC4868\] |
| 3 | AES-CBC \[RFC3602\] | HMAC-SHA-256-128 \[RFC4868\] |

The entire conversation (IKE+ESP) is sent UDP-encapsulated on port 4500.

Contents:

* capture.pcap: packet capture file
* esp_sa: decryption table for the ESP SAs (requires [Merge Request !3444](https://gitlab.com/wireshark/wireshark/-/merge_requests/3444 "ipsec: refactor the decryption and dissection of ESP packets"))
* esp_sa.no_icv decryption table for the ESP SAs (without AES-GCM ICV length; for current releases of Wireshark)
* ikev2_decryption_table: decryption table for the IKEv2 SAs

Contributor: Matthias St. Pierre

### Pro-MPEG FEC - Professional video FEC data over RTP

See protocol description, [2dParityFEC](/2dParityFEC) for details.\
File: [2dParityFEC-Example.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/2dParityFEC-Example.cap.gz)\
Description: Example of row and column FEC data mixed with MPEG2 transport stream data in standard [RTP](/RTP) packets.

### SSL with decryption keys

File: [snakeoil2_070531.tgz](uploads/__moin_import__/attachments/SampleCaptures/snakeoil2_070531.tgz)\
Description: Example of [SSL](/SSL) encrypted HTTPS traffic and the key to decrypt it. (example taken from the dev mailinglist)

Files: [dump.pcapng](https://bugs.wireshark.org/bugzilla/attachment.cgi?id=11612), [premaster.txt](https://bugs.wireshark.org/bugzilla/attachment.cgi?id=11616)\
Description: Capture and related keylog file of a openssl's s_client/s_server HTTP GET request over TLSv1.2 with 73 different cipher suites (generated using [openssl-connect](https://git.lekensteyn.nl/peter/wireshark-notes/tree/openssl-connect) for [Bug 9144 - Update TLS ciphers](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9144))

File: [mysql-ssl.pcapng](uploads/__moin_import__/attachments/SampleCaptures/mysql-ssl.pcapng) (11 KB, from https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/mysql-ssl.pcapng?id=8cfd2f667e796e4c0e3bdbe117e515206346f74a, SSL keys in capture file comments)

File: [mysql-ssl-larger.pcapng](uploads/__moin_import__/attachments/SampleCaptures/mysql-ssl-larger.pcapng) (`show variables` response in two TLS records and multiple TCP segments) (22 KB, from https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/mysql-ssl-larger.pcapng?id=818f97811ee7d9b4c5b2d0d14f8044e88787bc01, SSL keys in capture file comments)

File: [smtp-ssl.pcapng](uploads/__moin_import__/attachments/SampleCaptures/smtp-ssl.pcapng) (8.8 KB, from https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/smtp-ssl.pcapng?id=9615a132638741baa2cf839277128a32e4fc34f2, SSL keys in capture file comments)

File: [smtp2525-ssl.pcapng](uploads/__moin_import__/attachments/SampleCaptures/smtp2525-ssl.pcapng) (SMTP over non-standard port 2525) (8.8 KB, from https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/smtp2525-ssl.pcapng?id=d448482c095363191ff5b5b312fa8f653e482425, SSL keys in capture file comments)

File: [xmpp-ssl.pcapng](uploads/__moin_import__/attachments/SampleCaptures/xmpp-ssl.pcapng) (15 KB, from https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/xmpp-ssl.pcapng?id=fa979120b060be708e3e752e559e5878524be133, SSL keys in capture file comments)

File: [pop-ssl.pcapng](uploads/__moin_import__/attachments/SampleCaptures/pop-ssl.pcapng) (POP3) (9.2 KB, from https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/pop-ssl.pcapng?id=860c55ba8449a877e21480017e16cfae902b69fb, SSL keys in capture file comments)

File: [imap-ssl.pcapng](uploads/__moin_import__/attachments/SampleCaptures/imap-ssl.pcapng) (10 KB, from https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/imap-ssl.pcapng?id=1123e936365c89d43e9f210872778d81223af36d, SSL keys in capture file comments)

File: [pgsql-ssl.pcapng](uploads/__moin_import__/attachments/SampleCaptures/pgsql-ssl.pcapng) (7.7 KB, from https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/pgsql-ssl.pcapng?id=836b6f746df24aa04fa29b71806d8d0e496c2a68, SSL keys in capture file comments)

File: [ldap-ssl.pcapng](uploads/__moin_import__/attachments/SampleCaptures/ldap-ssl.pcapng) (8.3 KB, from https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/ldap-ssl.pcapng?id=d931120107e7429a689a8350d5e49c1f1147316f, SSL keys in capture file comments)

File: [http2-16-ssl.pcapng](uploads/__moin_import__/attachments/SampleCaptures/http2-16-ssl.pcapng) (HTTP2 with ALPN h2-16 extension) (5.1 KB, from https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/http2-16-ssl.pcapng?id=a24c03ce96e383faf2a624bfabd5cc843e78ab2a, SSL keys in capture file comments)

File: [amqps.pcapng](uploads/__moin_import__/attachments/SampleCaptures/amqps.pcapng) (AMQP using RabbitMQ server and Celery client) (5.1 KB, from https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/amqps.pcapng?id=3c00336b07f1fec0fb13af3c7d502d51fab732b7, SSL keys in capture file comments)

The `*-ssl.pcapng` capture files above can be found at https://git.lekensteyn.nl/peter/wireshark-notes/tree/tls/ with the pre-master key secrets being available in the capture file comments. See the commit log for further details. The keys have been extracted from the OpenSSL library using a LD_PRELOAD interposing library, libsslkeylog.so ([sslkeylog.c](https://git.lekensteyn.nl/peter/wireshark-notes/tree/src/sslkeylog.c)).

For TLS 1.3 captures and keys, see [Bug 12779](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=12779). For example, Chromium 61 (TLS 1.3 draft -18) connecting to enabled.tls13.com using HTTP/2 can be found in [this comment](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=12779#attach_15867).

### MCPE/RakNet

File: [MCPE-0.15.pcapng](uploads/__moin_import__/attachments/SampleCaptures/MCPE-0.15.pcapng)\
Description: Example of [Minecraft Pocket Edition](http://wiki.vg/Pocket_Edition_Protocol_Documentation) 0.15.x on [RakNet](http://www.raknet.com/) protocol.

### NDMP

File: [ndmp.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/ndmp.pcap.gz)\
Description: Example of NDMP connection using MD5 method. Capture shows some additonal NDMP traffic not recognized by wireshark (ndmfs extension).

### Kismet Client/Server protocol

File: [kismet-client-server-dump-1.pcap](uploads/__moin_import__/attachments/SampleCaptures/kismet-client-server-dump-1.pcap)\
Description: Example traffic beetwen Kismet GUI and Kismet Sever (begining of kismet session).

File: [kismet-client-server-dump-2.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/kismet-client-server-dump-2.pcap.gz)\
Description: Example traffic beetwen Kismet GUI and Kismet Sever (after new wireless network has been detected).

### Kismet Drone/Server protocol

File: [kdsp.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/kdsp.pcap.gz)\
Description: Example traffic between Kismet drone and Kismet sever. See [KDSP](/KDSP)

### DTLS with decryption keys

File: [snakeoil.tgz](uploads/__moin_import__/attachments/SampleCaptures/snakeoil.tgz)\
Description: Example of [DTLS](/DTLS) simple encrypted traffic and the key to decrypt it. (Simple example made with OpenSSLv0.9.8b)

### DTLS JPAKE as used in ThreadGroup Commissioning

File: [ThreadCommissioning-JPAKE-DTLS-1.pcapng](uploads/__moin_import__/attachments/SampleCaptures/ThreadCommissioning-JPAKE-DTLS-1.pcapng)\
Description: Example 1 of [DTLS-JPAKE](/DTLS-JPAKE) traffic. (Thread reference application (DTLS client) against mbedTLS server)

File: [ThreadCommissioning-JPAKE-DTLS-2.pcapng](uploads/__moin_import__/attachments/SampleCaptures/ThreadCommissioning-JPAKE-DTLS-2.pcapng)\
Description: Example 2 of [DTLS-JPAKE](/DTLS-JPAKE) traffic. (Thread reference application (DTLS client) against mbedTLS server)

File: [ThreadCommissioning-JPAKE-DTLS-NSS](uploads/__moin_import__/attachments/SampleCaptures/ThreadCommissioning-JPAKE-DTLS-NSS)\
Description: NSS file for decryption of the two example files.

### ETHERNET Powerlink v1

File: [epl_v1.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/epl_v1.cap.gz)\
Description: Example traffic of [EPL V1](/EPL-V1). Capture shows the traffic of an EPLv1 [ManagingNode](/ManagingNode) and three [ControlledNodes](/ControlledNodes).

### ETHERNET Powerlink v2

File: [epl.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/epl.cap.gz)\
Description: Example traffic of [EPL](/EPL). Capture shows the boot up of an EPLv2 [ManagingNode](/ManagingNode) and one [ControlledNode](/ControlledNode).

File: [epl_sdo_udp.cap](uploads/__moin_import__/attachments/SampleCaptures/epl_sdo_udp.cap)\
Description: Example traffic of [EPL](/EPL). Capture shows an access to the object dictionary of a [ControlledNode](/ControlledNode) within an EPL-Network from outside via [ServiceDataObject](/ServiceDataObject) (SDO) by UDP.

### Architecture for Control Networks (ACN)

File: [acn_capture_example_1.cap](uploads/__moin_import__/attachments/SampleCaptures/acn_capture_example_1.cap)\
Description: Example traffic of [ACN](/ACN). Capture shows just a few examples.

### Intellon Homeplug (INT51X1)

File: [homeplug_request_channel_estimation.pcap](uploads/__moin_import__/attachments/SampleCaptures/homeplug_request_channel_estimation.pcap)\
Description: Example traffic of [Homeplug](/Homeplug). Capture of Request Channel Estimation (RCE) frame. File: [homeplug_request_parameters_and_statistics.pcap](uploads/__moin_import__/attachments/SampleCaptures/homeplug_request_parameters_and_statistics.pcap)\
Description: Example traffic of [Homeplug](/Homeplug). Capture of Request Parameters and Statistics (RPS) frame. File: [homeplug_network_statistics_basic.pcap](uploads/__moin_import__/attachments/SampleCaptures/homeplug_network_statistics_basic.pcap)\
Description: Example traffic of [Homeplug](/Homeplug). Capture of Network Statistics basic (NS) frame.

### Wifi / Wireless LAN captures / 802.11

File: [Network_Join_Nokia_Mobile.pcap](uploads/__moin_import__/attachments/SampleCaptures/Network_Join_Nokia_Mobile.pcap)\
Description: 802.11 capture of a new client joining the network, authenticating and activating WPA ciphering

File: [wpa-Induction.pcap](uploads/__moin_import__/attachments/SampleCaptures/wpa-Induction.pcap)\
Description: 802.11 capture with WPA data encrypted using the password "Induction".

File: [wpa-eap-tls.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/wpa-eap-tls.pcap.gz)\
Description: 802.11 capture with WPA-EAP. PSK's to decode: a5001e18e0b3f792278825bc3abff72d7021d7c157b600470ef730e2490835d4 79258f6ceeecedd3482b92deaabdb675f09bcb4003ef5074f5ddb10a94ebe00a 23a9ee58c7810546ae3e7509fda9f97435778d689e53a54891c56d02f18ca162

File: [http_PPI.cap](uploads/e8cebabd278b76e3bc9edbd484c4d293/http_PPI.cap)\
Description: 802.11n capture with PPI encapsulation containing HTTP data.

File: [mesh.pcap](uploads/__moin_import__/attachments/SampleCaptures/mesh.pcap)\
Description: 802.11s capture with Radiotap encapsulation.

File:[wpa2linkuppassphraseiswireshark](uploads/0ad8934c433f71607d8dc9c3b7a14718/wpa2linkuppassphraseiswireshark.pcap)\
Description: Typical WPA2 PSK linked up process (SSID is ikeriri-5g and passphrase is wireshark so you may input wireshark:ikeriri-5g choosing wpa-pwd in decryption key settings in IEEE802.11 wireless LAN settings)

### TrunkPack Network Control Protocol (TPNCP)

File: [tpncp_udp.pcap](uploads/__moin_import__/attachments/SampleCaptures/tpncp_udp.pcap)\
Description: Example traffic of [TPNCP](/TPNCP) over [UDP](/UDP).

File: [tpncp_tcp.pcap](uploads/__moin_import__/attachments/SampleCaptures/tpncp_tcp.pcap)\
Description: Example traffic of [TPNCP](/TPNCP) over [TCP](/TCP).

### EtherCAT

File: [ethercat.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/ethercat.cap.gz)\
Description: Example traffic of [Ethercat](/Ethercat). Capture shows the boot up of an network with Beckhoff 1100, 1014, 2004, 3102 and 4132 modules.

### iWARP Protocol Suite

These captures show MPA/DDP/RDMAP communication.

Contributor: Philip Frey

File: [iwarp_connect.tar.gz](uploads/__moin_import__/attachments/SampleCaptures/iwarp_connect.tar.gz) (1.4KB)\
Description: MPA connection setup without data exchange.

File: [iwarp_send_recv.tar.gz](uploads/__moin_import__/attachments/SampleCaptures/iwarp_send_recv.tar.gz) (1.9KB)\
Description: MPA connection setup followed by RDMA Send/Receive data exchange.

File: [iwarp_rdma.tar.gz](uploads/__moin_import__/attachments/SampleCaptures/iwarp_rdma.tar.gz) (7KB)\
Description: MPA connection setup followed by RDMA Write/Read data exchange.

### IPv6 (and tunneling mechanism)

File: [Teredo.pcap](uploads/__moin_import__/attachments/SampleCaptures/Teredo.pcap)\
Description: Example of [IPv6](/IPv6) traffic using Teredo for encapsulation.

File: [6to4.pcap](uploads/__moin_import__/attachments/SampleCaptures/6to4.pcap)\
Description: Example of [IPv6](/IPv6) traffic using 6to4 for encapsulation.

File: [6in4.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/6in4.pcap.gz)\
Description: Example of [IPv6](/IPv6) traffic using 6in4 for encapsulation.

File: [6LoWPAN.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/6LoWPAN.pcap.gz)\
Description: [IPv6](/IPv6) over IEEE 802.15.4.

File: [6lowpan-rfrag-icmpv6.pcapng](uploads/__moin_import__/attachments/SampleCaptures/6lowpan-rfrag-icmpv6.pcapng)\
Description: Example of [6LoWPAN Selective Fragment Recovery (RFRAG)](https://tools.ietf.org/html/draft-ietf-6lo-fragment-recovery-02) packets. Payload is ICMPv6 echo request in 6LoWPAN RFRAGs.

File: [sr-header.pcap](uploads/__moin_import__/attachments/SampleCaptures/sr-header.pcap)\
Description: [IPv6](/IPv6) Segment Routing header.

### TTEthernet (TTE)

File: [TTE_mix_small.pcap](uploads/__moin_import__/attachments/SampleCaptures/TTE_mix_small.pcap)\
Description: Example of [TTEthernet](/TTEthernet) traffic showing different traffic classes.

### GSM

File: [abis-accept-network.pcap](uploads/__moin_import__/attachments/SampleCaptures/abis-accept-network.pcap)\
Description: Abis: Setup + Location Updating Request + Accept + SMS. Note: Set "Use GSM SAPI Values" in LAPD preferences.

File: [abis-reject-network.pcap](uploads/__moin_import__/attachments/SampleCaptures/abis-reject-network.pcap)\
Description: Abis: Setup + Location Updating Request + Reject. Note: Set "Use GSM SAPI Values" in LAPD preferences.

File: [gsm_call_1525.xml](uploads/__moin_import__/attachments/SampleCaptures/gsm_call_1525.xml)\
Description: Um: Mobile phone called the number 1525 and stayed connected for 2-3 seconds.

File: [gsm_sms2.xml](uploads/__moin_import__/attachments/SampleCaptures/gsm_sms2.xml)\
Description: Um: SMS containing "abc"

File: [gsm-r.uus1.pcap](uploads/__moin_import__/attachments/SampleCaptures/gsm-r.uus1.pcap)\
Description: GSM-R specific messages in the user-user signalling

### UMTS

#### IuB interface

File: [UMTS_FP_MAC_RLC_RRC_NBAP.pcap](uploads/__moin_import__/attachments/SampleCaptures/UMTS_FP_MAC_RLC_RRC_NBAP.pcap)\
Description: IuB: Mobile Originating Video Call Signaling and traffic. Contains all common IuB protocols: NBAP, FP, MAC, RLC, RRC

#### Iu-CS over IP interface(MoC)

File: [Mobile Originating Call(AMR).pcap](uploads/__moin_import__/attachments/SampleCaptures/Mobile-Originating-Call(AMR).pcap)\
Description: Iu-CS: Mobile Originating Call Signaling and Bearer in IP network AMR(12.2).

#### Iu-CS over IP interface(MtC)

File: [Mobile Terminating Call(AMR).pcap](uploads/__moin_import__/attachments/SampleCaptures/Mobile-Terminating-Call(AMR).pcap)\
Description: Iu-CS: Mobile Terminating Call Signaling and Bearer in IP network AMR(12.2)

### X11

File: [x11-gtk.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/x11-gtk.pcap.gz) A GTK app opening only an error dialog. Exercises a surprising portion of the RENDER extension.

File: [x11-shape.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/x11-shape.pcap.gz) vtwm, xcalc, and xeyes. Multiple SHAPE extension requests and one [ShapeNotify](/ShapeNotify) event.

File: [x11-composite.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/x11-composite.pcap.gz) vtwm, 2x xlogo, and xcompmgr. Exercises parts of Composte, Damage, and XFixes extensions.

File: [x11-glx.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/x11-glx.pcap.gz) A couple of frames of glxgears, to demonstrate GLX/glRender dissection.

File: [x11-xtest.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/x11-xtest.pcap.gz) An xtest test run, uses the XTEST extension.

File: [x11-res.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/x11-res.pcap.gz) xlogo and one iteration of xrestop, to demonstrate the X-Resource extension.

File: [x11-xinput.pcapng.gz](uploads/__moin_import__/attachments/SampleCaptures/x11-xinput.pcapng.gz)`xinput list`, to demonstrate the XInputExtension extension.

### Gopher

File: [gopher.pcap](uploads/__moin_import__/attachments/SampleCaptures/gopher.pcap) A capture of the Gopher protocol (a gopher browser retrieving few files and directories).

### InfiniBand

File [infiniband.pcap](uploads/__moin_import__/attachments/SampleCaptures/infiniband.pcap) (8.7KB)\
Description A libpcap trace file of low level [InfiniBand](/InfiniBand) frames in DLT_ERF format.

### Network News Transfer Protocol (NNTP)

File: [nntp.pcap](uploads/__moin_import__/attachments/SampleCaptures/nntp.pcap) A capture of the NNTP protocol (a KNode client retrieving few messages from two groups on a Leafnode server).

### FastCGI (FCGI)

File: [fcgi.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/fcgi.pcap.gz) A capture of the FCGI protocol (a single HTTP request being processed by an FCGI application).

### Lontalk (EIA-709.1) encapsulated in EIA-852

File: [eia709.1-over-eia852.pcap](uploads/__moin_import__/attachments/SampleCaptures/eia709.1-over-eia852.pcap) A capture of the Lontalk homeautomation protocol. Lots of button presses, temperature sensors, etc.

### DVB-CI (Common Interface)

File: [dvb-ci_1.pcap](uploads/__moin_import__/attachments/SampleCaptures/dvb-ci_1.pcap)

A DVB-CI module is plugged into a receiver and initialized. The receiver asks the module to descramble a Pay-TV service. After a moment, there’s a service change and another request to descramble the newly selected service. After some seconds, the module is removed from the receiver.

File: [dvb-ci_2.pcap](uploads/__moin_import__/attachments/SampleCaptures/dvb-ci_2.pcap)

Communication between a DVB-CI host and module where the maximum message size on the link layer is 16 bytes. Larger messages from upper layers must be fragmented and reassembled.

### ANSI C12.22 (c1222)

File: [c1222overIPv4.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/c1222overIPv4.cap.gz) ([ANSI C12.22](/C12.22)) C12.22 read of Standard Table 1 with response. This communication was using _Ciphertext with Authenticaton_ mode with key 0 = 6624C7E23034E4036FE5CB3A8B5DAB44

File: [c1222_over_ipv6.pcap](uploads/__moin_import__/attachments/SampleCaptures/c1222_over_ipv6.pcap) ([ANSI C12.22](/C12.22)) C12.22 read of Standard Tables 1 and 2 with response. This communication was using _Ciphertext with Authenticaton_ mode with key 0 = 000102030405060708090A0B0C0D0E0F

### HDCP

File: [hdcp_authentication_sample.pcap](uploads/__moin_import__/attachments/SampleCaptures/hdcp_authentication_sample.pcap)

HDCP authentication between a DVB receiver and a handheld device

### openSAFETY

File: [opensafety_udp_trace.pcap](uploads/__moin_import__/attachments/SampleCaptures/opensafety_udp_trace.pcap) openSAFETY communication using UDP as transport protocol

File: [opensafety_epl_trace.pcap](uploads/__moin_import__/attachments/SampleCaptures/opensafety_epl_trace.pcap) openSAFETY communication using Ethernet Powerlink V2 as transport protocol

File: [opensafety_sercosiii_trace.pcap](uploads/__moin_import__/attachments/SampleCaptures/opensafety_sercosiii_trace.pcap) openSAFETY communication using SercosIII as transport protocol

### Radio Frequency Identification (RFID), and Near-Field Communication (NFC)

File: [Read-FeliCa-Lite-NDEF-Tags.cap](uploads/__moin_import__/attachments/SampleCaptures/Read-FeliCa-Lite-NDEF-Tags.cap) A trace file from a USB-connected NFC transceiver based upon the NXP PN532 chipset, containing packets from a successful attempt at enumerating, and reading the contents of two Sony [FeliCa](/FeliCa) Lite tags.

### IEC 60870-5-104

File: [iec104.pcap](uploads/__moin_import__/attachments/SampleCaptures/iec104.pcap) IEC 60870-5-104 communication log.

File: [IEC104_SQ.pcapng](uploads/__moin_import__/attachments/SampleCaptures/IEC104_SQ.pcapng) IEC 60870-5-104 communication log with SQ bit.

### SISO-STD-002

Simulation Interoperability Standards Organization SISO-STD-002 Standard for Link 16 Simulation

File: [siso_std_002_annex_b_example.pcap](uploads/__moin_import__/attachments/SampleCaptures/siso_std_002_annex_b_example.pcap) .

File: [siso_std_002_transmitter.pcap](uploads/__moin_import__/attachments/SampleCaptures/siso_std_002_transmitter.pcap).

Standard: http://www.sisostds.org/ProductsPublications/Standards/SISOStandards.aspx

### STANAG-5602 SIMPLE

Standard Interface for Multiple Platform Evaluation

File: [stanag-5602-simple-example.pcap](uploads/__moin_import__/attachments/SampleCaptures/stanag-5602-simple-example.pcap) .

Standard: http://assistdoc1.dla.mil/qsDocDetails.aspx?ident_number=213042

### S7COMM - S7 Communication

[s7comm_downloading_block_db1.pcap](uploads/__moin_import__/attachments/SampleCaptures/s7comm_downloading_block_db1.pcap) s7comm: Connecting and downloading program block DB1 into PLC

[s7comm_program_blocklist_onlineview.pcap](uploads/__moin_import__/attachments/SampleCaptures/s7comm_program_blocklist_onlineview.pcap) s7comm: Connecting and getting a list of all available blocks in the S7-300 PLC

[s7comm_reading_plc_status.pcap](uploads/__moin_import__/attachments/SampleCaptures/s7comm_reading_plc_status.pcap) s7comm: Connecting and viewing the S7-300 PLC status

[s7comm_reading_setting_plc_time.pcap](uploads/__moin_import__/attachments/SampleCaptures/s7comm_reading_setting_plc_time.pcap) s7comm: Connecting, reading and setting the time of the S7-300 PLC

[s7comm_varservice_libnodavedemo.pcap](uploads/__moin_import__/attachments/SampleCaptures/s7comm_varservice_libnodavedemo.pcap) s7comm: running libnodave demo with a S7-300 PLC, using variable-services reading several different areas and sizes

[s7comm_varservice_libnodavedemo_bench.pcap](uploads/__moin_import__/attachments/SampleCaptures/s7comm_varservice_libnodavedemo_bench.pcap) s7comm: running libnodave demo benchmark with S7-300 PLC using variable-services to check the communication capabilities

### Harman Pro HiQnet

[hiqnet_netsetter-soundcraft_session.pcapng.gz](uploads/__moin_import__/attachments/SampleCaptures/hiqnet_netsetter-soundcraft_session.pcapng.gz) hiqnet: A session between Harman [NetSetter](/NetSetter) desktop application and a Soundcraft Si Compact 16 digital mixing console reading and writing very basic informations.

[hiqnet_visiremote-soundcraft_session.pcapng.gz](uploads/__moin_import__/attachments/SampleCaptures/hiqnet_visiremote-soundcraft_session.pcapng.gz) hiqnet: A session between Soundcraft's [ViSiRemote](/ViSiRemote) iPad application and a Soundcraft Si Compact 16 digital mixing console playing around with different values. The VU-meters stream is not part of this capture because it uses another protocol (UDP on port 3333).

### DJI Drones control Protocol

[djiuav.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/djiuav.pcap.gz) DJI drone getting managed and sending video stream.

### HCrt (Hotline Command-response Transaction) Protocol

[hcrt.pcap](uploads/__moin_import__/attachments/SampleCaptures/hcrt.pcap) Some captures of the HCRT protocol. Specifications of the protocol can be found here: https://github.com/ShepardSiegel/hotline/tree/master/doc.

### DOF (Distributed Object Framework) Protocols

[tunnel.pcap](uploads/__moin_import__/attachments/SampleCaptures/tunnel.pcap) Contains a DOF session which exercises many aspects of the protocol, best viewed with display filter "dof"

Most of the packets in this capture are encrypted, to view them:

1. Open Edit/Preferences.
2. Expand Protocols, select DOF.
3. Click “Edit…” on DPS Identity Secrets.
4. Click “New”.
5. In Domain, add ‘\[{03}:james.simister@us.panasonic.com\]’ without the quotes.
6. In Identity, add ‘\[{03}:dt@pan9320.pslcl.com\]’.
7. In Secret, add ‘2BCFE378663EBF2B5C4D8F971175B4767984CC2544EA969FB37799C777CF4C8F’ without the quotes.
8. Click OK on all the dialogs.

[dof-small-device.pcapng](uploads/__moin_import__/attachments/SampleCaptures/dof-small-device.pcapng) Example of a small device communicating with a server.

[dof-short-capture.pcapng](uploads/__moin_import__/attachments/SampleCaptures/dof-short-capture.pcapng) Larger example of two nodes communicating.

Both of these captures create secure sessions, but the keys are not provided.

Information on the DOF protocols can be found at https://opendof.org. Full protocol specifications are available on the downloads page.

### CBOR (Concise Binary Object Representation)

[coap-cbor.pcap](uploads/__moin_import__/attachments/SampleCaptures/coap-cbor.pcap) The CBOR test vectors over CoAP defined here: https://github.com/cbor/test-vectors/

### RADIUS (RFC 2865)

File: [radius_localhost.pcapng](uploads/__moin_import__/attachments/SampleCaptures/radius_localhost.pcapng)

This file contains RADIUS packets sent from localhost to localhost, using [FreeRADIUS Server](http://freeradius.org/) and the radtest utility.

Description of packets: | Frame | Description | shared secret | | on server | on client | | 1-4 | user steve authenticating with EAP-MD5, password bad (Access rejected) | testing123 | | 5-8 | user steve authenticating with EAP-MD5, password testing (Access Accepted) | testing123 | | 9-10 | same user, same password, PAP (Access Accepted) | testing123 | | 11-12 | same user/password, CHAP (Access Accepted) | testing123 | | 13-14 | same user, password bad_passsword, PAP (Access Rejected) | testing123 | | 15-17 | The client has a wrong shared secret, the server does not answer | bad_secret | testing123 | | 18-19 | Authentication successfull with PAP | bad_secret |

### Distributed Interactive Simulation (IEEE 1278)

Distributed Interactive Simulation (DIS) is described [here](https://en.wikipedia.org/wiki/Distributed_Interactive_Simulation).

Capture files:

* [DIS_EntityState_1.pcapng](uploads/__moin_import__/attachments/SampleCaptures/DIS_EntityState_1.pcapng) - Basic [EntityState](/EntityState) PDUs capture
* [DIS_EntityState_2.pcapng](uploads/__moin_import__/attachments/SampleCaptures/DIS_EntityState_2.pcapng) - Another basic [EntityState](/EntityState) PDUs capture
* [DIS_EnvironmentalProcess.pcapng](uploads/__moin_import__/attachments/SampleCaptures/DIS_EnvironmentalProcess.pcapng) - EnvironmentalProcessPDU capture
* [DIS_Signal.pcapng](uploads/__moin_import__/attachments/SampleCaptures/DIS_Signal.pcapng) - Signal PDUs capture
* [DIS_signal_and_transmitter.pcapng](uploads/__moin_import__/attachments/SampleCaptures/DIS_signal_and_transmitter.pcapng) - Signal and Transmitter PDUs capture

### Financial Information eXchange (FIX)

Capture files generated using the "f8test" program from the open-source FIX protocol implementation [Fix8](http://www.fix8.org/) (version 1.3.4).

* [fix.pcap](uploads/__moin_import__/attachments/SampleCaptures/fix.pcap)
* [fix-ssl.pcap](uploads/__moin_import__/attachments/SampleCaptures/fix-ssl.pcap)

The SSL keylog file for `fix-ssl.pcap` should contain:\
CLIENT_RANDOM 330221F6F09769F5F0E128551DF5C75F18464BEFB88B9CFE77FB83EFEEE4A6B5 3494FD0D729C23E590F8F7F9B150D534E5F225AA60873E91719A289D8BB92A9CDB482185213F11BB105C7C634A32BCEF

### UserLog

userlog is user flow logs of H3C device.

Flow logging records users’ access to the extranet. The device classifies and calculates flows through the 5-tuple information, which includes source IP address, destination IP address, source port, destination port, and protocol number, and generates user flow logs. Flow logging records the 5-tuple information of the packets and number of the bytes received and sent. With flow logs, administrators can track and record accesses to the network, facilitating the availability and security of the network.

[UserLog.pcap](uploads/__moin_import__/attachments/SampleCaptures/UserLog.pcap)

### OpenFlow

[openflow_v1.3_messages.pcapng.gz](uploads/__moin_import__/attachments/SampleCaptures/openflow_v1.3_messages.pcapng.gz): A collection of [OpenFlow](/OpenFlow) v1.3 packets (taken from [bug 9283](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9283)).

### ISO 8583-1

[iso8583_messages.tar.gz](uploads/__moin_import__/attachments/SampleCaptures/iso8583_messages.tar.gz): A collection of ISO8583-1 packets (taken from [bug 12244](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=12244)).

### DNP3

[dnp3_read.pcap](uploads/__moin_import__/attachments/SampleCaptures/dnp3_read.pcap); [dnp3_select_operate.pcap](uploads/__moin_import__/attachments/SampleCaptures/dnp3_select_operate.pcap); [dnp3_write.pcap](uploads/__moin_import__/attachments/SampleCaptures/dnp3_write.pcap). Source: pcapr.net by bwilkerson.

### System Calls

[curl-packets+syscalls-2016-05-04.pcapng](uploads/__moin_import__/attachments/SampleCaptures/curl-packets-syscalls-2016-05-04.pcapng): Network traffic and system calls generated by running `curl` to download a file.

### Linux netlink

[netlink.pcap](uploads/__moin_import__/attachments/SampleCaptures/netlink.pcap): Linux netlink with rtnetlink (route) and Netfilter protocols, captured in a Ubuntu 14.04.4 QEMU VM. Also contains NFQUEUE traffic with some DNS queries.

[netlink-nflog.pcap](uploads/__moin_import__/attachments/SampleCaptures/netlink-nflog.pcap): Linux netlink embedding rtnetlink and NFLOG (Netfilter) protocols. The NFLOG packets contain HTTP and ICMP packets, using `nf-queue` program as listener.

[netlink-conntrack.pcap](uploads/__moin_import__/attachments/SampleCaptures/netlink-conntrack.pcap): Linux netlink, an HTTP request and DNS query with Netfilter (NFQUEUE and conntrack) packets. Used the `conntrack -E` command as listener.

[netlink-ipset.pcap](uploads/__moin_import__/attachments/SampleCaptures/netlink-ipset.pcap): Linux netlink-netfilter traffic while executing various ipset commands.

[nlmon-big.pcap](uploads/__moin_import__/attachments/SampleCaptures/nlmon-big.pcap): Linux netlink traffic captured on a MIPS (big-endian) device.

Related (NFLOG):

* [nflog.pcap](uploads/__moin_import__/attachments/SampleCaptures/nflog.pcap): another HTTP and ICMP trace captured with `tcpdump -i nflog:42` (NFLOG encapsulation, not netlink).
* [nflog-ebtables.pcapng](uploads/__moin_import__/attachments/SampleCaptures/nflog-ebtables.pcapng): NFLOG via ebtables (family `NFPROTO_BRIDGE`). Contains ARP, IPv4, IPv6, ICMP, ICMPv6, TCP.

### Oracle TNS / SQLnet / OCI / OPI

[TNS_Oracle1.pcap](uploads/__moin_import__/attachments/SampleCaptures/TNS_Oracle1.pcap) A sample of TNS traffic (dated Apr 2014).

[TNS_Oracle2.pcap](uploads/__moin_import__/attachments/SampleCaptures/TNS_Oracle2.pcap) A bunch of INSERT INTO's on an Oracle server (dated Apr 2009).

[TNS_Oracle3.pcap](uploads/__moin_import__/attachments/SampleCaptures/TNS_Oracle3.pcap) A bunch of SELECT FROM's on an Oracle server (dated Apr 2009).

[TNS_Oracle4.pcap](uploads/__moin_import__/attachments/SampleCaptures/TNS_Oracle4.pcap) Oracle server redirecting to an alternate port upon connection (dated Apr 2009).

[TNS_Oracle5.pcap](uploads/__moin_import__/attachments/SampleCaptures/TNS_Oracle5.pcap) Another sample of TNS traffic (dated Oct 2015).

[7_oracle10_2016.pcapng](uploads/__moin_import__/attachments/SampleCaptures/7_oracle10_2016.pcapng) Oracle 10 examples (dated Dec 2016)

[8_oracle11_2016.pcapng](uploads/__moin_import__/attachments/SampleCaptures/8_oracle11_2016.pcapng) Oracle 11 examples (dated Dec 2016)

[9_oracle12_2016.pcapng](uploads/__moin_import__/attachments/SampleCaptures/9_oracle12_2016.pcapng) Oracle 12 examples (dated Dec 2016)

[10_sqldeveloper10_2016.pcapng](uploads/__moin_import__/attachments/SampleCaptures/10_sqldeveloper10_2016.pcapng) Oracle 10 SQL Developer (dated Dec 2016)

[11_sqldeveloper11_2016.pcapng](uploads/__moin_import__/attachments/SampleCaptures/11_sqldeveloper11_2016.pcapng) Oracle 11 SQL Developer (dated Dec 2016)

[12_sqldeveloper12_2016.pcapng](uploads/__moin_import__/attachments/SampleCaptures/12_sqldeveloper12_2016.pcapng) Oracle 12 SQL Developer (dated Dec 2016)

[oracle12-example.pcapng](uploads/__moin_import__/attachments/SampleCaptures/oracle12-example.pcapng) Oracle 12 examples.

Special thanks to pcapr.net project.

### Lawo EmberPlus S101/Glow

[s101glow.pcap](uploads/__moin_import__/attachments/SampleCaptures/s101glow.pcap)

### HP ERM

[hp-erm-1.cap](uploads/__moin_import__/attachments/SampleCaptures/hp-erm-1.cap) Simple sample of 2 pings, one untagged on VLAN 10, one tagged on VLAN 2010 and the HP ERM results of the port of the device sending the ICMP Echo Request.

[hp-erm-2.cap](uploads/__moin_import__/attachments/SampleCaptures/hp-erm-2.cap) Complex sample of 2 pings, one untagged on VLAN 10, one tagged on VLAN 2010 and the HP ERM results of the port of the device sending the ICMP Echo Request, the port on the second switch connecting to the first (both VLANs tagged) and a double-encapsulated sample.

### Automotive Protocols

[udp-nm_anon.pcap](uploads/__moin_import__/attachments/SampleCaptures/udp-nm_anon.pcap) Simple UDP-NM packet.

[caneth.pcapng](uploads/__moin_import__/attachments/SampleCaptures/caneth.pcapng) Simple CAN-ETH protocol capture.

### Steam In-Home Streaming Protocol

Valve Software's Steam In-Home Streaming Protocol, which is used by the Steam client and Steam Link devices.

Further Information:

* https://codingrange.com/blog/steam-in-home-streaming-discovery-protocol
* https://codingrange.com/blog/steam-in-home-streaming-control-protocol

[steam-ihs-discovery.pcap](uploads/__moin_import__/attachments/SampleCaptures/steam-ihs-discovery.pcap) Server discovery and connection negotiation/authentication

### Wi-SUN low power RF Protocol

[wisunSimple.pcapng](uploads/__moin_import__/attachments/SampleCaptures/wisunSimple.pcapng) Two almost identical frames containing a PAN Advertisement Solicit. The first frame has an error (missing Header Termination 1) and the second has that error corrected. This was used to test a change in Wireshark intended to give a clearer warning message for exactly this error.

### Nano / RaiBlocks Cryptocurrency Protocol

[nano.pcap](uploads/__moin_import__/attachments/SampleCaptures/nano.pcap) Some traffic from the Nano live network, including all common packet and block types.

[nano_tcp.pcap](uploads/__moin_import__/attachments/SampleCaptures/nano_tcp.pcap) Example Nano bootstrap traffic (TCP).

### ua/udp, ua3g and noe protocols (Alcatel-Lucent Enterprise)

[uaudp_ipv6.pcap](uploads/__moin_import__/attachments/SampleCaptures/uaudp_ipv6.pcap) Some traffic over ipv6. Filter on fc0c::8 and decode frame #17 (udp port 32513) as ua/udp protocol. On capture where the source and destination ports are the same, add the call server ip address in the protocol preferences to allow the correct decoding.

[ua3g_freeseating_ipv6.pcap](uploads/__moin_import__/attachments/SampleCaptures/ua3g_freeseating_ipv6.pcap) Freeseating message: ipv6 addresses (filter ua3g.ip.freeseating.parameter.ipv6)

[ua3g_freeseating_ipv4.pcap](uploads/__moin_import__/attachments/SampleCaptures/ua3g_freeseating_ipv4.pcap) Freeseating message: ipv4 address (filter ua3g.ip.freeseating.parameter.ip)

### DICOM

[DICOM_C-ECHO-echoscu.pcap](uploads/__moin_import__/attachments/SampleCaptures/DICOM_C-ECHO-echoscu.pcap) Successful C-ECHO request generated with echoscu fromOFFIS DICOM Toolkit

### ETSI Intelligent Transport Systems (ITS) Protocols

[etsi-its-cam-unsecured.pcapng](uploads/__moin_import__/attachments/SampleCaptures/etsi-its-cam-unsecured.pcapng) Cooperative Awareness Basic Service (CAM) sample capture in non secured mode. See ETSI EN 302 637-2 for protocol details.

[etsi-its-denm-unsecured.pcapng](uploads/__moin_import__/attachments/SampleCaptures/etsi-its-denm-unsecured.pcapng) Decentralized Environmental Notification Basic Service (DENM) sample capture in non secured mode. See ETSI EN 302 637-3 for protocol details.

[etsi-its-cam-secured.pcapng](uploads/__moin_import__/attachments/SampleCaptures/etsi-its-cam-secured.pcapng) Cooperative Awareness Basic Service (CAM) sample capture in secured mode.

[etsi-its-denm-secured.pcapng](uploads/__moin_import__/attachments/SampleCaptures/etsi-its-denm-secured.pcapng) Decentralized Environmental Notification Basic Service (DENM) sample capture in secured mode.

[EA_Request.pcapng](uploads/__moin_import__/attachments/SampleCaptures/EA_Request.pcapng) Enrollment Authorization request/response from an OBU/RSU to a PKI EA entity. To decrypt the messages exchange in Wireshark, please use the following parameters:

\- Private key of the PKI EA certificate: 06EB0D8314ADC4C3564A8E721DF1372FF54B5C725D09E2E353F2D0A46003AB86

\- Whole PKI EA certificate hash SHA-256: 843BA5DC059A5DD3A6BF81842991608C4CB980456B9DA26F6CC2023B5115003E

See:

* IEEE 1609.2a-2017 IEEE Standard for Wireless Access in Vehicular Environments—Security Services for Applications and Management Messages
* ETSI TS 102 940 ITS Security; ITS communications security architecture and security management
* ETSI TS 102 941 ITS Security; Trust and Privacy Management
* ETSI TS 103 097 ITS Security; Security header and certificate formats

### NetBIOS

A sample program (with nearly the same data transferred) has been run under MS-DOS using different NetBIOS implementations/drivers:

* [microsoft_npc_netbios.pcapng](uploads/__moin_import__/attachments/SampleCaptures/microsoft_npc_netbios.pcapng) NetBEUI (aka NPC) using Microsoft Network Client 3
* [novell_eth2_netbios.pcapng](uploads/__moin_import__/attachments/SampleCaptures/novell_eth2_netbios.pcapng) NetBIOS over IPX using Novell Netware client on Ethernet-II
* [novell_raw_netbios.pcapng](uploads/__moin_import__/attachments/SampleCaptures/novell_raw_netbios.pcapng) NetBIOS over IPX using Novell Netware client on Ethernet-I raw
* [novell_llc_netbios.pcapng](uploads/__moin_import__/attachments/SampleCaptures/novell_llc_netbios.pcapng) NetBIOS over IPX using Novell Netware client using Ethernet-I with LLC

And another NetBIOS example: SMB between an MS-DOS client and a Windows 98 server over NetBEUI: [dos_win98_smb_netbeui.pcapng](uploads/__moin_import__/attachments/SampleCaptures/dos_win98_smb_netbeui.pcapng)

### Dynamic Link Exchange Protocol (DLEP)

[dlep.pcap](uploads/__moin_import__/attachments/SampleCaptures/dlep.pcap) Basic data items as defined in RFC8175

### Asphodel Protocol

[Asphodel_WMRTCP5135.pcapng](uploads/__moin_import__/attachments/SampleCaptures/Asphodel_WMRTCP5135.pcapng) Streaming data example from a wireless module through a reciever.

### Protobuf

Please refer to [Protobuf dissector description page](/Protobuf) for how to use the sample capture files.

[protobuf_udp_addressbook.pcapng](uploads/e2b98423e5f0dc85e0b1228ebbd044e2/protobuf_udp_addressbook.pcapng) Protobuf UDP example.

[protobuf_tcp_addressbook.pcapng](uploads/b2f61c813d697e3ed22accf728de3122/protobuf_tcp_addressbook.pcapng) Protobuf TCP example.

[protobuf_udp_addressbook_with_image.pcapng](uploads/4dde0c0be2c88ad980a0f42a9f1507cb/protobuf_udp_addressbook_with_image.pcapng) Protobuf UDP example with image field.

[protobuf_udp_addressbook_with_image_ts.pcapng](uploads/c425dd4bb60f7d7ea35ec1b924bf3788/protobuf_udp_addressbook_with_image_ts.pcapng) Protobuf UDP example about image field and google.protobuf.Timestamp field.

### gRPC

Please refer to [gRPC dissector description page](/gRPC) for how to use the sample capture files.

[grpc_person_search_protobuf_with_image.pcapng](uploads/f6fcdceb0248669c0b057bd15d45ab6f/grpc_person_search_protobuf_with_image.pcapng) gRPC Person search service example, using Protobuf to serialize structured data.

[grpc_person_search_json_with_image.pcapng](uploads/88c03db83efb2e3253c88f853d40477b/grpc_person_search_json_with_image.pcapng) gRPC Person search service example, using JSON to serialize structured data.

### AllJoyn

[Gitlab issues](https://gitlab.com/wireshark/wireshark/-/issues) with samples attached.

[9361 - AllJoyn protocol dissector](https://gitlab.com/wireshark/wireshark/-/issues/9361 "AllJoyn protocol dissector")

[10567 - Improve support for AllJoyn Reliable Datagram Protocol.](https://gitlab.com/wireshark/wireshark/-/issues/10567 "Improve support for AllJoyn Reliable Datagram Protocol.")

### Thrift

Please refer to [Thrift dissector description page](/Thrift) for how to use the sample capture files with specific dissectors.

[jaeger-compact.pcap](uploads/c5eb22240c76f97801c6120017196bcd/jaeger-compact.pcap) Thrift Compact Protocol UDP example using [Jaeger](https://www.jaegertracing.io/).

[anony-tcp-std.pcap](uploads/99d63eaf8a2780a1da96cb111267deea/anony-tcp-std.pcap) Thrift Binary Protocol TCP example with [packet reassembly](https://gitlab.com/wireshark/wireshark/-/issues/16244 "[Thrift] Dissector fails to reassemble PDU on nested structures").

### Huawei's GRE bonding control (RFC8157)

[greb_DSLkeepalive_m.cap](uploads/0c476e603bf492bd9f914c01fcfe7084/greb_DSLkeepalive_m.cap) Keepalive (regular "Hello") for the bonding as seen on a Deutsche Telekom DSL line (that's why it is encapsuluated in PPP and VLAN 7)

[notifyLTE.pcap](uploads/64bfcee3cc3e25d56c6cd43eb5f82d4b/notifyLTE.pcap) "Notify" over LTE, just keeping the IPv6 prefix fresh

[greb_notifyDSLfail_overLTE.cap](uploads/ef50161950b672bcc73d3d7b71c272bc/greb_notifyDSLfail_overLTE.cap) Notification of DSL failure

[greb_filterlist.pcap](uploads/d9bfb8281125a1d71ed9d138a4d491ea/greb_filterlist.pcap) Notify incl. filter list

### ADWS

ADWS (Active Directory Web Services) relies on [WCF](https://learn.microsoft.com/en-us/dotnet/framework/wcf/) which relies on [\[MC-NMF\]](https://learn.microsoft.com/en-us/openspecs/windows_protocols/mc-nmf/0aab922d-8023-48bb-8ba2-c4d3404cc69d) and [\[MS-NNS\]](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-nns/93df08eb-a6c4-4dff-81c3-519cf7236df4)

In this capture file we have, the first TCP connection using SPNEGO with Kerberos and the second using raw NTLM (without SPNEGO). The targeted server for both is the same but one via FQDN (so Kerberos ticket retrieval worked) and the second via IP.

[wcf_nettcpbinding.pcapng](uploads/1f2351885a425ae58c1d544f4c11c3ca/wcf_nettcpbinding.pcapng)

### NTLMSSP

See [NTLMSSP](NTLMSSP)

[NTLM.pcap](uploads/__moin_import__/attachments/SampleCaptures/NTLM-wenchao.pcap) (libpcap) Illustrate [NTLM](/NTLMSSP) authentication process, based on WSS 3.0

Usage of the \[[MS-TSCH](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-tsch/d1058a28-7e02-4948-8b8d-4a347fa64931)\] MS-RPC protocol, to create two scheduled tasks with the `SchRpcRegisterTask` method, then listing all the tasks using the `SchRpcEnumTasks` methods. Auth uses NTLMSSP and RPC trafic can be decrypted (as described in [NTLMSSP](NTLMSSP)) using cleartext password "clem":

* With NTLMv1 ESS (Extended Session Security): [create_two_tasks_then_enum_RPC_C_AUTHN_LEVEL_PKT_PRIVACY_NTLMv1_ESS__password_clem.pcapng](uploads/53f6885e55de6c7ac0c8b516793f3aea/create_two_tasks_then_enum_RPC_C_AUTHN_LEVEL_PKT_PRIVACY_NTLMv1_ESS__password_clem.pcapng)
* With NTLMv2: [create_two_tasks_then_enum_RPC_C_AUTHN_LEVEL_PKT_PRIVACY_NTLMv2__password_clem.pcapng](uploads/43f6d21d7fd73ff9b5e3e58b9bdb0604/create_two_tasks_then_enum_RPC_C_AUTHN_LEVEL_PKT_PRIVACY_NTLMv2__password_clem.pcapng)

The two following examples show LDAP and DRSUAPI MS-RPC trafic that can be decrypted by providing the cleartext "admin" password, as described in [NTLMSSP](NTLMSSP):

* [ntlm_ldap.pcapng](uploads/5fd073d53e914a16d5d40297b76893b1/ntlm_ldap.pcapng)
* [ntlm_rpc.pcapng](uploads/13031c07486de60355d015782ab74e3b/ntlm_rpc.pcapng)

### Zabbix Protocol

- [zabbix70-proxy-and-agent.pcapng](uploads/70bcad147eed51f7781fd923275e3270/zabbix70-proxy-and-agent.pcapng): Zabbix 7.0.0alpha2, active proxy is talking to the server, active agent 2 is talking to the proxy
- [zabbix30-proxy-and-agent.pcapng](uploads/a4226d1d2a97707d0ae8da09a1e97aab/zabbix30-proxy-and-agent.pcapng): Zabbix 3.0.32 (very old version!), active proxy is talking to the server, active agent is talking to the proxy

### DHCPFO Protocol

Dynamic Host Configuration Protocol - Failover

- [dhcpfo.pcapng](uploads/31512202644437433637e62f32a116ad/dhcpfo.pcapng): Two Windows Server 2022 DHCP servers talking to each other with DHCPFO, while a DHCP client retrieves and releases its lease

### COTP (ISO 8073)

Connection Oriented Transfer Protocal

[COTP_Example.pcapng.gz](uploads/fce52472307ec7a4538651186f0b05ca/COTP_Example.pcapng.gz):  Two computers exchanging messages using ISO 8073 packets on top of RFC 1006.

## Captures in specific file formats

[i4b.trace](uploads/__moin_import__/attachments/SampleCaptures/i4b.trace) An I4B (ISDN for BSD) capture file.

[D-1-Anonymous-Anonymous-D-OFF-27d01m2009y-00h00m00s-0a0None.trc](uploads/__moin_import__/attachments/SampleCaptures/D-1-Anonymous-Anonymous-D-OFF-27d01m2009y-00h00m00s-0a0None.trc) An EyeSDN capture file containing DPNSS packets.

[erf-ethernet-example.erf](uploads/__moin_import__/attachments/SampleCaptures/erf-ethernet-example.erf) A Endace [ERF](/ERF) capture file.

[pcapng-example.pcapng](uploads/96afe21b136f715d5b96df4a646c57d9/pcapng-example.pcapng) A PCAPNG example file with packets from interfaces with different link-layer types, file- and packet-comments, a name resolution block and a TLS session keys block.

## Captures used in Wireshark testing

The following are used during Wireshark testing, and are from the test/captures directory.

[c1222_std_example8.pcap](uploads/__moin_import__/attachments/SampleCaptures/c1222_std_example8.pcap) ANSI C12.22 packets, used to cover bug 9196.

[dhcp-nanosecond.pcap](uploads/__moin_import__/attachments/SampleCaptures/dhcp-nanosecond.pcap) DHCP with nanosecond timing.

[dhcp.pcapng](uploads/__moin_import__/attachments/SampleCaptures/dhcp.pcapng) DHCP saved in pcapng format.

[dns_port.pcap](uploads/__moin_import__/attachments/SampleCaptures/dns_port.pcap) DNS running on a different port than 53.

[dns+icmp.pcapng.gz](uploads/__moin_import__/attachments/SampleCaptures/dns-icmp.pcapng.gz) DNS and ICMP saved in gzipped pcapng format.

[dvb-ci_UV1_0000.pcap](uploads/__moin_import__/attachments/SampleCaptures/dvb-ci_UV1_0000.pcap) DVB Common Interface (DVB-CI) packet.

[rsasnakeoil2.pcap](uploads/__moin_import__/attachments/SampleCaptures/rsasnakeoil2.pcap) SSL handshake and encrypted payload.

[sample_control4_2012-03-24.pcap](uploads/__moin_import__/attachments/SampleCaptures/sample_control4_2012-03-24.pcap) [ZigBee](/ZigBee) protocol traffic.

[snakeoil-dtls.pcap](uploads/__moin_import__/attachments/SampleCaptures/snakeoil-dtls.pcap) DTLS handshake and encrypted payload.

[wpa-Induction.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/wpa-Induction.pcap.gz) [WiFi](/WiFi) 802.11 WPA traffic.

[wpa-eap-tls.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/wpa-eap-tls.pcap.gz) [WiFi](/WiFi) 802.11 WPA-EAP/Rekey sample.

[segmented_fpm.pcap](uploads/__moin_import__/attachments/SampleCaptures/segmented_fpm.pcap) FPM and Netlink used for Lua plugin TCP-based dissector testing.

[policy-authorizeNV.pcap](uploads/__moin_import__/attachments/SampleCaptures/policy-authorizeNV.pcap) TPM2.0 policy sample.

## Discussion

Can some one please upload IKEv1(Phase 1 and phase 2) and IKEv2 Packets? -- nitin raj

Is sample the right name, instead of example? I always think about a sampling rate. - _Ulf Lamping_

In this context, "sample" and "example" are interchangeable. I'm not sure which is more formally correct. - _Gerald Combs_

Think of "sample" as in "_take a free sample of our magazine_". Sampling really means that you're taking samples at specific points in time, so it _is_ OK. - _Olivier Biot_

Hmmm, still unsure. Following your logic, Sample and Capture would have almost the same meaning. But I'm usually not interested that the capture is sampled from a specific network at a specific point in time, I'm looking for examples, how a specific network traffic does look like. I would think that sample in the way it's used here, is just an abbreviation for example, or do I miss something here. - _Ulf Lamping_

I see. Maybe then "example capture" is more appropriate than "sample capture" or "capture(d) sample". - _Olivier Biot_

What about "example sample"... Everyone would get it, and, most of it, it rhymes! :smiley: - _Luis Ontanon_

What are the rules regarding attaching sample captures? I mean those that aren't yours. If it was seen "in the wild" (e.g., attached to an email on the mailing list or a bug), is that public enough for someone to attach it here? - Jeff Morriss

Should we add example captures from the mailing list here? In those cases it is obvious that they are donated as examples of a protocol? I am thinking of something like http://www.wireshark.org/lists/wireshark-dev/200003/msg00078.html -- ronnie

I've been thinking about that too -- if a sample example :smiley: is sent to the list it's publicly avalable on the net intended or not and could be added to the examples? -- at least if its not obviusly a (bad) misstake -- Anders

### Requests for particular captures

I think some Tor traffic captures would be a good addition. Maybe also examples using different pluggable transports. I will upload later if I end up doing some. :smiley:

Could someone add a capture of Internet Key Exchange (IKE) protocol or IKEv2 ? :smiling_imp:

Hi I am searching for a capture of MACSec frames according to 802.1ae. Thanks karsten_g@rad.com

Could someone please add a capture of GTP-U V1 messages, whatever the interface that is being captured?

Can someone please add a capture of dnp3 messages both udp and tcp?

Can someone please add a capture of PROFINET like PNIO packages and some commands of the used Network (like names and IP's of the devices)? Thanks a lot.

Can Someone add a RTP capture with AMR audio. If it is capturered from a push-to-talk session it would be wonderful for me. Thanks.

Can someone add a DOCSIS cable modem capture? Thanks

Can somebody add a packet capture of RADIUS conforming to RFC 2865 and RFC 2866?

Can anybody provide the wireshark capture of VoIP?

I need a capture like the previous : VoIP but an international call. (need to check delays for a university work). Thanks

Does anybody out there have pcap files with the following?: Citrix ICA traffic, CU-[SeeMe](/SeeMe) Video conference traffic, EIGRP (Enhanced Interior Gateway Routing Protocol) traffic, X-Win remote access, SunRPC traffic, SOCKS traffic, SKYPE traffic, pcAnywhere traffic, NNTP traffic or MGCP traffic???

Can anybody provide the wireshark capture of RANAP?

An Iu-CS capture would be welcomed, containing both RANAP and Iu-UP traces of for example an AMR voice call.

I added Iu-CS capture just now!!! :smiley: Please look under UMTS section. -Samba sambasiva.manchili@nexustelecom.com When you open this in it may show IuUP packets, as UDP stream. In this case please click on relevant UDP packet and then select from _menu_ _Analyze--->Decode As_ RTP(both ports) under Transport tab. In case of any help required, please do not hesitate to write to me.

Anyone have a capture of RTP conforming to RFC 2198 (Redundant Audio) or RFC 2733 (Generic FEC) encoding? Associated SIP/SDP signaling would be a bonus.

Does anyone have any capture files containing "raw" ATM packets (with AAL0/AAL5 would be handy)?. Thank you --

Estou desenvolvendo uma ferramenta em C++ que tem como entrada uma mensagem no formato hexadecimal, encapsulada nos protocolos SS7, do tipo: ISUP, INAP e CAP. E como saída um arquivo .cap ou .pcap para ser lido pelo [WireShark](/WireShark). Para concluir esse projeto gostaria de ter um exemplo de arquivo de entrada (extensão .cap o .pcap) encapsulado nos protocolos INAP E CAP, pois nos arquivos de exemplo disponiveis só encontrei do protocolo ISUP.

I am developing a tool in C++ that has as input a message in the hexadecimal format, encapsulated in SS7 protocols, of the type: ISUP, INAP and CAP. As exit a file .cap or .pcap to be read by the [WireShark](/WireShark). To conclude this project it would like to have an example file (extension cap pcap) encapsulated in protocols INAP and CAP, because in the example files I only found of ISUP protocol.

Can anyone add a UCP capture? especially 5x series messages but others would be helful too... Thanks

Does anyone have HDLC traffic, like for example between WAN routers?

Does anyone have Synchronous Ethernet Capture? -[RadhaKrishna](/RadhaKrishna) arkrishna@alcatel-lucent.com

Can someone add a TRIP protocol capture (RFC 3219)?

Can somebody provide a capture of a Cisco wireless accesspoint (any model) connecting to the controller (either via LWAPP or CAPWAP)?

Does anyone has any ETHOAM captures? Please upload.

### Downloading all traces

Is there an easy way to download all of the traces? If yes, please email me. -grant@wildpackets.com

Yes,

`wget -nc -r -H -l 1 --accept=cap,gz,pcap,zip,iptrace,snoop,txt,CAP http://wiki.wireshark.org/SampleCaptures`

under UN\*X or Cygwin -Phil

Thanks a ton! -grant@wildpackets.com

That didn't work with wget 1.9.1:

```plaintext
$ wget -nc -r -H -l 1 --accept=cap,gz,pcap,zip,iptrace,snoop,txt,CAP http://wiki.wireshark.org/SampleCaptures --22:19:05-- http://wiki.wireshark.org/SampleCaptures => `wiki.wireshark.org/SampleCaptures' Resolving wiki.wireshark.org... 65.208.228.223 Connecting to wiki.wireshark.org[65.208.228.223]:80... connected. HTTP request sent, awaiting response... 200 OK Length: unspecified [text/html] [ <=> ] 42,305 68.22K/s 22:19:06 (68.12 KB/s) - `wiki.wireshark.org/SampleCaptures' saved [42305] Removing wiki.wireshark.org/SampleCaptures since it should be rejected. FINISHED --22:19:06-- Downloaded: 42,305 bytes in 1 files
```

\-_Guy Harris_

Damn, I don't know why this wget commands gets a bad Forbidden from the server when politely asking for some files :wink:

```plaintext
wget --server-response -r -l 1 --follow-tags=link,a \ --accept=cap,gz,pcap,zip,iptrace,snoop,txt,CAP, \ 'http://wiki.wireshark.org/SampleCaptures'
```

Someone please tell me...

ok, here is something that _works_ (tested) but then, ahem, it's ugly:

```plaintext
lynx -dump 'http://wiki.wireshark.org/SampleCaptures' | \ grep -Eh --only-matching 'http://[^ ]+' | grep AttachFile | \ while read a; do htget $a; done
```

Beware when cutting/pasting, some spaces are inserted after the backslash and bash shells don't like that.

\--Phil

ok, I tried this one on my suse 9.3 box but htget was not found. A quick google showed that this tool seems to be Debian specific. It looks natural for us "newbie distribution users" to be more and more jealous of Debian... Anyway I found the source code at http://ftp.cvut.cz/debian/pool/main/h/htget/htget_0.93-1.1woody1.tar.gz and expanding the file, followed by 'make', 'make install' (as root) and copying htgetrc to <span dir="">\~</span>/.htgetrc did the trick. Thanks so much for this, ahem, ugly skript that has the undeniable advantage of working great!

\--Eberhard

The reason the wget doesn't work is the `<meta name="robots" content="index,nofollow">` in the html of the wiki pages. Is there a reason we have that?

\--_Rich van der Hoff_

Try using Download Accelerator Plus (DAP). When integrated with Firefox there is an option called "Save all .." in the right-click context menu

\-- Razor

Hi :smiley:

I used htget, but got all these Sample.\* Prefixes, which may you want to remove:

first _backup_

rename like this:

```plaintext
for i in SampleCaptures\?action\=AttachFile* ; do mv "$i" $( echo $i|sed 's/S.* target=//g' ); done
```

opt. move [NetMon](/NetMon) files in a separate directory:

```plaintext
mkdir NetMon; mv `file * |grep NetMon| awk '{ print $1 }'| tr ':' ' ' ` NetMon/
```

\-- netbeisser :wink:

The "Forbidden" response to wget is caused by the "do=view" part of the link. These files that cause this error can be retrieved okay if substituting this part with "do=get". Suggest the following command (that also has a benefit of auto-renaming the files and doesn't use that hideous `htget` utility):

```plaintext
lynx -dump 'http://wiki.wireshark.org/SampleCaptures' |
grep -Eh --only-matching 'http://[^ ]+' | grep AttachFile.*target= |
sed 's/do=view/do=get/' | sort | uniq |
while read i; do wget -O ${i##*=} "$i"; done
```

\-- AVN

wget respects the robot meta tag, so you need to ignore that. '-A' did not work for me, probably because it does not match the query part. This works for me (wget 1.15):

```plaintext
wget -e robots=off -nc -r -l 1 --accept-regex='.*do=get.*(p?cap|pcapng)(\.gz)?$' --ignore-case http://wiki.wireshark.org/SampleCaptures?action=AttachFile
```

The above command will result in file names such as 'SampleCaptures?...&target=foo.pcap'. To get "foo.pcap" instead, you could use the following commands to create symlinks (the advantage is that you can run the wget command again which will skip existing files):

```plaintext
mkdir captures && cd captures && ln -s ../wiki.wireshark.org .;
find wiki.wireshark.org/ -name '*target=*' | php -r 'while ($line = fgets(STDIN)) { $line = trim($line); symlink($line, urldecode(preg_replace("#.*target=#", "", $line))); }'
```

As of this writing, there are 634 files matching that filter which have a total size of 537 MiB. --Lekensteyn

Does anyone have a sample trace of Q-in-Q (IEEE 802.1ah) or MAC-in-MAC? If you add either to these samples, I would appreciate if you drop me a note at richman30@ix.netcom.com . Thank you.

\--LMR

---