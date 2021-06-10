[[_TOC_]]

## Sample Captures

So you're at home tonight, having just installed Wireshark. You want to take the program for a test drive. But your home LAN doesn't have any interesting or exotic packets on it? Here's some goodies to try. Please note that if for some reason your version of Wireshark doesn't have zlib support, you'll have to gunzip any file with a **.gz** extension.

If you don't see what you want here, that doesn't mean you're out of luck; look at some of the other sources listed below, such as <http://www.pcapr.net/>.

## How to add a new Capture File

If you want to include a new example capture file, you should attach it to this page (click 'attachments' in header above). In the corresponding text, you might explain what this file is doing and what protocols, mechanisms or events it explains. Links from here to the related protocol pages are also welcome.

**Please** don't just attach your capture file to the page without putting an attachment link in the page, in the format **`attachment:`*`filename.ext`***; if you don't put an attachment link in the page, it's not obvious that the capture file is available.

It's also a very good idea to put links on the related protocol pages pointing to your file. Referring to an attachment on this page from another Wiki page requires a link on that other Wiki page in the format **`attachment:SampleCaptures/`*`filename.ext`***. For an example of this, see the [NetworkTimeProtocol](/NetworkTimeProtocol) page.

## Other Sources of Capture Files

If you don't find what you're looking for, you may also try:

  - <http://www.google.com/>

  - <http://www.icir.org/enterprise-tracing/download.html> (unsorted capture of packet headers from enterprise traffic - use the .anon files)

  - <https://www.openpacket.org/capture/list> (open repository of traces particularly related to digital security)

  - <http://www.packetlife.net/captures/> (community submissions, organized and moderated)

  - <http://www.pcapr.net/> (web 2.0 for pcaps with editing, DoS, etc; powered by wireshark)

  - <http://www.netresec.com/?page=PcapFiles> (great list of places to download pcap files from)

  - <http://sysdoccap.codeplex.com/wikipage?title=System%20Overview%20Document%20Scenario%20Captures> (Microsoft System Overview Document captures).

  - [Collection of Pcap files from malware analysis](http://contagiodump.blogspot.co.uk/2013/04/collection-of-pcap-files-from-malware.html) (You will need to contact [Mila](https://www.blogger.com/profile/09472209631979859691) for the password to extract the files.)

  - <https://bugs.wireshark.org/bugzilla/> Added as attachments to recreate bug or test a fix.

  - [Malware of the Day](https://www.activecountermeasures.com/category/malware-of-the-day/) Network traffic of malware samples in the lab.

  - [Malware-Traffic-Analysis.net](https://www.malware-traffic-analysis.net/about.html) Sharing information on malicious network traffic and malware samples. A source for pcap files and malware samples...

## General / Unsorted

[rpl-dio-mc-nsa-optional-tlv-dissector-sample.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/rpl-dio-mc-nsa-optional-tlv-dissector-sample.pcap.gz) (libpcap) ICMPv6 IPv6 Routing Protocol for Low-Power and Lossy Networks (RPL) DODAG Information Object (DIO) control messages with optional type-length-value (TLV) in an Node State and Attributes (NSA) object in a Metric Container (MC).

[ipv4frags.pcap](uploads/__moin_import__/attachments/SampleCaptures/ipv4frags.pcap) (libpcap) ICMP Echo request (1400B) response with Fragments (MTU=1000 on one side).

[tfp\_capture.pcapng](uploads/__moin_import__/attachments/SampleCaptures/tfp_capture.pcapng) (libpcap) Tinkerforge protocol captures over TCP/IP and USB.

[NTLM.pcap](uploads/__moin_import__/attachments/SampleCaptures/NTLM-wenchao.pcap "NTLM.pcap") (libpcap) Illustrate NTLM authentication process, based on WSS 3.0

[Obsolete\_Packets.cap](uploads/__moin_import__/attachments/SampleCaptures/Obsolete_Packets.cap) (libpcap) Contains various obscure/no longer in common use protocols, including Banyan VINES, [AppleTalk](/AppleTalk) and DECnet.

[Apple\_IP-over-IEEE\_1394\_Packet.pcap](uploads/__moin_import__/attachments/SampleCaptures/Apple_IP-over-IEEE_1394_Packet.pcap) (libpcap) An ICMP packet encapsulated in Apple's IP-over-1394 (ap1394) protocol

[SkypeIRC.cap](uploads/__moin_import__/attachments/SampleCaptures/SkypeIRC.cap) (libpcap) Some Skype, IRC and DNS traffic.

[ipp.pcap](uploads/__moin_import__/attachments/SampleCaptures/ipp.pcap) (libpcap) CUPS printing via IPP (test page)

[IrDA\_Traffic.ntar](uploads/__moin_import__/attachments/SampleCaptures/IrDA_Traffic.ntar) (pcapng) Various IrDA packets, use Wireshark 1.3.0 (SVN revision 28866 or higher) to view

[9p.cap](uploads/__moin_import__/attachments/SampleCaptures/9p.cap) (libpcap) Plan 9 9P protocol, various message types.

[EmergeSync.cap](uploads/__moin_import__/attachments/SampleCaptures/EmergeSync.cap) (libpcap) rsync packets, containing the result of an "emerge sync" operation on a Gentoo system

[afs.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/afs.cap.gz) (libpcap) Andrew File System, based on RX protocol. Various operations.

[ancp.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/ancp.pcap.gz) (libpcap) Access Node Control Protocol (ANCP).

[ascend.trace.gz](uploads/__moin_import__/attachments/SampleCaptures/ascend.trace.gz) (Ascend WAN router) Shows how Wireshark parses special Ascend data

[atm\_capture1.cap](uploads/__moin_import__/attachments/SampleCaptures/atm_capture1.cap) (libpcap) A trace of ATM Classical IP packets.

[bacnet-arcnet.cap](uploads/__moin_import__/attachments/SampleCaptures/bacnet-arcnet.cap) (libpcap) Some BACnet packets encapsulated in ARCnet framing

[bfd-raw-auth-simple.pcap](uploads/__moin_import__/attachments/SampleCaptures/bfd-raw-auth-simple.pcap) (libpcap) BFD packets using simple password authentication.

[bfd-raw-auth-md5.pcap](uploads/__moin_import__/attachments/SampleCaptures/bfd-raw-auth-md5.pcap) (libpcap) BFD packets using md5 authentication.

[bfd-raw-auth-sha1.pcap](uploads/__moin_import__/attachments/SampleCaptures/bfd-raw-auth-sha1.pcap) (libpcap) BFD packets using SHA1 authentication.

[BT\_USB\_LinCooked\_Eth\_80211\_RT.ntar.gz](uploads/__moin_import__/attachments/SampleCaptures/BT_USB_LinCooked_Eth_80211_RT.ntar.gz) (pcapng) A selection of Bluetooth, Linux mmapped USB, Linux Cooked, Ethernet, IEEE 802.11, and IEEE 802.11 [RadioTap](/RadioTap) packets in a pcapng file, to showcase the power of the file format, and Wireshark's support for it. Currently, Wireshark doesn't support files with multiple Section Header Blocks, which this file has, so it cannot read it. In addition, the first packet in the file, a Bluetooth packet, is corrupt - it claims to be a packet with a Bluetooth pseudo-header, but it contains only 3 bytes of data, which is too small for a Bluetooth pseudo-header.

[bootparams.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/bootparams.cap.gz) (libpcap) A couple of rpc.bootparamsd 'getfile' and 'whoami' requests.

[chargen-udp.pcap](uploads/__moin_import__/attachments/SampleCaptures/chargen-udp.pcap) (libpcap) Chargen over UDP.

[chargen-tcp.pcap](uploads/__moin_import__/attachments/SampleCaptures/chargen-tcp.pcap) (libpcap) Chargen over TCP.

[cmp\_IR\_sequence\_OpenSSL-Cryptlib.pcap](uploads/__moin_import__/attachments/SampleCaptures/cmp_IR_sequence_OpenSSL-Cryptlib.pcap) (libpcap) Certificate Management Protocol (CMP) version 2 encapsulated in HTTP. Full "Initialization Request".

[cmp\_IR\_sequence\_ OpenSSL-EJBCA.pcap](uploads/__moin_import__/attachments/SampleCaptures/cmp_IR_sequence_-OpenSSL-EJBCA.pcap) (libpcap) Certificate Management Protocol (CMP) version 2 encapsulated in HTTP. Full "Initialization Request". Authentication with CRMF regToken.

[cmp-trace.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/cmp-trace.pcap.gz) (libpcap) Certificate Management Protocol (CMP) certificate requests.

[cmp-in-http-with-errors-in-cmp-protocol.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/cmp-in-http-with-errors-in-cmp-protocol.pcap.gz) (libpcap) Certificate Management Protocol (CMP) version 2 encapsulated in HTTP. Full "Initialization Request" and rejected "Key Update Request". There are some errors in the CMP packages.

[cmp\_in\_http\_with\_pkixcmp-poll\_content\_type.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/cmp_in_http_with_pkixcmp-poll_content_type.pcap.gz) (libpcap) Certificate Management Protocol (CMP) version 2 encapsulated in HTTP. The CMP messages are of the deprecated but used content-type "pkixcmp-poll", so they are using the TCP transport style. In two of the four CMP messages, the content type is not explicitly set, thus they cannot be dissected correctly.

[cigi2.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/cigi2.pcap.gz) (libpcap) Common Image Generator Interface (CIGI) version 2 packets.

[cigi3.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/cigi3.pcap.gz) (libpcap) Common Image Generator Interface (CIGI) version 3 packets.

[ciscowl.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/ciscowl.pcap.gz) (libpcap) Cisco Wireless LAN Context Control Protocol ([WLCCP](/WLCCP)) version 0x0

[ciscowl\_version\_0xc1.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/ciscowl_version_0xc1.pcap.gz) (libpcap) Cisco Wireless LAN Context Control Protocol ([WLCCP](/WLCCP)) version 0xc1. Includes following base message types: SCM Advertisements, EAP Auth., Path Init, Registration

[configuration\_test\_protocol\_aka\_loop.pcap](uploads/__moin_import__/attachments/SampleCaptures/configuration_test_protocol_aka_loop.pcap) (libpcap) Example of an Ethernet loopback with a 'third party assist'

[cops-pr.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/cops-pr.cap.gz) (libpcap) A sample of COPS traffic.

[couchbase\_subdoc\_multi.pcap](uploads/__moin_import__/attachments/SampleCaptures/couchbase_subdoc_multi.pcap) (libpcap) A sample Couchbase binary protocol file including sub-document multipath request/responses.

[couchbase-create-bucket.pcapng](uploads/__moin_import__/attachments/SampleCaptures/couchbase-create-bucket.pcapng) (libpcap) A sample Couchbase binary protocol file that includes a create\_bucket command.

[couchbase-lww.pcap](uploads/__moin_import__/attachments/SampleCaptures/couchbase-lww.pcap) (libpcap) A sample Couchbase binary protocol file including set\_with\_meta, del\_with\_meta and get\_meta commands with last write wins support.

[couchbase-xattr.pcapng](uploads/__moin_import__/attachments/SampleCaptures/couchbase-xattr.pcapng) (libpcap) A sample capture of the XATTR features in the Couchbase binary protocol.

[dct2000\_test.out](uploads/__moin_import__/attachments/SampleCaptures/dct2000_test.out) (dct2000) A sample [DCT2000](/DCT2000) file with examples of most supported link types

[dhcp.pcap](uploads/__moin_import__/attachments/SampleCaptures/dhcp.pcap) (libpcap) A sample of DHCP traffic.

[dhcp-and-dyndns.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/dhcp-and-dyndns.pcap.gz) (libpcap) A sample session of a host doing dhcp first and then dyndns.

[dhcp-auth.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/dhcp-auth.pcap.gz) (libpcap) A sample packet with dhcp authentication information.

[PRIV\_bootp-both\_overload.pcap](uploads/__moin_import__/attachments/SampleCaptures/PRIV_bootp-both_overload.pcap) (libpcap) A DHCP packet with sname and file field overloaded.

[PRIV\_bootp-both\_overload\_empty-no\_end.pcap](uploads/__moin_import__/attachments/SampleCaptures/PRIV_bootp-both_overload_empty-no_end.pcap) (libpcap) A DHCP packet with overloaded field and all end options missing.

[dccp\_trace.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/dccp_trace.pcap.gz) (libpcap) A trace of [DCCP](/DCCP) packet types.

[dns.cap](uploads/__moin_import__/attachments/SampleCaptures/dns.cap) (libpcap) Various DNS lookups.

[dualhome.iptrace](uploads/__moin_import__/attachments/SampleCaptures/dualhome.iptrace) (AIX iptrace) Shows Ethernet and Token Ring packets captured in the same file.

[dvmrp-conv.cap](uploads/__moin_import__/attachments/SampleCaptures/dvmrp-conv.cap) Shows Distance Vector Multicast Routing Protocol packets.

[eapol-mka.pcap](uploads/__moin_import__/attachments/SampleCaptures/eapol-mka.pcap) (libpcap) EAPoL-MKA (MKA, IEEE 802.1X) traffic.

[epmd.pcap](uploads/__moin_import__/attachments/SampleCaptures/epmd.pcap) Two Erlang Port Mapper Daemon ([EPMD](/EPMD)) messages.

[Ethernet\_Pause\_Frame.cap](uploads/__moin_import__/attachments/SampleCaptures/Ethernet_Pause_Frame.cap) Ethernet Pause Frame packets.

[exablaze\_trailer.pcap](uploads/__moin_import__/attachments/SampleCaptures/exablaze_trailer.pcap) (libpcap) A sample capture with Exablaze timestamp trailers.

[exec-sample.pcap](uploads/__moin_import__/attachments/SampleCaptures/exec-sample.pcap) The [exec](/Exec) (rexec) protocol

[fw1\_mon2018.cap](uploads/__moin_import__/attachments/SampleCaptures/fw1_mon2018.cap) (Solaris snoop) [CheckPoint](/CheckPoint) FW-1 fw monitor file (include new Encryption check points). Enable FW-1 interpretation in Ethernet protocol interpretation

[genbroad.snoop](uploads/__moin_import__/attachments/SampleCaptures/genbroad.snoop) (Solaris snoop) Netware, Appletalk, and other broadcasts on an ethernet network.

[Mixed1.cap](uploads/__moin_import__/attachments/SampleCaptures/Mixed1.cap) (MS [NetMon](/NetMon)) Some Various, Mixed Packets.

[small-system-misc-ping.etl](uploads/__moin_import__/attachments/SampleCaptures/small-system-misc-ping.etl) (MS ETL) Various events, ping and browser packets.

[gryphon.cap](uploads/__moin_import__/attachments/SampleCaptures/gryphon.cap) (libpcap) A trace of Gryphon packets. This is useful for testing the Gryphon plug-in.

[hart\_ip.pcap](uploads/__moin_import__/attachments/SampleCaptures/hart_ip.pcap) (libpcap) Some HART-IP packets, including both an UDP and TCP session.

[hsrp.pcap](uploads/__moin_import__/attachments/SampleCaptures/hsrp.pcap) (libpcap) Some Cisco HSRP packets, including some with Opcode 3 (Advertise) .

[hsrp-and-ospf-in-LAN](uploads/__moin_import__/attachments/SampleCaptures/hsrp-and-ospf-in-LAN) (libpcap) HSRP state changes and OSPF LSAs sent during link up/down/up.

[ieee802154-association-data.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/ieee802154-association-data.pcap.gz) (libpcap) A device associates to a coordinator, and transmits some data frames.

[ipv4\_cipso\_option.pcap](uploads/__moin_import__/attachments/SampleCaptures/ipv4_cipso_option.pcap) (libpcap) A few IP packets with CIPSO option.

[imap.cap](uploads/__moin_import__/attachments/SampleCaptures/imap.cap) (libpcap) A short IMAP session using Mutt against an MSX server.

[RawPacketIPv6Tunnel-UK6x.cap](uploads/__moin_import__/attachments/SampleCaptures/RawPacketIPv6Tunnel-UK6x.cap) (libpcap) - Some IPv6 packets captured from the 'sit1' interface on Linux. The IPv6 packets are carried over the UK's UK6x network, but what makes this special, is the fact that it has a Link-Layer type of "Raw packet data" - which is something that you don't see everyday.

[iseries.cap](uploads/__moin_import__/attachments/SampleCaptures/iseries.cap) (IBM iSeries communications trace) FTP and Telnet traffic between two AS/400 LPARS.

[FTPv6-1.cap](uploads/__moin_import__/attachments/SampleCaptures/FTPv6-1.cap) (Microsoft Network Monitor) FTP packets (IPv6)

[FTPv6-2.cap](uploads/__moin_import__/attachments/SampleCaptures/FTPv6-2.cap) (Microsoft Network Monitor) Some more FTP packets (IPv6)

[gearman.cap](uploads/__moin_import__/attachments/SampleCaptures/gearman.cap "Upload new attachment \"gearman.cap\"") Gearman Protocol packets

[isl-2-dot1q.cap](uploads/__moin_import__/attachments/SampleCaptures/isl-2-dot1q.cap) (libpcap) A trace including both ISL and 802.1q-tagged Ethernet frames. Frames 1 through 381 represent traffic encapsulated using Cisco's ISL, frames 382-745 show traffic sent by the same switch after it had been reconfigured to support 802.1Q trunking.

[kafka-testcases-v4.tar.gz](uploads/__moin_import__/attachments/SampleCaptures/kafka-testcases-v4.tar.gz) (libpcap) Apache Kafka dissector testcases (generated with [this scripts](https://github.com/laz2/genpcap)).

[lacp1.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/lacp1.pcap.gz) (libpcap) Link Aggregation Control Protocol (LACP, IEEE 802.3ad) traffic.

[linx-setup-pingpong-shutdown.pcap](uploads/__moin_import__/attachments/SampleCaptures/linx-setup-pingpong-shutdown.pcap) (libpcap) Successive setup of LINX on two hosts, exchange of packets and shutdown.

[llrp.cap](uploads/__moin_import__/attachments/SampleCaptures/llrp.cap) EPCglobal [Low-Level Reader Protocol (LLRP)](/LLRP)

[llt-sample.pcap](uploads/__moin_import__/attachments/SampleCaptures/llt-sample.pcap) Veritas [Low Latency Transport (LLT)](/LLT) frames

[lustre-lnet\_sample.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/lustre-lnet_sample.cap.gz) (libpcap) Lustre Filesystem with Lustre Fileystem Network under it (tcp)

[macsec\_cisco\_trunk.pcap](uploads/__moin_import__/attachments/SampleCaptures/macsec_cisco_trunk.pcap) (libpcap) MACsec/802.1AE session, manual keys, 3750X switch-to-switch (Trustsec) forced across a half-duplex 10M hub connection, destination mac addresses can be seen for Cisco VTP, RSTP (RPVST+), CDP, EIGRP etc.

[mapi.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/mapi.cap.gz) (libpcap) MAPI session w/ Outlook and MSX server, not currently decoded by Wireshark.

[messenger.pcap](uploads/__moin_import__/attachments/SampleCaptures/messenger.pcap) (libpcap) a few messenger example packets.

[metamako\_trailer.pcap](uploads/__moin_import__/attachments/metamako_trailer.pcap/metamako_trailer.pcap "Upload new attachment \"metamako_trailer.pcap\"") (libpcap) the Metamako timestamp trailer format.

[mms.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/mms.pcap.gz) (libpcap) Manufacturing Message Specification traffic.

[SITA-Protocols.cap](uploads/__moin_import__/attachments/SampleCaptures/SITA-Protocols.cap) (libpcap) Some SITA WAN (Societe Internationale de Telecommunications Aeronautiques sample packets (contains X.25, International Passenger Airline Reservation System, Unisys Transmittal System and Frame Relay packets)

[msnms.pcap](uploads/__moin_import__/attachments/SampleCaptures/msnms.pcap) (libpcap) MSN Messenger packets.

[MSN\_CAP.xlsx](uploads/__moin_import__/attachments/SampleCaptures/MSN_CAP.xlsx) (xlsx) MSN Messenger packets in xlsx format.

[monotone-netsync.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/monotone-netsync.cap.gz) (libpcap) Some fragments (the full trace is \> 100MB gzipped) of a checkout of the monotone sources.

[mpeg2\_mp2t\_with\_cc\_drop01.pcap](uploads/__moin_import__/attachments/SampleCaptures/mpeg2_mp2t_with_cc_drop01.pcap) (libpcap) MPEG2 (RFC 2250) Transport Stream example with a dropped CC packet (anonymized with tcpurify).

[mpls-basic.cap](uploads/__moin_import__/attachments/SampleCaptures/mpls-basic.cap) (libpcap) A basic sniff of MPLS-encapsulated IP packets over Ethernet.

[mpls-exp.cap](uploads/__moin_import__/attachments/SampleCaptures/mpls-exp.cap) (libpcap) IP packets with EXP bits set.

[mpls-te.cap](uploads/__moin_import__/attachments/SampleCaptures/mpls-te.cap) (libpcap) MPLS Traffic Engineering sniffs. Includes RSVP messages with MPLS/TE extensions and OSPF link updates with MPLS LSAs.

[mpls-twolevel.cap](uploads/__moin_import__/attachments/SampleCaptures/mpls-twolevel.cap) (libpcap) An IP packet with two-level tagging.

[netbench\_1.cap](uploads/__moin_import__/attachments/SampleCaptures/netbench_1.cap) (libpcap) A capture of a reasonable amount of NetBench traffic. It is useful to see some of the traffic a NetBench run generates.

[NMap Captures.zip](uploads/__moin_import__/attachments/SampleCaptures/NMap-Captures.zip) (libpcap) Some captures of various [NMap](http://nmap.org/%E2%80%8E) port scan techniques.

[OptoMMP.pcap](uploads/__moin_import__/attachments/SampleCaptures/OptoMMP.pcap) A capture of some OptoMMP read/write quadlet/block request/response packets. [OptoMMP documentation](http://www.opto22.com/site/documents/doc_drilldown.aspx?aid=1875).

[pana.cap](uploads/__moin_import__/attachments/SampleCaptures/pana.cap) (libpcap) PANA authentication session (pre-draft-15a so Wireshark 0.99.5 or before is required to view it correctly).

[pana-draft18.cap](uploads/__moin_import__/attachments/SampleCaptures/pana-draft18.cap) (libpcap) PANA authentication session (draft-18 so Wireshark 0.99.7 or later is required to view it correctly).

[pana-rfc5191.cap](uploads/__moin_import__/attachments/SampleCaptures/pana-rfc5191.cap) (libpcap) PANA authentication and re-authentication sequences.

[pim-reg.cap](uploads/__moin_import__/attachments/SampleCaptures/pim-reg.cap) (libpcap) Protocol Independent Multicast, with IPv6 tunnelled within IPv6

[ptpv2.pcap](uploads/__moin_import__/attachments/SampleCaptures/ptpv2.pcap) (libpcap) various Precision Time Protocol (IEEE 1588) version 2 packets.

[Public\_nic](uploads/__moin_import__/attachments/SampleCaptures/Public_nic) (libpcap) A bunch of SSDP (Universal Plug and Play protocol) announcements.

[rpl\_sample.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/rpl_sample.cap.gz) (libpcap) A RIPL sample capture.

[rtp\_example.raw.gz](uploads/__moin_import__/attachments/SampleCaptures/rtp_example.raw.gz) (libpcap) A VoIP sample capture of a [H323](/H323) call (including [H225](/H225), [H245](/H245), [RTP](/RTP) and [RTCP](/RTCP)).

[RTP\_L16\_monaural\_sample.pcapng](uploads/__moin_import__/attachments/SampleCaptures/RTP_L16_monaural_sample.pcapng) (libpcap) A sample L16 monaural (44100Hz) [RTP](/RTP) stream

[rtps\_cooked.pcapng](uploads/__moin_import__/attachments/SampleCaptures/rtps_cooked.pcapng) (libpcap) Manually generated RTPS traffic covering a range of submessages and parameters.

[rsvp-PATH-RESV.pcap](uploads/__moin_import__/attachments/SampleCaptures/rsvp-PATH-RESV.pcap) (libpcap) A sample RSVS capture with PATH and RESV messages.

[sbus.pcap](uploads/__moin_import__/attachments/SampleCaptures/sbus.pcap) (libpcap) An [EtherSBus](/EtherSBus) (sbus) sample capture showing some traffic between the programming tool (PG5) and a PCD (Process Control Device, a PLC; Programmable Logic Controller).

[Ether-S-IO\_traffic\_01.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/Ether-S-IO_traffic_01.pcap.gz) (libpcap) An [EtherSIO](/EtherSIO) (esio) sample capture showing some traffic between a PLC from Saia-Burgess Controls AG and some remote I/O stations (devices called PCD3.T665).

[simulcrypt.pcap](uploads/__moin_import__/attachments/SampleCaptures/SIMULCRYPT.pcap "simulcrypt.pcap") (libpcap) A SIMULCRYPT sample capture, [SIMULCRYPT](/SIMULCRYPT) over [TCP](/TCP)) on ports 8600, 8601, and 8602.

[TeamSpeak2.pcap](uploads/__moin_import__/attachments/SampleCaptures/TeamSpeak2.pcap) (libpcap) A [TeamSpeak2](/TeamSpeak2) capture

[tipc-publication-payload-withdrawal.pcap](uploads/__moin_import__/attachments/SampleCaptures/tipc-publication-payload-withdrawal.pcap) (libpcap) TIPC port name publication, payload messages and port name withdrawal.

[tipc-bundler-messages.pcap](uploads/__moin_import__/attachments/SampleCaptures/tipc-bundler-messages.pcap) (libpcap) TIPCv2 Bundler Messages

[tipc\_v2\_fragmenter\_messages.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/tipc_v2_fragmenter_messages.pcap.gz) (libpcap) TIPCv2 Fragmenter Messages

[TIPC-over-TCP\_disc-publ-inventory\_sim-withd.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/TIPC-over-TCP_disc-publ-inventory_sim-withd.pcap.gz) (libpcap) TIPCv2 over TCP (port 666) traffic generated by the inventory simulation of the TIPC demo package.

[TIPC-over-TCP\_MTU-discovery.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/TIPC-over-TCP_MTU-discovery.pcap.gz) (libpcap) TIPCv2 over TCP (port 666) - Link State messages with filler bytes for MTU discovery.

[toshiba.general.gz](uploads/__moin_import__/attachments/SampleCaptures/toshiba.general.gz) (Toshiba) Just some general usage of a Toshiba ISDN router. There are three link types in this trace: PPP, Ethernet, and LAPD.

[uma\_ho\_req\_bug.cap](uploads/__moin_import__/attachments/SampleCaptures/uma_ho_req_bug.cap) (libpcap) A "UMA URR HANDOVER REQUIRED" packet.

[unistim\_phone\_startup.pcap](uploads/__moin_import__/attachments/SampleCaptures/unistim_phone_startup.pcap) (libpcap) Shows a phone booting up, requesting ip address and establishing connection with cs2k server.

[unistim-call.pcap](uploads/__moin_import__/attachments/SampleCaptures/unistim-call.pcap) (libpcap) Shows one phone calling another via cs2k server over unistim

[v6.pcap](uploads/__moin_import__/attachments/SampleCaptures/v6.pcap) (libpcap) Shows IPv6 (6-Bone) and ICMPv6 packets.

[v6-http.cap](uploads/__moin_import__/attachments/SampleCaptures/v6-http.cap) (libpcap) Shows IPv6 (SixXS) HTTP.

[vlan.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/vlan.cap.gz) (libpcap) Lots of different protocols, all running over 802.1Q virtual lans.

[vms\_tcptrace.txt](uploads/__moin_import__/attachments/SampleCaptures/vms_tcptrace.txt) (VMS TCPtrace) Sample output from VMS TCPtrace. Mostly NFS packets.

[vms\_tcptrace-full.txt](uploads/__moin_import__/attachments/SampleCaptures/vms_tcptrace-full.txt) (VMS TCPtrace) Sample output from VMS TCPtrace/full. Mostly NFS packets.

[vnc-sample.pcap](uploads/__moin_import__/attachments/SampleCaptures/vnc-sample.pcap) Virtual Networking Computing (VNC) session trace

[vxi-11.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/vxi-11.pcap.gz) (libpcap) Scan for instruments attached to an Agilent E5810A VXI-11-to-GPIB adapter.

[WINS-Replication-01.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/WINS-Replication-01.cap.gz) (libpcap) WINS replication trace.

[WINS-Replication-02.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/WINS-Replication-02.cap.gz) (libpcap) WINS replication trace.

[WINS-Replication-03.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/WINS-Replication-03.cap.gz) (libpcap) WINS replication trace.

[wpsdata.cap](uploads/__moin_import__/attachments/SampleCaptures/wpsdata.cap) (libpcap) WPS expanded EAP trace.

[openwire\_sample.tar.gz](uploads/__moin_import__/attachments/SampleCaptures/openwire_sample.tar.gz) (libpcap) ActiveMQ [OpenWire](/OpenWire) trace.

[drda\_db2\_sample.tgz](uploads/__moin_import__/attachments/SampleCaptures/drda_db2_sample.tgz) (libpcap) DRDA trace from DB2.

[starteam\_sample.tgz](uploads/__moin_import__/attachments/SampleCaptures/starteam_sample.tgz) (libpcap) [StarTeam](/StarTeam) trace.

[rtmp\_sample.tgz](uploads/__moin_import__/attachments/SampleCaptures/rtmp_sample.tgz) (libpcap) RTMP (Real Time Messaging Protocol) trace.

[rtmpt.pcap.bz2](uploads/__moin_import__/attachments/SampleCaptures/rtmpt.pcap.bz2) (libpcap) RTMPT trace with macromedia-fsc TCP-stuff.

[sample-imf.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/sample-imf.pcap.gz) (libpcap) [SMTP](/SMTP) and [IMF](/IMF) capture. Also shows some [MIME\_multipart](/MIME_multipart).

[smtp.pcap](uploads/__moin_import__/attachments/SampleCaptures/smtp.pcap) (libpcap) [SMTP](/SMTP) simple example.

[captura.NNTP.cap](uploads/__moin_import__/attachments/SampleCaptures/captura.NNTP.cap) (libpcap) [NNTP](/NNTP) News simple example.

[sample-TNEF.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/sample-TNEF.pcap.gz) (libpcap) [TNEF](/TNEF) trace containing two attachments as well as message properties. Also shows some [SMTP](/SMTP), [IMF](/IMF) and [MIME\_multipart](/MIME_multipart) trace.

[wol.pcap](uploads/__moin_import__/attachments/SampleCaptures/wol.pcap) (libpcap) [WakeOnLAN](/WakeOnLAN) sample packets generated from both ether-wake and a Windows-based utility.

[zigbee-join-authenticate.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/zigbee-join-authenticate.pcap.gz) (libpcap) Two devices join a [ZigBee](/ZigBee) network and authenticate with the trust center. Network is encrypted using network keys and trust center link keys.

[IGMP dataset.pcap](uploads/__moin_import__/attachments/SampleCaptures/IGMP-dataset.pcap) (igmp) igmp version 2 dataset

[yami.pcap](uploads/__moin_import__/attachments/SampleCaptures/yami.pcap) (yami) sample packets captured when playing with YAMI4 library

[DHCPv6.pcap](uploads/__moin_import__/attachments/SampleCaptures/DHCPv6.pcap) (dhcpv6) sample dhcpv6 client server transaction solicit(fresh lease)/advertise/request/reply/release/reply.

[dhcpv6_1.pcap](uploads/1b328a71c8c503e5bfdeb2fe143402af/dhcpv6_1.pcap) (dhcpv6) sample dhcpv6 client server transaction solicit(requesting-old-lease)/advertise/request/reply/release/reply.

[ecpri.pcap](uploads/__moin_import__/attachments/SampleCaptures/ecpri.pcap) (libpcap)[eCPRI](/eCPRI) sample file.

[iperf3-udp.pcapng.gz](uploads/__moin_import__/attachments/SampleCaptures/iperf3-udp.pcapng.gz) (pcapng) sample capture for iPerf3 in reverse UDP mode using `iperf3 -u -t 3 -c ping.online.net -p5208 -R`

## ADSL CPE

Here are some captures of the data sent on an ADSL line by the Neufbox 6, the CPE provided by french ISP SFR. Capturing was done by running tcpdump via SSH on the 8/35 ATM VC.

Sensitive informations like passwords, phone numbers, personal IP/MAC addresses... were redacted and replaced by equivalent ones (checksums were recalculated too).

Used protocols includes DHCP, PPP, Ethernet, IP, ARP, L2TP, SIP, RTP, DNS, ICMP, DHCPv6, NTP, IGMPv2, ICMPv6, HTTP, HTTPS, Syslog, RADIUS...

  - [nb6-startup.pcap](uploads/__moin_import__/attachments/SampleCaptures/nb6-startup.pcap) Includes etablishement of IPv4 and IPv6 connections, download of configuration, connection to a VoIP server...

  - [nb6-http.pcap](uploads/__moin_import__/attachments/SampleCaptures/nb6-http.pcap) Three different HTTP requests: first was sent on the private IPv4 network (IPoE), second was sent on the public IPv4 network, third was sent on the public IPv6 network (L2TP tunnel).

  - [nb6-telephone.pcap](uploads/__moin_import__/attachments/SampleCaptures/nb6-telephone.pcap) A brief phone call to SFR's voicemail service.

  - [nb6-hotspot.pcap](uploads/__moin_import__/attachments/SampleCaptures/nb6-hotspot.pcap) Someone connecting to SFR's wireless community network.

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

3GPP **[3gpp\_mc.cap](uploads/__moin_import__/attachments/SampleCaptures/3gpp_mc.cap) (libpcap) 3gpp cn mc interface capture file, include megaco and ranap packet**

### AirTunes

Apple [AirTunes](/AirTunes) protocol as used by [AirPort](/AirPort). See <http://git.zx2c4.com/Airtunes2/about/> [airtunes-1.pcap](uploads/__moin_import__/attachments/SampleCaptures/airtunes-1.pcap)

### Apache Cassandra

[apache-cassandra-cql-v3.pcapng.gz](uploads/__moin_import__/attachments/SampleCaptures/apache-cassandra-cql-v3.pcapng.gz) - CQL binary protocol version 3. Specification at <https://raw.githubusercontent.com/apache/cassandra/cassandra-2.1/doc/native_protocol_v3.spec>.

### ARP/RARP

[arp-storm.pcap](uploads/__moin_import__/attachments/SampleCaptures/arp-storm.pcap) (libpcap) More than 20 ARP requests per second, observed on a cable modem connection.

[rarp\_request.cap](uploads/__moin_import__/attachments/SampleCaptures/rarp_request.cap) (libpcap) A reverse ARP request.

[rarp\_req\_reply.pcap](uploads/__moin_import__/attachments/SampleCaptures/rarp_req_reply.pcap) (pcapng) RARP request and reply.

### Spanning Tree Protocol

[stp.pcap](uploads/8d3d0627231ab1e2fa5d3fe8be2390a7/stp.pcap) (libpcap)

[STP_UplinkFast.pcapng](uploads/204b8eb1a66421c6f9324d4211f6ed45/STP_UplinkFast.pcapng) (pcapng) Cisco STP UplinkFast proxy multicast frames sent to 0100.0ccd.cdcd. This file contains a capture of proxy (also called dummy) multicast frames sent after a root port switchover on behalf of 3 dynamic unicast MAC addresses to update the "upstream" part of the network about the new path toward them. For each of the MAC addresses (001d.e50a.d740, 0800.2774.b2c5, e4be.ede3.f013), the switch sends out 4 frames using the particular MAC address as a source, and the 0100.0ccd.cdcd as a destination, with each frame using a different type: SNAP (OUI 0x00000c, PID 0x0115), AppleTalk (EtherType 0x809b), IPX (EtherType 0x8137), and ARP (EtherType 0x0806). The frame payload is just a stuffing to the minimal frame length; it has no meaning.

### Bluetooth

[l2ping.cap](uploads/__moin_import__/attachments/SampleCaptures/l2ping.cap) (Linux BlueZ hcidump) Contains some [Bluetooth](/Bluetooth) packets captured using hcidump, the packets were from the l2ping command that's included with the Linux BlueZ stack.

[Bluetooth1.cap](uploads/__moin_import__/attachments/SampleCaptures/Bluetooth1.cap) (Linux BlueZ hcidump) Contains some [Bluetooth](/Bluetooth) packets captured using hcidump.

### CredSSP

[ws-cssp.tgz](uploads/8c35b41dcf37fa3dd795e08f73f15991/ws-cssp.tgz) Contains rdp sessions from Windows and freerdp clients, featuring CredSSP over TLS, GSS-KRB5, SPNEGO and U2U (user-to-user). Certificate key and Kerberos keytab included.

### UDP-Lite

Several [UDP-Lite](/UDP-Lite) packets, some correct, some wrong.

[udp\_lite\_full\_coverage\_0.pcap](uploads/__moin_import__/attachments/SampleCaptures/udp_lite_full_coverage_0.pcap) If coverage=0, the full packet is checksummed over.

[udp\_lite\_illegal\_1-7.pcap](uploads/__moin_import__/attachments/SampleCaptures/udp_lite_illegal_1-7.pcap) Coverage values between 1..7 (illegal).

[udp\_lite\_normal\_coverage\_8-20.pcap](uploads/__moin_import__/attachments/SampleCaptures/udp_lite_normal_coverage_8-20.pcap) Normal ones with correct checksums (legal).

[udp\_lite\_illegal\_large-coverage.pcap](uploads/__moin_import__/attachments/SampleCaptures/udp_lite_illegal_large-coverage.pcap) Three traces with coverage lengths greater than the packet length.

[udp\_lite\_checksum\_0.pcap](uploads/__moin_import__/attachments/SampleCaptures/udp_lite_checksum_0.pcap) checksum 0 is illegal.

### NFS Protocol Family

[nfs\_bad\_stalls.cap](uploads/__moin_import__/attachments/SampleCaptures/nfs_bad_stalls.cap) (libpcap) An NFS capture containing long stalls (about 38ms) in the middle of the responses to many read requests. This is useful for seeing the staircase effect in TCP Time Sequence Analysis.

[nfsv2.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/nfsv2.pcap.gz) (libpcap) Fairly complete trace of all [NFS](/NFS) v2 packet types.

[nfsv3.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/nfsv3.pcap.gz) (libpcap) Fairly complete trace of all [NFS](/NFS) v3 packet types.

[klm.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/klm.pcap.gz) (libpcap) A "fake" trace containing all [KLM](/KLM) functions.

[rquota.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/rquota.pcap.gz) (libpcap) A "fake" trace containing all [RQUOTA](/RQUOTA) functions.

[nsm.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/nsm.pcap.gz) (libpcap) A "fake" trace containing all [NSM](/NSM) functions.

[nfsv4.1\_pnfs.cap](uploads/__moin_import__/attachments/SampleCaptures/nfsv4.1_pnfs.cap) NFSv4.1 trace containing pNFS.

### Server Message Block (SMB)/Common Internet File System (CIFS)

[smbtorture.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/smbtorture.cap.gz) (libpcap) Capture showing a wide range of SMB features. The capture was made using the Samba4 smbtorture suite, against a Windows Vista beta2 server.

See [SMB2\#Example\_capture\_files](/SMB2#Example_capture_files) for more captures.

### Legacy Implementations of SMB

[smb-legacy-implementation.pcapng](uploads/__moin_import__/attachments/SampleCaptures/smb-legacy-implementation.pcapng) NetBIOS traffic from Windows for Workgroups v3.11. Shows NetBIOS over LLC and NetBIOS over IPX.

### Browser Elections

[smb-browser-elections.pcapng](uploads/__moin_import__/attachments/SampleCaptures/smb-browser-elections.pcapng) NetBIOS requires that a Master Browser tracks host announcements and responds to Browser Requests. Master Browser a elected by a list of criteria. The role of a master browser should be taken by a stable system, as browser elections can have a serious performance impact. This trace shows the a client with a misconfigured firewall, blocking incoming UDP port 138. Since the client can not find a master browser, it stalls all other systems by repeated browser elections.

### SMB-Locking

[SMB-locking.pcapng.gz](uploads/__moin_import__/attachments/SampleCaptures/SMB-locking.pcapng.gz) (libpcap) SMB and SMB2 support opportunistic locking. Clients can send a lock request. If necessary, the server has to break conflicting locks by sending a lock request to the client. This is a bit unusual: We see requests from the server. A large number of lock requests is usually an indicator for poor performance. If lock requests are made as blocking IOs, users will experience that their application freezes in a seemingly random manner.

### SMB-Direct

[smb-direct-man-in-the-middle-02-reassemble-frames9.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/smb-direct-man-in-the-middle-02-reassemble-frames9.pcap.gz) (libpcap) SMB-Direct over iWarp between two Windows 2012 machines proxied via a port redirector in order to capture the traffic.

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

[200722\_win\_scale\_examples\_anon.pcapng](uploads/__moin_import__/attachments/SampleCaptures/200722_win_scale_examples_anon.pcapng) TCP Window Scaling examples - available, no scaling and missing/unknown.

[200722\_tcp\_anon.pcapng](uploads/__moin_import__/attachments/SampleCaptures/200722_tcp_anon.pcapng) Netcat - string, file and characters.

### MPTCP

[iperf-mptcp-0-0.pcap](uploads/__moin_import__/attachments/SampleCaptures/iperf-mptcp-0-0.pcap) iperf between client and hosts with 2 interfaces and the linux implementation. There are 4 subflows, 2 of them actually successfully connected.

[redundant\_stream1.pcapng](uploads/__moin_import__/attachments/SampleCaptures/redundant_stream1.pcapng) iperf with a redundant scheduler, i.e., the same data is sent across several subflows at the same time. Enable all the MPTCP options and you should be able to see Wireshark detect reinjections across subflows. For instance try the filter "tcp.options.mptcp.rawdataseqno == 1822294653": you should see 3 packets sending the same data on 3 different TCP connections.

[mptcp\_v1.pcapng](uploads/__moin_import__/attachments/SampleCaptures/mptcp_v1.pcapng) This pcap was generated with the kernel 5.6 and shows the version 1 of MPTCP.

### Parallel Virtual File System (PVFS)

[pvfs2-sample.pcap](uploads/__moin_import__/attachments/SampleCaptures/pvfs2-sample.pcap) (libpcap) PVFS2 copy operation (local file to PVFS2 file system)

### HyperText Transport Protocol (HTTP)

[http.cap](uploads/27707187aeb30df68e70c8fb9d614981/http.cap) A simple HTTP request and response.

[http\_gzip.cap](uploads/__moin_import__/attachments/SampleCaptures/http_gzip.cap) A simple HTTP request with a one packet gzip Content-Encoded response.

[http-chunked-gzip.pcap](uploads/__moin_import__/attachments/SampleCaptures/http-chunked-gzip.pcap) A single HTTP request and response for www.wireshark.org (proxied using socat to remove SSL encryption). Response is gzipped and used chunked encoding. Added in January 2016.

[http\_with\_jpegs.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/http_with_jpegs.cap.gz) A simple capture containing a few JPEG pictures one can reassemble and save to a file.

[tcp-ethereal-file1.trace](uploads/__moin_import__/attachments/SampleCaptures/tcp-ethereal-file1.trace) (libpcap) A large POST request, taking many TCP segments.

[tcp-ecn-sample.pcap](uploads/__moin_import__/attachments/SampleCaptures/tcp-ecn-sample.pcap) A sample TCP/HTTP of a file transfer using ECN (Explicit Congestion Notification) feature per RFC3168. Frame 48 experienced Congestion Encountered.

[http\_redirects.pcapng](uploads/__moin_import__/attachments/SampleCaptures/http_redirects.pcapng) A sample TCP/HTTP with many 302 redirects per RFC 3986 ( <https://tools.ietf.org/html/rfc3986#section-5.4>).

For captures using SSL/TLS, see [\#SSL\_with\_decryption\_keys](/SampleCaptures#ssl-with-decryption-keys).

### Telnet

[telnet-cooked.pcap](uploads/__moin_import__/attachments/SampleCaptures/telnet-cooked.pcap) (libpcap) A telnet session in "cooked" (per-line) mode.

[telnet-raw.pcap](uploads/__moin_import__/attachments/SampleCaptures/telnet-raw.pcap) (libpcap) A telnet session in "raw" (per-character) mode.

### TFTP

[tftp\_rrq.pcap](uploads/__moin_import__/attachments/SampleCaptures/tftp_rrq.pcap) (libpcap) A TFTP Read Request.

[tftp\_wrq.pcap](uploads/__moin_import__/attachments/SampleCaptures/tftp_wrq.pcap) (libpcap) A TFTP Write Request.

### UFTP

[UFTP\_v3\_transfer.pcapng](uploads/__moin_import__/attachments/SampleCaptures/UFTP_v3_transfer.pcapng) (pcapng) An UFTP v3 file transfer (unencrypted).

[UFTP\_v4\_transfer.pcapng](uploads/__moin_import__/attachments/SampleCaptures/UFTP_v4_transfer.pcapng) (pcapng) An UFTP v4 file transfer (unencrypted).

[UFTP\_v5\_transfer.pcapng](uploads/__moin_import__/attachments/SampleCaptures/UFTP_v5_transfer.pcapng) (pcapng) An UFTP v5 file transfer (unencrypted and encrypted).

### Routing Protocols

[bgp.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/bgp.pcap.gz) (libpcap) BGP packets, including AS path attributes.

[bgp\_shutdown\_communication.pcap](uploads/__moin_import__/attachments/SampleCaptures/bgp_shutdown_communication.pcap) (libpcap) Sample packet for BGP Shutdown communication <https://tools.ietf.org/html/draft-ietf-idr-shutdown-01>.

[bgpsec.pcap](uploads/__moin_import__/attachments/SampleCaptures/bgpsec.pcap) (libpcap) Sample BGPsec OPEN and UPDATE messages. See <https://tools.ietf.org/html/rfc8205> for the protocol specification and <https://tools.ietf.org/html/rfc8208#appendix-A> for more packet examples.

[bmp.pcap](uploads/__moin_import__/attachments/SampleCaptures/bmp.pcap) (libpcap) BGP Monitoring Protocol, including Init, Peer Up, Route Monitoring

[EIGRP\_Neighbors.cap](uploads/__moin_import__/attachments/SampleCaptures/EIGRP_Neighbors.cap) Two Cisco EIGRP peers forming an adjacency.

[eigrp-for-ipv6-auth.pcap](uploads/__moin_import__/attachments/SampleCaptures/eigrp-for-ipv6-auth.pcap) Cisco EIGRP packets, including Authentication TLVs

[eigrp-for-ipv6-stub.pcap](uploads/__moin_import__/attachments/SampleCaptures/eigrp-for-ipv6-stub.pcap) Cisco EIGRP packets, including Stub routing TLVs

[eigrp-for-ipv6-updates.pcap](uploads/__moin_import__/attachments/SampleCaptures/eigrp-for-ipv6-updates.pcap) Cisco EIGRP packets, including IPv6 internal and external route updates

[eigrp-ipx.pcap](uploads/__moin_import__/attachments/SampleCaptures/eigrp-ipx.pcap) Cisco EIGRP packets, including IPX internal and external route updates

[ipv6-ripng.gz](uploads/__moin_import__/attachments/SampleCaptures/ipv6-ripng.gz) (libpcap) RIPng packets (IPv6)

[ospf.cap](uploads/__moin_import__/attachments/SampleCaptures/ospf.cap) (libpcap) Simple OSPF initialization.

[ospf-md5.cap](uploads/__moin_import__/attachments/SampleCaptures/ospf-md5.cap) (libpcap) Simple OSPF-MD5 Authentication.

[RIP\_v1](uploads/__moin_import__/attachments/SampleCaptures/RIP_v1) A basic route exchange between two RIP v1 routers.

### SNMP

[b6300a.cap](uploads/__moin_import__/attachments/SampleCaptures/b6300a.cap) A collection of SNMP GETs and RESPONSEs

[snmp\_usm.pcap](uploads/__moin_import__/attachments/SampleCaptures/snmp_usm.pcap) A series of authenticated and some encrypted SNMPv3 PDUS

  - the authPassword for all users is pippoxxx and the privPassword is PIPPOxxx.
  - pippo uses MD5 and DES
  - pippo2 uses SHA1 and DES
  - pippo3 uses SHA1 and AES
  - pippo4 uses MD5 and AES

### Network Time Protocol

File: **[NTP\_sync.pcap](uploads/__moin_import__/attachments/SampleCaptures/NTP_sync.pcap) (4KB, showing the [NetworkTimeProtocol](/NetworkTimeProtocol))  
**Contributor: **Gerald Combs  
**Description: **After reading about the round robin [DNS](/DNS) records set up by the folks at [pool.ntp.org](http://www.pool.ntp.org), I decided to use their service to sync my laptop's clock. The attached file contains the result of running**

**net time /setsntp:us.pool.ntp.org  
net stop w32time  
net start w32time**

at the command prompt. Something to note is that each pool.ntp.org DNS record contains multiple addresses. The Windows time client appears to query all of them.

[MicrosoftNTP.cap](uploads/__moin_import__/attachments/SampleCaptures/MicrosoftNTP.cap) (Microsoft Network Monitor) 2 Packets containing a synchronisation to the Microsoft NTP server.

### SyncE Protocol

**File:** [SyncE\_bidirectional.pcapng](uploads/__moin_import__/attachments/SampleCaptures/SyncE_bidirectional.pcapng) (1.5KB, showing the [syncE](/syncE) protocol)  
**Contributor:** [RadhaKrishna](/RadhaKrishna). courtesy:Karsten, RAD, Germany  
**Description:** SyncE is a synchronization mechanism for Ethernet networks. This mechanism uses SSM packets to qualify the synchronization signal quality.

### PostgreSQL v3 Frontend/Backend Protocol

File: **[pgsql.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/pgsql.cap.gz) (2KB, showing a brief [PostgresProtocol](/PostgresProtocol) session)  
**Contributor: **Abhijit Menon-Sen  
**

File: **[pgsql-jdbc.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/pgsql-jdbc.pcap.gz) (584KB, showing a PostgreSQL JDBC test session)  
**Contributors: **Kris Jurka and Abhijit Menon-Sen  
**

### MySQL protocol

File: **[mysql\_complete.pcap](uploads/__moin_import__/attachments/SampleCaptures/mysql_complete.pcap) (6 KB, from bug 2691)**

For MySQL captures using SSL, see [\#SSL\_with\_decryption\_keys](/SampleCaptures#ssl-with-decryption-keys).

### MS SQL Server protocol - Tabular Data Stream (TDS)

[ms-sql-tds-rpc-requests.cap](uploads/__moin_import__/attachments/SampleCaptures/ms-sql-tds-rpc-requests.cap) (17 KB) RPC requests and a few SQL queries  
Contributor: Emil Wojak  

### Netgear NSDP

[ndsp\_v2.pcapng.gz](uploads/__moin_import__/attachments/SampleCaptures/ndsp_v2.pcapng.gz) <https://en.wikipedia.org/wiki/Netgear_NSDP> upload a new Firmware via Netgear [SmartUtility](/SmartUtility). Switch Netgear GS748Tv3 is 192.168.0.239.

### VendorLanProtocolFamily

Extreme Networks

[edp.trace.gz](uploads/__moin_import__/attachments/SampleCaptures/edp.trace.gz) General EDP traffic

[edp1.trace.gz](uploads/__moin_import__/attachments/SampleCaptures/edp1.trace.gz)

[edp.esrp.gz](uploads/__moin_import__/attachments/SampleCaptures/edp.esrp.gz) EDP/ESRP traffic

[edp.eaps.mirror1.trace.gz](uploads/__moin_import__/attachments/SampleCaptures/edp.eaps.mirror1.trace.gz)

[edp.eaps.mirror2.trace.gz](uploads/__moin_import__/attachments/SampleCaptures/edp.eaps.mirror2.trace.gz)

\===Cisco===

[cdp.pcap](uploads/__moin_import__/attachments/SampleCaptures/cdp.pcap) CDP v2 frame from a Cisco router.

[cdp\_v2.pcap](uploads/__moin_import__/attachments/SampleCaptures/cdp_v2.pcap) CDP v2 frame from a Cisco switch.

[DTP.pcapng](uploads/__moin_import__/attachments/SampleCaptures/DTP.pcapng) DTP frames from a Cisco switch.

[cdp-BCM1100.cap](uploads/__moin_import__/attachments/SampleCaptures/cdp-BCM1100.cap)

Mikrotiks [mndp.pcap](uploads/__moin_import__/attachments/SampleCaptures/mndp.pcap)

### DECT

[dump\_2009-02-02\_23\_17\_18\_RFPI\_00\_4e\_b4\_bd\_50.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/dump_2009-02-02_23_17_18_RFPI_00_4e_b4_bd_50.pcap.gz) A trace of an unencrypted DECT phonecall with the original Ethernet pseudoheader (see README.DECT). Called number 0800-1507090 (DTMF only?)

### Sigtran Protocol Family

Captures of protocols belonging to the [SIGTRAN](/SIGTRAN) family.

[isup.cap](uploads/__moin_import__/attachments/SampleCaptures/isup.cap) A single call's signalling sequence using ISUP/MTP3/M3UA/SCTP/IP. NOTE: The M3UA version preference must be set to "Draft 6" to successfully view this file (Edit-\>Preferences-\>Protocols-\>M3UA-\>M3UA Version-\>Internet Draft version 6).

[isup\_load\_generator.pcap](uploads/__moin_import__/attachments/SampleCaptures/isup_load_generator.pcap) ISUP/MTP3/MTP2 made by a call load generator and captured from an E1 line. The capture includes the frame check sequence at the end of each packet.

[bicc.pcap](uploads/__moin_import__/attachments/SampleCaptures/bicc.pcap) Sample [BICC](/BICC) PDUs.

[camel.pcap](uploads/__moin_import__/attachments/SampleCaptures/camel.pcap) A single call using CAMEL/TCAP/SCCP/MTP3/M2UA/SCTP/IP. This "capture" has been generated using [text2pcap](http://www.wireshark.org/docs/man-pages/text2pcap.1.html) tool, from MTP3 raw data trace. The capture contains the following Camel operations: InitialDP, RequestReportBCSMEvent, ApplyCharging, Continue, EventReportBCSM, ApplyChargingReport, ReleaseCall.

[camel2.pcap](uploads/__moin_import__/attachments/SampleCaptures/camel2.pcap) Same as camel.pcap capture, except that the it is using another Camel phase. The other difference is that the call is rejected. The capture contains the following Camel operations: InitialDP, RequestReportBCSMEvent, Connect, [ReleaseCall](/ReleaseCall).

[gsm\_map\_with\_ussd\_string.pcap](uploads/__moin_import__/attachments/SampleCaptures/gsm_map_with_ussd_string.pcap) This "capture" has been generated using [text2pcap](http://www.wireshark.org/docs/man-pages/text2pcap.1.html) tool, from MTP3 raw data trace. It contains a GSM MAP processUnstructuredSS-Request MAP operation with a USSD String (GSM 7 bit encoded).

[ansi\_map\_ota.pcap](uploads/__moin_import__/attachments/SampleCaptures/ansi_map_ota.pcap) ANSI MAP OTA trace.

[ansi\_map\_win.pcap](uploads/__moin_import__/attachments/SampleCaptures/ansi_map_win.pcap) ANSI MAP over ANSI MTP3 with WIN messages.

[packlog-example.cap](uploads/__moin_import__/attachments/SampleCaptures/packlog-example.cap) Example capture of Cisco ITP's Packet Logging Facility packets (SS7 MSU encapsulated in syslog messages). It contains a few random MSUs: MTP3MG, TCAP and GSM\_MAP. There aren't any complete dialogs in the capture.

[japan\_tcap\_over\_m2pa.pcap](uploads/__moin_import__/attachments/SampleCaptures/japan_tcap_over_m2pa.pcap) Example of TCAP over Japan SCCP/MTP over M2PA (RFC version).

[ansi\_tcap\_over\_itu\_sccp\_over\_mtp3\_over\_mtp2.pcap](uploads/__moin_import__/attachments/SampleCaptures/ansi_tcap_over_itu_sccp_over_mtp3_over_mtp2.pcap) Example of ANSI TCAP carried over ITU SCCP/MTP3/MTP2. Really this should be in an "SS7" section of the SampleCaptures page.

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

[SIP\_CALL\_RTP\_G711](uploads/__moin_import__/attachments/SampleCaptures/SIP_CALL_RTP_G711) Sample SIP call with RTP in G711.

[SIP\_DTMF2.cap](uploads/__moin_import__/attachments/SampleCaptures/SIP_DTMF2.cap) Sample SIP call with RFC 2833 DTMF

[DTMFsipinfo.pcap](uploads/__moin_import__/attachments/SampleCaptures/DTMFsipinfo.pcap) Sample SIP call with SIP INFO DTMF

[h223-over-rtp.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/h223-over-rtp.pcap.gz) (libpcap) A sample of H.223 running over RTP, following negotiation over SIP.

[h263-over-rtp.pcap](uploads/__moin_import__/attachments/SampleCaptures/h263-over-rtp.pcap) (libpcap) A sample of RFC 2190 H.263 over RTP, following negotiation over SIP.

[metasploit-sip-invite-spoof.pcap](uploads/__moin_import__/attachments/SampleCaptures/metasploit-sip-invite-spoof.pcap) Metasploit 3.0 SIP Invite spoof capture.

[FAX-Call-t38-CA-TDM-SIP-FB-1.pcap](uploads/__moin_import__/attachments/SampleCaptures/FAX-Call-t38-CA-TDM-SIP-FB-1.pcap) Fax call from TDM to SIP over Mediagateway with declined T38 request, megaco H.248.

[Asterisk\_ZFONE\_XLITE.pcap](uploads/__moin_import__/attachments/SampleCaptures/Asterisk_ZFONE_XLITE.pcap) Sample SIP call with ZRTP protected media.

[MagicJack+ Power On sequence](uploads/__moin_import__/attachments/SampleCaptures/MagicJack-_pwr_up.pcap "Upload new attachment \"MagicJack+_pwr_up.pcap\"") SIP and RTP traffic generated by power on the MagicJack+

[MagicJack+ short test call](uploads/__moin_import__/attachments/SampleCaptures/MagicJack-_short_call.pcap "MagicJack+ short test call") A complete telephone call example

[sip-rtp-opus-hybrid.pcap](uploads/1868d73fee89fce9d77c6ba21929e773/sip-rtp-opus-hybrid.pcap) SIP and OPUS hybrid payloads, include OPUS-multiple frames packets.

[rtp-opus-only.pcap](uploads/1d5d8e249b46a446eaecc7970b8d129d/rtp-opus-only.pcap) RTP Opus payloads only (without SIP/SDP).

SIP calls between SIPp ([scenario file](https://git.lekensteyn.nl/peter/wireshark-notes/tree/sipsim/uac_media.xml)) and FreeSWITCH 1.6.12, playing [ivr-on\_hold\_indefinitely.wav](https://freeswitch.org/stash/projects/FS/repos/freeswitch-sounds/commits/d55f6602be073fda2138febf286954ad125c6878#sounds/trunk/fr/ca/june/48000/ivr/ivr-on_hold_indefinitely.wav) in one direction using various codecs:

  - [sip-rtp-dvi4.pcap](uploads/__moin_import__/attachments/SampleCaptures/sip-rtp-dvi4.pcap)

  - [sip-rtp-g711.pcap](uploads/__moin_import__/attachments/SampleCaptures/sip-rtp-g711.pcap) - has both G.711A (PCMA) and G.711U (PCMU)

  - [sip-rtp-g722.pcap](uploads/__moin_import__/attachments/SampleCaptures/sip-rtp-g722.pcap)

  - [sip-rtp-g726.pcap](uploads/__moin_import__/attachments/SampleCaptures/sip-rtp-g726.pcap) - has eight variants: (AAL2-)G726-16/24/40/40

  - [sip-rtp-gsm.pcap](uploads/__moin_import__/attachments/SampleCaptures/sip-rtp-gsm.pcap)

  - [sip-rtp-ilbc.pcap](uploads/__moin_import__/attachments/SampleCaptures/sip-rtp-ilbc.pcap)

  - [sip-rtp-l16.pcap](uploads/__moin_import__/attachments/SampleCaptures/sip-rtp-l16.pcap) - four variants: 8000/2, 16000/2, 11025, 48000

  - [sip-rtp-lpc.pcap](uploads/__moin_import__/attachments/SampleCaptures/sip-rtp-lpc.pcap)

  - [sip-rtp-opus.pcap](uploads/__moin_import__/attachments/SampleCaptures/sip-rtp-opus.pcap) - Opus mono session with 48kHz clock rate

  - [sip-rtp-speex.pcap](uploads/__moin_import__/attachments/SampleCaptures/sip-rtp-speex.pcap) - three sample rates: 8/16/32kHz

  - [sip-rtp-g729a.pcap](uploads/__moin_import__/attachments/SampleCaptures/sip-rtp-g729a.pcap)

[sip-tls-1.3-and-rtcp.zip](uploads/__moin_import__/attachments/SampleCaptures/sip-tls-1.3-and-rtcp.zip) SIP call over TLS 1.3 transport with enabled RTCP. Used [openssl 1.1.1 prerelease version](https://github.com/openssl/openssl/commit/bdcacd93b14ed7381a922b41d74c481224ef9fa1)

### RTSP Protocol

Here's a few RTSP packets in Microsoft Network Monitor format: [RTSPPACKETS1.cap](uploads/__moin_import__/attachments/SampleCaptures/RTSPPACKETS1.cap)

[rtsp\_with\_data\_over\_tcp.cap](uploads/__moin_import__/attachments/SampleCaptures/rtsp_with_data_over_tcp.cap) (libpcap) An RTSP reply packet.

### H.223

[h223-over-iax.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/h223-over-iax.pcap.gz) (libpcap) A sample of H.223 running over IAX, including H.263 and AMR payloads.

[h223-over-tcp.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/h223-over-tcp.pcap.gz) (libpcap) A sample of H.223 running over TCP. You'll need to select 'Decode as... H.223'.

[h223-over-rtp.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/h223-over-rtp.pcap.gz) (libpcap) A sample of H.223 running over RTP, following negotiation over SIP.

### H.265/HEVC

[1920x1080\_H.265.pcapng](uploads/__moin_import__/attachments/SampleCaptures/1920x1080_H.265.pcapng) (libpcap) A sample of H.265 running over RTP, following negotiation over RTSP.

### MGCP

[MGCP.pcap](uploads/__moin_import__/attachments/SampleCaptures/MGCP.pcap) (libpcap) A sample of the Media Gateway Control Protocol (MGCP).

### USB Raw (dlt 186)

[VariousUSBDevices.pcap](uploads/__moin_import__/attachments/SampleCaptures/VariousUSBDevices.pcap) (libpcap) Various USB devices on a number of busses

Usb packets exchanged while unpluggin and replugging a mouse: [mouse\_replug2.pcap](uploads/__moin_import__/attachments/SampleCaptures/mouse_replug2.pcap)

[usbstick3.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/usbstick3.pcap.gz) (libpcap) Plug in a USB2.0 stick, mount it, list the contents.

[usbhub.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/usbhub.pcap.gz) (libpcap) Plug in a usb2.0 4-port hub without external powersupply, plugin a logitech presenter into one of the ports, press a button, unplug presenter, unplug hub. Repeat with externally powered hub.

### USB with Linux encapsulation (dlt 189)

[usb\_memory\_stick.pcap](uploads/__moin_import__/attachments/SampleCaptures/usb_memory_stick.pcap) Plug in an usb stick and mount it

[usb\_memory\_stick\_create\_file.pcap](uploads/__moin_import__/attachments/SampleCaptures/usb_memory_stick_create_file.pcap) Create a new file in a previusly mounted memory stick and write some text into it

[usb\_memory\_stick\_delete\_file.pcap](uploads/__moin_import__/attachments/SampleCaptures/usb_memory_stick_delete_file.pcap) Delete the file previusly created from the memory stick.

[Bluetooth\_HCI\_and\_OBEX\_Transaction\_over\_USB.ntar.gz](uploads/__moin_import__/attachments/SampleCaptures/Bluetooth_HCI_and_OBEX_Transaction_over_USB.ntar.gz) contains a Bluetooth session (including connecting the USB adaptor used, pairing with a mobile phone, receiving a file over RFCOMM/L2CAP/OBEX, and finally removing the USB Bluetooth adaptor) over USB

[xrite-i1displaypro-argyllcms-1.9.2-spotread.pcapng](uploads/__moin_import__/attachments/SampleCaptures/xrite-i1displaypro-argyllcms-1.9.2-spotread.pcapng) ArgyllCMS 1.9.2 making a single measurement (spotread) using an X-Rite i1 Display Pro color sensor. Some other sensors, such as the near-identical ColorMunki Display, use the same protocol.

### USB with USBPcap encapsulation

[usb\_u3v\_sample.pcapng](uploads/__moin_import__/attachments/SampleCaptures/usb_u3v_sample.pcapng) Sample control and video traffic with a USB3Vision camera

[xrite-i1displaypro-i1profiler.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/xrite-i1displaypro-i1profiler.pcap.gz) X-Rite i1Profiler v1.6.6.19864 measuring a display profile using an X-Rite i1 Display Pro color sensor, captured using USBPcap 1.0.0.7. Some other sensors, such as the near-identical ColorMunki Display, use the same protocol.

### USB Link Layer

[SB1240-via-hub\_usbll.7z](uploads/__moin_import__/attachments/SampleCaptures/SB1240-via-hub_usbll.7z) USB Audio class device SB1240 (Full-Speed) connected via High-Speed USB Hub to host. Contains simultaneous captures on the HS link between Hub and Host, FS link between SB1240 and Hub and usbmon capture on the USB Host.

[STM32L053-Nucleo-via-hub.7z](uploads/__moin_import__/attachments/SampleCaptures/STM32L053-Nucleo-via-hub.7z) Composite device (ST-LINK Vendor specific protocol, Mass Storage class, CDC Class) STM32L053 Nucleo (Full-Speed) connected via High-Speed USB Hub to host. Contains simultaneous captures on the HS link between Hub and Host, FS link between SB1240 and Hub and usbmon capture on the USB Host. Only the Mass Storage class interface was actively used.

[USBMSC-USBLL.7z](uploads/36d216660e18783c8d2229ddc372f746/USBMSC-USBLL.7z) USB memory stick connected and mounted on Windows. Includes both link layer capture and matching USBPcap capture.

### FreeBSD usbdump format file

[test.usbdump](uploads/__moin_import__/attachments/SampleCaptures/test.usbdump) Sample FreeBSD usbdump capture file.

### WAP Protocol Family

[WAP\_WBXML\_Provisioning\_Push.pcap](uploads/__moin_import__/attachments/SampleCaptures/WAP_WBXML_Provisioning_Push.pcap) contains a [WSP](/WSP) Push PDU with a Client Provisioning document encoded in [WBXML](/WBXML). This example comes from the WAP Provisioning specifications.

[wap\_google.pcap](uploads/__moin_import__/attachments/SampleCaptures/wap_google.pcap) contains two [WSP](/WSP) request-response dialogs.

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

[ldap-ssl.pcapng](uploads/__moin_import__/attachments/SampleCaptures/ldap-ssl.pcapng) Encrypted LDAP traffic, see [\#SSL\_with\_decryption\_keys](/SampleCaptures#ssl-with-decryption-keys) for more details.

### Link Layer Discovery Protocol (LLDP)

[lldp.minimal.pcap](uploads/__moin_import__/attachments/SampleCaptures/lldp.minimal.pcap) (libpcap) Simple LLDP packets.

[lldp.detailed.pcap](uploads/__moin_import__/attachments/SampleCaptures/lldp.detailed.pcap) (libpcap) LLDP packets with more details.

[lldpmed\_civicloc.pcap](uploads/__moin_import__/attachments/SampleCaptures/lldpmed_civicloc.pcap) (libpcap) LLDP-MED packet with TLV entries, including civic address location ID, network policy and extended power-via-MDI.

[D-Link Ethernet Switch Smart Console Utility LLDP](uploads/__moin_import__/attachments/SampleCaptures/D-Link-Ethernet-Switch-Smart-Console-Utility-LLDP "Upload new attachment \"D-Link Ethernet Switch Smart Console Utility LLDP\"") (libpcap) D-Link LLDP [SmartConsole](/SmartConsole) Utility.

### SAN Protocol Captures (iSCSI, ATAoverEthernet, FibreChannel, SCSI-OSD and other SAN related protocols)

[iscsi-scsi-data-cdrom.zip](uploads/__moin_import__/attachments/SampleCaptures/iscsi-scsi-data-cdrom.zip) contains a complete log of iSCSI traffic between MS iSCSI Initiator and Linux iSCSI Enterprise Target with a real SCSI CD-ROM exported. The CD-ROM has a Fedora Core 3 installation CD in it.

[iscsi-scsi-10TB-data-device.zip](uploads/__moin_import__/attachments/SampleCaptures/iscsi-scsi-10TB-data-device.zip) contains a complete log of iSCSI traffic between MS iSCSI Initiator and Linux iSCSI Enterprise Target with a 10TB block device exported. See the use of READ\_CAPACITY\_16, READ\_16, and WRITE\_16.

[iscsi-tapel.gz](uploads/__moin_import__/attachments/SampleCaptures/iscsi-tapel.gz) contains some operation log of iSCSI traffic between Linux open-iscsi initiator and Linux iSCSI Enterprise Target. The target is a EXABYTE EXB480 Tape library. Various mtx operations are executed.

[fcip\_trace.cap](uploads/__moin_import__/attachments/SampleCaptures/fcip_trace.cap) from <http://www.wireshark.org/lists/ethereal-dev/200212/msg00080.html> containing fcip traffic but unfortunately no SCSI over FCP over FCIP

[fcoe-t11.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/fcoe-t11.cap.gz) has the FCoE encapsulation, showing a host adapter doing fabric and port logins, discovery and SCSI Inquiries, etc. This uses the August 2007 T11 converged frame format.

[fcoe1.cap](uploads/__moin_import__/attachments/SampleCaptures/fcoe1.cap) has a similar set of frames using an older FCoE frame format proposed prior to the August 2007 version.

[fcoe-t11-short.cap](uploads/__moin_import__/attachments/SampleCaptures/fcoe-t11-short.cap) is a trace of part of a SCSI write with only the first 64 bytes of each frame captured.

[fcoe-drop-rddata.cap](uploads/__moin_import__/attachments/SampleCaptures/fcoe-drop-rddata.cap) is a trace of a SCSI read with REC and SRR recovery performed.

FIP is the FCoE Initialization Protocol. [fip-adv.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/fip-adv.cap.gz) shows advertisement, discovery and FLOGI. [fip-ka.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/fip-ka.cap.gz) shows keep-alives and a clear-virtual-link. Note that the host and gateway are not necessarily using FIP correctly.

[scsi-osd-example-001.pcap](uploads/__moin_import__/attachments/SampleCaptures/scsi-osd-example-001.pcap) is a trace of the IBM osd\_initiator\_3\_1\_1 (an OSD tester application) exercising IBM's ibm-osd-sim (an emulation of an OSD target device). The transport involved is iSCSI, and makes use of the relatively unusual new SCSI feature of bidirectional data transfer. The trace captures the initial iSCSI Logins, through INQUIRY and REPORT LUNS, followed by a number of commands from the SCSI-OSD command set such as FORMAT OSD, LIST, CREATE PARTITION, CREATE, WRITE, READ, REMOVE, REMOVE PARTITION, and SET ROOT KEY.

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

[smpp.cap](uploads/__moin_import__/attachments/SampleCaptures/smpp.cap) (libpcap) An SMPP capture showing a Bind\_transmitter, Submit\_sm and Unbind request flow.

### Kaspersky Update Protocol

Some examples of packets used by the Kaspersky AntiVirus Updater: [KasperskyPackets.CAP](uploads/__moin_import__/attachments/SampleCaptures/KasperskyPackets.CAP)

### Kerberos and keytab file for decryption

[krb-816.zip](uploads/__moin_import__/attachments/SampleCaptures/krb-816.zip) An example of Kerberos traffic when 2 users logon domain from a Windows XP. keytab file is included. With Kerberos decryption function in wireshark 0.10.12, some encrypted data can be decrypted.

[kpasswd\_tcp.cap](uploads/__moin_import__/attachments/SampleCaptures/kpasswd_tcp.cap) An example of a Kerberos password change, sent over TCP.

[kerberos-Delegation.zip](uploads/__moin_import__/attachments/SampleCaptures/kerberos-Delegation.zip) An example of Kerberos Delegation in Windows Active Diretory.Keytaf file is also included.Please use Wireshark 0.10.14 SVN 17272 or above to open the trace.

[constained-delegation.zip](uploads/__moin_import__/attachments/SampleCaptures/constained-delegation.zip) An example of Kerberos constrained delegation (s4U2Proxy) in Windows 2003 domain.

[win\_s4u2self.pcap](uploads/__moin_import__/attachments/SampleCaptures/win_s4u2self.pcap) An example of Kerberos protocol transition (s4U2Self) with W2k8 server and Win7 client (no keys).

[s4u2self\_with\_keys.tgz](uploads/__moin_import__/attachments/SampleCaptures/s4u2self_with_keys.tgz) Another example of Kerberos protocol transition (s4U2Self) with W2k16 server and MIT client (with keys).

[S4U2Self\_with\_certificate.tgz](uploads/__moin_import__/attachments/SampleCaptures/S4U2Self_with_certificate.tgz) Kerberos protocol transition (s4U2Self) using X509 certificate (with keys).

[rbcd\_win\_with\_keys.tgz](uploads/__moin_import__/attachments/SampleCaptures/rbcd_win_with_keys.tgz) Kerberos s4U2Proxy resource-based-constrained-delegation (with keys).

[rbcd\_win\_two\_transits\_with\_keys.tgz](uploads/__moin_import__/attachments/SampleCaptures/rbcd_win_two_transits_with_keys.tgz) Kerberos s4U2Proxy resource-based-constrained-delegation two transit (with keys).

[krb5\_tgs\_fast.tgz](uploads/__moin_import__/attachments/SampleCaptures/krb5_tgs_fast.tgz) Kerberos TGS with FAST padata.

### mDNS & Apple Rendezvous

ZIP Compressed mDNS (Apple Rendezvous) Dumps - MS [NetMon](/NetMon) Format: [mDNS1.zip](uploads/__moin_import__/attachments/SampleCaptures/mDNS1.zip)

### Point-To-Point (PPP)

[PPPHandshake.cap](uploads/__moin_import__/attachments/SampleCaptures/PPPHandshake.cap) PPP Handshake using Microsoft Windows VPN - MS [NetMon](/NetMon) Format

[PPP-config.cap](uploads/__moin_import__/attachments/SampleCaptures/PPP-config.cap) LCP and IPCP configuration of a Direct Cable Connection (WinXP)

[ppp-dialup-munged.pppd](uploads/__moin_import__/attachments/SampleCaptures/ppp-dialup-munged.pppd) Linux pppd async dialup connect/disconnect; (The capture file generated by pppd has been munged slightly to hide login info, thus certain HDLC checksums are incorrect)

[ppp\_lcp\_ipcp.pcap](uploads/__moin_import__/attachments/SampleCaptures/ppp_lcp_ipcp.pcap) PPP LCP and IPCP traffic w/a protocol reject for CCP.

### Point-To-Point over Ethernet

File: [telecomitalia-pppoe.pcap](uploads/__moin_import__/attachments/SampleCaptures/telecomitalia-pppoe.pcap)

PPPoE exchange between a Telecom Italia ADSL CPE and one of their Juniper (ex-Unisphere) BNASes.

1.  CPE sends a discovery initiation frame (PADI) and receives an offer (PADO).
2.  CPE sends an authentication request with dummy credentials "aliceadsl" both for username and password. These are useless, since the actual authentication is performed thanks to the DSLAM intercepting the PPPoE discovery frames and adding in a Circuit-ID/NAS-Port-ID tag, which is unique for the customer DSLAM port. This tag is then verified against a RADIUS server on Telecom Italia's premises. This process is hidden and transparent to the user and cannot be shown here.
3.  Post-authentication, our CPE receives back IPCP messages containing configuration information, such as public IP, default gateway and DNS configuration.
4.  We're now on the Internet. PPP LCP Echo requests and Echo replies are sent as session keep-alive check.

Contributed by [Lorenzo Cafaro](https://github.com/lcafaro).

### X.400

These captures exercise the Session (SES), Presentation(PRES), Assocation Control (ACSE), Reliable Transfer (RTSE), Remote Operations (ROSE), X.400 P1 Transfer (X411), X.400 Information Object [X420](/X420) and STANAG 4406 [S4406](/S4406) dissectors.

Contributor: **Graeme Lunt**

File: **[x400-ping-refuse.pcap](uploads/__moin_import__/attachments/SampleCaptures/x400-ping-refuse.pcap) (2KB)  
**Description: **An X.400 bind attempt using RTS in normal mode generating an authentication error from the responder.**

File: **[x400-ping-success.pcap](uploads/__moin_import__/attachments/SampleCaptures/x400-ping-success.pcap) (2KB)  
**Description: **An X.400 bind attempt using RTS in normal mode with a bind result from the responder.**

File: **[p772-transfer-success.pcap](uploads/__moin_import__/attachments/SampleCaptures/p772-transfer-success.pcap) (4KB)  
**Description: **An X.400 bind attempt using RTS in normal mode with a bind result from the responder, and then the successful transfer of a P772 message.**

### Direct Message Protocol

Contributor: **Stig Bjorlykke**

File: **[dmp-examples.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/dmp-examples.pcap.gz) (667B)  
**Description: **Some example [DMP](/DMP) messages. Note that the examples uses port number 24209, which must be configured in the protocol page.**

### STANAG 5066 SIS

These captures show a succeful and unsuccesful transfer of a simple line of text with STANAG 5066 Subnetwork Interface Sublayer (S5066\_SIS).

Contributor: **Menno Andriesse**

File: **[S5066-HFChat-1.pcap](uploads/__moin_import__/attachments/SampleCaptures/S5066-HFChat-1.pcap) (4KB)  
**Description: **A line of text is send and acknowledged**

File: **[S5066-HFChat-Rejected.pcap](uploads/__moin_import__/attachments/SampleCaptures/S5066-HFChat-Rejected.pcap) (2KB)  
**Description: **A line of text is send and rejected because the other node does not respond.**

Contributor: **Taner Kurtulus**

File: **[S5066-Expedited.pcap](uploads/__moin_import__/attachments/SampleCaptures/S5066-Expedited.pcap) (2KB)  
**Description: **A line of text is sent/received with Expedited S\_Prims and confirmed**

### STANAG 5066 DTS

These captures show a successful BFTP transfer over a hardlink between two peers.  
  
Contributor: **İbrahim Can Yüce**

File: **[Stanag5066-TCP-ENCAP-Bftp-Exchange-tx-rx.pcapng](uploads/__moin_import__/attachments/SampleCaptures/Stanag5066-TCP-ENCAP-Bftp-Exchange-tx-rx.pcapng)**  
Description: **BFTP file transfer exchange D\_PDUs captured directly from the line.**  
  
File: **[Stanag5066-RAW-ENCAP-Bftp-Exchange-tx.pcap](uploads/__moin_import__/attachments/SampleCaptures/Stanag5066-RAW-ENCAP-Bftp-Exchange-tx.pcap)**  
Description: **BFTP file transfer exchange D\_PDUs encapsulated in TCP, then handed off to S5066 dissector.**

### RTP Norm

These captures show samples of RTP NORM transfers.

Contributor: **Julian Onions**

File: **[rtp-norm-transfer.pcap](uploads/__moin_import__/attachments/SampleCaptures/rtp-norm-transfer.pcap) (291.2 KB)  
**Description: **A norm file transfer over multicast (to one acking host).**

File: **[rtp-norm-stream.zip](uploads/__moin_import__/attachments/SampleCaptures/rtp-norm-stream.zip) (673.4 KB)  
**Description: **A portion of a NORM stream transfer.**

### DCE/RPC and MSRPC-based protocols

Captures in this section show traffic related to various DCE/RPC-based and MSRPC-based interfaces.

File: **[dcerpc-fault-stub-data-02.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/dcerpc-fault-stub-data-02.pcap.gz)  
**Description: **A DCERPC Fault pdu with extended error information (MS-EERR).**

#### DSSETUP MSRPC interface

File: **[dssetup\_DsRoleGetPrimaryDomainInformation\_standalone\_workstation.cap](uploads/__moin_import__/attachments/SampleCaptures/dssetup_DsRoleGetPrimaryDomainInformation_standalone_workstation.cap) (1.0 KB)  
**Description: **[DsRoleGetPrimaryDomainInformation](/DsRoleGetPrimaryDomainInformation) operation (DSSETUP) against a standalone workstation.**

File: **[dssetup\_DsRoleGetPrimaryDomainInformation\_ad\_member.cap](uploads/__moin_import__/attachments/SampleCaptures/dssetup_DsRoleGetPrimaryDomainInformation_ad_member.cap) (1.5 KB)  
**Description: **[DsRoleGetPrimaryDomainInformation](/DsRoleGetPrimaryDomainInformation) operation (DSSETUP) against an Active Directory domain member workstation.**

File: **[dssetup\_DsRoleGetPrimaryDomainInformation\_ad\_dc.cap](uploads/__moin_import__/attachments/SampleCaptures/dssetup_DsRoleGetPrimaryDomainInformation_ad_dc.cap) (1.0 KB)  
**Description: **[DsRoleGetPrimaryDomainInformation](/DsRoleGetPrimaryDomainInformation) operation (DSSETUP) against an Active Directory DC.**

File: **[dssetup\_DsRoleDnsNameToFlatName\_w2k3\_op\_rng\_error.cap](uploads/__moin_import__/attachments/SampleCaptures/dssetup_DsRoleDnsNameToFlatName_w2k3_op_rng_error.cap) (1.0 KB)  
**Description: **In Windows Server 2003, there is only one operation ([DsRoleGetPrimaryDomainInformation](/DsRoleGetPrimaryDomainInformation)) in the DSSETUP interface. This capture shows that the [DsRoleDnsNameToFlatName](/DsRoleDnsNameToFlatName) is not supported in Windows Server 2003.**

File: **[dssetup\_DsRoleDnsNameToFlatName\_w2k.cap](uploads/__moin_import__/attachments/SampleCaptures/dssetup_DsRoleDnsNameToFlatName_w2k.cap) (1.0 KB)  
**Description: **[DsRoleDnsNameToFlatName](/DsRoleDnsNameToFlatName) operation against a Windows 2000 system without MS04-011 applied**

File: **[dssetup\_DsRoleUpgradeDownlevelServer\_MS04-011\_exploit.cap](uploads/__moin_import__/attachments/SampleCaptures/dssetup_DsRoleUpgradeDownlevelServer_MS04-011_exploit.cap) (5.0 KB)  
**Description: **traffic of an exploit for the security vulnerabillity exploitable using the [DsRoleUpgradeDownlevelServer](/DsRoleUpgradeDownlevelServer) operation (Windows 2000 and Windows XP systems without MS04-011 applied)**

#### NSPI MSRPC Interface

File **[nspi.pcap](uploads/__moin_import__/attachments/SampleCaptures/nspi.pcap) (7.2 KB)  
**Description: **MAPI Profile creation between Microsoft Exchange 2003 and the mail applet in the configuration panel (Windows 2003 Server and Windows XP Professional)**

#### WINREG Interface

File **[dcerpc-winreg-with-rpc-sec-verification-trailer.pcap](uploads/__moin_import__/attachments/SampleCaptures/dcerpc-winreg-with-rpc-sec-verification-trailer.pcap)  
**Description: **smbtorture in Samba's make test. Frame 34 contains a rpc\_sec\_verification\_trailer.**

#### WITNESS Interface

File **[dcerpc\_witness.pcapng](uploads/__moin_import__/attachments/SampleCaptures/dcerpc_witness.pcapng)  
**Description: **Sample Witness traffic**

### IPsec - ESP Payload Decryption and Authentication Checking Examples

File: **[ipsec\_esp\_capture\_1.tgz](uploads/__moin_import__/attachments/SampleCaptures/ipsec_esp_capture_1.tgz) [ESP](/ESP)  
**Description: **Example for ESP payload Decryption and Authentication checking for simple transport mode in v4/v6.**

File: **[ipsec\_esp\_capture\_2.tgz](uploads/__moin_import__/attachments/SampleCaptures/ipsec_esp_capture_2.tgz) [ESP](/ESP)  
**Description: **Example for ESP payload Decryption and Authentication checking for tunnel mode in v4.**

File: **[ipsec\_esp\_capture\_3.tgz](uploads/__moin_import__/attachments/SampleCaptures/ipsec_esp_capture_3.tgz) [ESP](/ESP)  
**Description: **Example for ESP payload Decryption with authentication Checking for some more Encryption Algorithms not defined in RFC4305.**

File: **[ipsec\_esp\_capture\_5.tgz](uploads/__moin_import__/attachments/SampleCaptures/ipsec_esp_capture_5.tgz) [ESP](/ESP)  
**Description: **Example of Authentication Checking and decryption using Hexadecimal keys.**

### Pro-MPEG FEC - Professional video FEC data over RTP

See protocol description, [2dParityFEC](/2dParityFEC) for details.  
File: **[2dParityFEC-Example.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/2dParityFEC-Example.cap.gz)  
**Description: **Example of row and column FEC data mixed with MPEG2 transport stream data in standard [RTP](/RTP) packets.**

### SSL with decryption keys

File: **[snakeoil2\_070531.tgz](uploads/__moin_import__/attachments/SampleCaptures/snakeoil2_070531.tgz)  
**Description: **Example of [SSL](/SSL) encrypted HTTPS traffic and the key to decrypt it. (example taken from the dev mailinglist)**

Files: **[dump.pcapng](https://bugs.wireshark.org/bugzilla/attachment.cgi?id=11612)**, [premaster.txt](https://bugs.wireshark.org/bugzilla/attachment.cgi?id=11616)  
Description: **Capture and related keylog file of a openssl's s\_client/s\_server HTTP GET request over TLSv1.2 with 73 different cipher suites (generated using [openssl-connect](https://git.lekensteyn.nl/peter/wireshark-notes/tree/openssl-connect) for [Bug 9144 - Update TLS ciphers](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9144))**

File: **[mysql-ssl.pcapng](uploads/__moin_import__/attachments/SampleCaptures/mysql-ssl.pcapng) (11 KB, from <https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/mysql-ssl.pcapng?id=8cfd2f667e796e4c0e3bdbe117e515206346f74a>, SSL keys in capture file comments)**

File: **[mysql-ssl-larger.pcapng](uploads/__moin_import__/attachments/SampleCaptures/mysql-ssl-larger.pcapng) (`show variables` response in two TLS records and multiple TCP segments) (22 KB, from <https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/mysql-ssl-larger.pcapng?id=818f97811ee7d9b4c5b2d0d14f8044e88787bc01>, SSL keys in capture file comments)**

File: **[smtp-ssl.pcapng](uploads/__moin_import__/attachments/SampleCaptures/smtp-ssl.pcapng) (8.8 KB, from <https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/smtp-ssl.pcapng?id=9615a132638741baa2cf839277128a32e4fc34f2>, SSL keys in capture file comments)**

File: **[smtp2525-ssl.pcapng](uploads/__moin_import__/attachments/SampleCaptures/smtp2525-ssl.pcapng) (SMTP over non-standard port 2525) (8.8 KB, from <https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/smtp2525-ssl.pcapng?id=d448482c095363191ff5b5b312fa8f653e482425>, SSL keys in capture file comments)**

File: **[xmpp-ssl.pcapng](uploads/__moin_import__/attachments/SampleCaptures/xmpp-ssl.pcapng) (15 KB, from <https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/xmpp-ssl.pcapng?id=fa979120b060be708e3e752e559e5878524be133>, SSL keys in capture file comments)**

File: **[pop-ssl.pcapng](uploads/__moin_import__/attachments/SampleCaptures/pop-ssl.pcapng) (POP3) (9.2 KB, from <https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/pop-ssl.pcapng?id=860c55ba8449a877e21480017e16cfae902b69fb>, SSL keys in capture file comments)**

File: **[imap-ssl.pcapng](uploads/__moin_import__/attachments/SampleCaptures/imap-ssl.pcapng) (10 KB, from <https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/imap-ssl.pcapng?id=1123e936365c89d43e9f210872778d81223af36d>, SSL keys in capture file comments)**

File: **[pgsql-ssl.pcapng](uploads/__moin_import__/attachments/SampleCaptures/pgsql-ssl.pcapng) (7.7 KB, from <https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/pgsql-ssl.pcapng?id=836b6f746df24aa04fa29b71806d8d0e496c2a68>, SSL keys in capture file comments)**

File: **[ldap-ssl.pcapng](uploads/__moin_import__/attachments/SampleCaptures/ldap-ssl.pcapng) (8.3 KB, from <https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/ldap-ssl.pcapng?id=d931120107e7429a689a8350d5e49c1f1147316f>, SSL keys in capture file comments)**

File: **[http2-16-ssl.pcapng](uploads/__moin_import__/attachments/SampleCaptures/http2-16-ssl.pcapng) (HTTP2 with ALPN h2-16 extension) (5.1 KB, from <https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/http2-16-ssl.pcapng?id=a24c03ce96e383faf2a624bfabd5cc843e78ab2a>, SSL keys in capture file comments)**

File: **[amqps.pcapng](uploads/__moin_import__/attachments/SampleCaptures/amqps.pcapng) (AMQP using RabbitMQ server and Celery client) (5.1 KB, from <https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/amqps.pcapng?id=3c00336b07f1fec0fb13af3c7d502d51fab732b7>, SSL keys in capture file comments)**

The `*-ssl.pcapng` capture files above can be found at <https://git.lekensteyn.nl/peter/wireshark-notes/tree/tls/> with the pre-master key secrets being available in the capture file comments. See the commit log for further details. The keys have been extracted from the OpenSSL library using a LD\_PRELOAD interposing library, libsslkeylog.so ([sslkeylog.c](https://git.lekensteyn.nl/peter/wireshark-notes/tree/src/sslkeylog.c)).

For TLS 1.3 captures and keys, see [Bug 12779](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=12779). For example, Chromium 61 (TLS 1.3 draft -18) connecting to enabled.tls13.com using HTTP/2 can be found in [this comment](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=12779#attach_15867).

### MCPE/RakNet

File: **[MCPE-0.15.pcapng](uploads/__moin_import__/attachments/SampleCaptures/MCPE-0.15.pcapng)  
**Description: **Example of [Minecraft Pocket Edition](http://wiki.vg/Pocket_Edition_Protocol_Documentation) 0.15.x on [RakNet](http://www.raknet.com/) protocol.**

### NDMP

File: **[ndmp.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/ndmp.pcap.gz)  
**Description: **Example of NDMP connection using MD5 method. Capture shows some additonal NDMP traffic not recognized by wireshark (ndmfs extension).**

### Kismet Client/Server protocol

File: **[kismet-client-server-dump-1.pcap](uploads/__moin_import__/attachments/SampleCaptures/kismet-client-server-dump-1.pcap)  
**Description: **Example traffic beetwen Kismet GUI and Kismet Sever (begining of kismet session).**

File: **[kismet-client-server-dump-2.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/kismet-client-server-dump-2.pcap.gz)  
**Description: **Example traffic beetwen Kismet GUI and Kismet Sever (after new wireless network has been detected).**

### Kismet Drone/Server protocol

File: **[kdsp.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/kdsp.pcap.gz)  
**Description: **Example traffic between Kismet drone and Kismet sever. See [KDSP](/KDSP)**

### DTLS with decryption keys

File: **[snakeoil.tgz](uploads/__moin_import__/attachments/SampleCaptures/snakeoil.tgz)  
**Description: **Example of [DTLS](/DTLS) simple encrypted traffic and the key to decrypt it. (Simple example made with OpenSSLv0.9.8b)**

### DTLS JPAKE as used in ThreadGroup Commissioning

File: **[ThreadCommissioning-JPAKE-DTLS-1.pcapng](uploads/__moin_import__/attachments/SampleCaptures/ThreadCommissioning-JPAKE-DTLS-1.pcapng)  
**Description: **Example 1 of [DTLS-JPAKE](/DTLS-JPAKE) traffic. (Thread reference application (DTLS client) against mbedTLS server)**

File: **[ThreadCommissioning-JPAKE-DTLS-2.pcapng](uploads/__moin_import__/attachments/SampleCaptures/ThreadCommissioning-JPAKE-DTLS-2.pcapng)  
**Description: **Example 2 of [DTLS-JPAKE](/DTLS-JPAKE) traffic. (Thread reference application (DTLS client) against mbedTLS server)**

File: **[ThreadCommissioning-JPAKE-DTLS-NSS](uploads/__moin_import__/attachments/SampleCaptures/ThreadCommissioning-JPAKE-DTLS-NSS)  
**Description: **NSS file for decryption of the two example files.**

### ETHERNET Powerlink v1

File: **[epl\_v1.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/epl_v1.cap.gz)  
**Description: **Example traffic of [EPL V1](/EPL-V1). Capture shows the traffic of an EPLv1 [ManagingNode](/ManagingNode) and three [ControlledNodes](/ControlledNodes).**

### ETHERNET Powerlink v2

File: **[epl.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/epl.cap.gz)  
**Description: **Example traffic of [EPL](/EPL). Capture shows the boot up of an EPLv2 [ManagingNode](/ManagingNode) and one [ControlledNode](/ControlledNode).**

File: **[epl\_sdo\_udp.cap](uploads/__moin_import__/attachments/SampleCaptures/epl_sdo_udp.cap)  
**Description: **Example traffic of [EPL](/EPL). Capture shows an access to the object dictionary of a [ControlledNode](/ControlledNode) within an EPL-Network from outside via [ServiceDataObject](/ServiceDataObject) (SDO) by UDP.**

### Architecture for Control Networks (ACN)

File: **[acn\_capture\_example\_1.cap](uploads/__moin_import__/attachments/SampleCaptures/acn_capture_example_1.cap)  
**Description: **Example traffic of [ACN](/ACN). Capture shows just a few examples.**

### Intellon Homeplug (INT51X1)

File: **[homeplug\_request\_channel\_estimation.pcap](uploads/__moin_import__/attachments/SampleCaptures/homeplug_request_channel_estimation.pcap)  
**Description: **Example traffic of [Homeplug](/Homeplug). Capture of Request Channel Estimation (RCE) frame.** File: **[homeplug\_request\_parameters\_and\_statistics.pcap](uploads/__moin_import__/attachments/SampleCaptures/homeplug_request_parameters_and_statistics.pcap)  
**Description: **Example traffic of [Homeplug](/Homeplug). Capture of Request Parameters and Statistics (RPS) frame.** File: **[homeplug\_network\_statistics\_basic.pcap](uploads/__moin_import__/attachments/SampleCaptures/homeplug_network_statistics_basic.pcap)  
**Description: **Example traffic of [Homeplug](/Homeplug). Capture of Network Statistics basic (NS) frame.**

### Wifi / Wireless LAN captures / 802.11

File: **[Network\_Join\_Nokia\_Mobile.pcap](uploads/__moin_import__/attachments/SampleCaptures/Network_Join_Nokia_Mobile.pcap)  
**Description: **802.11 capture of a new client joining the network, authenticating and activating WPA ciphering**

File: **[wpa-Induction.pcap](uploads/__moin_import__/attachments/SampleCaptures/wpa-Induction.pcap)  
**Description: **802.11 capture with WPA data encrypted using the password "Induction".**

File: **[wpa-eap-tls.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/wpa-eap-tls.pcap.gz)  
**Description: **802.11 capture with WPA-EAP. PSK's to decode: a5001e18e0b3f792278825bc3abff72d7021d7c157b600470ef730e2490835d4 79258f6ceeecedd3482b92deaabdb675f09bcb4003ef5074f5ddb10a94ebe00a 23a9ee58c7810546ae3e7509fda9f97435778d689e53a54891c56d02f18ca162**

File: **[http_PPI.cap](uploads/e8cebabd278b76e3bc9edbd484c4d293/http_PPI.cap)  
**Description: **802.11n capture with PPI encapsulation containing HTTP data.**

File: **[mesh.pcap](uploads/__moin_import__/attachments/SampleCaptures/mesh.pcap)  
**Description: **802.11s capture with Radiotap encapsulation.**

### TrunkPack Network Control Protocol (TPNCP)

File: **[tpncp\_udp.pcap](uploads/__moin_import__/attachments/SampleCaptures/tpncp_udp.pcap)  
**Description: **Example traffic of [TPNCP](/TPNCP) over [UDP](/UDP).**

File: **[tpncp\_tcp.pcap](uploads/__moin_import__/attachments/SampleCaptures/tpncp_tcp.pcap)  
**Description: **Example traffic of [TPNCP](/TPNCP) over [TCP](/TCP).**

### EtherCAT

File: **[ethercat.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/ethercat.cap.gz)  
**Description: **Example traffic of [Ethercat](/Ethercat). Capture shows the boot up of an network with Beckhoff 1100, 1014, 2004, 3102 and 4132 modules.**

### iWARP Protocol Suite

These captures show MPA/DDP/RDMAP communication.

Contributor: **Philip Frey**

File: **[iwarp\_connect.tar.gz](uploads/__moin_import__/attachments/SampleCaptures/iwarp_connect.tar.gz) (1.4KB)  
**Description: **MPA connection setup without data exchange.**

File: **[iwarp\_send\_recv.tar.gz](uploads/__moin_import__/attachments/SampleCaptures/iwarp_send_recv.tar.gz) (1.9KB)  
**Description: **MPA connection setup followed by RDMA Send/Receive data exchange.**

File: **[iwarp\_rdma.tar.gz](uploads/__moin_import__/attachments/SampleCaptures/iwarp_rdma.tar.gz) (7KB)  
**Description: **MPA connection setup followed by RDMA Write/Read data exchange.**

### IPv6 (and tunneling mechanism)

File: **[Teredo.pcap](uploads/__moin_import__/attachments/SampleCaptures/Teredo.pcap)  
**Description: **Example of [IPv6](/IPv6) traffic using Teredo for encapsulation.**

File: **[6to4.pcap](uploads/__moin_import__/attachments/SampleCaptures/6to4.pcap)  
**Description: **Example of [IPv6](/IPv6) traffic using 6to4 for encapsulation.**

File: **[6in4.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/6in4.pcap.gz)  
**Description: **Example of [IPv6](/IPv6) traffic using 6in4 for encapsulation.**

File: **[6LoWPAN.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/6LoWPAN.pcap.gz)  
**Description: **[IPv6](/IPv6) over IEEE 802.15.4.**

File: **[6lowpan-rfrag-icmpv6.pcapng](uploads/__moin_import__/attachments/SampleCaptures/6lowpan-rfrag-icmpv6.pcapng)  
**Description: **Example of [6LoWPAN Selective Fragment Recovery (RFRAG)](https://tools.ietf.org/html/draft-ietf-6lo-fragment-recovery-02) packets. Payload is ICMPv6 echo request in 6LoWPAN RFRAGs.**

File: **[sr-header.pcap](uploads/__moin_import__/attachments/SampleCaptures/sr-header.pcap)  
**Description: **[IPv6](/IPv6) Segment Routing header.**

### TTEthernet (TTE)

File: **[TTE\_mix\_small.pcap](uploads/__moin_import__/attachments/SampleCaptures/TTE_mix_small.pcap)  
**Description: **Example of [TTEthernet](/TTEthernet) traffic showing different traffic classes.**

### GSM

File: **[abis-accept-network.pcap](uploads/__moin_import__/attachments/SampleCaptures/abis-accept-network.pcap)  
**Description: **Abis: Setup + Location Updating Request + Accept + SMS. Note: Set "Use GSM SAPI Values" in LAPD preferences.**

File: **[abis-reject-network.pcap](uploads/__moin_import__/attachments/SampleCaptures/abis-reject-network.pcap)  
**Description: **Abis: Setup + Location Updating Request + Reject. Note: Set "Use GSM SAPI Values" in LAPD preferences.**

File: **[gsm\_call\_1525.xml](uploads/__moin_import__/attachments/SampleCaptures/gsm_call_1525.xml)  
**Description: **Um: Mobile phone called the number 1525 and stayed connected for 2-3 seconds.**

File: **[gsm\_sms2.xml](uploads/__moin_import__/attachments/SampleCaptures/gsm_sms2.xml)  
**Description: **Um: SMS containing "abc"**

File: **[gsm-r.uus1.pcap](uploads/__moin_import__/attachments/SampleCaptures/gsm-r.uus1.pcap)  
**Description: **GSM-R specific messages in the user-user signalling**

### UMTS

#### IuB interface

File: **[UMTS\_FP\_MAC\_RLC\_RRC\_NBAP.pcap](uploads/__moin_import__/attachments/SampleCaptures/UMTS_FP_MAC_RLC_RRC_NBAP.pcap)  
**Description: **IuB: Mobile Originating Video Call Signaling and traffic. Contains all common IuB protocols: NBAP, FP, MAC, RLC, RRC**

#### Iu-CS over IP interface(MoC)

File: **[Mobile Originating Call(AMR).pcap](uploads/__moin_import__/attachments/SampleCaptures/Mobile-Originating-Call\(AMR\).pcap)  
**Description: **Iu-CS: Mobile Originating Call Signaling and Bearer in IP network AMR(12.2).**

#### Iu-CS over IP interface(MtC)

File: **[Mobile Terminating Call(AMR).pcap](uploads/__moin_import__/attachments/SampleCaptures/Mobile-Terminating-Call\(AMR\).pcap)  
**Description: **Iu-CS: Mobile Terminating Call Signaling and Bearer in IP network AMR(12.2)**

### X11

File: **[x11-gtk.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/x11-gtk.pcap.gz) A GTK app opening only an error dialog. Exercises a surprising portion of the RENDER extension.**

File: **[x11-shape.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/x11-shape.pcap.gz) vtwm, xcalc, and xeyes. Multiple SHAPE extension requests and one [ShapeNotify](/ShapeNotify) event.**

File: **[x11-composite.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/x11-composite.pcap.gz) vtwm, 2x xlogo, and xcompmgr. Exercises parts of Composte, Damage, and XFixes extensions.**

File: **[x11-glx.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/x11-glx.pcap.gz) A couple of frames of glxgears, to demonstrate GLX/glRender dissection.**

File: **[x11-xtest.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/x11-xtest.pcap.gz) An xtest test run, uses the XTEST extension.**

File: **[x11-res.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/x11-res.pcap.gz) xlogo and one iteration of xrestop, to demonstrate the X-Resource extension.**

File: **[x11-xinput.pcapng.gz](uploads/__moin_import__/attachments/SampleCaptures/x11-xinput.pcapng.gz) `xinput list`, to demonstrate the XInputExtension extension.**

### Gopher

File: **[gopher.pcap](uploads/__moin_import__/attachments/SampleCaptures/gopher.pcap) A capture of the Gopher protocol (a gopher browser retrieving few files and directories).**

### InfiniBand

File **[infiniband.pcap](uploads/__moin_import__/attachments/SampleCaptures/infiniband.pcap) (8.7KB)  
**Description **A libpcap trace file of low level [InfiniBand](/InfiniBand) frames in DLT\_ERF format.**

### Network News Transfer Protocol (NNTP)

File: **[nntp.pcap](uploads/__moin_import__/attachments/SampleCaptures/nntp.pcap) A capture of the NNTP protocol (a KNode client retrieving few messages from two groups on a Leafnode server).**

### FastCGI (FCGI)

File: **[fcgi.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/fcgi.pcap.gz) A capture of the FCGI protocol (a single HTTP request being processed by an FCGI application).**

### Lontalk (EIA-709.1) encapsulated in EIA-852

File: **[eia709.1-over-eia852.pcap](uploads/__moin_import__/attachments/SampleCaptures/eia709.1-over-eia852.pcap) A capture of the Lontalk homeautomation protocol. Lots of button presses, temperature sensors, etc.**

### DVB-CI (Common Interface)

File: [dvb-ci\_1.pcap](uploads/__moin_import__/attachments/SampleCaptures/dvb-ci_1.pcap)

A DVB-CI module is plugged into a receiver and initialized. The receiver asks the module to descramble a Pay-TV service. After a moment, there’s a service change and another request to descramble the newly selected service. After some seconds, the module is removed from the receiver.

File: [dvb-ci\_2.pcap](uploads/__moin_import__/attachments/SampleCaptures/dvb-ci_2.pcap)

Communication between a DVB-CI host and module where the maximum message size on the link layer is 16 bytes. Larger messages from upper layers must be fragmented and reassembled.

### ANSI C12.22 (c1222)

File: **[c1222overIPv4.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/c1222overIPv4.cap.gz) ([ANSI C12.22](/C12.22))** C12.22 read of Standard Table 1 with response. This communication was using *Ciphertext with Authenticaton* mode with key 0 = 6624C7E23034E4036FE5CB3A8B5DAB44

File: **[c1222\_over\_ipv6.pcap](uploads/__moin_import__/attachments/SampleCaptures/c1222_over_ipv6.pcap) ([ANSI C12.22](/C12.22))** C12.22 read of Standard Tables 1 and 2 with response. This communication was using *Ciphertext with Authenticaton* mode with key 0 = 000102030405060708090A0B0C0D0E0F

### HDCP

File: **[hdcp\_authentication\_sample.pcap](uploads/__moin_import__/attachments/SampleCaptures/hdcp_authentication_sample.pcap)**

**HDCP authentication between a DVB receiver and a handheld device**

### openSAFETY

**File:** [opensafety\_udp\_trace.pcap](uploads/__moin_import__/attachments/SampleCaptures/opensafety_udp_trace.pcap) openSAFETY communication using UDP as transport protocol

File: **[opensafety\_epl\_trace.pcap](uploads/__moin_import__/attachments/SampleCaptures/opensafety_epl_trace.pcap) openSAFETY communication using Ethernet Powerlink V2 as transport protocol**

**File:** [opensafety\_sercosiii\_trace.pcap](uploads/__moin_import__/attachments/SampleCaptures/opensafety_sercosiii_trace.pcap) openSAFETY communication using SercosIII as transport protocol

### Radio Frequency Identification (RFID), and Near-Field Communication (NFC)

File: **[Read-FeliCa-Lite-NDEF-Tags.cap](uploads/__moin_import__/attachments/SampleCaptures/Read-FeliCa-Lite-NDEF-Tags.cap) A trace file from a USB-connected NFC transceiver based upon the NXP PN532 chipset, containing packets from a successful attempt at enumerating, and reading the contents of two Sony [FeliCa](/FeliCa) Lite tags.**

### IEC 60870-5-104

**File:** [iec104.pcap](uploads/__moin_import__/attachments/SampleCaptures/iec104.pcap) IEC 60870-5-104 communication log.

**File:** [IEC104\_SQ.pcapng](uploads/__moin_import__/attachments/SampleCaptures/IEC104_SQ.pcapng) IEC 60870-5-104 communication log with SQ bit.

### SISO-STD-002

Simulation Interoperability Standards Organization SISO-STD-002 Standard for Link 16 Simulation

**File:** [siso\_std\_002\_annex\_b\_example.pcap](uploads/__moin_import__/attachments/SampleCaptures/siso_std_002_annex_b_example.pcap) .

**File:** [siso\_std\_002\_transmitter.pcap](uploads/__moin_import__/attachments/SampleCaptures/siso_std_002_transmitter.pcap).

**Standard:** <http://www.sisostds.org/ProductsPublications/Standards/SISOStandards.aspx>

### STANAG-5602 SIMPLE

Standard Interface for Multiple Platform Evaluation

**File:** [stanag-5602-simple-example.pcap](uploads/__moin_import__/attachments/SampleCaptures/stanag-5602-simple-example.pcap) .

**Standard:** <http://assistdoc1.dla.mil/qsDocDetails.aspx?ident_number=213042>

### S7COMM - S7 Communication

[s7comm\_downloading\_block\_db1.pcap](uploads/__moin_import__/attachments/SampleCaptures/s7comm_downloading_block_db1.pcap) s7comm: Connecting and downloading program block DB1 into PLC

[s7comm\_program\_blocklist\_onlineview.pcap](uploads/__moin_import__/attachments/SampleCaptures/s7comm_program_blocklist_onlineview.pcap) s7comm: Connecting and getting a list of all available blocks in the S7-300 PLC

[s7comm\_reading\_plc\_status.pcap](uploads/__moin_import__/attachments/SampleCaptures/s7comm_reading_plc_status.pcap) s7comm: Connecting and viewing the S7-300 PLC status

[s7comm\_reading\_setting\_plc\_time.pcap](uploads/__moin_import__/attachments/SampleCaptures/s7comm_reading_setting_plc_time.pcap) s7comm: Connecting, reading and setting the time of the S7-300 PLC

[s7comm\_varservice\_libnodavedemo.pcap](uploads/__moin_import__/attachments/SampleCaptures/s7comm_varservice_libnodavedemo.pcap) s7comm: running libnodave demo with a S7-300 PLC, using variable-services reading several different areas and sizes

[s7comm\_varservice\_libnodavedemo\_bench.pcap](uploads/__moin_import__/attachments/SampleCaptures/s7comm_varservice_libnodavedemo_bench.pcap) s7comm: running libnodave demo benchmark with S7-300 PLC using variable-services to check the communication capabilities

### Harman Pro HiQnet

[hiqnet\_netsetter-soundcraft\_session.pcapng.gz](uploads/__moin_import__/attachments/SampleCaptures/hiqnet_netsetter-soundcraft_session.pcapng.gz) hiqnet: A session between Harman [NetSetter](/NetSetter) desktop application and a Soundcraft Si Compact 16 digital mixing console reading and writing very basic informations.

[hiqnet\_visiremote-soundcraft\_session.pcapng.gz](uploads/__moin_import__/attachments/SampleCaptures/hiqnet_visiremote-soundcraft_session.pcapng.gz) hiqnet: A session between Soundcraft's [ViSiRemote](/ViSiRemote) iPad application and a Soundcraft Si Compact 16 digital mixing console playing around with different values. The VU-meters stream is not part of this capture because it uses another protocol (UDP on port 3333).

### DJI Drones control Protocol

[djiuav.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/djiuav.pcap.gz) DJI drone getting managed and sending video stream.

### HCrt (Hotline Command-response Transaction) Protocol

[hcrt.pcap](uploads/__moin_import__/attachments/SampleCaptures/hcrt.pcap) Some captures of the HCRT protocol. Specifications of the protocol can be found here: <https://github.com/ShepardSiegel/hotline/tree/master/doc>.

### DOF (Distributed Object Framework) Protocols

[tunnel.pcap](uploads/__moin_import__/attachments/SampleCaptures/tunnel.pcap) Contains a DOF session which exercises many aspects of the protocol, best viewed with display filter "dof"

Most of the packets in this capture are encrypted, to view them:

1.  Open Edit/Preferences.

2.  Expand Protocols, select DOF.

3.  Click “Edit…” on DPS Identity Secrets.

4.  Click “New”.

5.  In Domain, add ‘\[{03}:<james.simister@us.panasonic.com>\]’ without the quotes.

6.  In Identity, add ‘\[{03}:<dt@pan9320.pslcl.com>\]’.

7.  In Secret, add ‘2BCFE378663EBF2B5C4D8F971175B4767984CC2544EA969FB37799C777CF4C8F’ without the quotes.

8.  Click OK on all the dialogs.

[dof-small-device.pcapng](uploads/__moin_import__/attachments/SampleCaptures/dof-small-device.pcapng) Example of a small device communicating with a server.

[dof-short-capture.pcapng](uploads/__moin_import__/attachments/SampleCaptures/dof-short-capture.pcapng) Larger example of two nodes communicating.

Both of these captures create secure sessions, but the keys are not provided.

Information on the DOF protocols can be found at <https://opendof.org>. Full protocol specifications are available on the downloads page.

### CBOR (Concise Binary Object Representation)

[coap-cbor.pcap](uploads/__moin_import__/attachments/SampleCaptures/coap-cbor.pcap) The CBOR test vectors over CoAP defined here: <https://github.com/cbor/test-vectors/>

### RADIUS (RFC 2865)

File: [radius\_localhost.pcapng](uploads/__moin_import__/attachments/SampleCaptures/radius_localhost.pcapng)

This file contains RADIUS packets sent from localhost to localhost, using [FreeRADIUS Server](http://freeradius.org/) and the radtest utility.

Description of packets:

<div>

<table>

<tbody>

<tr>

<td colspan="1" rowspan="2" style="&amp;quot; text-align:center&amp;quot;">

Frame

</div>

</td>

<td colspan="1" rowspan="2" style="&amp;quot; text-align:center&amp;quot;">

Description

</td>

<td colspan="2" style="&amp;quot; text-align:center&amp;quot;">

shared secret

</td>

</tr>

<tr>

<td>

on server

</td>

<td>

on client

</td>

</tr>

<tr>

<td>

1-4

</td>

<td>

user steve authenticating with EAP-MD5, password bad (Access rejected)

</td>

<td colspan="2" style="&amp;quot; text-align:center&amp;quot;">

testing123

</td>

</tr>

<tr>

<td>

5-8

</td>

<td>

user steve authenticating with EAP-MD5, password testing (Access Accepted)

</td>

<td colspan="2" style="&amp;quot; text-align:center&amp;quot;">

testing123

</td>

</tr>

<tr>

<td>

9-10

</td>

<td>

same user, same password, PAP (Access Accepted)

</td>

<td colspan="2" style="&amp;quot; text-align:center&amp;quot;">

testing123

</td>

</tr>

<tr>

<td>

11-12

</td>

<td>

same user/password, CHAP (Access Accepted)

</td>

<td colspan="2" style="&amp;quot; text-align:center&amp;quot;">

testing123

</td>

</tr>

<tr>

<td>

13-14

</td>

<td>

same user, password bad\_passsword, PAP (Access Rejected)

</td>

<td colspan="2" style="&amp;quot; text-align:center&amp;quot;">

testing123

</td>

</tr>

<tr>

<td>

15-17

</td>

<td>

The client has a wrong shared secret, the server does not answer

</td>

<td>

bad\_secret

</td>

<td>

testing123

</td>

</tr>

<tr>

<td>

18-19

</td>

<td>

Authentication successfull with PAP

</td>

<td colspan="2" style="&amp;quot; text-align:center&amp;quot;">

bad\_secret

</td>

</tr>

</tbody>

</table>

</div>

### Distributed Interactive Simulation (IEEE 1278)

Distributed Interactive Simulation (DIS) is described [here](https://en.wikipedia.org/wiki/Distributed_Interactive_Simulation).

Capture files:

  - [DIS\_EntityState\_1.pcapng](uploads/__moin_import__/attachments/SampleCaptures/DIS_EntityState_1.pcapng) - Basic [EntityState](/EntityState) PDUs capture

  - [DIS\_EntityState\_2.pcapng](uploads/__moin_import__/attachments/SampleCaptures/DIS_EntityState_2.pcapng) - Another basic [EntityState](/EntityState) PDUs capture

  - [DIS\_EnvironmentalProcess.pcapng](uploads/__moin_import__/attachments/SampleCaptures/DIS_EnvironmentalProcess.pcapng) - EnvironmentalProcessPDU capture

  - [DIS\_Signal.pcapng](uploads/__moin_import__/attachments/SampleCaptures/DIS_Signal.pcapng) - Signal PDUs capture

  - [DIS\_signal\_and\_transmitter.pcapng](uploads/__moin_import__/attachments/SampleCaptures/DIS_signal_and_transmitter.pcapng) - Signal and Transmitter PDUs capture

### Financial Information eXchange (FIX)

Capture files generated using the "f8test" program from the open-source FIX protocol implementation [Fix8](http://www.fix8.org/) (version 1.3.4).

  - [fix.pcap](uploads/__moin_import__/attachments/SampleCaptures/fix.pcap)

  - [fix-ssl.pcap](uploads/__moin_import__/attachments/SampleCaptures/fix-ssl.pcap)

The SSL keylog file for `fix-ssl.pcap` should contain:  
**CLIENT\_RANDOM 330221F6F09769F5F0E128551DF5C75F18464BEFB88B9CFE77FB83EFEEE4A6B5 3494FD0D729C23E590F8F7F9B150D534E5F225AA60873E91719A289D8BB92A9CDB482185213F11BB105C7C634A32BCEF**

### UserLog

userlog is user flow logs of H3C device.

Flow logging records users’ access to the extranet. The device classifies and calculates flows through the 5-tuple information, which includes source IP address, destination IP address, source port, destination port, and protocol number, and generates user flow logs. Flow logging records the 5-tuple information of the packets and number of the bytes received and sent. With flow logs, administrators can track and record accesses to the network, facilitating the availability and security of the network.

[UserLog.pcap](uploads/__moin_import__/attachments/SampleCaptures/UserLog.pcap)

### OpenFlow

[openflow\_v1.3\_messages.pcapng.gz](uploads/__moin_import__/attachments/SampleCaptures/openflow_v1.3_messages.pcapng.gz): A collection of [OpenFlow](/OpenFlow) v1.3 packets (taken from [bug 9283](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9283)).

### ISO 8583-1

[iso8583\_messages.tar.gz](uploads/__moin_import__/attachments/SampleCaptures/iso8583_messages.tar.gz): A collection of ISO8583-1 packets (taken from [bug 12244](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=12244)).

### DNP3

[dnp3\_read.pcap](uploads/__moin_import__/attachments/SampleCaptures/dnp3_read.pcap); [dnp3\_select\_operate.pcap](uploads/__moin_import__/attachments/SampleCaptures/dnp3_select_operate.pcap); [dnp3\_write.pcap](uploads/__moin_import__/attachments/SampleCaptures/dnp3_write.pcap). Source: [pcapr.net](http://pcapr.net) by bwilkerson.

### System Calls

[curl-packets+syscalls-2016-05-04.pcapng](uploads/__moin_import__/attachments/SampleCaptures/curl-packets-syscalls-2016-05-04.pcapng): Network traffic and system calls generated by running `curl` to download a file.

### Linux netlink

[netlink.pcap](uploads/__moin_import__/attachments/SampleCaptures/netlink.pcap): Linux netlink with rtnetlink (route) and Netfilter protocols, captured in a Ubuntu 14.04.4 QEMU VM. Also contains NFQUEUE traffic with some DNS queries.

[netlink-nflog.pcap](uploads/__moin_import__/attachments/SampleCaptures/netlink-nflog.pcap): Linux netlink embedding rtnetlink and NFLOG (Netfilter) protocols. The NFLOG packets contain HTTP and ICMP packets, using `nf-queue` program as listener.

[netlink-conntrack.pcap](uploads/__moin_import__/attachments/SampleCaptures/netlink-conntrack.pcap): Linux netlink, an HTTP request and DNS query with Netfilter (NFQUEUE and conntrack) packets. Used the `conntrack -E` command as listener.

[netlink-ipset.pcap](uploads/__moin_import__/attachments/SampleCaptures/netlink-ipset.pcap): Linux netlink-netfilter traffic while executing various ipset commands.

[nlmon-big.pcap](uploads/__moin_import__/attachments/SampleCaptures/nlmon-big.pcap): Linux netlink traffic captured on a MIPS (big-endian) device.

Related (NFLOG):

  - [nflog.pcap](uploads/__moin_import__/attachments/SampleCaptures/nflog.pcap): another HTTP and ICMP trace captured with `tcpdump -i nflog:42` (NFLOG encapsulation, not netlink).

  - [nflog-ebtables.pcapng](uploads/__moin_import__/attachments/SampleCaptures/nflog-ebtables.pcapng): NFLOG via ebtables (family `NFPROTO_BRIDGE`). Contains ARP, IPv4, IPv6, ICMP, ICMPv6, TCP.

### Oracle TNS / SQLnet / OCI / OPI

[TNS\_Oracle1.pcap](uploads/__moin_import__/attachments/SampleCaptures/TNS_Oracle1.pcap) A sample of TNS traffic (dated Apr 2014).

[TNS\_Oracle2.pcap](uploads/__moin_import__/attachments/SampleCaptures/TNS_Oracle2.pcap) A bunch of INSERT INTO's on an Oracle server (dated Apr 2009).

[TNS\_Oracle3.pcap](uploads/__moin_import__/attachments/SampleCaptures/TNS_Oracle3.pcap) A bunch of SELECT FROM's on an Oracle server (dated Apr 2009).

[TNS\_Oracle4.pcap](uploads/__moin_import__/attachments/SampleCaptures/TNS_Oracle4.pcap) Oracle server redirecting to an alternate port upon connection (dated Apr 2009).

[TNS\_Oracle5.pcap](uploads/__moin_import__/attachments/SampleCaptures/TNS_Oracle5.pcap) Another sample of TNS traffic (dated Oct 2015).

[7\_oracle10\_2016.pcapng](uploads/__moin_import__/attachments/SampleCaptures/7_oracle10_2016.pcapng) Oracle 10 examples (dated Dec 2016)

[8\_oracle11\_2016.pcapng](uploads/__moin_import__/attachments/SampleCaptures/8_oracle11_2016.pcapng) Oracle 11 examples (dated Dec 2016)

[9\_oracle12\_2016.pcapng](uploads/__moin_import__/attachments/SampleCaptures/9_oracle12_2016.pcapng) Oracle 12 examples (dated Dec 2016)

[10\_sqldeveloper10\_2016.pcapng](uploads/__moin_import__/attachments/SampleCaptures/10_sqldeveloper10_2016.pcapng) Oracle 10 SQL Developer (dated Dec 2016)

[11\_sqldeveloper11\_2016.pcapng](uploads/__moin_import__/attachments/SampleCaptures/11_sqldeveloper11_2016.pcapng) Oracle 11 SQL Developer (dated Dec 2016)

[12\_sqldeveloper12\_2016.pcapng](uploads/__moin_import__/attachments/SampleCaptures/12_sqldeveloper12_2016.pcapng) Oracle 12 SQL Developer (dated Dec 2016)

[oracle12-example.pcapng](uploads/__moin_import__/attachments/SampleCaptures/oracle12-example.pcapng) Oracle 12 examples.

Special thanks to pcapr.net project.

### Lawo EmberPlus S101/Glow

[s101glow.pcap](uploads/__moin_import__/attachments/SampleCaptures/s101glow.pcap)

### HP ERM

[hp-erm-1.cap](uploads/__moin_import__/attachments/SampleCaptures/hp-erm-1.cap) Simple sample of 2 pings, one untagged on VLAN 10, one tagged on VLAN 2010 and the HP ERM results of the port of the device sending the ICMP Echo Request.

[hp-erm-2.cap](uploads/__moin_import__/attachments/SampleCaptures/hp-erm-2.cap) Complex sample of 2 pings, one untagged on VLAN 10, one tagged on VLAN 2010 and the HP ERM results of the port of the device sending the ICMP Echo Request, the port on the second switch connecting to the first (both VLANs tagged) and a double-encapsulated sample.

### Automotive Protocols

[udp-nm\_anon.pcap](uploads/__moin_import__/attachments/SampleCaptures/udp-nm_anon.pcap) Simple UDP-NM packet.

[caneth.pcapng](uploads/__moin_import__/attachments/SampleCaptures/caneth.pcapng) Simple CAN-ETH protocol capture.

### Steam In-Home Streaming Protocol

Valve Software's Steam In-Home Streaming Protocol, which is used by the Steam client and Steam Link devices.

Further Information:

  - <https://codingrange.com/blog/steam-in-home-streaming-discovery-protocol>

  - <https://codingrange.com/blog/steam-in-home-streaming-control-protocol>

[steam-ihs-discovery.pcap](uploads/__moin_import__/attachments/SampleCaptures/steam-ihs-discovery.pcap) Server discovery and connection negotiation/authentication

### Wi-SUN low power RF Protocol

[wisunSimple.pcapng](uploads/__moin_import__/attachments/SampleCaptures/wisunSimple.pcapng) Two almost identical frames containing a PAN Advertisement Solicit. The first frame has an error (missing Header Termination 1) and the second has that error corrected. This was used to test a change in Wireshark intended to give a clearer warning message for exactly this error.

### Nano / RaiBlocks Cryptocurrency Protocol

[nano.pcap](uploads/__moin_import__/attachments/SampleCaptures/nano.pcap) Some traffic from the Nano live network, including all common packet and block types.

[nano\_tcp.pcap](uploads/__moin_import__/attachments/SampleCaptures/nano_tcp.pcap) Example Nano bootstrap traffic (TCP).

### ua/udp, ua3g and noe protocols (Alcatel-Lucent Enterprise)

[uaudp\_ipv6.pcap](uploads/__moin_import__/attachments/SampleCaptures/uaudp_ipv6.pcap) Some traffic over ipv6. Filter on fc0c::8 and decode frame \#17 (udp port 32513) as ua/udp protocol. On capture where the source and destination ports are the same, add the call server ip address in the protocol preferences to allow the correct decoding.

[ua3g\_freeseating\_ipv6.pcap](uploads/__moin_import__/attachments/SampleCaptures/ua3g_freeseating_ipv6.pcap) Freeseating message: ipv6 addresses (filter ua3g.ip.freeseating.parameter.ipv6)

[ua3g\_freeseating\_ipv4.pcap](uploads/__moin_import__/attachments/SampleCaptures/ua3g_freeseating_ipv4.pcap) Freeseating message: ipv4 address (filter ua3g.ip.freeseating.parameter.ip)

### DICOM

[DICOM\_C-ECHO-echoscu.pcap](uploads/__moin_import__/attachments/SampleCaptures/DICOM_C-ECHO-echoscu.pcap) Successful C-ECHO request generated with echoscu fromOFFIS DICOM Toolkit

### ETSI Intelligent Transport Systems (ITS) Protocols

[etsi-its-cam-unsecured.pcapng](uploads/__moin_import__/attachments/SampleCaptures/etsi-its-cam-unsecured.pcapng) Cooperative Awareness Basic Service (CAM) sample capture in non secured mode. See ETSI EN 302 637-2 for protocol details.

[etsi-its-denm-unsecured.pcapng](uploads/__moin_import__/attachments/SampleCaptures/etsi-its-denm-unsecured.pcapng) Decentralized Environmental Notification Basic Service (DENM) sample capture in non secured mode. See ETSI EN 302 637-3 for protocol details.

[etsi-its-cam-secured.pcapng](uploads/__moin_import__/attachments/SampleCaptures/etsi-its-cam-secured.pcapng) Cooperative Awareness Basic Service (CAM) sample capture in secured mode.

[etsi-its-denm-secured.pcapng](uploads/__moin_import__/attachments/SampleCaptures/etsi-its-denm-secured.pcapng) Decentralized Environmental Notification Basic Service (DENM) sample capture in secured mode.

[EA\_Request.pcapng](uploads/__moin_import__/attachments/SampleCaptures/EA_Request.pcapng) Enrollment Authorization request/response from an OBU/RSU to a PKI EA entity. To decrypt the messages exchange in Wireshark, please use the following parameters:

\- Private key of the PKI EA certificate: 06EB0D8314ADC4C3564A8E721DF1372FF54B5C725D09E2E353F2D0A46003AB86

\- Whole PKI EA certificate hash SHA-256: 843BA5DC059A5DD3A6BF81842991608C4CB980456B9DA26F6CC2023B5115003E

See:

  - IEEE 1609.2a-2017 IEEE Standard for Wireless Access in Vehicular Environments—Security Services for Applications and Management Messages
  - ETSI TS 102 940 ITS Security; ITS communications security architecture and security management
  - ETSI TS 102 941 ITS Security; Trust and Privacy Management
  - ETSI TS 103 097 ITS Security; Security header and certificate formats

### NetBIOS

A sample program (with nearly the same data transferred) has been run under MS-DOS using different NetBIOS implementations/drivers:

  - [microsoft\_npc\_netbios.pcapng](uploads/__moin_import__/attachments/SampleCaptures/microsoft_npc_netbios.pcapng) NetBEUI (aka NPC) using Microsoft Network Client 3

  - [novell\_eth2\_netbios.pcapng](uploads/__moin_import__/attachments/SampleCaptures/novell_eth2_netbios.pcapng) NetBIOS over IPX using Novell Netware client on Ethernet-II

  - [novell\_raw\_netbios.pcapng](uploads/__moin_import__/attachments/SampleCaptures/novell_raw_netbios.pcapng) NetBIOS over IPX using Novell Netware client on Ethernet-I raw

  - [novell\_llc\_netbios.pcapng](uploads/__moin_import__/attachments/SampleCaptures/novell_llc_netbios.pcapng) NetBIOS over IPX using Novell Netware client using Ethernet-I with LLC

And another NetBIOS example: SMB between an MS-DOS client and a Windows 98 server over NetBEUI: [dos\_win98\_smb\_netbeui.pcapng](uploads/__moin_import__/attachments/SampleCaptures/dos_win98_smb_netbeui.pcapng)

### Dynamic Link Exchange Protocol (DLEP)

[dlep.pcap](uploads/__moin_import__/attachments/SampleCaptures/dlep.pcap) Basic data items as defined in RFC8175

### Asphodel Protocol

[Asphodel\_WMRTCP5135.pcapng](uploads/__moin_import__/attachments/SampleCaptures/Asphodel_WMRTCP5135.pcapng) Streaming data example from a wireless module through a reciever.

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

[9361 - AllJoyn protocol dissector](https://gitlab.com/wireshark/wireshark/-/issues/9361)

[10567 - Improve support for AllJoyn Reliable Datagram Protocol.](https://gitlab.com/wireshark/wireshark/-/issues/10567)

## Captures in specific file formats

[i4b.trace](uploads/__moin_import__/attachments/SampleCaptures/i4b.trace) An I4B (ISDN for BSD) capture file.

[D-1-Anonymous-Anonymous-D-OFF-27d01m2009y-00h00m00s-0a0None.trc](uploads/__moin_import__/attachments/SampleCaptures/D-1-Anonymous-Anonymous-D-OFF-27d01m2009y-00h00m00s-0a0None.trc) An EyeSDN capture file containing DPNSS packets.

[erf-ethernet-example.erf](uploads/__moin_import__/attachments/SampleCaptures/erf-ethernet-example.erf) A Endace [ERF](/ERF) capture file.

## Captures used in Wireshark testing

The following are used during Wireshark testing, and are from the test/captures directory.

[c1222\_std\_example8.pcap](uploads/__moin_import__/attachments/SampleCaptures/c1222_std_example8.pcap) ANSI C12.22 packets, used to cover bug 9196.

[dhcp-nanosecond.pcap](uploads/__moin_import__/attachments/SampleCaptures/dhcp-nanosecond.pcap) DHCP with nanosecond timing.

[dhcp.pcapng](uploads/__moin_import__/attachments/SampleCaptures/dhcp.pcapng) DHCP saved in pcapng format.

[dns\_port.pcap](uploads/__moin_import__/attachments/SampleCaptures/dns_port.pcap) DNS running on a different port than 53.

[dns+icmp.pcapng.gz](uploads/__moin_import__/attachments/SampleCaptures/dns-icmp.pcapng.gz) DNS and ICMP saved in gzipped pcapng format.

[dvb-ci\_UV1\_0000.pcap](uploads/__moin_import__/attachments/SampleCaptures/dvb-ci_UV1_0000.pcap) DVB Common Interface (DVB-CI) packet.

[rsasnakeoil2.pcap](uploads/__moin_import__/attachments/SampleCaptures/rsasnakeoil2.pcap) SSL handshake and encrypted payload.

[sample\_control4\_2012-03-24.pcap](uploads/__moin_import__/attachments/SampleCaptures/sample_control4_2012-03-24.pcap) [ZigBee](/ZigBee) protocol traffic.

[snakeoil-dtls.pcap](uploads/__moin_import__/attachments/SampleCaptures/snakeoil-dtls.pcap) DTLS handshake and encrypted payload.

[wpa-Induction.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/wpa-Induction.pcap.gz) [WiFi](/WiFi) 802.11 WPA traffic.

[wpa-eap-tls.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/wpa-eap-tls.pcap.gz) [WiFi](/WiFi) 802.11 WPA-EAP/Rekey sample.

[segmented\_fpm.pcap](uploads/__moin_import__/attachments/SampleCaptures/segmented_fpm.pcap) FPM and Netlink used for Lua plugin TCP-based dissector testing.

[policy-authorizeNV.pcap](uploads/__moin_import__/attachments/SampleCaptures/policy-authorizeNV.pcap) TPM2.0 policy sample.

## Discussion

Can some one please upload IKEv1(Phase 1 and phase 2) and IKEv2 Packets? -- nitin raj

Is sample the right name, instead of example? I always think about a sampling rate. - *Ulf Lamping*

In this context, "sample" and "example" are interchangeable. I'm not sure which is more formally correct. - *Gerald Combs*

Think of "sample" as in "*take a free sample of our magazine*". Sampling really means that you're taking samples at specific points in time, so it *is* OK. - *Olivier Biot*

Hmmm, still unsure. Following your logic, Sample and Capture would have almost the same meaning. But I'm usually not interested that the capture is sampled from a specific network at a specific point in time, I'm looking for examples, how a specific network traffic does look like. I would think that sample in the way it's used here, is just an abbreviation for example, or do I miss something here. - *Ulf Lamping*

I see. Maybe then "example capture" is more appropriate than "sample capture" or "capture(d) sample". - *Olivier Biot*

What about "example sample"... Everyone would get it, and, most of it, it rhymes\! :smiley: - *Luis Ontanon*

What are the rules regarding attaching sample captures? I mean those that aren't yours. If it was seen "in the wild" (e.g., attached to an email on the mailing list or a bug), is that public enough for someone to attach it here? - Jeff Morriss

Should we add example captures from the mailing list here? In those cases it is obvious that they are donated as examples of a protocol? I am thinking of something like <http://www.wireshark.org/lists/wireshark-dev/200003/msg00078.html> -- ronnie

I've been thinking about that too -- if a sample example :smiley: is sent to the list it's publicly avalable on the net intended or not and could be added to the examples? -- at least if its not obviusly a (bad) misstake -- Anders

### Requests for particular captures

I think some Tor traffic captures would be a good addition. Maybe also examples using different pluggable transports. I will upload later if I end up doing some. :smiley:

Could someone add a capture of Internet Key Exchange (IKE) protocol or IKEv2 ? :smiling\_imp:

Hi I am searching for a capture of MACSec frames according to 802.1ae. Thanks <karsten_g@rad.com>

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

I added Iu-CS capture just now\!\!\! :smiley: Please look under UMTS section. -Samba <sambasiva.manchili@nexustelecom.com> When you open this in it may show IuUP packets, as UDP stream. In this case please click on relevant UDP packet and then select from ***menu*** *Analyze---\>Decode As* RTP(both ports) under Transport tab. In case of any help required, please do not hesitate to write to me.

Anyone have a capture of RTP conforming to RFC 2198 (Redundant Audio) or RFC 2733 (Generic FEC) encoding? Associated SIP/SDP signaling would be a bonus.

Does anyone have any capture files containing "raw" ATM packets (with AAL0/AAL5 would be handy)?. Thank you --

Estou desenvolvendo uma ferramenta em C++ que tem como entrada uma mensagem no formato hexadecimal, encapsulada nos protocolos SS7, do tipo: ISUP, INAP e CAP. E como saída um arquivo .cap ou .pcap para ser lido pelo [WireShark](/WireShark). Para concluir esse projeto gostaria de ter um exemplo de arquivo de entrada (extensão .cap o .pcap) encapsulado nos protocolos INAP E CAP, pois nos arquivos de exemplo disponiveis só encontrei do protocolo ISUP.

I am developing a tool in C++ that has as input a message in the hexadecimal format, encapsulated in SS7 protocols, of the type: ISUP, INAP and CAP. As exit a file .cap or .pcap to be read by the [WireShark](/WireShark). To conclude this project it would like to have an example file (extension cap pcap) encapsulated in protocols INAP and CAP, because in the example files I only found of ISUP protocol.

Can anyone add a UCP capture? especially 5x series messages but others would be helful too... Thanks

Does anyone have HDLC traffic, like for example between WAN routers?

Does anyone have Synchronous Ethernet Capture? -[RadhaKrishna](/RadhaKrishna) <arkrishna@alcatel-lucent.com>

Can someone add a TRIP protocol capture (RFC 3219)?

Can somebody provide a capture of a Cisco wireless accesspoint (any model) connecting to the controller (either via LWAPP or CAPWAP)?

Does anyone has any ETHOAM captures? Please upload.

### Downloading all traces

Is there an easy way to download all of the traces? If yes, please email me. <-grant@wildpackets.com>

Yes,

`wget -nc -r -H -l 1 --accept=cap,gz,pcap,zip,iptrace,snoop,txt,CAP http://wiki.wireshark.org/SampleCaptures`

under UN\*X or Cygwin -Phil

Thanks a ton\! <-grant@wildpackets.com>

That didn't work with wget 1.9.1:

    $ wget -nc -r -H -l 1 --accept=cap,gz,pcap,zip,iptrace,snoop,txt,CAP http://wiki.wireshark.org/SampleCaptures --22:19:05-- http://wiki.wireshark.org/SampleCaptures => `wiki.wireshark.org/SampleCaptures' Resolving wiki.wireshark.org... 65.208.228.223 Connecting to wiki.wireshark.org[65.208.228.223]:80... connected. HTTP request sent, awaiting response... 200 OK Length: unspecified [text/html] [ <=> ] 42,305 68.22K/s 22:19:06 (68.12 KB/s) - `wiki.wireshark.org/SampleCaptures' saved [42305] Removing wiki.wireshark.org/SampleCaptures since it should be rejected. FINISHED --22:19:06-- Downloaded: 42,305 bytes in 1 files

\-*Guy Harris*

Damn, I don't know why this wget commands gets a bad Forbidden from the server when politely asking for some files :wink:

    wget --server-response -r -l 1 --follow-tags=link,a \ --accept=cap,gz,pcap,zip,iptrace,snoop,txt,CAP, \ 'http://wiki.wireshark.org/SampleCaptures'

Someone please tell me...

ok, here is something that \_works\_ (tested) but then, ahem, it's ugly:

    lynx -dump 'http://wiki.wireshark.org/SampleCaptures' | \ grep -Eh --only-matching 'http://[^ ]+' | grep AttachFile | \ while read a; do htget $a; done

Beware when cutting/pasting, some spaces are inserted after the backslash and bash shells don't like that.

\--Phil

ok, I tried this one on my suse 9.3 box but htget was not found. A quick google showed that this tool seems to be Debian specific. It looks natural for us "newbie distribution users" to be more and more jealous of Debian... Anyway I found the source code at <http://ftp.cvut.cz/debian/pool/main/h/htget/htget_0.93-1.1woody1.tar.gz> and expanding the file, followed by 'make', 'make install' (as root) and copying htgetrc to \~/.htgetrc did the trick. Thanks so much for this, ahem, ugly skript that has the undeniable advantage of working great\!

\--Eberhard

The reason the wget doesn't work is the `<meta name="robots" content="index,nofollow">` in the html of the wiki pages. Is there a reason we have that?

\--*Rich van der Hoff*

Try using Download Accelerator Plus (DAP). When integrated with Firefox there is an option called "Save all .." in the right-click context menu

\-- Razor

Hi :smiley:

I used htget, but got all these Sample.\* Prefixes, which may you want to remove:

first \_backup\_

rename like this:

    for i in SampleCaptures\?action\=AttachFile* ; do mv "$i" $( echo $i|sed 's/S.* target=//g' ); done

opt. move [NetMon](/NetMon) files in a separate directory:

    mkdir NetMon; mv `file * |grep NetMon| awk '{ print $1 }'| tr ':' ' ' ` NetMon/

\-- netbeisser :wink:

The "Forbidden" response to wget is caused by the "do=view" part of the link. These files that cause this error can be retrieved okay if substituting this part with "do=get". Suggest the following command (that also has a benefit of auto-renaming the files and doesn't use that hideous `htget` utility):

    lynx -dump 'http://wiki.wireshark.org/SampleCaptures' |
    grep -Eh --only-matching 'http://[^ ]+' | grep AttachFile.*target= |
    sed 's/do=view/do=get/' | sort | uniq |
    while read i; do wget -O ${i##*=} "$i"; done

\-- AVN

wget respects the robot meta tag, so you need to ignore that. '-A' did not work for me, probably because it does not match the query part. This works for me (wget 1.15):

    wget -e robots=off -nc -r -l 1 --accept-regex='.*do=get.*(p?cap|pcapng)(\.gz)?$' --ignore-case http://wiki.wireshark.org/SampleCaptures?action=AttachFile

The above command will result in file names such as 'SampleCaptures?...\&target=foo.pcap'. To get "foo.pcap" instead, you could use the following commands to create symlinks (the advantage is that you can run the wget command again which will skip existing files):

    mkdir captures && cd captures && ln -s ../wiki.wireshark.org .;
    find wiki.wireshark.org/ -name '*target=*' | php -r 'while ($line = fgets(STDIN)) { $line = trim($line); symlink($line, urldecode(preg_replace("#.*target=#", "", $line))); }'

As of this writing, there are 634 files matching that filter which have a total size of 537 MiB. --Lekensteyn

Does anyone have a sample trace of Q-in-Q (IEEE 802.1ah) or MAC-in-MAC? If you add either to these samples, I would appreciate if you drop me a note at <richman30@ix.netcom.com> . Thank you.

\--LMR

-----

-----

---

Imported from https://wiki.wireshark.org/SampleCaptures on 2020-08-11 23:24:23 UTC