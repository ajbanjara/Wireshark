# Architecture for Control Networks (ACN)

ACN is a suite of network protocols for theatrical control developed by ESTA (Entertainment Services and Technology Association). It is also referred to as BSR E1.17, Entertainment Technology - Multipurpose Network Control Protocol Suite.

It may replace DMX as the control protocol for lighting systems and will be used for controlling more complex devices like video playback servers (media servers) and audio mixers. The protocol is designed to be layered on top of UDP/IP and therefore will run over standard, inexpensive Ethernet and 802.11 ([WiFi](/WiFi)) network links.

## History

The Architecture for Control Networks arose from a need within the entertainment technology industry in general and particularly the lighting industry for a common interoperable protocol or protocols for control of equipment which would take advantage of the new technologies which were gaining dominance and offering cheap high speed communications in many areas. This section describes the background from which ACN was developed, the design reasoning and processes which have gone into generating ACN and the way a typical implementation fits together. It is informative only, but is recommended reading as starting point for those new to ACN.

In designing ACN, great reliance has been placed on a wide variety of existing technologies which are constantly changing and progressing. The protocols of ACN have well defined functionality and clear boundaries and layering. It follows that all these pieces can and will be put together in different ways to suit different applications. The things which tie all these pieces together are interoperability profiles which specify which pieces must be used and what their operational parameters must be to achieve interoperability over a particular application domain. They may also specify what form of bridging or translation is required to connect them to networks using different profiles.

Thus the ACN architecture consists of a number of separate specifications for protocol formats, languages etc., together with interoperability profiles which specify where and how those specifications are to be used and call up external specifications as necessary. The driving force for ACN has been control of entertainment technology equipment across mainstream networks such as Ethernet and the initial interoperability profiles and specifications reflect this. However, other applications can be developed within this framework.

## Protocol dependencies

  - [UDP](/UDP): ACN typically uses [UDP](/UDP) as its transport protocol. The port number is non-specific.

## Example traffic

    Architecture for Control Networks
        Size of preamble: 16
        Size of postamble: 0
        Packet Identifier: ASC-E1.17
        PDU: Root SDT
            Flags: 0x70
                0... .... = Length: False
                .1.. .... = Vector: True
                ..1. .... = Header: True
                ...1 .... = Data: True
            Length: 62
            Protocol ID: SDT Protocol (1)
            Component ID: bad00668-bbbb-aaaa-dddd-abc012345678
            PDU: Unreliable Wrapper
                Flags: 0x70
                    0... .... = Length: False
                    .1.. .... = Vector: True
                    ..1. .... = Header: True
                    ...1 .... = Data: True
                Length: 40
                STD Vector: Unreliable Wrapper (2)
                Channel Number: 42998 (0xa7f6)
                Total Sequence Number: 42999 (0x0000a7f7)
                Reliable Sequence Number: 42998 (0x0000a7f6)
                Oldest Available Wrapper: 42998 (0x0000a7f6)
                First Member to ACK: 65535 (0xffff)
                Last Member to ACK: 65535 (0xffff)
                MAK Threshold: 0 (0x0000)
                PDU: SDT Protocol
                    Flags: 0x70
                        0... .... = Length: False
                        .1.. .... = Vector: True
                        ..1. .... = Header: True
                        ...1 .... = Data: True
                    Length: 17
                    Member ID: 1 (0x0001)
                    Protocol ID: SDT Protocol (1)
                    Association: 42998 (0xa7f6)
                    PDU: Ack
                        Flags: 0x70
                            0... .... = Length: False
                            .1.. .... = Vector: True
                            ..1. .... = Header: True
                            ...1 .... = Data: True
                        Length: 7
                        STD Vector: Ack (14)
                        Reliable Sequence Number: 42998 (0x0000a7f6)

## Wireshark

The ACN dissector is fully functional.

## Preference Settings

  - Decode ACN: Enable dissector. Starting from Wireshark 2.0, this setting is obsolete and replaced by the activation of the acn\_udp dissector in Analyze -\> Enabled Protocols

  - Streaming DMX: Enables dissector for ANSI BSR E1.31 "Streaming DMX" extension

  - DMX, display format: Changes the display format when viewing Streaming DMX

  - DMX, display zeros: If checked zeros are display for a value of zero, otherwise they are blanked.

  - DMX, display leading zeros, if checked, all values are padded with zeros.

  - DMX, display line format: controls the number of values display per line when viewing Streaming DMX

## Example capture file

  - [SampleCaptures/acn\_capture\_example\_1.cap](uploads/__moin_import__/attachments/SampleCaptures/acn_capture_example_1.cap)

## Display Filter

A complete list of ACN display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/protofirstletter/proto.html)

Show only the ACN based traffic:

``` 
 acn
```

## Capture Filter

You cannot directly filter ACN protocol while capturing.

``` 
```

## External links

  - <http://www.engarts.eclipse.co.uk/acn> ACN information

  - <http://www.esta.org/tsp/working_groups/CP/projs.html> ESTA's Technical Standards Program

  - <http://en.wikipedia.org/wiki/Architecture_for_Control_Networks> ACN protocol on wikipedia.org

  - <http://sacnview.sourceforge.net> Open source viewer/server for E1.31 "Streaming DMX" extension

  - <http://opendmx.net/index.php/OLA> Open source implementation

## Discussion

---

Imported from https://wiki.wireshark.org/ACN on 2020-08-11 23:11:01 UTC
