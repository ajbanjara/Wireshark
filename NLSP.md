# NetWare Link Services Protocol (NLSP)

NLSP is part of the [NovellProtocolFamily](/NovellProtocolFamily).

## History

XXX - add a brief description of NLSP history

## Protocol dependencies

  - [IPX](/IPX): Typically, NLSP uses [IPX](/IPX) as its transport protocol.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The NLSP dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how NLSP is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of NLSP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/n/nlsp.html)

Show only the NLSP based traffic:

``` 
 nlsp 
```

## Capture Filter

You cannot directly filter NLSP protocols while capturing.

## External links

NLSP 1.1 specification <http://developer.novell.com/devres/langrp/specs.htm> *nlspspec.exe is an executable .zip file, meaning it can be unzipped on non-MS-DOS OSes; the .PS files are postscript files which can be convered to PDF via the ghostscript ps2pdf utility*

## Discussion

---

Imported from https://wiki.wireshark.org/NLSP on 2020-08-11 23:17:30 UTC
