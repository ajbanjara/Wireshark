# Encrypted UDP based FTP with multicast (UFTP)

UFTP is an encrypted multicast file transfer program, designed to securely, reliably, and efficiently transfer files to multiple receivers simultaneously. This is useful for distributing large files to a large number of receivers, and is especially useful for data distribution over a satellite link (with two way communication), where the inherent delay makes any TCP based communication highly inefficient. The multicast encryption scheme is based on TLS with extensions to allow multiple receivers to share a common key. UFTP also has the capability to communicate over disjoint networks separated by one or more firewalls (NAT traversal) and without full end-to-end multicast capability (multicast tunneling) through the use of a UFTP proxy server. These proxies also provide scalability by aggregating responses from a group of receivers.

## History

UFTP was first released by Dennis Bush on 7/6/2001. Version 1.0 appeared 12/17/2002. Version 2.0 appeared 5/4/2006. Version 3.0 appeared 3/11/2010, adding SSL derived encryption. Version 4.0 appeared 4/27/2013, adding IPv6 support. Version 5.0 appeared 4/22/2020, adding security updates in line with TLS 1.3.

## Protocol dependencies

  - [UDP](/UDP): Typically, UFTP uses [UDP](/UDP) as its transport protocol. The well known UDP port for UFTP traffic is 1044.

## Example traffic

    Frame 12: 82 bytes on wire (656 bits), 82 bytes captured (656 bits) on interface 0
    Ethernet II, Src: e2:e4:de:0e:37:0a (e2:e4:de:0e:37:0a), Dst: IPv4mcast_04:04:01 (01:00:5e:04:04:01)
    Internet Protocol Version 4, Src: 10.0.0.1 (10.0.0.1), Dst: 230.4.4.1 (230.4.4.1)
    User Datagram Protocol, Src Port: 37173, Dst Port: 1044
    UDP based FTP w/ multicast V4
        Protocol Version: 0x40
        Type: ANNOUNCE (1)
        Sequence Number: 4
        Source ID: 0x0a000001
        Group ID: 0x96f4c304
        Group Instance ID: 0
        Group Round Trip Time: 0,532215785796568
        Group Size: 0
        Reserved: 0x00
        ANNOUNCE
            Type: ANNOUNCE (1)
            Header Length: 6
            Flags: 0x00
            Robustness Factor: 20
            Congestion Control Type: NONE (0)
            Reserved: 0
            Block Size: 1300
            Timestamp: Aug  6, 2016 21:52:35.000364573 UTC
            Public Multicast Address: 230.4.4.1 (230.4.4.1)
            Private Multicast Address: 230.5.5.56 (230.5.5.56)

## Wireshark

The UFTP dissector is fully functional, for both version 3 and 4 of the protocol. Support for version 5 is upcoming.

## Preference Settings

This dissector has no preferences to set.

## Example capture file

  - [SampleCaptures/UFTP\_v3\_transfer.pcapng](uploads/__moin_import__/attachments/SampleCaptures/UFTP_v3_transfer.pcapng)

  - [SampleCaptures/UFTP\_v4\_transfer.pcapng](uploads/__moin_import__/attachments/SampleCaptures/UFTP_v4_transfer.pcapng)

  - [SampleCaptures/UFTP\_v5\_transfer.pcapng](uploads/__moin_import__/attachments/SampleCaptures/UFTP_v5_transfer.pcapng)

## Display Filter

A complete list of UFTP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/u/uftp.html)

Show only the UFTP based traffic:

``` 
 uftp 
```

## Capture Filter

You cannot directly filter UFTP protocols while capturing. However, if you know the [UDP](/UDP) port used (see above), you can filter on that one.

Capture only the UFTP traffic over the default port (1044):

``` 
 udp port 1044 
```

## External links

  - <http://uftp-multicast.sourceforge.net/> *UFTP - Encrypted UDP based FTP with multicast*

## Discussion

---

Imported from https://wiki.wireshark.org/Protocols/uftp on 2020-08-11 23:23:11 UTC
