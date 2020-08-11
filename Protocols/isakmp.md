# Internet Security Association and Key Management Protocol (ISAKMP)

The ISAKMP protocol is defined in [RFC 2408](http://tools.ietf.org/html/rfc2408). It is also commonly called Internet Key Exchange (IKE)

This page is very much a stub\! Please help expand it.

## History

XXX - add a brief description of ISAKMP history

## Protocol dependencies

  - [UDP](/UDP): Typically, ISAKMP uses [UDP](/UDP) as its transport protocol. ISAKMP traffic normally goes over UDP port 500, unless [NAT-T](http://en.wikipedia.org/wiki/NAT-T) is used in which case UDP port 4500 is used.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The ISAKMP dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how ISAKMP is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/ISAKMP.pcap](uploads/__moin_import__/attachments/SampleCaptures/ISAKMP.pcap "Upload new attachment \"ISAKMP.pcap\"")

## Display Filter

A complete list of ISAKMP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/i/isakmp.html)

Show only the ISAKMP based traffic:

``` 
 isakmp 
```

## Capture Filter

You cannot directly filter ISAKMP protocols while capturing. However, if you know the [UDP](/UDP) port used (see above), you can filter on that one.

Capture only the ISAKMP traffic over the default port (500):

``` 
 udp port 500 
```

## External links

  - [RFC 2408](http://tools.ietf.org/html/rfc2408) *Internet Security Association and Key Management Protocol (ISAKMP)*.

## Discussion

There are some Vendor IDs missing from the filter implementation. It would be great if someone could add them. Identified so far:

  - 0x12F5F28C457168A9702D9FE274CC0100 - Cisco Unity

  - 0xA46AA082D563C4A5FA7F45E5D10FF095 - *Unknown*

---

Imported from https://wiki.wireshark.org/Protocols/isakmp on 2020-08-11 23:20:23 UTC
