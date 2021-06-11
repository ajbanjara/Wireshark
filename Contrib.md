This page contains a collection of user-created public scripts, macros, colouring rules and other useful plugins.

[[_TOC_]]

## Colouring Rules

Coloring rule files use an extension to keep them unique within the wiki. They need to be renamed when applied to a profile.

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Color profile</strong></p></td>
<td><p><strong>Profile version</strong></p></td>
<td><p><strong>Minimum Wireshark version</strong></p></td>
<td><p><strong>Description</strong></p></td>
</tr>
<tr class="even">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/colorfilters.rtps" class="attachment">colorfilters.rtps</a></p></td>
<td><p>16-03-05</p></td>
<td><p>2.1.0</p></td>
<td><p>These color filters are for RTPS protocol</p></td>
</tr>
</tbody>
</table>

</div>

## Display Filter Macros

None yet.

## Lua Plugins

### Protocol Dissectors

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Lua plugin</strong></p></td>
<td><p><strong>Lua plugin version</strong></p></td>
<td><p><strong>Minimum Wireshark version</strong></p></td>
<td><p><strong>Description</strong></p></td>
<td><p><strong>Sample capture</strong></p></td>
</tr>
<tr class="even">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/citp.lua" class="attachment">citp.lua</a></p></td>
<td><p>12-01-24</p></td>
<td><p>1.10.0</p></td>
<td><p>This plugin dissects CITP (Controller Interface Transport Protocol), as described at <a href="http://www.citp-protocol.org/" class="http">www.citp-protocol.org</a>. CITP is used in the event and entertainment industries to allow lighting consoles, media servers and visualizers to interchange operation information with an open protocol. The plugin is hosted on <a href="https://github.com/hossimo/CITP-Dissector" class="https">github</a>.</p></td>
<td><p>none</p></td>
</tr>
<tr class="odd">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/cr3.lua" class="attachment">cr3.lua</a></p></td>
<td><p>14-09-02</p></td>
<td><p>1.10.0</p></td>
<td><p>This plugin dissects packets for the Crimson v3 protocol related to the ICS HMI touchpanels made by Red Lion Controls (<a href="http://redlion.net" class="http">redlion.net</a>). These devices support updates over TCP port 789. This minimal dissector is a starting point for understanding this protocol. The plugin is hosted on <a href="https://github.com/internetofallthethings/cr3-wireshark" class="https">github</a>.</p></td>
<td><p>none</p></td>
</tr>
<tr class="even">
<td><p><a href="https://github.com/martin-cowie/wireshark-dissector" class="https">dpt.lua</a></p></td>
<td><p>14-08-28</p></td>
<td><p>1.10.0</p></td>
<td><p>This plugin dissects dissect the DPT protocol used by Diffusion (<a href="http://www.pushtechnology.com" class="http">www.pushtechnology.com</a>). The plugin is hosted on <a href="https://github.com/martin-cowie/wireshark-dissector" class="https">github</a>.</p></td>
<td><p><a href="https://github.com/martin-cowie/wireshark-dissector/tree/master/samples" class="https">DPT samples</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/fpm.lua" class="attachment">fpm.lua</a></p></td>
<td><p>1.0</p></td>
<td><p>1.10.0</p></td>
<td><p>This plugin dissects Forwarding Plane Manager (FPM) messages over TCP, which internally contain <a href="https://en.wikipedia.org/wiki/Netlink" class="https">Netlink protocol</a> messages. The open source <a href="http://www.nongnu.org/quagga/" class="http">Quagga</a>, <a href="https://en.wikipedia.org/wiki/GNU_Zebra" class="https">Zebra</a>, and commercial <a href="http://www.ipinfusion.com/products/zebos-network-platform" class="http">ZebOS</a> routing stacks/engines all use FPM to communicate to the forwarding plane of a router.</p></td>
<td><p><a href="uploads/__moin_import__/attachments/Contrib/segmented_fpm.pcap" class="attachment">segmented_fpm.pcap</a></p></td>
</tr>
<tr class="even">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/gits.lua" class="attachment">gits.lua</a></p></td>
<td><p>15-01-19</p></td>
<td><p>1.10.0</p></td>
<td><p>This plugin dissects packets for <a href="/PwnAdventure" class="nonexistent">PwnAdventure</a> 3, an MMORPG game designed to be hacked (<a href="http://pwnadventure.com" class="http">pwnadventure.com</a>). The plugin is hosted on <a href="https://github.com/maetrics/wireshark-scripts" class="https">github</a>.</p></td>
<td><p><a href="uploads/__moin_import__/attachments/Contrib/gits15.tar.gz" class="attachment">gits15.tar.gz</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="https://github.com/diarmuidcwc/LuaDissectors" class="https">inetx_generic.lua, et al</a></p></td>
<td><p>15-03-27</p></td>
<td><p>1.12.0</p></td>
<td><p>This plugin dissects iNet-X (CTEIP Integrated Network Enhanced Telemetry) and IENA packet formats. See <a href="http://www.cwc-ae.com/flight-test-learn-more/inet-x" class="http">Curtis-Wright</a> for details. The plugin is hosted on <a href="https://github.com/diarmuidcwc/LuaDissectors" class="https">github</a>.</p></td>
<td><p><a href="https://github.com/diarmuidcwc/AcraNetwork/tree/master/test" class="https">test samples</a></p></td>
</tr>
<tr class="even">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/kdnet.lua" class="attachment">kdnet.lua</a></p></td>
<td><p>2017-02-19</p></td>
<td><p>2.0.2</p></td>
<td><p>Reverse-engineered Windows Kernel Debugger UDP protocol. Plugin, pcap and keys are hosted on <a href="https://github.com/Lekensteyn/kdnet" class="https">Github</a></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/LyncPacketDissector1.00.lua" class="attachment">LyncPacketDissector1.00.lua</a> / <a href="uploads/__moin_import__/attachments/Contrib/Lync-Skype4B-Plugin2.00.lua" class="attachment">Lync-Skype4B-Plugin2.00.lua</a></p></td>
<td><p>1.00 / 2.0</p></td>
<td><p>1.10.0 / 2.0</p></td>
<td><p>This plugin dissects Microsoft Lync AV Edge and Internal Edge AV traffic, STUN/TURN traffic on Microsoft Lync Edge port, and the dynamically assigned RTP and RTCP traffic by using ports allocated in STUN requests. For more information, see <a href="http://www.myskypelab.com/2014/05/microsoft-lync-wireshark-plugin.html" class="http">myskypelab.com</a>.</p></td>
<td><p>none</p></td>
</tr>
<tr class="even">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/omci.lua" class="attachment">omci.lua</a> and <a href="uploads/__moin_import__/attachments/Contrib/BinDecHex.lua" class="attachment">BinDecHex.lua</a></p></td>
<td><p>14-3-13-r11</p></td>
<td><p>1.4.3</p></td>
<td><p>This plugin dissects packets for ONT Management and Control Interface (OMCI) protocol (ITU Rec. G984.4). The purpose of the dissector is to decode OMCI data flowing between Optical Line Termination (OLT, the network side) and Optical Network Termination (ONT, the end user side). Both Lua files are needed, as one depends on the other. The plugin is hosted on <a href="https://code.google.com/p/omci-wireshark-dissector/" class="https">google</a>.</p></td>
<td><p><a href="uploads/__moin_import__/attachments/Contrib/omci-example.pcap" class="attachment">omci-example.pcap</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/packet-simplemessage.lua" class="attachment">packet-simplemessage.lua</a></p></td>
<td><p>0.1.9</p></td>
<td><p>1.10.0</p></td>
<td><p>This plugin dissects the ROS-Industrial <a href="/SimpleMessage" class="nonexistent">SimpleMessage</a> protocol, as defined on <a href="http://wiki.ros.org/simple_message" class="http">www.ros.org</a>. The plugin is hosted on <a href="https://github.com/ros-industrial/packet-simplemessage" class="https">github</a>.</p></td>
<td><p><a href="uploads/__moin_import__/attachments/Contrib/simple_move.pcapng" class="attachment">simple_move.pcapng</a></p></td>
</tr>
<tr class="even">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/rtp_ext_onvif_replay.lua" class="attachment">rtp_ext_onvif_replay.lua</a></p></td>
<td><p>15-06-02</p></td>
<td><p>1.10.0</p></td>
<td><p>This plugin dissects ONVIF (<a href="http://www.onvif.org" class="http">Open Network Video Interface Forum</a>) media streams in RTP packets, as defined in <a href="http://www.onvif.org/specs/stream/ONVIF-Streaming-Spec-v210.pdf" class="http">ONVIF Spec 2.10 section 6.2</a>. The plugin is hosted on <a href="https://github.com/htbegin/lua_wireshark" class="https">github</a>.</p></td>
<td><p>none</p></td>
</tr>
<tr class="odd">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/satp.lua" class="attachment">satp.lua</a></p></td>
<td><p>r133</p></td>
<td><p>1.10.0</p></td>
<td><p>This plugin dissects the Secure Anycast Tunneling Protocol (SATP), as defined in IETF draft draft-gsenger-secure-anycast-tunneling-protocol-02. The plugin is hosted on <a href="http://svn.anytun.org/anytun-common/trunk/wireshark-lua/" class="http">SVN</a>.</p></td>
<td><p><a href="uploads/__moin_import__/attachments/Contrib/nullcypher-pings.pcap" class="attachment">nullcypher-pings.pcap</a></p></td>
</tr>
<tr class="even">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/SMPTE-2022-6.lua" class="attachment">SMPTE-2022-6.lua</a></p></td>
<td><p>14-02-14</p></td>
<td><p>1.10</p></td>
<td><p>This plugin dissects SMPTE 2022-6 High Bit Rate Media Signals over IP Networks (HBRMT). The plugin is hosted on <a href="https://github.com/FOXNEOAdvancedTechnology/smpte2022-6-dissector" class="https">github</a>.</p></td>
<td><p>none</p></td>
</tr>
<tr class="odd">
<td><p><a href="https://github.com/jamores/eth-ws-someip" class="https">someip.lua, et al</a></p></td>
<td><p>15-03-27</p></td>
<td><p>1.12.0</p></td>
<td><p>This plugin dissects packets for Scalable service-Oriented MiddlewarE over IP (SOME/IP), from the AUTOSAR (AUTomotive Open System ARchitecture) 4.2. The plugin is hosted on <a href="https://github.com/jamores/eth-ws-someip" class="https">github</a>.</p></td>
<td><p>none</p></td>
</tr>
<tr class="even">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/stomp.lua" class="attachment">stomp.lua</a></p></td>
<td><p>15-07-04</p></td>
<td><p>1.10.0</p></td>
<td><p>This plugin dissects STOMP protocol packets, both over raw TCP and over HTTP/Websocket. The plugin this was based on is hosted on <a href="https://github.com/ficoos/wireshark-stomp-plugin" class="https">github</a>, but the file in this wiki is newer, and can do things the one on github cannot; it was based on an answer to a question on <a href="https://ask.wireshark.org/questions/43861/wireshark-stomp-protocol-dissector" class="https">ask.wireshark.org</a>.</p></td>
<td><p><a href="uploads/__moin_import__/attachments/Contrib/websocket_stomp.pcapng" class="attachment">websocket_stomp.pcapng</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/wg.lua" class="attachment">wg.lua</a></p></td>
<td><p>2017-03-03</p></td>
<td><p>2.0.2</p></td>
<td><p>This plugin dissects the <a href="https://www.wireguard.io/" class="https">WireGuard VPN tunnel</a> protocol. Plugin, pcap and keys are on hosted on <a href="https://github.com/Lekensteyn/wireguard-dissector" class="https">Github</a>.</p></td>
<td></td>
</tr>
<tr class="even">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/xpl_dissector.lua" class="attachment">xpl_dissector.lua</a></p></td>
<td><p>1.2</p></td>
<td><p>1.10.0</p></td>
<td><p>This plugin dissects <a href="https://en.wikipedia.org/wiki/XPL_Protocol" class="https">xPL protocol</a> packets, used for home automation control. The plugin is hosted on <a href="http://www.thijsschreijer.nl/blog/?p=479" class="http">the author's web site</a>.</p></td>
<td><p><a href="uploads/__moin_import__/attachments/Contrib/xpl_dissector_testdata.pcap" class="attachment">xpl_dissector_testdata.pcap</a></p></td>
</tr>
</tbody>
</table>

