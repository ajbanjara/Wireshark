# Packet capture library (libpcap)

Wireshark/TShark uses libpcap to capture live network data.

As capture filter strings are directly passed from Wireshark/TShark to libpcap, the available capture filter syntax depends on the libpcap version installed.

More information can be found at the [tcpdump](http://www.tcpdump.org/) project page; libpcap and tcpdump are both developed by tcpdump.org.

On most modern UN\*X platforms libpcap is available. It comes as part of most non-specialized Linux distributions, the free-software BSDs, and macOS; it's installed by default on the BSDs and macOS, and it might be installed by default on the Linux distributions as well. (Specialized Linux distributions such as those for small embedded boxes might omit it.)

Two Windows versions of libpcap are available. The older one is named [WinPcap](/WinPcap); it is no longer actively being maintained, and is based on an older version of libpcap. The newer one is called Npcap; it is actively being maintained, and is based on a relatively recent version of libpcap, but is only available for Windows 7 and later versions of Windows.

The libpcap file format description can be found at: [Development/LibpcapFileFormat](/Development/LibpcapFileFormat)

---

Imported from https://wiki.wireshark.org/libpcap on 2020-08-11 23:15:56 UTC
