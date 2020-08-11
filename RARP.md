# Reverse Address Resolution Protocol (RARP)

This protocol does the exact opposite of [ARP](/ARP); given a MAC address, it tries to find the corresponding IP address.

## History

In the early years of 1980 this protocol was used for address assignment for network hosts. Due to its limited capabilities it was eventually superseded by [BOOTP](/BOOTP).

## Protocol dependencies

RARP is available for several link layers, some examples:

  - [Ethernet](/Ethernet): RARP can use [Ethernet](/Ethernet) as its transport protocol. The Ethernet type for RARP traffic is 0x8035.

  - Other protocols in the [LanProtocolFamily](/LanProtocolFamily): RARP can use other LAN protocols as transport protocols as well, using SNAP encapsulation and the Ethernet type of 0x8035.

## Example traffic

#### RARP request

    Frame 1 (60 bytes on wire, 60 bytes captured)
    
        [...]
    
    Ethernet II, Src: Marquett_12:dd:88 (00:00:a1:12:dd:88), Dst: Broadcast (ff:ff:ff:ff:ff:ff)
        Destination: Broadcast (ff:ff:ff:ff:ff:ff)
        Source: Marquett_12:dd:88 (00:00:a1:12:dd:88)
        Type: ARP (0x0806)
        Trailer: 000000000000000000000000000000000000
    Address Resolution Protocol (reverse request)
        Hardware type: Ethernet (0x0001)
        Protocol type: IP (0x0800)
        Hardware size: 6
        Protocol size: 4
        Opcode: reverse request (0x0003)
        Sender MAC address: Marquett_12:dd:88 (00:00:a1:12:dd:88)
        Sender IP address: 0.0.0.0 (0.0.0.0)
        Target MAC address: Marquett_12:dd:88 (00:00:a1:12:dd:88)
        Target IP address: 0.0.0.0 (0.0.0.0) 

## Wireshark

The RARP dissector is part of the ARP dissector and fully functional.

## Preference Settings

There are no RARP specific preference settings.

## Example capture file

[SampleCaptures/rarp\_request.cap](uploads/__moin_import__/attachments/SampleCaptures/rarp_request.cap) The above RARP request.

## Display Filter

There is no specific RARP filter, all is done by the ARP dissector, so the display filter fields for ARP and RARP are identical.

A complete list of ARP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/a/arp.html)

Show only the RARP (ARP) based traffic:

``` 
 arp 
```

## Capture Filter

As RARP packets have the same format as ARP packets and the same Ethernet type as ARP packets (i.e., they are, in effect, ARP packets with RARP-specific opcodes), the same capture filters that can be used for ARP can be used for RARP.

## External links

  - [RFC 903](http://www.ietf.org/rfc/rfc0903.txt) *A Reverse Address Resolution Protocol*

  - [RARP](http://en.wikipedia.org/wiki/RARP) at Wikipedia.org

## Discussion

---

Imported from https://wiki.wireshark.org/RARP on 2020-08-11 23:23:49 UTC