</div>

### Statistic Taps or Post-Dissectors

<div>

<table>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>Lua plugin</strong></p></td>
<td><p><strong>Lua plugin version</strong></p></td>
<td><p><strong>Minimum Wireshark version</strong></p></td>
<td><p><strong>Description</strong></p></td>
</tr>
<tr class="even">
<td><p><a href="uploads/3a12c9e0124a04e0771ec56fc7e9a7a5/arp_host.lua" class="attachment">arp_host.lua</a></p></td>
<td><p>1.0.0</p></td>
<td><p>unknown</p></td>
<td><p>Hacked up version of [Extract field values](https://gitlab.com/wireshark/wireshark/-/wikis/Lua/Examples#extract-field-values) to answer [Resolved or Mapped ARP Target IP Address](https://ask.wireshark.org/question/22016/resolved-or-mapped-arp-target-ip-address/)</p></td>
</tr>
<tr class="odd">
<td><p><a href="https://gitlab.com/wireshark/wireshark/-/wikis/Lua/Examples/filtcols" class="https">filtcols.lua</a></p></td>
<td><p>1.0.0</p></td>
<td><p>unknown</p></td>
<td><p>A post-dissector to allow filtering on Protocol and Info columns</p></td>
</tr>
<tr class="even">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/gd_tcflag.lua" class="attachment">gd_tcflag.lua</a></p></td>
<td><p>r27</p></td>
<td><p>1.10.0</p></td>
<td><p>Track each TCP stream automatically and group its details for express analysis:<br />
* TCP flags used through the lifetime of the conversation, etc.<br />
* Counters of all <strong>tcp.analysis.flags</strong> seen anywhere in the conversation<br />
* Stats (payload bytes, frames, lowest and highest window size used), etc.<br />
For more details visit homepage at <a href="https://github.com/gr8drag1/gd_tcflag" class="https">GitHub</a></p></td>
</tr>
<tr class="odd">
<td><p><a href="uploads/960ae7841b94b0fc6cefc90b2055a057/ip_src_alternate.lua" class="attachment">ip_src_alternate.lua</a></p></td>
<td><p>1.0.0</p></td>
<td><p>unknown</p></td>
<td><p>A blend of filtcols.lua and arp_host.lua to answer [How do I find two consecutive frames from the same IP source address](https://ask.wireshark.org/question/22090/how-do-i-find-two-consecutive-frames-from-the-same-ip-source-address/)</p></td>
</tr>
<tr class="even">
<td><p><a href="https://gitlab.com/wireshark/wireshark/-/wikis/Lua/Examples/PostDissector/IPv6-Post-dissector" class="https">ipv6-postdissector.lua</a></p></td>
<td><p>1.2</p></td>
<td><p>unknown</p></td>
<td><p>An IPv6 post-dissector that fully expands all IPv6 addresses.</p></td>
</tr>
<tr class="odd">
<td><p><a href="https://gitlab.com/wireshark/wireshark/-/wikis/Lua/Examples/Taps/tap-subnet" class="https">tap-subnet.lua</a></p></td>
<td><p>1.3</p></td>
<td><p>unknown</p></td>
<td><p>A tap that displays IPv4 subnet statistics in a GUI menu.</p></td>
</tr>
<tr class="even">
<td><p><a href="https://gitlab.com/wireshark/wireshark/-/wikis/Lua/Examples/Taps/tap-resolved" class="https">tap-resolved.lua</a></p></td>
<td><p>1.15</p></td>
<td><p>3.2.0</p></td>
<td><p>A tap that displays sorted resolved data in a GUI menu.</p></td>
</tr>
<tr class="odd">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/TCPextend-post_dissector.lua" class="attachment">TCPextend-post_dissector.lua</a></p></td>
<td><p>v0.7-20150706</p></td>
<td><p>1.10.0</p></td>
<td><p>The TCP-extend plugin displays some additional TCP statistics information, as new fields which can be used in display filters, columns, etc. The plugin is hosted on <a href="https://github.com/gaddman/wireshark-tcpextend" class="https">github</a>, which you should see for details.</p></td>
</tr>
<tr class="even">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/tcp_stats.lua" class="attachment">tcp_stats.lua</a></p></td>
<td><p>2017-06-21</p></td>
<td><p>1.10.0</p></td>
<td><p>The TCP-Stats plugin scans through all TCP connections and provides a summarized statistics of MSS, Window Scaling, iRTT, Highest Delta and Lowest Window Size. Latest version at <a href="https://github.com/sgissi/snippets/blob/master/tcp_stats.lua" class="https">github</a>. It is meant to run from tshark, see script header for instructions</p></td>
</tr>
<tr class="odd">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/transum.lua" class="attachment">transum.lua</a></p></td>
<td><p>9b</p></td>
<td><p>1.10.0</p></td>
<td><p>The TRANSUM plugin provides four new response time fields (APDU Response Time, Service Time, Request Spread, and Response Spread), powerful filtering options and a quick way to match front-end response times to back-end service delays. See <a href="http://www.tribelabzero.com/transum" class="http">tribelabzero.com</a> for details.</p></td>
</tr>
</tbody>
</table>

</div>

### File Formats

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Lua plugin</strong></p></td>
<td><p><strong>Lua plugin version</strong></p></td>
<td><p><strong>Minimum Wireshark version</strong></p></td>
<td><p><strong>Description</strong></p></td>
</tr>
<tr class="even">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/acme_file.lua" class="attachment">acme_file.lua</a></p></td>
<td><p>1.0</p></td>
<td><p>1.11.3</p></td>
<td><p>This "capture file" reader reads message logs from Acme Packet (now Oracle) Session Border Controllers, such as sipmsg.log files.</p></td>
</tr>
<tr class="odd">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/file-zip.lua" class="attachment">file-zip.lua</a></p></td>
<td><p>2016-12-22</p></td>
<td><p>1.11.3?</p></td>
<td><p>Dissects the structure of a Zip archive using heuristics. Hosted on <a href="https://git.lekensteyn.nl/peter/wireshark-notes/tree/lua/file-zip.lua" class="https">git.lekensteyn.nl</a></p></td>
</tr>
<tr class="even">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/fileshark_pcap.lua" class="attachment">fileshark_pcap.lua</a></p></td>
<td><p>1.0</p></td>
<td><p>1.11.3</p></td>
<td><p>This "capture file" reader reads pcap files - the old style ones - as a <a href="/FileShark" class="nonexistent">FileShark</a> implementation. What does that mean? It means it reads a pcap file and displays the contents of the file format itself, showing the file header, record headers, etc., and their fields. To do this it creates a "pcapfile" protocol dissector, with associated protocol fields of what pcap file formats have.</p></td>
</tr>
</tbody>
</table>

</div>

### Other

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Lua plugin</strong></p></td>
<td><p><strong>Lua plugin version</strong></p></td>
<td><p><strong>Minimum Wireshark version</strong></p></td>
<td><p><strong>Description</strong></p></td>
</tr>
<tr class="even">
<td><p><a href="http://netzob.readthedocs.org/en/latest/tutorials/wireshark.html" class="http">Generated by Netzob</a></p></td>
<td><p>N/A</p></td>
<td><p>unknown</p></td>
<td><p>You can use the <a href="http://netzob.readthedocs.org/en/latest/index.html" class="http">Netzob application</a>'s exporter to automatically generate Wireshark Lua-based dissectors for proprietary or undocumented protocols, as Lua plugin scripts. (i.e., it generates the Lua scripts to use in Wireshark)</p></td>
</tr>
<tr class="odd">
<td><p><a href="https://appliance.cloudshark.org/wireshark/" class="https">Lua plugin installer</a></p></td>
<td><p>1.0.3-180</p></td>
<td><p>1.10.0</p></td>
<td><p>The <a href="/CloudShark" class="nonexistent">CloudShark</a> plug-in for Wireshark lets you seamlessly sync your Wireshark packet captures with the <a href="/CloudShark" class="nonexistent">CloudShark</a> Appliance. After installing the <a href="/CloudShark" class="nonexistent">CloudShark</a> plug-in on your system with Wireshark, you will be able to manage, view, analyze, and share your Wireshark captures on <a href="https://appliance.cloudshark.org" class="https">CloudShark's website</a>.</p></td>
</tr>
</tbody>
</table>

</div>

## Extcap Plugins

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Extcap plugin</strong></p></td>
<td><p><strong>Profile version</strong></p></td>
<td><p><strong>Minimum Wireshark version</strong></p></td>
<td><p><strong>Description</strong></p></td>
</tr>
<tr class="even">
<td><p><a href="uploads/__moin_import__/attachments/Contrib/extcap_example.rb" class="attachment">extcap_example.rb</a></p></td>
<td><p>16-03-05</p></td>
<td><p>2.1.0</p></td>
<td><p>A ruby example extcap application</p></td>
</tr>
<tr class="odd">
<td><p><a href="https://github.com/cardigliano/wireshark-fritzbox" class="https">wireshark-fritzbox</a></p></td>
<td></td>
<td></td>
<td><p>Allows running a remote capture from a FRITZ!Box router</p></td>
</tr>
</tbody>
</table>

</div>

---

Imported from https://wiki.wireshark.org/Contrib on 2020-08-11 23:12:21 UTC