# Introduction

Wireshark provides a wide range of network statistics.

These statistics range from general information about the loaded capture file (like the number of captured packets), to statistics about specific protocols (e.g. statistics about the number of HTTP requests and responses captured).

You will find some information about statistics in the corresponding [User's Guide chapter(s)](http://www.wireshark.org/docs/wsug_html_chunked/ChStatistics.html).

## General statistics

  - [Summary](http://www.wireshark.org/docs/wsug_html_chunked/ChStatSummary.html) about the capture file like: packet counts, captured time period, ...

  - [Protocol Hierarchy](http://www.wireshark.org/docs/wsug_html_chunked/ChStatHierarchy.html) of the captured packets.

  - [Conversations](http://www.wireshark.org/docs/wsug_html_chunked/ChStatConversations.html) e.g. traffic between specific Ethernet/IP/... addresses.

  - [Endpoints](http://www.wireshark.org/docs/wsug_html_chunked/ChStatEndpoints.html) e.g. traffic to and from an Ethernet/IP/... address.

  - [IO Graphs](http://www.wireshark.org/docs/wsug_html_chunked/ChStatIOGraphs.html) visualizing the number of packets (or similar) in time.

## Protocol specific statistics

  - [RTP\_statistics](/RTP_statistics)

  - [Service Response Time](http://www.wireshark.org/docs/wsug_html_chunked/ChStatSRT.html) between request and response of some protocols.

  - [TcpPduTime](/TcpPduTime) The time it took to transfer all segments of a PDU spanning multiple segments, great for finding TCP Retransmissions.

  - [VoIP\_calls](/VoIP_calls) Get the VoIP calls from the capture. The current VoIP supported protocols are SIP, H323, ISUP and MGCP with their corresponded RTP traffic. The calls can also be Graph and filtered for analysis.

  - [Multicast\_streams](/Multicast_streams)

Various other protocol specific statistics.

---

Imported from https://wiki.wireshark.org/Statistics on 2020-08-11 23:25:57 UTC
