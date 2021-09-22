# Tools

This is a place for scripts and tools related to Wireshark / TShark that users may like to share, and for links to related [NetworkTroubleshooting](/NetworkTroubleshooting) tools.

You will find additional development related tools in the [Development](/Development) page.

[[_TOC_]]

## Internal

Some command line tools are shipped together with Wireshark. These tools are useful to work with capture files.

  - [capinfos](http://www.wireshark.org/docs/man-pages/capinfos.html) is a program that reads a saved capture file and returns any or all of several statistics about that file

  - [dumpcap](http://www.wireshark.org/docs/man-pages/dumpcap.html) a small program whose only purpose is to capture network traffic, while retaining advanced features like capturing to multiple files (since version 0.99.0). Dumpcap is the engine under the Wireshark/tshark hood. For long-term capturing, this is the tool you want.

  - [editcap](http://www.wireshark.org/docs/man-pages/editcap.html) edit and/or translate the format of capture files

  - [mergecap](http://www.wireshark.org/docs/man-pages/mergecap.html) merges multiple capture files into one

  - [randpkt](http://www.wireshark.org/docs/man-pages/randpkt.html) random packet generator

  - [rawshark](http://www.wireshark.org/docs/man-pages/rawshark.html) dump and analyze raw libpcap data

  - [reordercap](http://www.wireshark.org/docs/man-pages/reordercap.html) reorder input file by timestamp into output file

  - [text2pcap](http://www.wireshark.org/docs/man-pages/text2pcap.html) generates a capture file from an ASCII hexdump of packets

  - [tshark](https://www.wireshark.org/docs/man-pages/tshark.html) is the command-line equivalent of Wireshark, similar in many respects to `tcpdump/WinDump` but with many more features. Learn it, use it, love it.

## Scripts

  - [dumpcap.bat](uploads/__moin_import__/attachments/Tools/dumpcap.bat) A batch file front-end for `dumpcap.exe`. It allows you to save `dumpcap.exe` settings, be notified of capture events or trigger `dumpcap.exe` capturing after a capture event occurs. It also provides hooks for performing custom actions through user-defined batch files, among other things. In order to get the most out of this batch file, it is recommended that you also download [Handle.exe](https://technet.microsoft.com/en-us/sysinternals/bb896655.aspx) as well as [mailsend1.17b14.exe](https://code.google.com/p/mailsend/downloads/detail?name=mailsend1.17b14.exe), being sure to rename it to `mailsend.exe`. These executables should be saved either in a directory that is in your `PATH` or in the same directory as `dumpcap.bat` itself. (GPL, Windows)

  - [maxfiles.bat](uploads/__moin_import__/attachments/Tools/maxfiles.bat) A batch file to limit either the number of files in a directory to a specified limit, or the total disk space consumed by those files or both.

  - [menushark](/menushark), a Bourne shell menu script to allow users to employ the use of tshark by answering a few menu questions. The script also gives you the command that the menu system has made to try to teach you how to use tshark at the command line.

  - [mpeg\_dump](/mpeg_dump.lua), a Lua script that adds a Wireshark extension to dump MPEG-2 transport stream packets (ISO/IEC 13818-1) from a network capture to a file, for example, to extract one or more mpeg PIDs that were transported via UDP unicast or multicast.

  - [osXextraction](/osXextraction), a macOS bash script to extract particular packet types from a capture file (NOTE: it's not very macOS-specific - some small changes should allow it to work on other UN\*Xes, and would probably allow it to work on Windows with Cygwin as well.)

  - [pdetipv4.py](uploads/__moin_import__/attachments/Tools/pdetipv4.py) : Detect IPv4 packet headers in binary dumps, Perl3, Code development <https://github.com/gr8drag1/pdetipv4>, discussion <https://www.linkedin.com/posts/vadim-zakharine-bb55922_wireshark-ip-capture-activity-6601113583017439232-pCGo>

  - [RtpDumpScript](/RtpDumpScript), a perl script to dump [RTP](/RTP) audio data

  - [RtpH263DumpScript](/RtpH263DumpScript), a perl script to dump H.263 video data

  - [tektronix2pcap](/tektronix2pcap), a script to convert Tektronix rf5 files to pcap format that can be loaded into Wireshark. Note that current versions of Wireshark can directly read [rf5](/rf5) binary captures.

  - [update-ws-profiles](uploads/__moin_import__/attachments/Tools/update-ws-profiles) and [update-ws-profiles.bat](uploads/__moin_import__/attachments/Tools/update-ws-profiles.bat) automate changing strings in a collection of Wireshark profiles, e.g. changing "gui.filter\_expressions.expr: eth.addr==11:22:33:44:55:66" to "gui.filter\_expressions.expr: eth.addr==66:55:44:33:22:11"

  - [update\_geoip.bat](uploads/__moin_import__/attachments/Tools/update_geoip.bat) A batch file inspired by Jasper Bongertz's [UpdateGeoIPDB.cmd](https://github.com/packetfoo/GeoIPDBUpdate/blob/master/UpdateGeoIPDB.cmd) file that makes it easier to update the [MaxMind](http://geolite.maxmind.com/download/geoip/database) GeoIP database files. (GPL, Windows)

## Wrappers

  - [dumpcapui](http://www.netskillz.com/dumpcapui/) - A GUI front-end for `dumpcap.exe` that helps you in setting up `dumpcap.exe` captures and allows storing and retrieving of those settings at a later time. (Windows)

  - [Net::Sharktools](http://search.cpan.org/dist/Net-Sharktools/) - Use Wireshark's packet dissection engine from Perl (blog entries: [1](http://blog.nu42.com/2011/01/perl-xs-interface-to-sharktools.html) [2](http://blogs.perl.org/users/brian_d_foy/2011/01/a-perl-interface-for-sharktools.html)).

  - [Packet Dump Decode (pdd)](http://code.google.com/p/pdd/) is a simple and convenient GUI wrapper around the Wireshark tools to convert packet hexdumps into well formatted xml (viz. text2pcap and tshark). Using pdd, you just need to copy-paste the hexdump into pdd and hit the "Decode" button (GPL, Linux/Win32)

  - [Packet Hexdump Decoder (phd)](http://sadjad.me/phd/) is a web-based utility that uses Wireshark tools to decode packet hexdumps online.

  - [Sharktools](https://github.com/armenb/sharktools) - Use Wireshark's packet dissection engine from Matlab and Python ([announcement](http://www.wireshark.org/lists/wireshark-users/201011/msg00028.html)).

  - [Webshark.io](https://webshark.io/) - Web interface using sharkd as backend. [Git repo](https://bitbucket.org/jwzawadzki/webshark)

  - [Termshark](https://termshark.io/) - Terminal user interface for tshark. Written in Go, supports Linux/macOS/FreeBSD/Windows. [Git repo](https://github.com/gcla/termshark)

## External Links

Tools related to [NetworkTroubleshooting](/NetworkTroubleshooting) and alike.

### Dedicated capture tools

  - [dumpcap](http://www.wireshark.org/docs/man-pages/dumpcap.html) shipped with Wireshark, already mentioned at the "Internal" section above

  - [Microsoft Message Analyzer](http://www.microsoft.com/en-us/download/details.aspx?id=44226) Microsoft's newest tool for capturing, displaying, and analyzing protocol messaging traffic and to trace and assess system events and other messages from Windows components

  - [Microsoft Network Monitor 3.4](http://www.microsoft.com/en-us/download/details.aspx?id=4865) Microsoft's network traffic capture and protocol analysis tool, now largely supplanted by *Message Analyzer*, but still potentially useful especially on systems that do not meet the *Message Analyzer* system requirements

  - Microsoft Packet Monitor tool: Packet Monitoring is a new feature that allows you to diagnose your server by capturing and displaying network traffic through the networking stack in a log that is filtered, organized, and easy to follow and manipulate. (pktmon.exe) [Non-Microsoft](https://www.bleepingcomputer.com/news/microsoft/windows-10-quietly-got-a-built-in-network-sniffer-how-to-use/) writeup. (update when/if Microsoft documents)

  - [multicap](http://src.carnivore.it/multicap/about/) (a packet capture tool for Linux)

  - [netsniff-ng](http://netsniff-ng.org/) (a packet capture tool for Linux)

  - [netsh trace](https://technet.microsoft.com/en-us/library/dd878517) the Windows native command-line tracing tool

  - [PacketCache](https://www.netresec.com/?page=PacketCache) Capture packets in RAM (Windows only)

  - [Packet Sniffer](http://packet-sniffer.net/) Connection oriented TCP/IP packet sniffer and protocol analyzer

  - [RawCap](http://www.netresec.com/?page=RawCap) (a raw socket sniffer for Windows)

  - [snoop](/snoop) SunOS/Solaris capture tool

  - [SPAN Port Configurator](http://www.netfort.com/downloads/free-software) (a Cisco SPAN port configuration tool for Windows)

  - [TcpDump](/TcpDump) / [WinDump](/WinDump) the classical capture tool(s)

  - [UML Sniffing](http://kartoch.msi.unilim.fr/wiki/index.php?n=Netkit.InstallSniffing) a patch to enable sniffing in [User Mode Linux](http://user-mode-linux.sourceforge.net/) (like used in [netkit](http://wiki.netkit.org/index.php/Main_Page))

  - [Colasoft Capsa Free Network Analyzer](https://www.colasoft.com/capsa-free/) is a network analyzer freeware for Ethernet monitoring, troubleshooting and analysis. (Windows freeware)

### Monitoring/tracing tools

The following tools can process the libpcap-format files that Wireshark and TShark produce or can perform network traffic capture and analysis functions complementary to those performed by Wireshark and TShark. In brackets you will find the program license and the supported operating systems.

  - [A-packets](https://apackets.com/) Allow read pcap file and analyze IPv4/IPv6, HTTP, Telnet, FTP, DNS, SSDP, WPA protocols, build map of network structure and nodes activity graph, sniff and analyze network traffic and other pcap data.  Analyse pcap files to view HTTP headers and data, extract transferred binaries, files, office documents, pictures.

  - [Arkime](https://github.com/arkime/arkime) Arkime (formerly Moloch) is a large scale, open source, indexed packet capture (PCAP) and search tool.

  - [Cap'r Mak'r](http://www.pcapr.net/caprmakr) generates new pcaps for various protocols

  - [Chaosreader](http://chaosreader.sourceforge.net/) Extracts data streams from TCP connections and writes each stream to a file (GPL, Windows, various UN\*Xes)

  - [CloudShark](http://www.cloudshark.org/) Ability to view and analyze captures in a browser, annotate and tag them, and share them with a URL.

  - [Cookie Cadger](https://www.cookiecadger.com/) Helps identify information leakage from applications that utilize insecure HTTP GET requests.

  - [Driftnet](http://www.ex-parrot.com/~chris/driftnet/) It is a program which listens to network traffic and picks out images from TCP streams it observes (GPL, Linux)

  - [Dshell](https://github.com/USArmyResearchLab/Dshell) is an extensible network forensic analysis framework that enables rapid development of plugins to support the dissection of network packet captures. (MIT, Linux)

  - [EtherApe](http://etherape.sourceforge.net/) A graphical network monitor (GPL, Linux only)

  - [Ettercap](http://ettercap.sourceforge.net/) Allows for sniffing of machines in a switched network LAN (GPL, BSD/Linux/Solaris)

  - [ExtShark](https://github.com/fuzzz/extshark) is web-interface to tshark. It will bring dumping to cloud.

  - [Homer](http://www.sipcapture.org) SIP Capture Server & Agent

  - [HPD](https://hpd.gasmi.net) Online hex message and pcap file parser with packet visualization.

  - [HUNT](http://lin.fsid.cvut.cz/~kra/#HUNT) Allows for sniffing of machines in a switched network LAN as well as providing a very easy to use API to modify the intercepted frames before they are forwarded. Intercept and Modify. (GPL, Linux)

  - [Impacket](http://corelabs.coresecurity.com/index.php?module=Wiki&action=view&type=tool&name=Impacket) It is a collection of Python classes focused on providing access to network packets (Apache, Linux).

  - [ipsumdump](http://www.cs.ucla.edu/~kohler/ipsumdump/) summarizes TCP/IP dump files into a self-describing ASCII format easily readable by humans and programs (uses the [Click modular router](http://www.read.cs.ucla.edu/click/)).

  - [joincap](https://github.com/assafmo/joincap) Merge multiple pcap files together, gracefully (MIT, Linux/MacOS/Windows)

  - [junkie](https://github.com/securactive/junkie) A real-time packet sniffer and analyzer (AGPLv3, Linux)

  - [justsniffer](http://justniffer.sourceforge.net) is a tcp packet sniffer. (GPL, BSD/Linux/Win32)

  - [Mojo Packets](https://mojopackets.com/) Mojo Packets™ is web based tool which aims to simplify trace based analysis and troubleshooting of connectivity issues observed in Wi-Fi (IEEE 802.11) environments.

  - [Mu DoS](http://www.pcapr.net/dos) converts any packet into a DoS generator

  - [NetSleuth](http://www.netgrab.co.uk/) is a free network forensics and pcap file analyser. It provides offline analysis for incident response, and live "silent portscanning" functionality. (GPL, Windows)

  - [netsniff-ng](http://netsniff-ng.org/) is a free, Linux network analyzer and networking toolkit.

  - [NetworkMiner](http://www.netresec.com/?page=NetworkMiner) A network forensic analysis tool (GPL, Windows)

  - [Ntop](http://www.ntop.org/) Network top - tool that lets you analyze network traffic statistics (GPL, FreeBSD/Linux/Unix)

  - [online message parser](http://www.linkbit.com/support-decoder.html) Online single hex message parser, supports Wireless/PSTN/VoIP protocols (Freeware, Web)

  - [Online PCAP to MSC chart Generator](http://tools.valid8.com) generates MSC arrow diagram charts from PCAP files.

  - [p0f](http://lcamtuf.coredump.cx/p0f.shtml) versatile passive OS fingerprinting and many other tricks (Freeware, BSD/Linux/Win32/...). Take a look[here](http://whatever.frukt.org/routerp0f.text.shtml) to see some stats generated with p0f and some scripts.

  - [packet-o-matic](http://www.packet-o-matic.org/) is a packet sniffer, supporting fairly general packet processing, used mainly for network forensics. (GPL, BSD/Linux/macOS/Solaris)

  - [PacketShark™](http://www.gl.com/packetshark-handheld-gigabit-ethernet-tester.html) A handheld hardware tap for 100% on-field capturing of Ethernet packets at wire speed; store captured data using an external storage device (SD memory card) and analyze using wireshark

  - [pcap\_diff](http://sourceforge.net/projects/pcapdif/) compares pcap files for received, missing or altered packets.

  - [pcapdatacopy](http://sourceforge.net/projects/pcapdatacopy) Windows based application with various functions: copy TCP/UDP payload data from one or more .pcap files to a single file. merge multiple .pcap files into a single file, detect and export rtp streams from one or more files to both raw and wav format file.(Win32)

  - [Prelude](http://www.prelude-ids.org/) Another network intrusion detection system (GPL, BSD/Linux/Unix)

  - [RRDtool](http://people.ee.ethz.ch/~oetiker/webtools/rrdtool/) is "a system to store and display time-series data (i.e. network bandwidth, machine-room temperature, server load average)". (GPL, various UN\*Xes) Many RRDtool-based applications are listed on [the RRD World page](http://people.ee.ethz.ch/~oetiker/webtools/rrdtool/rrdworld/).

  - [Show Traffic](http://sourceforge.net/projects/showtraf) shows continuous summary list of TCP/UDP traffic (BSD, Win32)

  - [Snort](http://www.snort.org/) Network intrusion detection system (GPL, BSD/Linux/Unix/Win32)

  - [SplitCap](http://www.netresec.com/?page=SplitCap) A pcap file splitter.

  - [Suricata](https://suricata-ids.org/) a free and open source, mature, fast and robust network threat detection engine. (GPLv2, Windows, various Un\*Xes)

  - [tcpflow](https://github.com/simsong/tcpflow/wiki/tcpflow-%E2%80%94-A-tcp-ip-session-reassembler) Extracts data streams from TCP connections and writes each stream to a file (GPL, UN\*X/Windows)

  - [tcpick](http://tcpick.sourceforge.net/) tcpick is a textmode sniffer libpcap-based that can track, reassemble and reorder tcp streams (GPL, BSD/Linux/Unix)

  - [tcpstat](http://www.frenchfries.net/paul/tcpstat/) Tool for reporting statistics for TCP connections (BSD style, BSD/Linux/Unix)

  - [tcptrace](http://www.tcptrace.org/) Tool for analysis of TCP connections (GPL, BSD/Linux/Unix)

  - [TcpView](https://docs.microsoft.com/en-us/sysinternals/downloads/tcpview) maps TCP/UDP endpoints to running programs (Freeware, Win32)

  - [tcpxtract](http://tcpxtract.sourceforge.net/) It is a tool for extracting files from network traffic based on file signatures (GPL, various UN\*Xes)

  - [Tele Traffic Tapper](http://www.csl.sony.co.jp/person/kjc/kjc/software.html#ttt) Graphical traffic-monitoring tool; can also read saved capture files (BSD style?, BSD/Linux)

  - [TPCAT](http://sourceforge.net/projects/tpcat/) will analyze two packet captures (taken on each side of the firewall as an example) and report any packets that were seen on the source capture but didn’t make it to the destination (GPLv2, any OS with Python and pcapy)

  - [tracesplit](https://github.com/wanduow/libtrace/wiki/tracesplit) will split a trace into a number of smaller tracefiles (GPLv3)

  - [Tranalyzer](http://tranalyzer.com/) It is a lightweight flow generator and packet analyzer application (GPL, Linux)

  - [TrimPCAP](http://www.netresec.com/?page=Blog&month=2017-12&post=Don%27t-Delete-PCAP-Files---Trim-Them) Trim PCAP files

  - [Tstat](http://tstat.tlc.polito.it/index.shtml) A passive sniffer able to provide several insights on the traffic patterns at both the the network and transport levels (GPL, various UN\*Xes)

  - [VisualEther Protocol Analyzer](http://www.eventhelix.com/VisualEther/) generates sequence diagrams from Wireshark PDML output (Win32)

  - [WebScarab](https://www.owasp.org/index.php/Category:OWASP_WebScarab_Project) [WebScarab](/WebScarab) is a framework for analysing applications that communicate using the HTTP and HTTPS protocols.

  - [Xplico](http://www.xplico.org) A network forensic analysis tool (GPL, Linux only)

  - [xtractr](http://www.pcapr.net/xtractr) collaborative cloud app for indexing, searching, reporting and extracting on large pcaps using tshark

  - [Expert Network Analysis](http://expertnetworkanalysis.naudit.es/) An online tool where you can upload a pcap traffic trace captured in the network point considered as problematic and receive a personalized report

  - [Zeek (formerly Bro)](https://zeek.org/) an open source network security monitoring tool (BSD license, Linux, FreeBSD, macOS, possibly other various UN\*Xes)

### Traffic generators

These tools will either generate traffic and transmit it, retransmit traffic from a capture file, perhaps with changes, or permit you to edit traffic in a capture file and retransmit it.

  - [Bit-Twist](http://bittwist.sourceforge.net/) includes bittwist, to retransmit traffic from a capture file, and bittwiste, to edit a capture file and write the result to another file (GPL, BSD/Linux/OSX/Windows)

  - [Cat Karat](https://sites.google.com/site/catkaratpacketbuilder/) - Easy packet generation tool that allows to build custom packets for firewall or target testing and has integrated scripting ability for automated testing. (Windows)

  - [D-ITG](http://www.grid.unina.it/software/ITG/) - (Distributed Internet Traffic Generator) is a platform capable to produce traffic at packet level accurately replicating appropriate stochastic processes for both IDT (Inter Departure Time) and PS (Packet Size) random variables (exponential, uniform, cauchy, normal, pareto, ...).

  - [epb - ethernet package bombardier](http://maz-programmersdiary.blogspot.fi/2012/05/epb-ethernet-package-bombardier.html) Simple CLI tool for generating/converting ethernet packets from plain text/pcap/netmon/snoop files. (BSD like, Linux/Unix)

  - [HexInject](http://hexinject.sourceforge.net/) is a very versatile packet injector and sniffer, that provides a command-line framework for raw network access. (BSD License (2011), \*nix)

  - [Mausezahn](http://www.perihel.at/sec/mz/) Mausezahn is a free fast traffic generator written in C which allows you to send nearly every possible and impossible packet.

  - [Nemesis](http://nemesis.sourceforge.net/) is a command-line network packet crafting and injection utility. Nemesis can natively craft and inject ARP, DNS, ETHERNET, ICMP, IGMP, IP, OSPF, RIP, TCP and UDP packets. (GPL, BSD/Linux/Solaris/Mac OSX/Win32)

  - [Network Expect](http://www.netexpect.org/) is a framework that allows to easily build tools that can interact with network traffic. Following a script, traffic can be injected into the network, and decisions can be taken, and acted upon, based on received network traffic. An interpreted language provides branching and high-level control structures to direct the interaction with the network. Network Expect uses libwireshark for all packet dissection tasks. (GPL, BSD/Linux/OSX)

  - [Network Traffic Generator](http://sourceforge.net/projects/traffic) Client/Server based TCP/UDP traffic generator (GPL, BSD/Linux/Win32)

  - [Ostinato](https://ostinato.org/) is a network packet and traffic generator and analyzer with a friendly GUI. It aims to be "Wireshark in Reverse" and thus become complementary to Wireshark. It features custom packet crafting with editing of any field for several protocols: Ethernet, 802.3, LLC SNAP, VLAN (with Q-in-Q), ARP, IPv4, IPv6, IP-in-IP a.k.a IP Tunneling, TCP, UDP, ICMP, IGMP, MLD, HTTP, SIP, RTSP, NNTP, etc. It is useful for both functional and performance testing. (GPL, Linux/BSD/OSX/Win32)

  - [packETH](http://packeth.sourceforge.net/) GUI/CLI Ethernet packet generator (GPL, Linux/OSX/Windows)

  - [Packet Sender](https://packetsender.com/) is an open source utility to allow sending and receiving TCP, UDP, and SSL (encrypted TCP) packets (GPL, Linux/OSX/Windows).

  - [PlayCap](https://github.com/signal11/PlayCap) is a GUI tool for playing back pcap/Wireshark captures (GPL, Linux/Windows).

  - [Scapy](http://www.secdev.org/projects/scapy/) Scapy is a powerful interactive packet manipulation program (in Python). It is able to forge or decode packets of a wide number of protocols, send them on the wire, capture them, match requests and replies, and much more. (GPL, BSD/Linux/OSX)

  - [tcpreplay](http://tcpreplay.appneta.com/) the opposite of tcpdump, send pcap files out of an interface (BSD, BSD/Linux/Unix)

  - [Colasoft Packet Player](https://www.colasoft.com/packet_player/) is a packet replayer which allows users to open captured packet trace files and play them back in the network. (Windows, see [EULA](https://www.colasoft.com/products/license_pt_player.php))

This is another collection of traffic generators: <http://www.grid.unina.it/software/ITG/link.php>

### Capture file editors and/or anonymizers

These tools can be used to "anonymize" capture files, replacing fields such as IP addresses with randomized values.

  - [AnonTool](http://crawdad.cs.dartmouth.edu/meta.php?name=tools/sanitize/generic/AnonTool) from the [CRAWDAD](http://crawdad.cs.dartmouth.edu/index.php) archive of wireless traffic.

  - The bittwiste tool from [Bit-Twist](http://bittwist.sourceforge.net/).

  - The [Crypto-PAn](http://www.cc.gatech.edu/computing/Networking/projects/cryptopan) tool.

  - The [Network Expect](http://netexpect.org/wiki) tool, which [can be used to anonymize packets](http://netexpect.org/wiki/RewriteAndReplay#Traffic_Anonymization).

  - The [pktanon](http://www.tm.uka.de/software/pktanon/) tool from the [Karlsruhe Institute of Technology Institute of Telematics](http://telematics.tm.kit.edu/english/index.php).

  - The [SafePCAP](https://omnipacket.com/safepcap.html) tool from Omnipacket.

  - The [SCRUB-tcpdump](http://scrub-tcpdump.sourceforge.net) tool.

  - The [tcpdpriv](http://ita.ee.lbl.gov/html/contrib/tcpdpriv.html) tool from the [Internet Traffic Archive](http://ita.ee.lbl.gov).

  - The [tcprewrite](http://tcpreplay.appneta.com/wiki/tcpreplay) tool from [tcpreplay](http://tcpreplay.appneta.com//).

  - The [TraceWrangler](http://www.tracewrangler.com/) tool.

  - The [WireEdit](https://wireedit.com/) tool from Omnipacket.

  - [Colasoft Packet Builder](https://www.colasoft.com/packet_builder/) enables creating custom network packets; users can use this tool to check their network protection against attacks and intruders. Colasoft Packet Builder includes a very powerful editing feature. Besides common HEX editing raw data, it features a Decoding Editor allowing users to edit specific protocol field values much easier. (Windows, see [EULA](https://www.colasoft.com/products/license_pt_builder.php))

There's [a categorized list of anonymization tools](http://www.caida.org/tools/taxonomy/anontaxonomy.xml) at the [CAIDA](http://www.caida.org/home/) site.

### Capture file repair

These tools attempt to repair damaged capture files as much as can be done.

  - [pcapfix](http://f00l.de/pcapfix/) can repair corrupted or truncated capture files.

### Capture file tools

  - [Brim](https://www.brimsecurity.com/) A new way to browse, store and archive your logs (Windows, macOS, Linux, [BSD 3-Clause License](https://github.com/brimsec/brim/blob/master/LICENSE.txt))

  - [Brute Shark](https://github.com/odedshimon/BruteShark) a Network Forensic Analysis Tool (NFAT) that performs deep processing and inspection of network traffic (mainly PCAP files). (Windows, Linux, [GPLv3](https://github.com/odedshimon/BruteShark/blob/master/LICENSE))

  - [large-pcap-analyzer](https://github.com/f18m/large-pcap-analyzer) is designed to perform some common operations on very large PCAP files at high speed.

  - [sctpunbunlde](https://github.com/kor44/sctpunbundle/releases) splits SCTP chunks into separate frames. [Git repo](https://github.com/kor44/sctpunbundle)

### Capture file conversion

These tools convert between different capture file formats.

  - [etl2pcapng](https://github.com/microsoft/etl2pcapng) This tool enables you to view ndiscap packet captures with Wireshark by converting the etl file to a pcapng file. (Windows, [MIT License](https://github.com/microsoft/etl2pcapng/blob/master/LICENSE))

  - [PcapNG.com](http://pcapng.com/) Free online service that converts pcapng files to plain libpcap (pcap) format.

  - [ProConvert](https://mypeek.wildpackets.com/view_submission.php?id=97) convert capture files between different formats - some that Wireshark currently doesn't support (closed source freeware, unsupported and noted as buggy by vendor, registration and [WildPackets](/WildPackets) maintenance contract required, Win32 only)

### Collections

  - [Awesome PCAP Tools](http://xiaming.me/awesome-pcaptools/) A list of tools to process pcap files in research of network traffic

  - [A list of tools](http://www.comlab.uni-rostock.de/research/tools.html) Web page of links to various networking tools

  - [dsniff](http://www.monkey.org/~dugsong/dsniff/) is a collection of tools for network auditing and penetration testing (BSD style?, BSD/Linux/Solaris/...)

  - [Network Security Toolkit (NST 34-12743)](https://www.networksecuritytoolkit.org/) Fedora-based (F34) bootable Linux distribution with best-of-breed open source network security tools. Provides a Web-Based frontend to the **dumpcap** network packet capture engine with dump file format: **pcapng** support. Simultaneous network packet capture on up to 4 network interfaces per Multi-Tap session is supported. Also provides IPv4 Address conversation geolocations and extensive **HTML** report generation from **PDML** and **PSML** packet decoding. See the article: [Multi-Tap Network Packet Capturing](https://www.networksecuritytoolkit.org/nst/tools/wiki-redirect.php?page=Multi-Tap_Network_Packet_Capturing) for a tutorial and example usage. Capture starting can be delayed by a duration or an absolute date. Captures can be uploaded from **NST** to ["CloudShark.org"](https://www.cloudshark.org) or a ["CloudShark Appliance"](https://appliance.cloudshark.org/product.html) for viewing, sharing and analysis in a web browser (See: [HowTo Use The NST CloudShark Upload Manager](https://wiki.networksecuritytoolkit.org/nstwiki/index.php/HowTo_Use_The_NST_CloudShark_Upload_Manager) for additional information). Tshark specific statistics conversations can be generated in tabular format and then further analyzed with the [NST WUI "Network Tools Widgets](https://wiki.networksecuritytoolkit.org/nstwiki/index.php/HowTo_Use_The_NST_Network_Tools_Widgets)".

  - [Packetfactory projects](http://packetfactory.openwall.net/projects/) Various networking-related tools and libraries

  - [Top 75 Security Tools](http://www.insecure.org/tools.html) from [nmap](http://www.insecure.org/nmap/) users votes

### USB capture

Currently, *raw* USB traffic can be captured with Wireshark only under Linux, macOS, and Windows; see [CaptureSetup/USB](/CaptureSetup/USB). If it's an [Ethernet](/Ethernet) (or any other network related) USB adapter, Wireshark can capture e.g. Ethernet traffic from that USB device if the platform supports it (which it usually will do). On Win32 you can however try:

  - [SniffUSB](http://www.pcausa.com/Utilities/UsbSnoop/) "minor" updates and port of usbsnoop 1.8 (v2.0.0006 Feb 2007)

  - [SnoopyPro](http://sourceforge.net/projects/usbsnoop/) based on usbsnoopy, last updated (v0.22) in 2002 (GPL, Win32)
    
      - Also [usbsnoop](http://benoit.papillault.free.fr/usbsnoop/) seems to be by the same developer, but updated through 2001-2003 (latest v1.8)

  - [usbsnoopy](http://www.wingmanteam.com/usbsnoopy/) last updated (v0.13) in 2001 (no license, source incl., Win32)

### Intrusion Analysis / SQL Database Support

  - [C5 SIGMA](http://www.commandfive.com/research.html) from [Command Five Pty Ltd](http://www.commandfive.com/) automates TShark (Wireshark) to load large quantities of packet capture data into a SQL database using an automatically generated schema. C5 SIGMA flattens the Wireshark protocol tree into a relational table structure useful for intrusion analysis and data correlation with other systems. It also enables SQL queries against otherwise unnamed text fields visible in the Wireshark protocol tree by intelligently generating human readable names. C5 SIGMA is free software, released under GPL.

  - [pcap2xml/sqlite](http://hackoftheday.securitytube.net/2015/03/pcap2xmlsqlite-convert-80211-packets-to.html) This tool converts 802.11 packet traces (PCAP format) into an XML and SQLITE equivalent so you can now run XPATH/XQUERY/SQL queries on the packets.

---

Imported from https://wiki.wireshark.org/Tools on 2020-08-11 23:26:45 UTC