# High-availability Seamless Redundancy Protocol (HSR)

HSR is a Layer 2 redundancy protocol for Ethernet. HSR adds a header to each frame, and duplicates the frame, sending it along two directions of a ring. Nodes in the ring pass the frame along the ring, using the header to discard duplicates.

## Example traffic

    Ethernet II, Src: ZurichUn_15:77:84 (00:15:12:15:77:84), Dst: IntelCor_5c:22:42 (00:1b:21:5c:22:42)
        ...
    High-availability Seamless Redundancy (IEC62439 Part 3 Chapter 5)
        0001 .... .... .... = Path: 1
        000. .... .... .... = Network id: 0
        ...1 .... .... .... = Lane id: Lane B (1)
        LSDU size: 52 [correct]
        Sequence number: 6679
        Type: ARP (0x0806)
    Address Resolution Protocol (reply)
        ...

## Wireshark

The HSR dissector is fully functional. Supervision frames have the same format as in the related [Parallel Redundancy Protocol](/PRP), so they share a common dissector. The HSR dissector only handles the actual HSR header.

## Example capture file

  - [SampleCaptures/HSR-simple-supervision-and-1vdan-appearing.pcap](uploads/__moin_import__/attachments/SampleCaptures/HSR-simple-supervision-and-1vdan-appearing.pcap)

## External links

  - [HSR Wikipedia article](http://en.wikipedia.org/wiki/High-availability_Seamless_Redundancy).

## Discussion

---

Imported from https://wiki.wireshark.org/HSR on 2020-08-11 23:14:47 UTC
