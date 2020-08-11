# Network Basic Input/Output System (NetBIOS)

NetBIOS is an API providing various networking services.

However, the formerly used Ethernet based networking protocol (often called NetBEUI or NBF for NetBEUI Framing) is/was often called NetBIOS too, leading to a lot of confusion.

NetBIOS traffic can be transported (encapsulated) over several different networking protocols:

  - [Ethernet](/Ethernet): NetBIOS over Ethernet - [/NetBIOS](/NetBIOS/NetBIOS), obsolete

  - [TokenRing](/TokenRing): NetBIOS over Token Ring, obsolete

  - [TCP](/TCP)/[IP](/IP): NetBIOS over TCP/IP - NBT (see below)

  - [IPX](/IPX): NetBIOS over [/IPX](/NetBIOS/IPX), obsolete

  - ...

... you might see a lot of these variants in the wild.

NetBIOS provides several services:

### NetBIOS Name Service

XXX - describe the name service in NetBIOS (the service, rather than the particular protocol) here - it's a service providing name lookup, registration, ...

### NetBIOS Datagram Service

XXX - describe the datagram service in NetBIOS (the service, rather than the particular protocol) here - seems to be rarely used

### NetBIOS Session Service

XXX - describe the session service in NetBIOS (the service, rather than the particular protocol) here - it's a service providing reliable, in-order delivery of packets.

## NetBIOS over TCP/IP (NBT)

The protocols in the NetBIOS over TCP/IP suite implements the NetBIOS services atop TCP and UDP, which is described in [RFC 1001](http://www.ietf.org/rfc/rfc1001.txt) and [RFC 1002](http://www.ietf.org/rfc/rfc1002.txt).

NetBIOS over TCP/IP (also called NBT) seems to slowly supersede all the other NetBIOS variants.

NBT provides three services:

  - NetBIOS Name Service: [/NBNS](/NetBIOS/NBNS) on UDP (or TCP) port 137 (similar to [DNS](/DNS) and also known as WINS on Windows)

  - NetBIOS Datagram Service: [/NBDS](/NetBIOS/NBDS) on UDP port 138, rarely used

  - NetBIOS Session Service: [/NBSS](/NetBIOS/NBSS) on TCP port 139

## History

XXX - add a brief description of NetBIOS history

## Wireshark

See the various NetBIOS protocols for Wireshark specifics and examples.

## External links

  - [RFC 1001](http://tools.ietf.org/html/rfc1001) *Protocol Standard For a NetBIOS Service on a TCP/UDP Transport: Concepts and Methods*

  - [RFC 1002](http://tools.ietf.org/html/rfc1002) *Protocol Standard For a NetBIOS Service on a TCP/UDP Transport: Detailed Specifications*

  - [NetBIOS](http://en.wikipedia.org/wiki/NetBIOS) on wikipedia.org

  - [NetBIOS, NetBEUI, NBF, SMB, CIFS document page](http://timothydevans.me.uk/n2c.html) a 92 page book from Timothy Evans

  - [NT Network Plumbing: Routers, Proxies, and Web Services Ch. 10: NetBIOS: Friend or Foe?](http://www.windowsitlibrary.com/Content/386/10/1.html) by Tony Northrup

## Discussion

---

Imported from https://wiki.wireshark.org/NetBIOS on 2020-08-11 23:17:11 UTC
