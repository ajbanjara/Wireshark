# Frame Protocol Hints (FP Hint)

The FP Hint protocol is used to add information required to correctly dissect FP frames (i.e. as transported over the UTRAN interface Iub) to a frame. This include information used by the following protocols:

  - [MAC](/MAC) Medium Access Control

  - [RLC](/RLC) Radio Link Control

  - [FP](/FP) Frame Protocol

## Protocol specification

XXX - TODO provide exact protocol specification

## Protocol dependencies

The FP Hint relies on a mechanism to determine the direction of a frame (for discriminating uplink and downlink packets). For example, the [META](/META) protocol provides this information.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The FP Hint dissector is fully functional.

Currently, only the Iub interface using FDD is supported. The FP release is fixed to release 6, September 2006.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of FP Hint display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/f/fp_hint.html)

Show only the FP Hint based traffic:

``` 
 fp_hint 
```

## Capture Filter

You cannot directly filter FP Hint protocols while capturing.

## Discussion

---

Imported from https://wiki.wireshark.org/FP%20Hint on 2020-08-11 23:14:09 UTC
