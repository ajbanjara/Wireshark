# High Speed Capturing

Some ideas that might be worth trying out.

## Ethernet drivers

NTOP has customized drivers for DNA(Direct Network card Access), could something like that be made Open Source?

Luca Deri (author of NTOP) has contributed code to Wireshark in the past so he might be amenable. Otherwise, we could use Intel's DPDK directly - this too might require a license and permission, but Intel might be amenable for a tool like Wireshark.

## AF\_PACKET\_V3

Leaving some space at the beginning of the packet buffer to write the pcap(ng) header might avoid a copy and improve performance.

## libpcap

Having a pcapng phdr might be more efficient.

## Dumpcap

Doing benchmarking with libpcap(1.5.3) with the recently added AF\_PACKET\_V3 tcpdump was performing better than dumpcap. Possibly due to dumpcap using pcap\_dispatch(pcap\_opts-\>pcap\_h, 1, capture\_loop\_write\_packet\_cb, (u\_char \*)pcap\_opts); e.g just handling one packet at a time. If this could be rewritten to use -1 performance may be improved.

---

Imported from https://wiki.wireshark.org/HighSpeedCapturing on 2020-08-11 23:14:39 UTC
