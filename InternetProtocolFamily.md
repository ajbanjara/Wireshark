# Internet (TCP/IP) protocol family

The TCP/IP family of protocols is widely used today.

Specifications of all of these protocols can be found in the [RFC](/RFC) documents.

A simplified overview of the core TCP/IP protocols could look like this:

|     |                                                 |
|  -  |  ---------------------------------------------  |
| 5-7 | Application layer (**HTTP**, **FTP**, ...)      |
| 4   | **TCP** (connections) / **UDP** (connectionless) |
| 3   | Internet (**IP**, **ICMP**)                     |
| 2   | Link layer (**ARP**, **PPP**, Ethernet, ...)    |

## Protocols

The TCP/IP family consists of (at least) the following protocols:

Link layer:

  - [ARP](/AddressResolutionProtocol): Address Resolution Protocol: Map [IP](/Internet_Protocol) to hardware (e.g. [Ethernet](/Ethernet)) addresses

  - [RARP](/RARP): Reverse ARP: Map hardware (e.g. [Ethernet](/Ethernet)) to [IP](/Internet_Protocol) addresses

Link layer (serial line):

  - CSLIP: Compressed Serial Line IP: Compressing [TCP](/TCP)/[IP](/Internet_Protocol) Headers for Low-Speed Serial Links [RFC 1144](https://tools.ietf.org/html/rfc1144), obsolete

  - [PPP](/PPP): The Point-to-Point Protocol

  - PPP-MP: The Point-to-Point Multilink Protocol

  - SLIP: Serial Line IP: Transmission of [IP](/Internet_Protocol) datagrams over serial lines [RFC 1055](https://tools.ietf.org/html/rfc1055), obsolete

Network layer:

  - [IP](/Internet_Protocol): Internet Protocol (version 4): transfer IP packets from one host to another. One of the most common protocols today. This is what the Internet is built around.

  - [IPv6](/IPv6): Internet Protocol (version 6): transfer IP packets from one host to another

  - [ICMP](/Internet_Control_Message_Protocol): Internet Control Message Protocol (version 4): This is a protocol to report common errors and events in the [IP](/Internet_Protocol), [TCP](/TCP) and [UDP](/UDP) protocols.

  - [ICMPv6](/ICMPv6): Internet Control Message Protocol (version 6): This is a protocol to report common errors and events in the [IPv6](/IPv6), [TCP](/TCP) and [UDP](/UDP) protocols.

  - [IGMP](/IGMP): IP multicasting

Network layer (routing):

  - [BGP](/BGP): Border Gateway Protocol

  - EGP: Exterior Gateway Protocol

  - GGP: Gateway to Gateway Protocol

  - IGRP: Interior Gateway Routing Protocol

  - ND: Neighbor Discovery

  - [OSPF](/OSPF): Open Shortest Path First

  - [RIP](/RIP): Routing Information Protocol

  - [RIPng](/RIPng): Routing Information Protocol next generation

  - [DSR](/DSR): Dynamic Source Routing (Ad-hoc protocol)

Network Layer ([IPsec](/IPsec) Internet Protocol Security):

  - [AH](/AH): Authentication Header

  - [ESP](/ESP): Encapsulating Security Payload

Transport layer:

  - These protocols run atop [IP](/Internet_Protocol):

  - [DCCP](/DCCP): Datagram Congestion Control Protocol: stream based, reliable, connection oriented transfer of data

  - [SCTP](/SCTP): datagram (packet) based, reliable, connection oriented transfer of data

  - [UDP](/UDP): User Datagram Protocol: datagram (packet) based, unreliable, connectionless transfer of data

  - [UDP-Lite](/Lightweight_User_Datagram_Protocol): Lightweight User Datagram Protocol: datagram (packet) based, unreliable, connectionless transfer of data

  - [TCP](/TCP): Transmission Control Protocol: stream based, reliable, connection oriented transfer of data

  - [PortReference](/PortReference): [TCP](/TCP)/[UDP](/UDP) port numbers 

These protocols run atop [UDP](/UDP), and provide additional transport-layer services:

  - [RTP](/RTP): datagram (packet) based, unreliable, connection oriented transfer of time sensitive data

  - [RTCP](/RTCP): RTP's control protocol

Session layer:

  - [NetBIOS](/NetBIOS): an API and several protocols providing various networking services.

  - [NetDump](/NetDump): a simple protocol for capturing crashed operating system memory cores over a network

  - [ONC-RPC](/ONC-RPC): Remote procedure calls using Sun's [RPC](/RPC) mechanism

  - [DCE/RPC](/DCE/RPC): Remote procedure calls using the OSF's [RPC](/RPC) mechanism

  - [HTTP](/Hyper_Text_Transfer_Protocol): Hyper Text Transfer Protocol: (and other files as well). Probably the best known protocol as it is used to allow users surfing on the Internet.

  - [SMTP](/SMTP): Simple Mail Transfer Protocol: send mails to a mail server

Presentation layer:

  - MIME: content encoding (for [HTTP](/Hyper_Text_Transfer_Protocol), [SMTP](/SMTP), ...) (RFC 2045-2049)

Application layer:

  - [ANCP](/ANCP): Access Node Control Protocol: TCP based L2 control protocol used in service provider DSL and PON Networks.

  - [BOOTP](/BOOTP): BOOT Protocol: antecessor of [DHCP](/DHCP), see below

  - [DHCP](/DHCP): Dynamic Host Configuration Protocol: distribute [IP](/Internet_Protocol), Gateway and [DNS](/DNS) server addresses and alike

  - [DNS](/DNS): Domain Name System: translate human readable addresses (e.g. wiki.wireshark.org) into [IP](/IP) addresses

  - [FTP](/FTP): File Transfer Protocol: file transfer (unsecure)

  - [IMAP](/IMAP): retrieve mails from a mail server

  - [iWARP-DDP](/iWARP-DDP): Direct Data Placement (part of the iWARP protocol stack)

  - [iWARP-MPA](/iWARP-MPA): Marker PDU Aligned Framing: adaptation layer between TCP and DDP (part of the iWARP protocol stack)

  - [iWARP-RDMAP](/iWARP-RDMAP): Remote Direct Memory Access Protocol (part of the iWARP protocol stack)

  - [NNTP](/NNTP): Network News Transfer Protocol: news transfer

  - [NTP](/NTP): Network Time Protocol: sychronize time between hosts

  - [PANA](/PANA): Protocol for Carrying Authentication for Network Access: user authentication for network access

  - [POP](/POP): Post Office Protocol: receive mails from a mail server

  - [RADIUS](/RADIUS): remote user authentication and accounting

  - [RLogin](/RLogin): remote login: remote shell access (unsecure)

  - RSH: Remote SHell: remote shell access (unsecure)

  - [RSIP](/RSIP): Realm Specific IP (RFC 3102-3104)

  - [SSH](/SSH): Secure SHell: encrypted remote shell access

  - [SNMP](/SNMP): Simple Network Management Protocol: network management (RFC 1157,1901-10,2271-75)

  - [Telnet](/Telnet): remote shell access (unsecure) (RFC 854,855,1700)

  - [TFTP](/TFTP): Trivial File Transfer

  - [SASP](/SASP): Server/Application State Protocol (RFC 4678)

Unsorted:

  - URN: Uniform Resource Names ([RFC 1737](https://tools.ietf.org/html/rfc1737))

  - URL: Uniform Resource Locators ([RFC 1738](https://tools.ietf.org/html/rfc1738))

## History

XXX - add a brief description of TCP/IP history?

## Readings

  - "Internetworking With TCP/IP Volume 1: Principles Protocols, and Architecture" from Douglas Comer (5th edition, 2006. ISBN 0-13-187671-6)
  - "TCP/IP Illustrated, Volume 1: The Protocols" from W. Richard Stevens (Addison-Wesley, 1994, ISBN 0-201-63346-9.)

## External links

  - <http://www.tcpipguide.com> "The TCP/IP Guide" from Charles M. Kozierok, printed book (1600 pages\!), also available for online reading

## Discussion

  - contrary to common belief: HTTP is not an application protocol, is a session (L5) protocol, uses MIME for presentation (L6), and, the application (L7) in this case is a wiki\! (another example is HTTP/XML/SOAP). (On the other hand, if you click on a download link, you're using HTTP for file transfer, so, in that case, it's an application-layer protocol. Protocols can't necessarily always be assigned to one and only one layer of the 7-layer model. -*Guy Harris*)

  - Does DCE/RPC and/or ONC/RPC really belong to the Internet Protocol Family? I wouldn't search at least DCE/RPC here. - *Ulf Lamping* ONC RPC was, at least at one time, supported on the OSI transport protocols as well (Connectathon included ONC RPC-over-OSI testing), so if this page is to hold protocols that *only* run atop Internet transport protocols, neither of them would belong here. There are a *lot* of protocols that run directly or indirectly atop the Internet transport protocols, so the question is which of them should be listed here? -*Guy Harris* Difficult, but we shouldn't put all protocols at this page which runs on top of IP/TCP/UDP, that would just be too much. I would think of this family as the protocols "when I hear the abbreviation, I would immediately think of looking at the RFC's" - simply speaking. But that will be a step-by-step decision. For the DCE/RPC I would think of a whole new family, namely the protocol itself plus all the interfaces "MS protocols" using it. Don't know ONC RPC well enough if it's the case there too. - *[UlfLamping](/UlfLamping)*

---

Imported from https://wiki.wireshark.org/InternetProtocolFamily on 2020-08-11 23:15:07 UTC
