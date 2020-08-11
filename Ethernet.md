# Ethernet (IEEE 802.3)

[[_TOC_]]

## Overview

Ethernet is the most common local area networking technology, and, with gigabit and 10 gigabit Ethernet, is also being used for metropolitan-area and wide-area networking.

It is specified by [various IEEE 802.3 specifications](http://standards.ieee.org/getieee802/802.3.html).

Ethernet sends network packets from the sending host to one ([Unicast](/Unicast)) or more ([Multicast](/Multicast)/[Broadcast](/Broadcast)) receiving hosts.

You can find hardware related Ethernet information at the [EthernetHardware](/EthernetHardware) page.

Information how to capture on an Ethernet network can be found at the [CaptureSetup/Ethernet](/CaptureSetup/Ethernet) page.

## Packet format

A physical Ethernet packet will look like this:

<div>

<table>
<tbody>
<tr class="odd">
<td><p>Preamble</p></td>
<td><p>Destination MAC address</p></td>
<td><p>Source MAC address</p></td>
<td><p>Type/Length</p></td>
<td><p>User Data</p></td>
<td><p>Frame Check Sequence (FCS)</p></td>
</tr>
<tr class="even">
<td><p>8</p></td>
<td><p>6</p></td>
<td><p>6</p></td>
<td><p>2</p></td>
<td><p>46 - 1500</p></td>
<td><p>4</p></td>
</tr>
</tbody>
</table>

</div>

As the Ethernet hardware filters the preamble, it is not given to Wireshark or any other application. Most Ethernet interfaces also either don't supply the FCS to Wireshark or other applications, or aren't configured by their driver to do so; therefore, Wireshark will typically only be given the green fields, although on some platforms, with some interfaces, the FCS will be supplied on incoming packets.

### Allowed Packet Lengths

Ethernet packets with less than the minimum 64 bytes for an Ethernet packet (header + user data + FCS) are padded to 64 bytes, which means that if there's less than 64-(14+4) = 46 bytes of user data, extra padding data is added to the packet.

Beware: the minimum Ethernet packet size is commonly mentioned at 64 bytes, which is including the FCS. This can be confusing as the FCS is often not shown by Wireshark, simply because the underlying mechanisms simply don't supply it. (XXX - add a list of system that supply the FCS and the systems that don't?)

XXX - 1GBit (10GBit?) Ethernet allows "Jumbo Ethernet Frames" of 9000? bytes, making the above standard Ethernet graphic inappropriate.

For operating system developers: it's considered to be a security threat to send uninitialised padding data\!

For protocol developers: If the upper layer protocol implementation has to know exactly how much user data is in the packet, and expects the length of the Ethernet packet to indicate the amount of user data, it will not behave correctly with padded packets\!

Even if the VLAN tag is 4 bytes, the minimum size of the Ethernet frame with VLAN tagging is 64 bytes.

### MAC address fields

An Ethernet host is addressed by its Ethernet MAC address, a 6 byte number usually displayed as: 08:00:08:15:ca:fe (the delimiters vary, so you might see 08-00-08-15-ca-fe or the like).

