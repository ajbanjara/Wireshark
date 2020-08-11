# Cisco Discovery Protocol (CDP)

CDP (Cisco Discovery Protocol) is a Cisco proprietary protocol that runs between direct connected network entities (routers, switches, remote access devices, IP telephones etc.). The purpose of the protocol is to supply a network entity with information about its direct connected neighbors.

## History

XXX - add a brief description of CDP history (see third external link for a detailed history)

## Protocol dependencies

  - [LLC](/LLC)/[SNAP](/SNAP): CDP is encapsulated as LLC/SNAP with an OUI of 0x00000C and a protocol ID of 0x2000.

  - [Cisco HDLC](/Cisco-HDLC): CDP is encapsulated over Cisco HDLC with a protocol type of 0x2000.

  - [PPP](/PPP): CDP is encapsulated over PPP with a protocol type of 0x0207.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

    $ sudo tshark -i eth0 -V -f "ether host 01:00:0c:cc:cc:cc" -c 2
    Capturing on eth0
    Frame 1 (386 bytes on wire, 386 bytes captured)
        Arrival Time: Oct 27, 2005 17:51:50.282947000
        Time delta from previous packet: 0.000000000 seconds
        Time since reference or first frame: 0.000000000 seconds
        Frame Number: 1
        Packet Length: 386 bytes
        Capture Length: 386 bytes
        Protocols in frame: eth:llc:cdp:data
    IEEE 802.3 Ethernet
        Destination: CDP/VTP (01:00:0c:cc:cc:cc)
        Source: Cisco_12:34:56 (00:07:85:12:34:56)
        Length: 372
    Logical-Link Control
        DSAP: SNAP (0xaa)
        IG Bit: Individual
        SSAP: SNAP (0xaa)
        CR Bit: Command
        Control field: U, func=UI (0x03)
            000. 00.. = Command: Unnumbered Information (0x00)
            .... ..11 = Frame type: Unnumbered frame (0x03)
        Organization Code: Cisco (0x00000c)
        PID: CDP (0x2000)
    Cisco Discovery Protocol
        Version: 2
        TTL: 180 seconds
        Checksum: 0xc2c3
        Device ID: LAN354802
            Type: Device ID (0x0001)
            Length: 13
            Device ID: LAN354802
        Addresses
            Type: Addresses (0x0002)
            Length: 17
            Number of addresses: 1
            IP address: 192.168.2.62
                Protocol type: NLPID
                Protocol length: 1
                Protocol: IP
                Address length: 4
                IP address: 192.168.2.62
        Port ID: FastEthernet0/7
            Type: Port ID (0x0003)
            Length: 19
            Sent through Interface: FastEthernet0/7
        Capabilities
            Type: Capabilities (0x0004)
            Length: 8
            Capabilities: 0x0000000a
                .... .... .... .... .... .... .... ...0 = Not a Router
                .... .... .... .... .... .... .... ..1. = Is  a Transparent Bridge
                .... .... .... .... .... .... .... .0.. = Not a Source Route Bridge
                .... .... .... .... .... .... .... 1... = Is  a Switch
                .... .... .... .... .... .... ...0 .... = Not a Host
                .... .... .... .... .... .... ..0. .... = Not IGMP capable
                .... .... .... .... .... .... .0.. .... = Not a Repeater
        Software Version
            Type: Software version (0x0005)
            Length: 225
            Software Version: Cisco Internetwork Operating System Software
                              IOS (tm) C3500XL Software (C3500XL-C3H2S-M), Version 12.0(5)WC8, RELEASE SOFTWARE (fc1)
                              Copyright (c) 1986-2003 by cisco Systems, Inc.
                              Compiled Thu 19-Jun-03 12:37 by antonino
        Platform: cisco WS-C3548-XL
            Type: Platform (0x0006)
            Length: 21
            Platform: cisco WS-C3548-XL
        Protocol Hello: Cluster Management
            Type: Protocol Hello (0x0008)
            Length: 36
            OUI: 0x00000C (Cisco)
            Protocol ID: 0x0112 (Cluster Management)
            Cluster Master IP: 0.0.0.0
            UNKNOWN (IP?): 0xFFFFFFFF (255.255.255.255)
            Version?: 0x01
            Sub Version?: 0x01
            Status?: 0x21
            UNKNOWN: 0xFF
            Cluster Commander MAC: 00:00:00:00:00:00
            Switch's MAC: 00:07:85:12:34:56
            UNKNOWN: 0xFF
            Management VLAN: 100
        VTP Management Domain: mynet
            Type: VTP Management Domain (0x0009)
            Length: 10
            VTP Management Domain: mynet
        Native VLAN: 105
            Type: Native VLAN (0x000a)
            Length: 6
            Native VLAN: 105
        Duplex: Full
            Type: Duplex (0x000b)
            Length: 5
            Duplex: Full
    Frame 2 (95 bytes on wire, 95 bytes captured)
        Arrival Time: Oct 27, 2005 17:51:52.924645000
        Time delta from previous packet: 2.641698000 seconds
        Time since reference or first frame: 2.641698000 seconds
        Frame Number: 2
        Packet Length: 95 bytes
        Capture Length: 95 bytes
        Protocols in frame: eth:llc:data
    IEEE 802.3 Ethernet
        Destination: CDP/VTP (01:00:0c:cc:cc:cc)
        Source: Cisco_12:34:56 (00:07:85:12:34:56)
        Length: 81
    Logical-Link Control
        DSAP: SNAP (0xaa)
        IG Bit: Individual
        SSAP: SNAP (0xaa)
        CR Bit: Command
        Control field: U, func=UI (0x03)

