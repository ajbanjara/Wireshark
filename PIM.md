# Protocol Independent Multicast (PIM)

PIM is a multicast routing protocol that runs over an existing unicast infrastructure. PIM provides for both dense and sparse group membership. It is different from other protocols, since it uses an explicit join model for sparse groups. Joining occurs on a shared tree and can switch to a per-source tree. Where bandwidth is plentiful and group membership is dense, overhead can be reduced by flooding data out all links and later pruning exception cases where there are no group members.

PIM-DM uses the underlying unicast routing information base to flood multicast datagrams to all multicast routers. Prune messages are used to prevent future messages from propagating to routers without group membership information.

PIM-SM uses either the underlying unicast routing information base or a separate multicast-capable routing information base. It builds unidirectional shared trees routed at a Rendezvous Point (RP) per group, and optionally creates shortest-path trees per source.

## History

  - The paper, "[An Architecture for Wide-Area Multicast Routing](http://www.cs.usc.edu/Research/techreports/papers/94-565.ps.Z)", hosted at the [University of Southern California](http://www.usc.edu/), appears to be the original paper introducing PIM.

  - "[Protocol Independent Multicast (PIM): Motivation and Architecture](http://www.cs.usc.edu/Research/techreports/papers/95-608.ps.Z)" is another paper hosted at USC of relevance here.

## Protocol dependencies

  - XXX

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The PIM dissector is partially functional. Many protocol fields are not yet filterable.

## Preference Settings

There are no PIM specific preference settings.

## Example capture file

A sample capture file containing PIM traffic is available on the [SampleCaptures](/SampleCaptures) page.

  - [SampleCaptures/pim-reg.cap](uploads/__moin_import__/attachments/SampleCaptures/pim-reg.cap)

## Display Filter

[display filter reference](http://www.wireshark.org/docs/dfref/p/pim.html) . Show only the PIM based traffic:

``` 
 pim
```

## Capture Filter

To capture all PIM traffic, use the following capture filter:

    (ip proto 103) or ((ip proto 2) and (ip[20] == 0x14))

## External links

  - PIM-DM: [RFC 3973](http://tools.ietf.org/html/rfc3973)

  - PIM-SM: [RFC 4601](http://tools.ietf.org/html/rfc4601)

  - PIMv1 [specification](ftp://ftp.usc.edu/pub/csinfo/tech-reports/papers/95-599.ps.Z) (or as close to one as possible.)

  - Network Sorcery's [PIM page](http://www.networksorcery.com/enp/protocol/pim.htm) has a lot of information and lists most of the relevant PIM RFC's.

## Discussion

The PIM dissector is currently undergoing some changes, primarily to allow many more protocol fields to be filterable. A bugzilla report with the proposed changes will be filed in the near future (hopefully) ...

---

Imported from https://wiki.wireshark.org/PIM on 2020-08-11 23:17:56 UTC
