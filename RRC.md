# Radio Resource Control RRC

## History

Radio Resource Control protocol for the UE-UTRAN radio interface

## Protocol dependencies

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The RRC dissector is partially functional. Currently there is no links into the main dissector due to lack of traces with RRC however the dissector should be able to dissect the whole protocol.

## Preference Settings

(XXX add links to preference settings affecting how PROTO is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/PROTO.pcap](uploads/__moin_import__/attachments/SampleCaptures/PROTO.pcap)

## Display Filter

A complete list of PROTO display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/protofirstletter/proto.html)

Show only the PROTO based traffic:

``` 
 proto 
```

## Capture Filter

You cannot directly filter PROTO protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the PROTO traffic over the default port (80):

``` 
 tcp port 80 
```

## External links

  - [3G TS 25.331](http://www.3gpp.org/ftp/Specs/html-info/25331.htm) *Universal Mobile Telecommunications System (UMTS); Radio Resource Control (RRC)* - Protocol description including ASN1 spec.

## Discussion

---

Imported from https://wiki.wireshark.org/RRC on 2020-08-11 23:24:07 UTC
