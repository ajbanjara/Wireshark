# NetBIOS over IPX (NBIPX)

Transport NetBIOS packets over IPX

## History

XXX - add a brief description of NBIPX history

## Protocol dependencies

  - [IPX](/IPX): NBIPX uses [IPX](/IPX) type 20/0x14 packets

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The NBIPX dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how NBIPX is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/PROTO.pcap](uploads/__moin_import__/attachments/SampleCaptures/PROTO.pcap)

## Display Filter

A complete list of NBIPX display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/n/nbipx.html)

Show only the NBIPX traffic:

``` 
 nbipx 
```

## Capture Filter

You cannot filter NBIPX protocols while capturing.

## External links

IPX Router specification, Chapter 5, "IPX Type 20 Propagation Packet" <http://developer.novell.com/devres/langrp/specs.htm> *rpspspec.exe is an executable .zip file, meaning it can be unzipped on non-MS-DOS OSes; the .PRN files are postscript files which can be convered to PDF via the ghostscript ps2pdf utility*

## Discussion

---

Imported from https://wiki.wireshark.org/NBIPX on 2020-08-11 23:17:07 UTC
