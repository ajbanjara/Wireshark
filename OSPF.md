# Open Shortest Path First (OSPF)

XXX - add a brief OSPF description here

OSPF (open shortest path first) is a dynamic routing protocol. It is an interior gateway protocol (IGP). Routers use it to learn routes automatically, without the need for administrative intervention. Once OSPF is enabled on a router, hello packets are sent out of each participating non-passive interface. These packets form neighborships and adjacencies with other routers on the same subnet. An adjacency has the capability of sending routing information, but a neighborship only sends link-state information used to build a map of links within the network.

Adjacencies are formed between routers that have specific roles within the OSPF topology. There are three roles within an OSPF topology, the designated router (DR), the backup designated router (BDR), and designated other (DROTHER). There is only one DR and one BDR, but there can be any number of DROTHERs. Each DROTHER has two adjacencies. One is between the DR and the other is between the BDR.

The DR and BDR is determined through an election process during the start up of OSPF. The router with the lowest router-id is elected DR, the second highest BDR. Since this election occurs during startup, the router with the highest router-id may be elected as the DR, because the other routers within the OSPF topology ran the election process after the DR and BDR had already been determined. A router only goes through the election process at the initial startup of OSPF.

## History

XXX - add a brief description of OSPF history

## Protocol dependencies

  - [IP](/IP): Typically, OSPF uses [IP](/IP) as its transport protocol. The well known IP protocol type for OSPF traffic is 0x59.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The OSPF dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how OSPF is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of OSPF display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/o/ospf.html)

Show only the OSPF traffic:

``` 
 ospf 
```

## Capture Filter

You cannot directly filter OSPF protocols while capturing. However, if you know the [IP](/IP) protocol type used (see above), you can filter on that one.

Capture OSPF traffic:

``` 
 ip proto ospf 
```

or, if that gets a parse error:

``` 
 ip proto 0x59 
```

## External links

  - [RFC 2328](http://www.ietf.org/rfc/rfc2328.txt) *OSPF Version 2*

  - [RFC 2740](http://www.ietf.org/rfc/rfc2740.txt) *OSPF for IPv6* - describes OSPF version 3

  - add additional I-Ds and other specs

## Discussion

---

Imported from https://wiki.wireshark.org/OSPF on 2020-08-11 23:17:43 UTC
