# PROFINET - Media Redundancy for RealTime (MRRT)

XXX - add a brief MRRT description here

## History

XXX - add a brief description of MRRT history

## Protocol dependencies

  - [PROFINET/RT](/PROFINET/RT): Typically, MRRT uses [PROFINET/RT](/PROFINET/RT) as its "transport" protocol. The PN/RT frame ID for MRRT traffic is 0xFF60.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The MRRT dissector is fully functional.

## Preference Settings

There are no MRRT specific preference settings.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/PROTO.pcap](uploads/__moin_import__/attachments/SampleCaptures/PROTO.pcap)

## Display Filter

A complete list of MRRT display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/p/pn_mrrt.html)

Show only the MRRT based traffic:

``` 
 pn_mrrt 
```

## Capture Filter

You cannot directly filter MRRT protocols while capturing.

## External links

  - add link to MRRT specification and where to find additional info on the web about it, e.g.:

  - [RFC 123](http://www.ietf.org/rfc/rfc123.txt) *The RFC title* - explanation of the RFC content.

## Discussion

---

Imported from https://wiki.wireshark.org/PROFINET/MRRT on 2020-08-11 23:18:24 UTC
