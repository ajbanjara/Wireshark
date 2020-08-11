# Internet Group Management Protocol (IGMP)

IGMP is used by IP hosts to manage their dynamic multicast group membership. It is also used by connected routers to discover these group members.

## History

[RFC 988](http://www.networksorcery.com/enp/rfc/rfc988.txt) **** - IGMP version 0

[RFC 1054](http://www.networksorcery.com/enp/rfc/rfc1054.txt) - IGMP version 1

[RFC 2236](http://tools.ietf.org/html/rfc2236) - IGMP version 2

## Protocol dependencies

  - [IP](/IP): Typically, IGMP uses [IP](/IP) as its transport protocol. The well known IP protocol type for IGMP traffic is 0x02.

## Example traffic

    (Certain addresses munged)
    
    No.     Time        Source                Destination           Protocol Info
         38 18.419525   192.168.xxx.xxx        239.255.255.250       IGMP     V2 Membership Report
    
    Frame 38 (46 bytes on wire, 46 bytes captured)
        Arrival Time: May 29, 2005 16:45:58.272406000
        Time delta from previous packet: 0.481171000 seconds
        Time since reference or first frame: 18.419525000 seconds
        Frame Number: 38
        Packet Length: 46 bytes
        Capture Length: 46 bytes
        Protocols in frame: eth:ip:igmp
    Ethernet II, Src: xx:xx:xx:xx:xx:xx, Dst: 01:00:5e:7f:ff:fa
        Destination: 01:00:5e:7f:ff:fa (01:00:5e:7f:ff:fa)
        Source: xx:xx:xx:xx:xx:00 (ABCD:xx:00)
        Type: IP (0x0800)
    Internet Protocol, Src Addr: 192.168.xxx.xxx (192.168.xxx.xxx), Dst Addr: 239.255.255.250 (239.255.255.250)
        Version: 4
        Header length: 24 bytes
        Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
            0000 00.. = Differentiated Services Codepoint: Default (0x00)
            .... ..0. = ECN-Capable Transport (ECT): 0
            .... ...0 = ECN-CE: 0
        Total Length: 32
        Identification: 0x58dd (22749)
        Flags: 0x00
            0... = Reserved bit: Not set
            .0.. = Don't fragment: Not set
            ..0. = More fragments: Not set
        Fragment offset: 0
        Time to live: 1
        Protocol: IGMP (0x02)
        Header checksum: 0x10f4 (correct)
        Source: 192.168.xxx.xxx (192.168.xxx.xxx)
        Destination: 239.255.255.250 (239.255.255.250)
        Options: (4 bytes)
            Router Alert: Every router examines packet
    Internet Group Management Protocol
        IGMP Version: 2
        Type: Membership Report (0x16)
        Max Response Time: 0,0 sec (0x00)
        Header checksum: 0xfa04 (correct)
        Multicast Address: 239.255.255.250 (239.255.255.250)
    
    0000  01 00 5e 7f ff fa xx xx xx xx xx xx 08 00 46 00   ..^.....Z#.s..F.
    0010  00 20 58 dd 00 00 01 02 10 f4 c0 a8 xx xx ef ff   . X..........d..
    0020  ff fa 94 04 00 00 16 00 fa 04 ef ff ff fa         ..............

## Wireshark

The IGMP dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

There are no IGMP specific preference settings.

## Example capture file

[SampleCaptures/IGMP dataset.pcap](uploads/__moin_import__/attachments/SampleCaptures/IGMP-dataset.pcap) Sample IGMP version 2.

## Display Filter

A complete list of IGMP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/i/igmp.html)

Show only the IGMP based traffic:

``` 
 igmp
```

## Capture Filter

Capture only the IGMP based traffic:

``` 
 igmp
```

## External links

  - [RFC 988](http://www.ietf.org/rfc/rfc988.txt) *Host Extensions for IP Multicasting* - describes the obsolete "version 0" of IGMP

  - [RFC 1112](http://www.ietf.org/rfc/rfc1112.txt) *Host Extensions for IP Multicasting* - describes version 1 of IGMP

  - [RFC 2236](http://www.ietf.org/rfc/rfc2236.txt) *Internet Group Management Protocol, Version 2*

  - [RFC 3376](http://www.ietf.org/rfc/rfc3376.txt) *Internet Group Management Protocol, Version 3*

## Discussion

---

Imported from https://wiki.wireshark.org/IGMP on 2020-08-11 23:15:04 UTC
