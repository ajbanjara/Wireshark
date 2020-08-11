# Ethernet Automatic Protection Switching (EAPS)

EAPS is a proprietary protocol developed by Extreme Networks to help with the "availability and robustness of Ethernet rings". EAPS was designed specifically to support implementing a fast resilient layer 2 physical loop topology without having to depend on the traditional Spanning Tree based protocols.

XXX - Add more info about what EAPS is here.

## History

Version 1 of EAPS was publically documented in October 2003 as RFC3619. The EAPS Frame format documented within RFC3619 indicates that the EAPS "TLV" starts at offset 0x32 of the frame. But actual EAPS data seen in captures implies that EAPS has evolved and is now encapsulated within EDP (Extreme Discovery Protocol) packets.

## Protocol dependencies

  - [EDP](/EDP): EAPS appears to use [EDP](/EDP) as its transport protocol.

  - [VLAN](/VLAN): EAPS control data is passed on 802.1Q control VLAN.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

EAPS dissection is implemented within the [EDP](/EDP) dissector. Consequently all the EAPS specific fields are accessed as edp.eaps.XXX

## Preference Settings

N/A

## Example capture file

  - [SampleCaptures/edp.eaps.mirror1.trace.gz](uploads/__moin_import__/attachments/SampleCaptures/edp.eaps.mirror1.trace.gz)

  - [SampleCaptures/edp.eaps.mirror2.trace.gz](uploads/__moin_import__/attachments/SampleCaptures/edp.eaps.mirror2.trace.gz)

## Display Filter

A complete list of EAPS display filter fields can be found under the Extreme Discovery Protocol (EDP) in the [display filter reference](http://www.wireshark.org/docs/dfref/e/edp.html)

This following filter will select out just EAPS frames (and exclude other EDP frames):

``` 
 edp.eaps 
```

## Capture Filter

Because EAPS is encapsulated within EDP, one can not specifically capture EAPS frames. But because EAPS packets are contained within EDP packets and these specific EDP packets are sent to the destination MAC address 00.e0.2b.00.00.04 one can specifically capture EAPSv1 frames.

Capture only the EAPS traffic:

``` 
 ether dest 0:e0:2b:0:0:4 
```

## External links

  - add link to EAPS specification and where to find additional info on the web about it, e.g.:

  - [RFC 3619](http://www.ietf.org/rfc/rfc3619.txt) *Extreme Networks Ethernet Automatic Protection Switching (EAPS) Version 1*.

## Discussion

XXX - Add some notes here regarding some observations regarding EAPS.

## Initially Added

Subsequent to the release of Wireshark 0.10.12, support for EDP/EAPS was initially added in August 2005 (starting with SVN 15299).

---

Imported from https://wiki.wireshark.org/EAPS on 2020-08-11 23:13:42 UTC
