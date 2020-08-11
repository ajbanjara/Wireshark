# Internetwork Packet eXchange (IPX)

Member of the [NovellProtocolFamily](/NovellProtocolFamily).

IPX uses a 80 bits address, composed of two parts :

  - Network (32 bits)
  - Node (48 bits)

The node part is the host MAC address, so IPX doesn't use the ARP protocol. As IP, IPX is on the Network layer of OSI model (Layer 3).

## History

IPX has been created by Novell wich implements IDP (developped by Xerox).

Novell decided to drop IPX for IPv6.

## Protocol dependencies

  - [LLC](/LLC): Typically, IPX runs atop IEEE 802.2 [LLC](/LLC) on LANs; it can also be transported atop [PPP](/PPP).

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The IPX dissector is (fully functional, partially functional, not existing, ... whatever the current state is) - XXX don't know.

## Preference Settings

(XXX add links to preference settings affecting how IPX is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of IPX display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/i/ipx.html)

Show only the IPX-based traffic:

``` 
 ipx
```

## Capture Filter

Capture IPX-based traffic only:

``` 
 ipx
```

Older versions of libpcap/WinPcap might not support this; current versions support it.

## External links

IPX Router specification, Chapter 2, "Internetwork Packet Exchange (IPX)" <http://developer.novell.com/devres/langrp/specs.htm> *rpspspec.exe is an executable .zip file, meaning it can be unzipped on non-MS-DOS OSes; the .PRN files are postscript files which can be convered to PDF via the ghostscript ps2pdf utility*

## Discussion

---

Imported from https://wiki.wireshark.org/IPX on 2020-08-11 23:15:17 UTC
