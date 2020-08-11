# Service-Specific Coordination Function for Signaling at the Network Node Interface (SSCF-NNI)

SSCF-NNI is used to transport [MTP3](/MTP3)-b PDUs over [ATM](/ATM) using the service of [SSCOP](/SSCOP).

## History

XXX - add a brief description of SSCF-NNI history

## Protocol dependencies

  - [SSCOP](/SSCOP): SSCF-NNI is carried over SSCOP links.

## Example traffic

XXX - Add example decoded traffic for SSCF-NNI here (as plain text or Wireshark screenshot).

## Wireshark

The SSCF-NNI dissector is fully functional.

## Preference Settings

The SSCF-NNI dissector has no preferences. XXX - Actually it should because the TTC (Japanese) version of SSCF-NNI allows the option to include an additional octet that includes the message priority.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of SSCF-NNI display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/s/sscf-nni.html)

Show only the SSCF-NNI based traffic:

``` 
 sscf-nni 
```

## Capture Filter

You cannot directly filter SSCF-NNI packets while capturing.

## External links

  - SSCF-NNI is specified in ITU [Q.2140](http://www.itu.int/rec/T-REC-Q.2140-199502-I).

## Discussion

---

Imported from https://wiki.wireshark.org/SSCF-NNI on 2020-08-11 23:25:50 UTC
