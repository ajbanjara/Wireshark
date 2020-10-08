# Virtual Bridged LAN (VLAN, IEEE 802.1Q)

A Virtual Bridged Local Area Network is used to logically group network devices together, which share the same physical network.

This way, the network traffic of a VLAN group is only visible to the network devices which are members of this group.

A specific VLAN (group) is distinguished by a unique 12 bit VLAN ID.

A network administrator will have to logically group the network devices together and provide a unique VLAN ID for each of these groups. Then he will attach each port on each participating (Ethernet) switch with one or several of these ID's. After that, the switch will forward incoming VLAN tagged packets (see below) only to the network devices which are in the specific VLAN.

VLAN is specified by the [IEEE](/IEEE) in the [IEEE 802.1Q](http://standards.ieee.org/getieee802/download/802.1Q-2003.pdf) standard.

VLAN's are "working together" with several IEEE 802 technologies (Ethernet, WLAN, Token Ring, ...).

See [CaptureSetup/VLAN](/CaptureSetup/VLAN) for various details how to capture VLAN traffic.

## (Ethernet) Packet Format

There are several different packet formats defined; see the standard for details.

However, a VLAN packet on an [Ethernet](/Ethernet) will typically look like this:

| Destination MAC address | Source MAC address | Type (VLAN: 0x8100) | VLAN Tag | User Data |
| ----------------------- | ------------------ | ------------------- | -------- | --------- |
| 6                       | 6                  | 2                   | 4        | 46 - 1500 |

The green fields have the same meaning as in a usual Ethernet packet, the VLAN Ethernet Type is 0x8100.

Please note, that the maximum user data length is still 1500, so VLAN packets will have a maximum of 1518 bytes (which is 4 bytes longer than usual Ethernet packets).

### VLAN Tag

The VLAN tag itself will look like this (length in bits):

| Priority | CFI | ID | Ethernet Type/Length |
| -------- | --- | -- | -------------------- |
| 3        | 1   | 12 | 16                   |

  - Priority: the user's priority of this packet (ranges from 0 to 7)
  - Canonical Format Identifier (CFI):
  - Usually 0 (canonical format, bytes Big Endian, bits Little Endian).
  - If set to 1, this generally indicates that MAC addresses in the frame are in non-canonical format for Ethernet (bits Big Endian), i.e. Token Ring and FDDI MAC address order.
  - More precisely, on Ethernet and on FDDI without source routing, i.e. when the RII bit in the frame's source MAC Address field is 0, this indicates an Embedded Routing Information Field (E-RIF) of two octets of more then follows the VLAN tag which itself has a Non-canonical Format Indicator that will definitively say whether the MAC addresses are in canonical order or not. On Token Ring and FDDI with source routing, this always indicates non-canonical / native TR and FDDI MAC address format.
  - The CFI being set indicates that the frame originated on a Token Ring (IEEE 802.5) or FDDI segment.
  - In IEEE 802.1ad and ah, this was replaced with a Drop Eligible Indicator (DEI) bit, and recent versions of 802.1Q (2011 and later) adopt this as well, rolling up 802.1ad and ah, since Token Ring and FDDI are now pretty rare support for bridging them was dropped.
  - ID: the ID of the VLAN (group) to which this packet belongs

## History

[Wikipedia VLAN history section](https://en.wikipedia.org/wiki/Virtual_LAN#History)

## Protocol dependencies

  - XXX - describe how VLAN is related to Ethernet (and other 802.x LANs on which it's used, e.g. Token Ring)

## Example traffic

``` 
 Frame 53 (70 bytes on wire, 70 bytes captured)
 Ethernet II, Src: 00:40:05:40:ef:24, Dst: 00:60:08:9f:b1:f3
 802.1q Virtual LAN
    000. .... .... .... = Priority: 0
    ...0 .... .... .... = CFI: 0
    .... 0000 0010 0000 = ID: 32
    Type: IP (0x0800)
 Internet Protocol, Src Addr: 131.151.32.129 (131.151.32.129), Dst Addr: 131.151.32.21 (131.151.32.21)
 Transmission Control Protocol, Src Port: 1173 (1173), Dst Port: 6000 (6000), Seq: 0, Ack: 128, Len: 0
```

## Wireshark

The VLAN dissector is fully functional.

## Preference Settings

The VLAN dissector has two preferences:

  - Show VLAN summary in protocol tree
  - 802.1QinQ Ethertype

## Example capture file

The [SampleCaptures](/SampleCaptures) page includes [vlan.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/vlan.cap.gz) which shows VLAN tags.

## Display Filter

A complete list of VLAN display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/v/vlan.html)

Show only the VLAN based traffic:

``` 
 vlan
```

## Capture Filter

Capture only VLAN traffic:

``` 
 vlan
```

Capture only VLAN traffic for VLAN 17:

``` 
 vlan 17
```

(substitute for 17 the VLAN ID of the VLAN whose traffic you want to capture)

To quote the Mac OS X 10.4.9 tcpdump man page (this isn't [WinPcap](/WinPcap)-specific - it's common to all libpcap/WinPcap implementations):

vlan \[vlan\_id\]

  - True if the packet is an IEEE 802.1Q VLAN packet. If \[vlan\_id\] is specified, only true is the packet has the specified vlan\_id. Note that the first vlan keyword encountered in expression changes the decoding offsets for the remainder of expression on the assumption that the packet is a VLAN packet.

As the second sentence says, "Note that the first vlan keyword encountered in expression changes the decoding offsets for the remainder of expression on the assumption that the packet is a VLAN packet." The "vlan" in "vlan and host x.x.x.x" causes the "host x.x.x.x" to check for VLAN-encapsulated packets with an IPv4 address of x.x.x.x.

To check for both VLAN-encapsulated and non-VLAN-encapsulated packets with that IPv4 address, try

host x.x.x.x or (vlan and host x.x.x.x)

## External links

  - IEEE 802.1Q: [IEEE Standards for Local and metropolitan area networks—Virtual Bridged Local Area Networks](http://standards.ieee.org/getieee802/download/802.1Q-2003.pdf).

## Discussion

---

Imported from https://wiki.wireshark.org/VLAN on 2020-08-11 23:27:11 UTC
