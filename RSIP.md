# Realm Specific IP (RSIP)

Realm Specific IP (RSIP) is intended as an alternative to Network Address Translation (NAT) / Network Address Port Translation (NAPT) which maintains the end-to-end integrity of packets.

## History

XXX - add a brief description of RSIP history

## Protocol dependencies

  - [TCP](/TCP): RSIP uses [TCP](/TCP) or [UDP](/UDP) as its transport protocol. The well known TCP/UDP port for RSIP traffic is 4555.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The RSIP dissector currently exists as a enhancement patch.

## Preference Settings

(XXX add links to preference settings affecting how RSIP is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/RSIP.pcap](uploads/__moin_import__/attachments/SampleCaptures/RSIP.pcap "Upload new attachment \"RSIP.pcap\"")

## Display Filter

A complete list of RSIP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/r/proto.html)

Show only the RSIP based traffic:

``` 
 rsip 
```

## Capture Filter

You cannot directly filter RSIP protocols while capturing if they are going to arbitrary ports. However, RSIP trafic normally goes to and from port 4555 [TCP](/TCP)/[UDP](/UDP) so you can filter on that one.

Capture only the RSIP traffic over the default port (4555):

``` 
 port 4555 
```

## External links

  - [RFC 3102](http://www.ietf.org/rfc/rfc3102.txt) *Realm Specific IP: Framework* -- general framework

  - [RFC 3103](http://www.ietf.org/rfc/rfc3103.txt) *Realm Specific IP: Protocol Specification* -- protocol definition

  - [RFC 3104](http://www.ietf.org/rfc/rfc3104.txt) *RSIP Support for End-to-end IPsec* -- mechanims to handle IP Security

## Discussion

---

Imported from https://wiki.wireshark.org/RSIP on 2020-08-11 23:24:08 UTC
