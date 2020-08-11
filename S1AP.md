# S1 Application Protocol (S1AP)

E-UTRAN radio network layer signalling protocol for the S1 interface

## History

## Protocol dependencies

  - [SCTP](/SCTP): Typically, S1AP uses [SCTP](/SCTP) as its transport protocol. The the PPID for S1AP traffic is 18.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The S1AP dissector is automatically generated from ASN1 descriptions by [Asn2wrs](/Asn2wrs) and is fully functional.

## Preference Settings

The SCTP port can be set with a preference.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/PROTO.pcap](uploads/__moin_import__/attachments/SampleCaptures/PROTO.pcap)

## Display Filter

A complete list of PROTO display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/protofirstletter/proto.html)

Show only the S1AP based traffic:

``` 
 s1ap 
```

## Capture Filter

## External links

  - [3GPP TS 36.413](http://www.3gpp.org/ftp/Specs/html-info/36413.htm) *Evolved Universal Terrestrial Radio Access (E-UTRA) ; S1 Application Protocol (S1AP)*

## Discussion

---

Imported from https://wiki.wireshark.org/S1AP on 2020-08-11 23:24:16 UTC
