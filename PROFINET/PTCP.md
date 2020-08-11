# PROFINET Precision Time Control Protocol (PN-PTCP)

XXX - add a brief PN-PTCP description here

## History

XXX - add a brief description of PN-PTCP history

## Protocol dependencies

  - [PROFINET/RT](/PROFINET/RT): PN-PTCP uses [PROFINET/RT](/PROFINET/RT) as its underlying protocol.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The PN-PTCP dissector is fully functional.

## Preference Settings

There are no PN-PTCP specific preference settings.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/PROTO.pcap](uploads/__moin_import__/attachments/SampleCaptures/PROTO.pcap)

## Display Filter

A complete list of PN-PTCP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/p/pn_ptcp.html)

Show only the PN-PTCP based traffic:

``` 
 pn_ptcp 
```

## Capture Filter

You cannot directly filter PN-PTCP protocols while capturing.

## External links

  - add link to PN-PTCP specification and where to find additional info on the web about it, e.g.:

  - [RFC 123](http://www.ietf.org/rfc/rfc123.txt) *The RFC title* - explanation of the RFC content.

## Discussion

---

Imported from https://wiki.wireshark.org/PROFINET/PTCP on 2020-08-11 23:18:25 UTC