Another example:

    Frame 1 (417 bytes on wire, 417 bytes captured)
        Arrival Time: Feb  8, 2008 03:24:16.590621000
        [Time delta from previous captured frame: 1202459056.590621000 seconds]
        [Time delta from previous displayed frame: 1202459056.590621000 seconds]
        [Time since reference or first frame: 1202459056.590621000 seconds]
        Frame Number: 1
        Frame Length: 417 bytes
        Capture Length: 417 bytes
        [Frame is marked: False]
        [Protocols in frame: eth:llc:cdp:data]
    IEEE 802.3 Ethernet
        Destination: CDP/VTP/DTP/PAgP/UDLD (01:00:0c:cc:cc:cc)
            Address: CDP/VTP/DTP/PAgP/UDLD (01:00:0c:cc:cc:cc)
            .... ...1 .... .... .... .... = IG bit: Group address (multicast/broadcast)
            .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        Source: Cisco_a9:59:15 (00:0a:b8:a9:59:15)
            Address: Cisco_a9:59:15 (00:0a:b8:a9:59:15)
            .... ...0 .... .... .... .... = IG bit: Individual address (unicast)
            .... ..0. .... .... .... .... = LG bit: Globally unique address (factory default)
        Length: 403
    Logical-Link Control
        DSAP: SNAP (0xaa)
        IG Bit: Individual
        SSAP: SNAP (0xaa)
        CR Bit: Command
        Control field: U, func=UI (0x03)
            000. 00.. = Command: Unnumbered Information (0x00)
            .... ..11 = Frame type: Unnumbered frame (0x03)
        Organization Code: Cisco (0x00000c)
        PID: CDP (0x2000)
    Cisco Discovery Protocol
        Version: 2
        TTL: 180 seconds
        Checksum: 0x7256 [incorrect, should be 0x7354]
            [Good: False]
            [Bad : True]
        Device ID: c3560.example.com
            Type: Device ID (0x0001)
            Length: 21
            Device ID: c3560.example.com
        Software Version
            Type: Software version (0x0005)
            Length: 194
            Software Version: Cisco IOS Software, C3560 Software (C3560-ADVIPSERVICESK9-M), Version 12.2(44)SE, RELEASE SOFTWARE (fc1)
                              Copyright (c) 1986-2008 by Cisco Systems, Inc.
                              Compiled Sat 05-Jan-08 00:15 by weiliu
        Platform: cisco WS-C3560G-48PS
            Type: Platform (0x0006)
            Length: 24
            Platform: cisco WS-C3560G-48PS
        Addresses
            Type: Addresses (0x0002)
            Length: 17
            Number of addresses: 1
            IP address: 192.168.1.1
                Protocol type: NLPID
                Protocol length: 1
                Protocol: IP
                Address length: 4
                IP address: 192.168.1.1
        Port ID: GigabitEthernet0/21
            Type: Port ID (0x0003)
            Length: 23
            Sent through Interface: GigabitEthernet0/21
        Capabilities
            Type: Capabilities (0x0004)
            Length: 8
            Capabilities: 0x00000029
                .... .... .... .... .... .... .... ...1 = Is  a Router
                .... .... .... .... .... .... .... ..0. = Not a Transparent Bridge
                .... .... .... .... .... .... .... .0.. = Not a Source Route Bridge
                .... .... .... .... .... .... .... 1... = Is  a Switch
                .... .... .... .... .... .... ...0 .... = Not a Host
                .... .... .... .... .... .... ..1. .... = Is  IGMP capable
                .... .... .... .... .... .... .0.. .... = Not a Repeater
        Protocol Hello: Cluster Management
            Type: Protocol Hello (0x0008)
            Length: 36
            OUI: 0x00000C (Cisco)
            Protocol ID: 0x0112 (Cluster Management)
            Cluster Master IP: 0.0.0.0
            UNKNOWN (IP?): 0xFFFFFFFF (255.255.255.255)
            Version?: 0x01
            Sub Version?: 0x02
            Status?: 0x21
            UNKNOWN: 0xFF
            Cluster Commander MAC: 00:00:00:00:00:00
            Switch's MAC: 00:0a:b8:a9:59:00
            UNKNOWN: 0xFF
            Management VLAN: 0
        VTP Management Domain: EXAMPLENET
            Type: VTP Management Domain (0x0009)
            Length: 14
            VTP Management Domain: EXAMPLENET
        Native VLAN: 40
            Type: Native VLAN (0x000a)
            Length: 6
            Native VLAN: 40
        Duplex: Full
            Type: Duplex (0x000b)
            Length: 5
            Duplex: Full
        Trust Bitmap: 0x00
            Type: Trust Bitmap (0x0012)
            Length: 5
            Trust Bitmap: 00
        Untrusted port CoS: 0x00
            Type: Untrusted Port CoS (0x0013)
            Length: 5
            Untrusted port CoS: 00
        Management Addresses
            Type: Management Address (0x0016)
            Length: 17
            Number of addresses: 1
            IP address: 192.168.1.1
                Protocol type: NLPID
                Protocol length: 1
                Protocol: IP
                Address length: 4
                IP address: 192.168.1.1
        Type: Unknown (0x001a), length: 16
            Type: Unknown (0x001a)
            Length: 16
            Data
    
    1 packets captured

