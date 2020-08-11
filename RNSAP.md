# Radio Network Subsystem Application Protocol IuR-UP User Plane (RNSAP)

## History

RNSAP is specified in [3GPP](/3GPP) TS 25.423

## Protocol dependencies

  - [SCCP](/SCCP): Typically, PROTO uses [SCCP](/SCCP) as its transport protocol. The SSN used for RNSAP is 142.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The PROTO dissector is fully functional.

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

  - add link to PROTO specification and where to find additional info on the web about it, e.g.:

  - [RFC 123](http://www.ietf.org/rfc/rfc123.txt) *The RFC title* - explanation of the RFC content.

## Discussion

---

Imported from https://wiki.wireshark.org/RNSAP on 2020-08-11 23:24:01 UTC
