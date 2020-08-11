# Lightweight User Datagram Protocol (UDP-Lite)

The Lightweight User Datagram Protocol (UDP-Lite) ([RFC 3828](http://www.ietf.org/rfc/rfc3828.txt)), which is similar to the User Datagram Protocol ([UDP](/UDP)) ([RFC 768](http://www.ietf.org/rfc/rfc768.txt)), but can also serve applications in error-prone network environments that prefer to have partially damaged payloads delivered rather than discarded. If this feature is not used, UDP-Lite is semantically identical to UDP.

## History

Wireless links typically have lower bit rates and higher error rates when compared to wired links. Applications such as audio/video streaming can use error-resilient codecs, but are delay-sensitive. Hence retransmission due to checksum errors is expensive. UDP Lite has been developed for these classes of applications. People have used it for streaming media, as well as video over cellphones, with good results.

## Protocol dependencies

  - [IP](/IP): Typically, UDP-Lite uses [IP](/IP) as its underlying protocol. The assigned protocol number for UDP-Lite is 136.

## Example traffic

    Frame 1 (60 bytes on wire, 60 bytes captured)
    Ethernet II, Src: 00:60:97:a0:e3:7e (00:60:97:a0:e3:7e), Dst: 00:04:75:c7:87:49 (00:04:75:c7:87:49)
    Internet Protocol, Src: 139.133.204.185 (139.133.204.185), Dst: 139.133.204.176 (139.133.204.176)
        Version: 4
        Header length: 20 bytes
        Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
        Total Length: 40
        Identification: 0xb651 (46673)
        Flags: 0x04 (Don't Fragment)
        Fragment offset: 0
        Time to live: 64
        Protocol: UDPlite (0x88)
        Header checksum: 0xd387 [correct]
        Source: 139.133.204.185 (139.133.204.185)
        Destination: 139.133.204.176 (139.133.204.176)
    Lightweight User Datagram Protocol, Src Port: 1024 (1024), Dst Port: 1234 (1234)
        Source port: 1024 (1024)
        Destination port: 1234 (1234)
        Checksum coverage: 8
        Checksum: 0x4614 [correct]
    Data (12 bytes)
    
    0000  68 65 6c 6c 6f 20 77 6f 72 6c 64 0a               hello world. 

## Wireshark

The UDP-Lite dissector is available in Wireshark 0.10.14 and up. It rides with the [UDP](/UDP) dissector, using an additional field for checksum coverage length.

## Preference Settings

  - Ignore checksum coverage (default:TRUE) - Ignore the fact that the checksum coverage value is invalid and the datagram should be dropped.

## Example capture file

  - [SampleCaptures/udp\_lite\_full\_coverage\_0.pcap](uploads/__moin_import__/attachments/SampleCaptures/udp_lite_full_coverage_0.pcap) If coverage=0, the full packet is checksummed over.

  - [SampleCaptures/udp\_lite\_illegal\_1-7.pcap](uploads/__moin_import__/attachments/SampleCaptures/udp_lite_illegal_1-7.pcap) Coverage values between 1..7 (illegal).

  - [SampleCaptures/udp\_lite\_normal\_coverage\_8-20.pcap](uploads/__moin_import__/attachments/SampleCaptures/udp_lite_normal_coverage_8-20.pcap) Normal ones with correct checksums (legal).

  - [SampleCaptures/udp\_lite\_illegal\_large-coverage.pcap](uploads/__moin_import__/attachments/SampleCaptures/udp_lite_illegal_large-coverage.pcap) Three traces with coverage lengths greater than the packet length.

  - [SampleCaptures/udp\_lite\_checksum\_0.pcap](uploads/__moin_import__/attachments/SampleCaptures/udp_lite_checksum_0.pcap) Checksum 0 is illegal.

## Display Filter

A complete list of UDP-Lite display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/protofirstletter/proto.html)

Show only the UDP-Lite based traffic:

``` 
 udplite 
```

## Capture Filter

Capture only the UDP-Lite traffic:

``` 
 ip proto 136 
```

## External links

  - [UDP-Lite](http://www.erg.abdn.ac.uk/users/gerrit/udp-lite/) *UDP-Lite homepage at Electronics Research Group, The University of Aberdeen*.

  - [RFC 3828](http://www.ietf.org/rfc/rfc3828.txt) *Lightweight User Datagram Protocol*.

  - [RFC 768](http://www.ietf.org/rfc/rfc768.txt) *User Datagram Protocol*.

  - [User Datagram Protocol](http://blog.eukhost.com/2006/11/03/user-datagram-protocol) *More Info on User Datagram Protocol*

## Discussion

---

Imported from https://wiki.wireshark.org/Lightweight_User_Datagram_Protocol on 2020-08-11 23:15:57 UTC
