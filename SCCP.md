# Signalling Connection Control Part (SCCP)

SCCP is part of the SS7/C7 stack.

  - MTP2
  - MTP3
  - user part(ISUP/TUP/SCCP/...)

Different flavors exist:

  - ANSI T1.112.3-1996
  - ITU-T Q.713 7/1996
  - YDN 038-1997 (Chinese ITU variant)

**Note:** Do not confuse Wireshark's SCCP with Cisco's [Skinny](/SKINNY) Call Control Protocol, which is also called SCCP in some circles but called Skinny in Wireshark.

## History

XXX - add a brief description of SCCP history

## Protocol dependencies

  - [MTP3](/MTP3): Typically, SCCP uses [MTP3](/MTP3), or its [SIGTRAN](/SIGTRAN) user adaptation layer, [M3UA](/M3UA), as its transport mechanism.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The SCCP dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how SCCP is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of SCCP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/s/sccp.html)

Show only the SCCP based traffic:

``` 
 sccp 
```

## Capture Filter

You cannot directly filter SCCP protocols while capturing.

## External links

  - add link to SCCP specification and where to find additional info on the web about SCCP

## Discussion

---

Imported from https://wiki.wireshark.org/SCCP on 2020-08-11 23:24:27 UTC
