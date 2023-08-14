This page contains a collection of user-created public scripts, macros, colouring rules and other useful plugins.

[[_TOC_]]

## Colouring Rules

Coloring rule files use an extension to keep them unique within the wiki. They need to be renamed when applied to a profile.

<div>

<table>
<tr>
<td>

**Color profile**
</td>
<td>

**Profile version**
</td>
<td>

**Minimum Wireshark version**
</td>
<td>

**Description**
</td>
</tr>
<tr>
<td>

[colorfilters.rtps](uploads/\__moin_import_\_/attachments/Contrib/colorfilters.rtps)
</td>
<td>16-03-05</td>
<td>

2\.1.0
</td>
<td>These color filters are for RTPS protocol</td>
</tr>
</table>

</div>## Display Filter Macros

None yet.

## Lua Plugins

### Protocol Dissectors

<div>

<table>
<tr>
<td>

**Lua plugin**
</td>
<td>

**Lua plugin version**
</td>
<td>

**Minimum Wireshark version**
</td>
<td>

**Description**
</td>
<td>

**Sample capture**
</td>
</tr>
<tr>
<td>

[citp.lua](uploads/\__moin_import_\_/attachments/Contrib/citp.lua)
</td>
<td>12-01-24</td>
<td>

1\.10.0
</td>
<td>

