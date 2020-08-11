# B-ISDN SAAL Service-Specific Connection-Oriented Protocol (SSCOP)

XXX - add a brief SSCOP description here

## History

SSCOP is specified in [ITU-T](/ITU-T) [Q.2110.](http://www.itu.int/rec/T-REC-Q.2110-199407-I/en)

## Protocol dependencies

  - [ATM](/ATM) - SSCOP is carried on ATM AAL5 links

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The SSCOP dissector is fully functional.

## Preference Settings

Wireshark's SSCOP dissector has a preference to tell it what kind of payload is carried. Choices include:

1.  Data (no further dissection is done)

2.  Q.2931

3.  [SSCF-NNI](/SSCF-NNI) for [MTP3](/MTP3)-b support

4.  [ALCAP](/ALCAP)

5.  [NBAP](/NBAP)

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of SSCOP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/s/sscop.html)

Show only the SSCOP based traffic:

``` 
 sscop 
```

## Capture Filter

You cannot directly filter for SSCOP while capturing.

## External links

  - The protocol specification is avalable at [ITU Q.2110.](http://www.itu.int/rec/T-REC-Q.2110-199407-I/en)

## Discussion

---

Imported from https://wiki.wireshark.org/SSCOP on 2020-08-11 23:25:51 UTC
