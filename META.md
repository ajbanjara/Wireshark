# Metadata Protocol (META)

This protocol uses a variation of the TLV encoding (Tag-Length-Value) to add - basically arbitrary - data to a frame. It is described in full [here](http://userver.ftw.at/~pilz/pcap/PCAP_Metadata_Specification_1.6.pdf).

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The META dissector is fully functional. It forwards frames to the Ethernet, [FP Hint](/FP-Hint), ATM (AAL2 and OAM) and ERF (AAL5) dissectors.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of META display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/m/meta.html)

Show only the META based traffic:

``` 
 meta 
```

## Capture Filter

You cannot directly filter META protocols while capturing.

## External links

  - [META Specification](http://userver.ftw.at/~pilz/pcap/PCAP_Metadata_Specification_1.6.pdf) A full description of the META protocol

## Discussion

---

Imported from https://wiki.wireshark.org/META on 2020-08-11 23:16:40 UTC