This plugin dissects CITP (Controller Interface Transport Protocol), as described at www.citp-protocol.org. CITP is used in the event and entertainment industries to allow lighting consoles, media servers and visualizers to interchange operation information with an open protocol. The plugin is hosted on [github](https://github.com/hossimo/CITP-Dissector).
</td>
<td>none</td>
</tr>
<tr>
<td>

[cr3.lua](uploads/\__moin_import_\_/attachments/Contrib/cr3.lua)
</td>
<td>14-09-02</td>
<td>

1\.10.0
</td>
<td>

This plugin dissects packets for the Crimson v3 protocol related to the ICS HMI touchpanels made by Red Lion Controls (redlion.net). These devices support updates over TCP port 789. This minimal dissector is a starting point for understanding this protocol. The plugin is hosted on [github](https://github.com/internetofallthethings/cr3-wireshark).
</td>
<td>none</td>
</tr>
<tr>
<td>

[dpt.lua](https://github.com/martin-cowie/wireshark-dissector)
</td>
<td>14-08-28</td>
<td>

1\.10.0
</td>
<td>

This plugin dissects dissect the DPT protocol used by Diffusion (www.pushtechnology.com). The plugin is hosted on [github](https://github.com/martin-cowie/wireshark-dissector).
</td>
<td>

[DPT samples](https://github.com/martin-cowie/wireshark-dissector/tree/master/samples)
</td>
</tr>
<tr>
<td>

[fpm.lua](uploads/\__moin_import_\_/attachments/Contrib/fpm.lua)
</td>
<td>

1\.0
</td>
<td>

1\.10.0
</td>
<td>

This plugin dissects Forwarding Plane Manager (FPM) messages over TCP, which internally contain [Netlink protocol](https://en.wikipedia.org/wiki/Netlink) messages. The open source [Quagga](http://www.nongnu.org/quagga/), [Zebra](https://en.wikipedia.org/wiki/GNU_Zebra), and commercial [ZebOS](http://www.ipinfusion.com/products/zebos-network-platform) routing stacks/engines all use FPM to communicate to the forwarding plane of a router.
</td>
<td>

[segmented_fpm.pcap](uploads/\__moin_import_\_/attachments/Contrib/segmented_fpm.pcap)
</td>
</tr>
<tr>
<td>

[gits.lua](uploads/\__moin_import_\_/attachments/Contrib/gits.lua)
</td>
<td>15-01-19</td>
<td>

1\.10.0
</td>
<td>

This plugin dissects packets for [PwnAdventure](/PwnAdventure) 3, an MMORPG game designed to be hacked (pwnadventure.com). The plugin is hosted on [github](https://github.com/maetrics/wireshark-scripts).
</td>
<td>

[gits15.tar.gz](uploads/\__moin_import_\_/attachments/Contrib/gits15.tar.gz)
</td>
</tr>
<tr>
<td>

[guacamole.lua](https://wiki.wireshark.org/Lua/Examples/Guacamole)
</td>
<td>

1\.5
</td>
<td>unknown</td>
<td>

This plugin dissects the [Guacamole Protocol](https://guacamole.apache.org/doc/gug/guacamole-protocol.html)
</td>
<td>

[/Lua/Examples/Guacamole](https://wiki.wireshark.org/Lua/Examples/Guacamole)
</td>
</tr>
<tr>
<td>

[inetx_generic.lua, et al](https://github.com/diarmuidcwc/LuaDissectors)
</td>
<td>15-03-27</td>
<td>

1\.12.0
</td>
<td>

This plugin dissects iNet-X (CTEIP Integrated Network Enhanced Telemetry) and IENA packet formats. See [Curtis-Wright](http://www.cwc-ae.com/flight-test-learn-more/inet-x) for details. The plugin is hosted on [github](https://github.com/diarmuidcwc/LuaDissectors).
</td>
<td>

[test samples](https://github.com/diarmuidcwc/AcraNetwork/tree/master/test)
</td>
</tr>
<tr>
<td>

[kdnet.lua](uploads/\__moin_import_\_/attachments/Contrib/kdnet.lua)
</td>
<td>2017-02-19</td>
<td>

2\.0.2
</td>
<td>

Reverse-engineered Windows Kernel Debugger UDP protocol. Plugin, pcap and keys are hosted on [Github](https://github.com/Lekensteyn/kdnet)
</td>
<td>

</td>
</tr>
<tr>
<td>

[LyncPacketDissector1.00.lua](uploads/\__moin_import_\_/attachments/Contrib/LyncPacketDissector1.00.lua) / [Lync-Skype4B-Plugin2.00.lua](uploads/\__moin_import_\_/attachments/Contrib/Lync-Skype4B-Plugin2.00.lua)
</td>
<td>

1\.00 / 2.0
</td>
<td>

1\.10.0 / 2.0
</td>
<td>

This plugin dissects Microsoft Lync AV Edge and Internal Edge AV traffic, STUN/TURN traffic on Microsoft Lync Edge port, and the dynamically assigned RTP and RTCP traffic by using ports allocated in STUN requests. For more information, see [myskypelab.com](http://www.myskypelab.com/2014/05/microsoft-lync-wireshark-plugin.html).
</td>
<td>none</td>
</tr>
<tr>
<td>

[omci.lua](uploads/\__moin_import_\_/attachments/Contrib/omci.lua) and [BinDecHex.lua](uploads/\__moin_import_\_/attachments/Contrib/BinDecHex.lua)
</td>
<td>14-3-13-r11</td>
<td>

1\.4.3
</td>
<td>

This plugin dissects packets for ONT Management and Control Interface (OMCI) protocol (ITU Rec. G984.4). The purpose of the dissector is to decode OMCI data flowing between Optical Line Termination (OLT, the network side) and Optical Network Termination (ONT, the end user side). Both Lua files are needed, as one depends on the other. The plugin is hosted on [google](https://code.google.com/p/omci-wireshark-dissector/).
</td>
<td>

[omci-example.pcap](uploads/\__moin_import_\_/attachments/Contrib/omci-example.pcap)
</td>
</tr>
<tr>
<td>

[packet-simplemessage.lua](uploads/\__moin_import_\_/attachments/Contrib/packet-simplemessage.lua)
</td>
<td>

0\.1.9
</td>
<td>

1\.10.0
</td>
<td>

This plugin dissects the ROS-Industrial [SimpleMessage](/SimpleMessage) protocol, as defined on [www.ros.org](http://wiki.ros.org/simple_message). The plugin is hosted on [github](https://github.com/ros-industrial/packet-simplemessage).
</td>
<td>

[simple_move.pcapng](uploads/\__moin_import_\_/attachments/Contrib/simple_move.pcapng)
</td>
</tr>
<tr>
<td>

[rtp_ext_onvif_replay.lua](uploads/\__moin_import_\_/attachments/Contrib/rtp_ext_onvif_replay.lua)
</td>
<td>15-06-02</td>
<td>

1\.10.0
</td>
<td>

This plugin dissects ONVIF ([Open Network Video Interface Forum](http://www.onvif.org)) media streams in RTP packets, as defined in [ONVIF Spec 2.10 section 6.2](http://www.onvif.org/specs/stream/ONVIF-Streaming-Spec-v210.pdf). The plugin is hosted on [github](https://github.com/htbegin/lua_wireshark).
</td>
<td>none</td>
</tr>
<tr>
<td>

[satp.lua](uploads/\__moin_import_\_/attachments/Contrib/satp.lua)
</td>
<td>r133</td>
<td>

1\.10.0
</td>
<td>

This plugin dissects the Secure Anycast Tunneling Protocol (SATP), as defined in IETF draft draft-gsenger-secure-anycast-tunneling-protocol-02. The plugin is hosted on [SVN](http://svn.anytun.org/anytun-common/trunk/wireshark-lua/).
</td>
<td>

[nullcypher-pings.pcap](uploads/\__moin_import_\_/attachments/Contrib/nullcypher-pings.pcap)
</td>
</tr>
<tr>
<td>

[SMPTE-2022-6.lua](uploads/\__moin_import_\_/attachments/Contrib/SMPTE-2022-6.lua)
</td>
<td>14-02-14</td>
<td>

1\.10
</td>
<td>

This plugin dissects SMPTE 2022-6 High Bit Rate Media Signals over IP Networks (HBRMT). The plugin is hosted on [github](https://github.com/FOXNEOAdvancedTechnology/smpte2022-6-dissector).
</td>
<td>none</td>
</tr>
<tr>
<td>

[someip.lua, et al](https://github.com/jamores/eth-ws-someip)
</td>
<td>15-03-27</td>
<td>

1\.12.0
</td>
<td>

This plugin dissects packets for Scalable service-Oriented MiddlewarE over IP (SOME/IP), from the AUTOSAR (AUTomotive Open System ARchitecture) 4.2. The plugin is hosted on [github](https://github.com/jamores/eth-ws-someip).
</td>
<td>none</td>
</tr>
<tr>
<td>

[stomp.lua](uploads/\__moin_import_\_/attachments/Contrib/stomp.lua)
</td>
<td>15-07-04</td>
<td>

1\.10.0
</td>
<td>

This plugin dissects STOMP protocol packets, both over raw TCP and over HTTP/Websocket. The plugin this was based on is hosted on [github](https://github.com/ficoos/wireshark-stomp-plugin), but the file in this wiki is newer, and can do things the one on github cannot; it was based on an answer to a question on [ask.wireshark.org](https://ask.wireshark.org/questions/43861/wireshark-stomp-protocol-dissector).
</td>
<td>

[websocket_stomp.pcapng](uploads/\__moin_import_\_/attachments/Contrib/websocket_stomp.pcapng)
</td>
</tr>
<tr>
<td>

[wg.lua](uploads/\__moin_import_\_/attachments/Contrib/wg.lua)
</td>
<td>2017-03-03</td>
<td>

2\.0.2
</td>
<td>

This plugin dissects the [WireGuard VPN tunnel](https://www.wireguard.io/) protocol. Plugin, pcap and keys are on hosted on [Github](https://github.com/Lekensteyn/wireguard-dissector).
</td>
<td>

</td>
</tr>
<tr>
<td>

[xpl_dissector.lua](uploads/\__moin_import_\_/attachments/Contrib/xpl_dissector.lua)
</td>
<td>

1\.2
</td>
<td>

1\.10.0
</td>
<td>

This plugin dissects [xPL protocol](https://en.wikipedia.org/wiki/XPL_Protocol) packets, used for home automation control. The plugin is hosted on [the author's web site](http://www.thijsschreijer.nl/blog/?p=479).
</td>
<td>

[xpl_dissector_testdata.pcap](uploads/\__moin_import_\_/attachments/Contrib/xpl_dissector_testdata.pcap)
</td>
</tr>
</table>

</div>### Statistic Taps or Post-Dissectors

<div>

<table>
<tr>
<td>

**Lua plugin**
</td>
<td>

**Lua plugin version**
</td>
<td>

**Minimum Wireshark version**
</td>
<td>

**Description**
</td>
</tr>
<tr>
<td>

[arp_host.lua](uploads/3a12c9e0124a04e0771ec56fc7e9a7a5/arp_host.lua)
</td>
<td>

1\.0.0
</td>
<td>unknown</td>
<td>

Hacked up version of [Extract field values](https://gitlab.com/wireshark/wireshark/-/wikis/Lua/Examples#extract-field-values) to answer [Resolved or Mapped ARP Target IP Address](https://ask.wireshark.org/question/22016/resolved-or-mapped-arp-target-ip-address/)
</td>
</tr>
<tr>
<td>

[delta_distance.lua](https://gitlab.com/-/snippets/2156053)
</td>
<td>2021-08-01</td>
<td>

1\.10.0
</td>
<td>Calculates the speed of light distance between packets.</td>
</tr>
<tr>
<td>

[filtcols.lua](https://gitlab.com/wireshark/wireshark/-/wikis/Lua/Examples/filtcols)
</td>
<td>

1\.0.2
</td>
<td>unknown</td>
<td>A post-dissector to allow filtering on Protocol and Info columns</td>
</tr>
<tr>
<td>

[gd_tcflag.lua](uploads/\__moin_import_\_/attachments/Contrib/gd_tcflag.lua)
</td>
<td>r27</td>
<td>

1\.10.0
</td>
<td>

Track each TCP stream automatically and group its details for express analysis:<br>\* TCP flags used through the lifetime of the conversation, etc.<br>\* Counters of all **tcp.analysis.flags** seen anywhere in the conversation<br>\* Stats (payload bytes, frames, lowest and highest window size used), etc.<br>For more details visit homepage at [GitHub](https://github.com/gr8drag1/gd_tcflag)
</td>
</tr>
<tr>
<td>

[ip_src_alternate.lua](uploads/960ae7841b94b0fc6cefc90b2055a057/ip_src_alternate.lua)
</td>
<td>

1\.0.0
</td>
<td>unknown</td>
<td>

A blend of filtcols.lua and arp_host.lua to answer [How do I find two consecutive frames from the same IP source address](https://ask.wireshark.org/question/22090/how-do-i-find-two-consecutive-frames-from-the-same-ip-source-address/)
</td>
</tr>
<tr>
<td>

[ipv6-postdissector.lua](https://gitlab.com/wireshark/wireshark/-/wikis/Lua/Examples/PostDissector/IPv6-Post-dissector)
</td>
<td>

1\.2
</td>
<td>unknown</td>
<td>An IPv6 post-dissector that fully expands all IPv6 addresses.</td>
</tr>
<tr>
<td>

[tap-subnets.lua](https://gitlab.com/wireshark/wireshark/-/wikis/Lua/Examples/Taps/tap-subnets)
</td>
<td>

1\.4
</td>
<td>unknown</td>
<td>A tap that displays IPv4 subnet statistics in a GUI menu.</td>
</tr>
<tr>
<td>

[tap-resolved.lua](https://gitlab.com/wireshark/wireshark/-/wikis/Lua/Examples/Taps/tap-resolved)
</td>
<td>

1\.18
</td>
<td>

3\.2.0
</td>
<td>A tap that displays sorted resolved data in a GUI menu.</td>
</tr>
<tr>
<td>

[TCPextend-post_dissector.lua](uploads/\__moin_import_\_/attachments/Contrib/TCPextend-post_dissector.lua)
</td>
<td>v0.7-20150706</td>
<td>

1\.10.0
</td>
<td>

The TCP-extend plugin displays some additional TCP statistics information, as new fields which can be used in display filters, columns, etc. The plugin is hosted on [github](https://github.com/gaddman/wireshark-tcpextend), which you should see for details.
</td>
</tr>
<tr>
<td>

[tcp_stats.lua](uploads/\__moin_import_\_/attachments/Contrib/tcp_stats.lua)
</td>
<td>2017-06-21</td>
<td>

1\.10.0
</td>
<td>

The TCP-Stats plugin scans through all TCP connections and provides a summarized statistics of MSS, Window Scaling, iRTT, Highest Delta and Lowest Window Size. Latest version at [github](https://github.com/sgissi/snippets/blob/master/tcp_stats.lua). It is meant to run from tshark, see script header for instructions
</td>
</tr>
<tr>
<td>

[TLSextend](https://github.com/syn-bit/TLSextend)
</td>
<td>(see github)</td>
<td>

1\.10.0
</td>
<td>Adds a TLS state field by to filter out complete TCP streams based on the presence of ClientHello and/or ServerHello packets in the stream.</td>
</tr>
<tr>
<td>

[tls_conversations.lua](uploads/7d5e866ec5cb5cb09a51649973461036/tls_conversations.lua)
</td>
<td>

1\.0.1
</td>
<td>unknown</td>
<td>

Started with [Example: Listener written in Lua](https://www.wireshark.org/docs/wsdg_html/#wslua_tap_example) in the WSDG. Tap/Gui version of \*\*TLSextend\*\* (see above). Answers question: [Filter TLS with no Server Hello](https://ask.wireshark.org/question/26618/filter-tls-with-no-server-hello/). Should be doable in \`MATE\` but it has issues: [\[Wireshark-dev\] MATE Stop for multi-occurrence field](https://www.wireshark.org/lists/wireshark-dev/202204/msg00000.html) / [MATE: no Match if multiple AVP with same name](https://gitlab.com/wireshark/wireshark/-/issues/18024 "MATE: no Match if multiple AVP with same name")
</td>
</tr>
<tr>
<td>

[transum.lua](uploads/\__moin_import_\_/attachments/Contrib/transum.lua)
</td>
<td>9b</td>
<td>

1\.10.0
</td>
<td>

The TRANSUM plugin provides four new response time fields (APDU Response Time, Service Time, Request Spread, and Response Spread), powerful filtering options and a quick way to match front-end response times to back-end service delays. See [tribelabzero.com](http://www.tribelabzero.com/transum) for details.
</td>
</tr>
</table>

</div>### File Formats

<div>

<table>
<tr>
<td>

**Lua plugin**
</td>
<td>

**Lua plugin version**
</td>
<td>

**Minimum Wireshark version**
</td>
<td>

**Description**
</td>
</tr>
<tr>
<td>

[acme_file.lua](uploads/\__moin_import_\_/attachments/Contrib/acme_file.lua)
</td>
<td>

1\.0
</td>
<td>

1\.11.3
</td>
<td>This "capture file" reader reads message logs from Acme Packet (now Oracle) Session Border Controllers, such as sipmsg.log files.</td>
</tr>
<tr>
<td>

[file-zip.lua](uploads/\__moin_import_\_/attachments/Contrib/file-zip.lua)
</td>
<td>2016-12-22</td>
<td>

1\.11.3?
</td>
<td>

Dissects the structure of a Zip archive using heuristics. Hosted on [git.lekensteyn.nl](https://git.lekensteyn.nl/peter/wireshark-notes/tree/lua/file-zip.lua)
</td>
</tr>
<tr>
<td>

[fileshark_pcap.lua](uploads/\__moin_import_\_/attachments/Contrib/fileshark_pcap.lua)
</td>
<td>

1\.0
</td>
<td>

1\.11.3
</td>
<td>

This "capture file" reader reads pcap files - the old style ones - as a [FileShark](/FileShark) implementation. What does that mean? It means it reads a pcap file and displays the contents of the file format itself, showing the file header, record headers, etc., and their fields. To do this it creates a "pcapfile" protocol dissector, with associated protocol fields of what pcap file formats have.
</td>
</tr>
</table>

</div>### Other

<div>

<table>
<tr>
<td>

**Lua plugin**
</td>
<td>

**Lua plugin version**
</td>
<td>

**Minimum Wireshark version**
</td>
<td>

**Description**
</td>
</tr>
<tr>
<td>

[ascii.lua](https://wiki.wireshark.org/Lua/Examples/ASCII)
</td>
<td>

1\.4
</td>
<td>unknown</td>
<td>Displays the ASCII table.</td>
</tr>
<tr>
<td>

[base64.lua](https://wiki.wireshark.org/Lua/Examples/Base64)
</td>
<td>

1\.1
</td>
<td>unknown</td>
<td>A Base64 Encoder/Decoder Tool.</td>
</tr>
<tr>
<td>

[baseconverter.lua](https://wiki.wireshark.org/Lua/Examples/BaseConverter)
</td>
<td>

1\.3
</td>
<td>unknown</td>
<td>A 64-bit Base Converter Tool.</td>
</tr>
<tr>
<td>

[Browser SSLKEYLOGFILE](https://gitlab.com/-/snippets/2156054)
</td>
<td>2021-08-01</td>
<td>

3\.0.0
</td>
<td>Runs Chrome or Firefox with the SSLKEYLOGFILE environment variable set to Wireshark's tls.keylog_file preference.</td>
</tr>
<tr>
<td>

[Cloudshark plugin](https://github.com/cloudshark/wireshark-plugin)
</td>
<td>

1\.0.5
</td>
<td>

1\.10.0
</td>
<td>

The CloudShark plug-in for Wireshark makes it seamless to move your capture files from Wireshark to a CloudShark appliance or https://www.cloudshark.org/. Once installed, the plugin adds a new CloudShark submenu under the existing Wireshark Tools menu. Capture files are sent to the configured CloudShark appliance or https://www.cloudshark.org/ by selecting the upload option under the Tools -\> Cloudshark menu. The plugin also works with tshark from the command-line.
</td>
</tr>
<tr>
<td>

[col.lua](uploads/815ba39e89ef7aba3258c09620f0837c/col.lua)
</td>
<td>

1\.3
</td>
<td>unknown</td>
<td>Common column functions</td>
</tr>
<tr>
<td>

[hexcalc.lua](uploads/9e8636fddba736b79e7181893689ad0d/hexcalc.lua)
</td>
<td>

1\.0.0
</td>
<td>unknown</td>
<td>New Tools menu item to convert between hex and decimal</td>
</tr>
<tr>
<td>

[maskmaker.lua](https://wiki.wireshark.org/Lua/Examples/MaskMaker)
</td>
<td>

1\.1
</td>
<td>unknown</td>
<td>An IPv4 Mask Maker Tool.</td>
</tr>
<tr>
<td>

[Netzob](http://netzob.readthedocs.org/en/latest/tutorials/wireshark.html)
</td>
<td>N/A</td>
<td>unknown</td>
<td>

You can use the [Netzob application](http://netzob.readthedocs.org/en/latest/index.html)'s exporter to automatically generate Wireshark Lua-based dissectors for proprietary or undocumented protocols, as Lua plugin scripts. (i.e., it generates the Lua scripts to use in Wireshark)
</td>
</tr>
<tr>
<td>

[netspooky/dissectors](https://github.com/netspooky/dissectors)
</td>
<td>N/A</td>
<td>unknown</td>
<td>

Apple Bluetooth Protocol dubbed "Continuity"<br>BGB Emulator Link Cable Protocol<br>Postgres Stats Collector Protocol
</td>
</tr>
<tr>
<td>

[ouilookup.lua](https://wiki.wireshark.org/Lua/Examples/OUILookup)
</td>
<td>

1\.4
</td>
<td>unknown</td>
<td>An OUI Lookup Tool.</td>
</tr>
<tr>
<td>

[subnetcalc.lua](https://wiki.wireshark.org/Lua/Examples/SubnetCalculator)
</td>
<td>

1\.1
</td>
<td>unknown</td>
<td>An IPv4 Subnet Calculator.</td>
</tr>
<tr>
<td>

[dtd_gen.lua](uploads/19dd601bd1179b2e8de41d9b19a14859/dtd_gen.lua)
</td>
<td>N/A</td>
<td>unknown</td>
<td>A DTD generator for Wireshark</td>
</tr>
</table>

</div>## Extcap Plugins

<div>

<table>
<tr>
<td>

**Extcap plugin**
</td>
<td>

**Profile version**
</td>
<td>

**Minimum Wireshark version**
</td>
<td>

**Description**
</td>
</tr>
<tr>
<td>

[extcap_example.rb](uploads/\__moin_import_\_/attachments/Contrib/extcap_example.rb)
</td>
<td>16-03-05</td>
<td>

2\.1.0
</td>
<td>A ruby example extcap application</td>
</tr>
<tr>
<td>

[wireshark-fritzbox](https://github.com/cardigliano/wireshark-fritzbox)
</td>
<td>

</td>
<td>

</td>
<td>Allows running a remote capture from a FRITZ!Box router</td>
</tr>
</table>

</div>---

Imported from https://wiki.wireshark.org/Contrib on 2020-08-11 23:12:21 UTC