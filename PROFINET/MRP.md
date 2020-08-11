# PROFINET - Media Redundancy Protocol (MRP)

XXX - add a brief MRP description here

## History

XXX - add a brief description of MRP history

## Protocol dependencies

  - [Ethernet](/Ethernet): Typically, MRP uses [Ethernet](/Ethernet) as its transport protocol. The well known Ethernet type for MRP traffic is 0x88e3.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The MRP dissector is fully functional.

## Preference Settings

There are no MRP specific preference settings.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/PROTO.pcap](uploads/__moin_import__/attachments/SampleCaptures/PROTO.pcap)

## Display Filter

A complete list of MRP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/p/pn_mrp.html)

Show only the MRP based traffic:

``` 
 pn_mrp 
```

## Capture Filter

You cannot directly filter MRP protocols while capturing. However, if you know the [Ethernet](/Ethernet) type used (see above), you can filter on that one.

Capture only the MRP traffic over the ethernet type (0x88e3):

``` 
 ether proto 0x88e3 
```

## External links

  - add link to MRP specification and where to find additional info on the web about it, e.g.:

  - [RFC 123](http://www.ietf.org/rfc/rfc123.txt) *The RFC title* - explanation of the RFC content.

## Discussion

---

Imported from https://wiki.wireshark.org/PROFINET/MRP on 2020-08-11 23:18:24 UTC
