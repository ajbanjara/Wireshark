# Routing Information Protocol (RIP)

The **Routing Information Protocol** (RIP) is one of the most commonly used interior gateway protocol (IGP) routing protocols on internal networks (and to a lesser extent, networks connected to the Internet), which helps routers dynamically adapt to changes of network connections by communicating information about which networks each router can reach and how far away those networks are.

## History

The routing algorithm used in RIP, the Bellman-Ford algorithm, was first deployed in a computer network in 1969, as the initial routing algorithm of the ARPANET.

The earliest version of the specific protocol that became RIP was the *Gateway Information Protocol*, part of Xerox Parc's PARC Universal Packet internetworking protocol suite. A later version, named the *Routing Information Protocol*, was part of Xerox Network Services.

A version of RIP which supported the Internet Protocol (IP) was later included in the Berkeley Software Distribution (BSD) of the Unix operating system as the *routed* daemon, and various other vendors would implement their own implementations of the routing protocol. Eventually RFC 1058 was issued to unify the various implementations under a single standard.

## Protocol dependencies

  - [UDP](/UDP): Typically, RIP uses [UDP](/UDP) as its transport protocol. The well known UDP port for RIP traffic is 520.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The RIP dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how RIP is dissected).

## Example capture file

[SampleCaptures/RIP\_v1](uploads/__moin_import__/attachments/SampleCaptures/RIP_v1) Sample file with basic RIP message exchange between two RIP version 1 routers.

## Display Filter

A complete list of RIP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/r/rip.html)

Show only the RIP based traffic:

``` 
 rip 
```

## Capture Filter

You cannot directly filter RIP protocols while capturing. However, if you know the [UDP](/UDP) port used (see above), you can filter on that one.

Capture RIP traffic over the default port (520):

``` 
 udp port 520 
```

## External links

  - [RFC 1058](http://www.ietf.org/rfc/rfc1058.txt) *Routing Information Protocol*

  - [RFD 2453](http://www.ietf.org/rfc/rfc2453.txt) *RIP Version 2*

  - [RFC 2082](http://www.ietf.org/rfc/rfc2082.txt) *RIP-2 MD5 Authentication*

## Discussion

---

Imported from https://wiki.wireshark.org/RIP on 2020-08-11 23:23:57 UTC
