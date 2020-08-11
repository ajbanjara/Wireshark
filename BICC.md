# Bearer Independent Call Control (BICC)

This Recommendation describes the adaptation of the narrow-band ISDN User Part (ISUP) for the support of narrow-band ISDN services independent of the bearer technology and signalling message transport technology used.

## History

ITU-T Recommendation Q.1901 was prepared by ITU-T Study Group 11 (1997-2000) and approved under the WTSC Resolution 1 procedure on 15 June 2000.

## Protocol dependencies

  - [MTP3](/MTP3): Typically, BICC uses MTP3 as its transport protocol. The service indicator BICC uses is 13.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The BICC dissector is fully functional.

## Preference Settings

(XXX add links to preference settings affecting how BICC is dissected).

## Example capture file

[SampleCaptures/bicc.pcap](uploads/__moin_import__/attachments/SampleCaptures/bicc.pcap)

## Display Filter

A complete list of BICC display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/b/bicc.html)

Show only the BICC based traffic:

``` 
 bicc 
```

## Capture Filter

You cannot directly filter BICC packets while capturing. However, in case BICC runs over SCTP/M3UA/MTP3 you could filter [SCTP](/SCTP) traffic using [IP](/IP) proto 0x84:

``` 
 ip proto 0x84 
```

or, in newer versions of libpcap:

``` 
 ip proto sctp 
```

## External links

  - [ITU-T - International Telecominication Union](http://www.itu.int)

  - [ITU T-REC-Q](http://www.itu.int/rec/recommendation.asp?type=products&lang=e&parent=T-REC-Q)

## Discussion

---

Imported from https://wiki.wireshark.org/BICC on 2020-08-11 23:11:32 UTC
