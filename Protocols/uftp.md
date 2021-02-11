# Encrypted UDP based FTP with multicast (UFTP)

UFTP is an encrypted multicast file transfer program, designed to securely, reliably, and efficiently transfer files to multiple receivers simultaneously. This is useful for distributing large files to a large number of receivers, and is especially useful for data distribution over a satellite link (with two way communication), where the inherent delay makes any TCP based communication highly inefficient. The multicast encryption scheme is based on TLS with extensions to allow multiple receivers to share a common key. UFTP also has the capability to communicate over disjoint networks separated by one or more firewalls (NAT traversal) and without full end-to-end multicast capability (multicast tunneling) through the use of a UFTP proxy server. These proxies also provide scalability by aggregating responses from a group of receivers.  
([project page](http://uftp-multicast.sourceforge.net/))

## History

UFTP was first released by Dennis Bush on 7/6/2001. Version 1.0 appeared 12/17/2002. Version 2.0 appeared 5/4/2006. Version 3.0 appeared 3/11/2010, adding SSL derived encryption. Version 4.0 appeared 4/27/2013, adding IPv6 support. Version 5.0 appeared 4/22/2020, adding security updates in line with TLS 1.3.  
([Change log](http://uftp-multicast.sourceforge.net/Changes.txt))

## Protocol dependencies

  - [UDP](/UDP): Typically, UFTP uses [UDP](/UDP) as its transport protocol. The well known UDP port for UFTP traffic is 1044.

## Example traffic (UFTP_v5_transfer.pcapng)

```
Frame 12: 82 bytes on wire (656 bits), 82 bytes captured (656 bits) on interface ens33, id 0
Ethernet II, Src: 00:0c:29:e4:53:3b, Dst: 01:00:5e:04:04:01
Internet Protocol Version 4, Src: 192.168.1.186, Dst: 230.4.4.1
User Datagram Protocol, Src Port: 37457, Dst Port: 1044
UDP based FTP w/ multicast V5
    Protocol Version: 0x50
    Type: ANNOUNCE (1)
    Sequence Number: 6
    Source ID: 0xc0a801ba
    Group ID: 0x0211a8c5
    Group Instance ID: 0
    Group Round Trip Time: 0.0105273022466847
    Group Size: 1
    Reserved: 0x00
    ANNOUNCE
        Type: ANNOUNCE (1)
        Header Length: 24 bytes (6)
        Flags: 0x00
            .... ...0 = Sync mode: False
            .... ..0. = Sync preview mode: False
            .... .0.. = IPv6: False
            0000 0... = Reserved: 0x00
        Robustness Factor: 20
        Congestion Control Type: TFMCC (2)
        Reserved: 0
        Block Size: 1300
        Timestamp: Apr 23, 2020 15:15:33.220323000 UTC
        Public Multicast Address: 230.4.4.1
        Private Multicast Address: 230.5.5.88

```

## Wireshark

The UFTP dissector is fully functional, for both version 3 and 4 of the protocol. Support for version 5 is upcoming.  
(Version 5 added in commit [d7b31223](https://gitlab.com/wireshark/wireshark/-/commit/d7b312238d32d6cb92e1a5ba6a15a213efa60c94) : May 24, 2020 )  
[packet-uftp.c](https://gitlab.com/wireshark/wireshark/-/blob/master/epan/dissectors/packet-uftp.c)  [packet-uftp4.c](https://gitlab.com/wireshark/wireshark/-/blob/master/epan/dissectors/packet-uftp4.c)   [packet-uftp5.c](https://gitlab.com/wireshark/wireshark/-/blob/master/epan/dissectors/packet-uftp5.c)

## Preference Settings

![210210_UFTP_port_preference](uploads/5cc5de40099739ec492596d5fe77d938/210210_UFTP_port_preference.png)  
  
`uftp.udp.port` - Set the UDP port for UFTP (if other than the default of 1044)  
  
![210210_UFTP_port_preference_advanced_crop](uploads/eb4d1443840aac5673d9616769563191/210210_UFTP_port_preference_advanced_crop.png)

## Example capture file

  - [SampleCaptures/UFTP\_v3\_transfer.pcapng](uploads/__moin_import__/attachments/SampleCaptures/UFTP_v3_transfer.pcapng)

  - [SampleCaptures/UFTP\_v4\_transfer.pcapng](uploads/__moin_import__/attachments/SampleCaptures/UFTP_v4_transfer.pcapng)

  - [SampleCaptures/UFTP\_v5\_transfer.pcapng](uploads/__moin_import__/attachments/SampleCaptures/UFTP_v5_transfer.pcapng)

## Display Filter

(210210 - at this time, each version is split out into a separate dissector)  
A complete list of UFTP display filter fields can be found in the display filter reference - [uftp](http://www.wireshark.org/docs/dfref/u/uftp.html), [uftp4](http://www.wireshark.org/docs/dfref/u/uftp4.html), [uftp5](http://www.wireshark.org/docs/dfref/u/uftp5.html)

Show only the UFTP based traffic:

``` 
 uftp or uftp4 or uftp5
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