## Wireshark

The CDP dissector is fully functional (as far as I can tell). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

There are no CDP specific preference settings.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/cdp.pcap](uploads/__moin_import__/attachments/SampleCaptures/cdp.pcap) Capture of a CDP v1 frame transmitted by a router.

  - [SampleCaptures/cdp\_v2.pcap](uploads/__moin_import__/attachments/SampleCaptures/cdp_v2.pcap) Capture of a CDP v2 frames transmitted by a switch.

  - [SampleCaptures/cdp\_v2\_voice.pcap](uploads/__moin_import__/attachments/SampleCaptures/cdp_v2_voice.pcap) Capture of a CDP v2 frames transmitted by a switch with the voice VLAN id for an IP Phone.

  - [SampleCaptures/cdp\_v2\_ppp.pcap](uploads/__moin_import__/attachments/SampleCaptures/cdp_v2_ppp.pcap) Capture of CDP v2 over ppp frames.

  - [SampleCaptures/cdp\_v2\_hdlc.pcap](uploads/__moin_import__/attachments/SampleCaptures/cdp_v2_hdlc.pcap) Capture of CDP v2 over hdlc frames.

## Display Filter

A complete list of CDP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/c/cdp.html)

Show only the CDP based traffic:

``` 
 cdp
```

## Capture Filter

Capture only the CDP traffic:

``` 
 ether host 01:00:0c:cc:cc:cc and ether[16:4] = 0x0300000C and ether[20:2] == 0x2000
```

## External links

  - [CDP packet format information](http://www.cisco.com/univercd/cc/td/doc/product/lan/trsrb/frames.htm#xtocid12)

  - [Some additional CDP information](http://www.cisco.com/en/US/products/hw/switches/ps663/products_tech_note09186a0080094713.shtml#cdp)

  - [A history of CDP and comparison to LLDP-MED](http://www.cisco.com/en/US/technologies/tk652/tk701/technologies_white_paper0900aecd804cd46d.html)

## Discussion

What does IFAICT means? Sounds like a disease :smiley: - *[UlfLamping](/UlfLamping)*

Typo for AFAICT - As Far As I Can Tell? It should probably be replaced by the full phrase, if so (IMHO :-)), for the benefit of those not familiar with "AFAICT". - *Guy Harris*

Or trying to be fancy saying "Insofar" but forgetting to take out the F? - *[BrianJulin](/BrianJulin)*

So today I started playing with lldpd and was wondering what would happen if I performed the Cisco "trace mac" command to a mac address of a linux box that a cisco switch considered to be a CDP neighbor. What it does is quite interesting. It sends a UDP packet to port 2228 of the advertised CDP peer address. The packet is similar to CDP minus any checksums and the type fields are 1 byte. Should I start a new page for this undocumented protocol? Or should it stay on this page with the normal CDP? - *[BrianJulin](/BrianJulin)*

---

Imported from https://wiki.wireshark.org/CDP on 2020-08-11 23:12:12 UTC
