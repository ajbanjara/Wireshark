# Generic Attribute Registration Protocol (GARP)

GARP is described in the IEEE 802.1D specification. Protocols that use it are called "GARP applications"; [GVRP](/GVRP) and [GMRP](/GMRP) are GARP applications.

XXX - add a brief GARP description here

## History

XXX - add a brief description of GARP history

## Protocol dependencies

  - [LLC](/LLC): Typically, GARP uses [802.2 LLC](/LLC) as its transport protocol, running on link-layer protocols in the [LanProtocolFamily](/LanProtocolFamily) such as [Ethernet](/Ethernet).

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

There is currently no GARP dissector, just dissectors for GVRP and GMRP.

## Preference Settings

There are no GARP specific preference settings, as there is no GARP dissector.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

There are no GARP display filter fields, as there is no GARP dissector.

## Capture Filter

You cannot directly filter GARP protocols while capturing.

## External links

  - IEEE 802.1D: [IEEE standard for local and metropolitan area networks--Media access control (MAC) Bridges](http://standards.ieee.org/getieee802/download/802.1D-2004.pdf).

## Discussion

---

Imported from https://wiki.wireshark.org/GARP on 2020-08-11 23:14:14 UTC
