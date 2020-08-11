# Enhanced Interior Gateway Routing Protocol (EIGRP)

XXX - add a brief EIGRP description here

## History

XXX - add a brief description of EIGRP history

## Protocol dependencies

  - [IP](/IP): Typically, EIGRP uses [IP](/IP) as its transport protocol.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The EIGRP dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how EIGRP is dissected).

## Example capture file

  - [SampleCaptures/EIGRP\_Neighbors.cap](uploads/__moin_import__/attachments/SampleCaptures/EIGRP_Neighbors.cap) Two Cisco EIGRP peers forming an adjacency.

  - [SampleCaptures/eigrp-for-ipv6-auth.pcap](uploads/__moin_import__/attachments/SampleCaptures/eigrp-for-ipv6-auth.pcap) Cisco EIGRP packets, including Authentication TLVs

  - [SampleCaptures/eigrp-for-ipv6-stub.pcap](uploads/__moin_import__/attachments/SampleCaptures/eigrp-for-ipv6-stub.pcap) Cisco EIGRP packets, including Stub routing TLVs

  - [SampleCaptures/eigrp-for-ipv6-updates.pcap](uploads/__moin_import__/attachments/SampleCaptures/eigrp-for-ipv6-updates.pcap) Cisco EIGRP packets, including IPv6 internal and external route updates

  - [SampleCaptures/eigrp-ipx.pcap](uploads/__moin_import__/attachments/SampleCaptures/eigrp-ipx.pcap) Cisco EIGRP packets, including IPX internal and external route updates

## Display Filter

A complete list of EIGRP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/e/eigrp.html)

Show only the EIGRP based traffic:

``` 
 eigrp
```

## Capture Filter

You cannot directly filter EIGRP protocols while capturing. However, if you know the [IP](/IP) protocol type used (see above), you can filter on that one.

## External links

  - add link to EIGRP specification and where to find additional info on the web about EIGRP

## Discussion

---

Imported from https://wiki.wireshark.org/EIGRP on 2020-08-11 23:13:44 UTC
