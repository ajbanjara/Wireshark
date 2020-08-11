# TeamSpeak2 (TS2)

The proprietary TeamSpeak2 protocol is used by the gamer oriented TeamSpeak2 VoIP software.

## History

Developed for TeamSpeak2.

## Protocol dependencies

  - [UDP](/UDP): TS2 uses [UDP](/UDP) as its transport protocol. The default UDP port for TS2 traffic is 8767.

## Example traffic

    Frame 5 (118 bytes on wire, 118 bytes captured)
    Teamspeak2 Protocol
        Class: Standard (reliable) (0xbef0)
        Type: Channel List (0x0006)
        Session Key: 0x004cf85b
        Client id: 1
        Sequence Number: 1
        Resend Count: 0
        Fragment Number: 0
        crc32: 0x56518d9a [correct]
        Number Of Channels: 1
        Channel Id: 1
        Channel Flags: True
        Unknown: 00
        Codec: Speex 12.3 (0x0009)
        End Marker
        Unknown: 00001000
        Channel Name: Default
        Channel Topic: Default
        Channel Description: Default Channel

## Wireshark

The TS2 dissector is (fully ?) functional and is currently (Dec 5,2008) available in the Wireshark 1.1.1 Development release.

## Example capture file

  - [SampleCaptures/TeamSpeak2.pcap](uploads/__moin_import__/attachments/SampleCaptures/TeamSpeak2.pcap)

## External links

  - <http://sf.net/projects/teambb> *libtbb* - An open source library for the TS2 protocol.

## Discussion

---

Imported from https://wiki.wireshark.org/TeamSpeak2 on 2020-08-11 23:26:34 UTC
