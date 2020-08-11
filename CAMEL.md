# Customised Applications for Mobile network Enhanced Logic (CAMEL)

CAMEL is based on a sub-set of the ETSI Core INAP CS-2 as specified by EN 301 140-1

## History

## Protocol dependencies

  - [TCAP](/TCAP)/[SCCP](/SCCP): Typically, CAMEL uses [TCAP](/TCAP)/[SCCP](/SCCP) as its transport protocol. The ssn used to dissect CAMEL is configurable.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The CAME dissector is fully functional.

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

Imported from https://wiki.wireshark.org/CAMEL on 2020-08-11 23:11:46 UTC
