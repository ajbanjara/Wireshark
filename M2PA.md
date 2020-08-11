# MTP2 User Peer-to-Peer Adaptation Layer (M2PA)

M2PA is part of the [SIGTRAN](/SIGTRAN) suite of protocols to transport SS7 over IP. It functionally replaces [MTP2](/MTP2) and below.

It should not be confused with [M2UA](/M2UA) which serves a similar purpose.

## History

XXX - add a brief description of M2PA history

## Protocol dependencies

  - [SCTP](/SCTP): M2PA uses [SCTP](/SCTP) as its transport protocol. The well known SCTP port for M2PA traffic is 3565.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The M2PA dissector is fully functional. It currently states that it decodes only up to Internet Draft-12 but it works just fine with implementations conforming to the RFC version. (If there are really no differences between Draft-12 and the RFC the dissector should be updated to indicate that it supports the RFC version.)

## Preference Settings

The M2PA dissector is able to decode the following versions of the M2PA protocol, based on the dissector's preference setting:

  - Internet-Draft 2
  - Internet-Draft 8
  - Internet-Draft 12 (compatible with RFC?)

## Example capture file

  - [SampleCaptures/japan\_tcap\_over\_m2pa.pcap](uploads/__moin_import__/attachments/SampleCaptures/japan_tcap_over_m2pa.pcap) This capture file contains TCAP over Japan SCCP and MTP3 over (RFC version) M2PA.

## Display Filter

A complete list of PROTO display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/protofirstletter/proto.html)

Show only the PROTO based traffic:

``` 
 m2pa 
```

## Capture Filter

You cannot directly filter for M2PA while capturing. However, if you know the [SCTP](/SCTP) port used (see above), you can filter on that.

Capture only the M2PA traffic over the default port (3565):

``` 
 sctp port 3565 
```

## External links

  - [RFC 4165](http://www.ietf.org/rfc/rfc4165.txt) *MTP2 Peer-to-Peer Adaptation Layer (M2PA)* - This is the RFC that defines M2PA.

## Discussion

---

Imported from https://wiki.wireshark.org/M2PA on 2020-08-11 23:16:22 UTC
