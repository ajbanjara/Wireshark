# Nmap Packet Capture (NPcap)

NPcap is the Windows version of the [libpcap](http://www.tcpdump.org/) library; it includes a driver to support capturing packets.

Wireshark can use this library to capture live network data on Windows.

General information about the NPcap project can be found at the [NPcap](http://www.npcap.org) web site.

The libpcap file format description can be found at: [Development/LibpcapFileFormat](/Development/LibpcapFileFormat)

The (development) releases can be downloaded from <https://github.com/nmap/npcap/releases>. As it's still in development it's not considered stable at this time.

Npcap is the Nmap Project's packet sniffing library for Windows. It is based on the wonderful Winpcap / Libpcap libraries, but with improved improved speed, portability, security, and efficiency. In particular, Npcap offers:

  - NDIS 6 Support

  - [WinPcap](/WinPcap) compatibility

  - Loopback Packet Capture

---

Imported from https://wiki.wireshark.org/NPcap on 2020-08-11 23:17:33 UTC