The first three bytes of the address are assigned to a specific vendor or organization; they're referred to as an Organizationally Unique Identifier, or an OUI. See [the IEEE OUI list](http://standards.ieee.org/regauth/oui/oui.txt), [Ethernet numbers](http://www.iana.org/assignments/ethernet-numbers) at the [IANA](/IANA), [Michael A. Patton's list of vendor codes](http://www.cavebear.com/CaveBear/Ethernet/vendor.html), and [Wireshark's list of Ethernet vendor codes and well-known MAC addresses](http://anonsvn.wireshark.org/wireshark/trunk/manuf), from the Wireshark source distribution, for assigned OUIs. You can also search for a particular OUI from [the IEEE OUI and Company\_id Assignments page](http://standards.ieee.org/regauth/oui/index.shtml).

A destination MAC address of ff:ff:ff:ff:ff:ff indicates a [Broadcast](/Broadcast), meaning the packet is sent from one host to any other on that network.

A destination MAC address where the low-order bit of the first byte is set indicates a [Multicast](/Multicast), meaning the packet is sent from one host to all hosts on the network interested in packets sent to that MAC address. A number of multicast addresses have been assigned; see [Ethernet numbers](http://www.iana.org/assignments/ethernet-numbers) at the [IANA](/IANA), [Michael A. Patton's list of multicast addresses](http://www.cavebear.com/CaveBear/Ethernet/multicast.html), and [Wireshark's list of Ethernet vendor codes and well-known MAC addresses](http://anonsvn.wireshark.org/wireshark/trunk/manuf), from the Wireshark source distribution, for assigned multicast addresses.

The second least significant bit of the first byte is the "Locally Administrated" bit. This bit is always set to 0 for all assigned OIDs. The purpose of this bit is that if you change your MAC address you should also set this bit to 1 in the new MAC address so that it is clear it is not a factory default MAC address. Many, but not all, cluster configurations that utilize MAC address failover will set this bit to 1 for the failover interface.

### Type / Length field

The original DEC/Intel/Xerox Ethernet specification included a 16-bit type field to indicate what upper layer protocol should be used.

When constructing standards for LANs, the IEEE added a new header, the [802.2](http://standards.ieee.org/getieee802/802.2.html) LLC header, to packets in those LANs. It contained a destination "service access point", source "service access point", and packet type field, similar to the packet type field used in HDLC and HDLC-derived protocols such as X.25's LAPB; the destination service access point indicated the service to which the packet should be delivered, where a "service" is implemented as a protocol. (XXX - is the notion of service and protocol formalized in the OSI reference model? If so, we should perhaps have a page for the OSI model and describe that notion, and link to it.) I.e., it indicates the upper layer protocol that should be used.

This meant that the type field in Ethernet could be used for other purposes, if an 802.2 header appeared at the beginning of the user data, so the IEEE standard for Ethernet, IEEE 802.3, included after the source MAC address a 16-bit field indicating the length of the user data in the packet, for the benefit of protocols that couldn't infer the length of the user data from the length of the packet as received.

However, that standard also had to support the traditional use of that field as a type field. Ethernet packets could have no more than 1500 bytes of user data, so the field is interpreted as a length field if it has a value \<= 1500 and a type field if it has a value \> 1500. (According to the October 1988 issue of COURIER (page 8), "if it is less than 600H, the packet is assumed to be an 802.3 packet; if it is greater than 600H, the packet is flagged as an Ethernet packet.")

Therefore, if the type/length field has a value 1500 or lower, it's a length field, and is followed by an 802.2 header, otherwise it's a type field and is followed by the data for the upper layer protocol (XXX - slight duplicate of sentence above?). Note that when the length/type field is used as a length field the length value specified does **not** include the length of any padding bytes (e.g. if a raw ethernet frame was sent with a payload containing a single byte of data the length field would be set to 0x0001 and 45 padding bytes would be appended to the data field to bring the ethernet frame up to the required minimum 64-byte length).

For a more detailed discussion of this, which mentions a *third* possibility used by [NetWare](/NetWare), and mentions the SNAP header that can follow the 802.2 header, see [Ethernet Frame Types: Provan's Definitive Answer](http://www.ee.siue.edu/~bnoble/comp/networks/frametypes.html), by Don Provan.

(XXX - we should mentioned that the 802.2/802.3 terminology used by Netware at that time is simply confusing)

Some examples of values in the type/length field:

  - 0 - 1500 length field (IEEE 802.3 and/or 802.2)
  - 0x0800 IP(v4), Internet Protocol version 4
  - 0x0806 ARP, Address Resolution Protocol
  - 0x8137 IPX, Internet Packet eXchange (Novell)
  - 0x86dd IPv6, Internet Protocol version 6

See [Ethernet numbers](http://www.iana.org/assignments/ethernet-numbers) at the [IANA](/IANA), [Michael A. Patton's list of Ethernet type codes](http://www.cavebear.com/CaveBear/Ethernet/type.html), and [the IEEE's list of public Ethernet type assignments](http://standards.ieee.org/regauth/ethertype/eth.txt) for lists of some assigned Ethernet type codes. You can also search for a particular Ethernet type from [the IEEE EtherType Registration Authority page](http://standards.ieee.org/regauth/ethertype/index.shtml); enter the Ethernet type in hex, without a leading 0x. (Not all assigned Ethernet type codes are reported publicly.)

### Frame Check Sequence (FCS) field

Ethernet uses a [CyclicRedundancyCheck](/CyclicRedundancyCheck) (CRC) algorithm to detect transmission errors. The [FrameCheckSequence](/FrameCheckSequence) field is filled (using a CRC) by the sending host. If the receiving host detects a wrong CRC, it will throw away that packet.

## History

See [Wikipedia](http://en.wikipedia.org/wiki/Ethernet#History) for a brief history of Ethernet

## Protocol dependencies

Ethernet is the lowest software layer, so it only depends on hardware.

## Example traffic

Small portion of the capture from opening wireshark.org in a web browser.

    No.     Time        Source                Destination           Protocol Info
          1 0.000000    192.168.2.3           mail.packet0.com      TCP      1061 > http [SYN] Seq=0 Ack=0 Win=16384 Len=0 MSS=1460
          2 0.063590    mail.packet0.com      192.168.2.3           TCP      http > 1061 [SYN, ACK] Seq=0 Ack=1 Win=5840 Len=0 MSS=1380
          3 0.063665    192.168.2.3           mail.packet0.com      TCP      1061 > http [ACK] Seq=1 Ack=1 Win=16560 Len=0
          4 0.064056    192.168.2.3           mail.packet0.com      HTTP     GET / HTTP/1.1
          5 0.163470    mail.packet0.com      192.168.2.3           TCP      http > 1061 [ACK] Seq=1 Ack=399 Win=6432 Len=0
          6 0.193849    mail.packet0.com      192.168.2.3           HTTP     HTTP/1.1 200 OK (text/html)
          7 0.201317    mail.packet0.com      192.168.2.3           HTTP     Continuation
          8 0.201408    192.168.2.3           mail.packet0.com      TCP      1061 > http [ACK] Seq=399 Ack=2761 Win=16560 Len=0
          9 0.208895    192.168.2.3           mail.packet0.com      TCP      1062 > http [SYN] Seq=0 Ack=0 Win=16384 Len=0 MSS=1460
         10 0.280617    mail.packet0.com      192.168.2.3           HTTP     Continuation
         11 0.287876    mail.packet0.com      192.168.2.3           HTTP     Continuation

## Example capture file

Full capture from above example. Opening www.wireshark.org from the Firefox browser.

[SampleCaptures/wireshark.org.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/wireshark.org.pcap.gz "Upload new attachment \"wireshark.org.pcap.gz\"")

## Wireshark

The Ethernet dissector is fully functional. Registered dissectors in `packet-eth.c`:

  - `eth_withoutfcs`

  - `eth_withfcs`

  - `eth_maybefcs`

## Preference Settings

(XXX add links to preference settings affecting how Ethernet is dissected).

## Display Filter

A complete list of Ethernet display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/e/eth.html)

Some useful filters:

<div>

<table>
<tbody>
<tr class="odd">
<td><p><em>Filter</em></p></td>
<td><p><em>Traffic Description</em></p></td>
</tr>
</tbody>
</table>

</div>

<div>

<table>
<tbody>
<tr class="odd">
<td><p><code>eth </code></p></td>
<td><p>all Ethernet based</p></td>
</tr>
<tr class="even">
<td><p><code>eth.addr==08.00.08.15.ca.fe </code></p></td>
<td><p>to and from Ethernet MAC address 08:00:08:15:ca:fe</p></td>
</tr>
<tr class="odd">
<td><p><code>!(eth.addr==08.00.08.15.ca.fe) </code></p></td>
<td><p>all except to and from Ethernet MAC address 08:00:08:15:ca:fe</p></td>
</tr>
<tr class="even">
<td><p><code>eth.dst==ff:ff:ff:ff:ff:ff </code></p></td>
<td><p>Ethernet <a href="/Broadcast">Broadcast</a> only</p></td>
</tr>
<tr class="odd">
<td><p><code>eth.dst!=ff:ff:ff:ff:ff:ff </code></p></td>
<td><p>all except Ethernet <a href="/Broadcast">Broadcast</a></p></td>
</tr>
<tr class="even">
<td><p><code>(eth.dst[0] &amp; 1) </code></p></td>
<td><p>Ethernet <a href="/Multicast">Multicast</a> only (least significant bit of first address byte set)</p></td>
</tr>
<tr class="odd">
<td><p><code>!(eth.dst[0] &amp; 1) </code></p></td>
<td><p>all except Ethernet <a href="/Multicast">Multicast</a> (least significant bit of first address byte not set)</p></td>
</tr>
</tbody>
</table>

</div>

Note: the Ethernet Broadcast address (ff:ff:ff:ff:ff:ff) is per definition a Multicast one (least significant bit of first address byte set). If you want to see only Multicasts, you have to filter out the Broadcasts as well ` (eth.dst[0] & 1) && eth.dst!=ff:ff:ff:ff:ff:ff `.

## Capture Filter

Capture only the Ethernet-based traffic to and from Ethernet MAC address 08:00:08:15:ca:fe:

``` 
 ether host 08:00:08:15:ca:fe 
```

Ethernet [Multicast](/Multicast) traffic only:

``` 
 ether multicast 
```

Ethernet [Broadcast](/Broadcast) traffic only:

``` 
 ether broadcast 
```

Ethernet traffic to/from a range of addresses:

``` 
 (ether[0:4]>=0x00804400 and ether[0:4]<=0x008044ff) or (ether[6:4]>=0x00804400 and ether[6:4]<=0x008044ff)
```

Information how to capture on an Ethernet network can be found at the [CaptureSetup/Ethernet](/CaptureSetup/Ethernet) page.

## External links

  - A lot of tutorial information about Ethernet can be found at [Charles Spurgeon's Ethernet Web Site](http://www.ethermanage.com/ethernet/ethernet.html)

  - [Xerox Wire Functional Specification](http://bitsavers.org/pdf/xerox/ethernet/XeroxWireDraft_Dec1976.pdf) - *Ethernet version "0"*

  - [The Ethernet - A Local Area Network - Data Link Layer and Physical Layer Specifications](http://ethernethistory.typepad.com/papers/EthernetSpec.pdf) - *Ethernet Version 1 A.K.A. "The Blue Book"*

  - [The Ethernet - A Local Area Network - Data Link Layer and Physical Layer Specifications](http://bitsavers.org/pdf/xerox/ethernet/Ethernet_Rev1.0_Sep1980.pdf) - *Ethernet Version 1 A.K.A. "The Blue Book"*

  - [The Ethernet - A Local Area Network - Data Link Layer and Physical Layer Specifications](http://research.microsoft.com/en-us/um/people/gbell/ethernet_blue_book_1980.pdf) - *Ethernet Version 1 A.K.A. "The Blue Book"*

  - [The Ethernet - A Local Area Network - Data Link Layer and Physical Layer Specifications](http://decnet.ipv7.net/docs/dundas/aa-k759a-tk.pdf) - *Ethernet Version 1 A.K.A. "The Blue Book" (this version's first page shows the blue cover)*

  - [The Ethernet -- A Local Area Network -- Data Link Layer and Physical Layer Specifications, Version 2.0 (Digital, Intel, and Xerox)](http://vt100.net/mirror/antonio/aa-k759b-tk.pdf) - *(33MB PDF\!)*

  - [The Ethernet -- A Local Area Network -- Data Link Layer and Physical Layer Specifications, Version 2.0 (Digital, Intel, and Xerox)](http://bitsavers.org/pdf/xerox/ethernet/Ethernet_Rev2.0_Nov1982.pdf)

  - [The Ethernet -- A Local Area Network -- Data Link Layer and Physical Layer Specifications, Version 2.0 (Digital, Intel, and Xerox)](http://decnet.ipv7.net/docs/dundas/aa-k759b-tk.pdf)

  - [Photo of a good condition copy of "The Ethernet -- A Local Area Network -- Data Link Layer and Physical Layer Specifications, Version 2.0 (Digital, Intel, and Xerox)"](http://www.digibarn.com/collections/manuals/xerox-docs/parc-research-reports/DSC00593.JPG)

  - [48-bit Absolute Internet and Ethernet Host Numbers](http://ethernethistory.typepad.com/papers/HostNumbers.pdf) - *origins of 48 bit addressing*

  - [Ethernet History](http://ethernethistory.typepad.com/) - *a website dedicated to the 30th anniversary of Ethernet, created by Yogan Dalal, one of the early people involved with it (and co-author of the "48-bit Absolute Internet and Ethernet Host Numbers" paper above)*

## Discussion

Maybe we should add dissection of the MAC address and the Multicast and the [LocallyAdministrated](/LocallyAdministrated) bits. Since many clusters implement MAC failover and they create the "new" MAC address for the failover interface as the same MAC address as the primary interface but with the LA bit set to 1, we should also add code to strip this bit off when we try to map it to a OID name.

---

Imported from https://wiki.wireshark.org/Ethernet on 2020-08-11 23:13:51 UTC
