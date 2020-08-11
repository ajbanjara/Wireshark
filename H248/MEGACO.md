# Media Gateway Control Protocol (MEGACO/H.248.1)

MEGACO/H.248 is used to control Media Gateways in a Multimedia systems. MEGACO can be Text or Binary (ASN.1) encoded. Sometimes it's also referred as GCP (Gateway Control Protocol).

A [MediaGateway](/MediaGateway) (MGw) as its name says is a system used as a Gateway for Media. Current uses are in telephony (Internet, Mobile and Wireline) and Video Broad and [NarrowCasting](/NarrowCasting). A [MediaGateway](/MediaGateway) is usually placed at the edge of two or more different Tranport Mediums (like: ATM (AAL1,AAL2,AAL5), IP, TDM, even two wire PSTN) and its main duty is to convert media (voice/video) between these domains. [MediaGateways](/MediaGateways) are often capable of playing and listening to DTMFs, playing tones (like busy tones), handling voice/video messaging and other similar tasks.

## History

Regardless of the original intention to allow interoperability between systems. It has become an over-standarized protocol so that interoperability between machinery of different vendors (and even between different machines from the SAME vendor) it's almost impossible.

## Protocol dependencies

  - [MTP3](/MTP3): MEGACO can use [MTP3](/MTP3) as its transport protocol; MEGACO is indicated in MTP3 by the service indicator 14.

  - [SCTP](/SCTP): MEGACO can use [SCTP](/SCTP) as its transport protocol; MEGACO is indicated in SCTP by a payload protocol ID of 7.

  - [TCP](/TCP): MEGACO can use [TCP](/TCP) as its transport protocol. The well known TCP port for MEGACO traffic is 2944; if TCP is used, a [TPKT](/TPKT) header must be included.

  - [UDP](/UDP): MEGACO can use [UDP](/UDP) as its transport protocol. The well known UDP port for MEGACO traffic is 2944

  - [SSCOP](/SSCOP): MEGACO can use [SSCOP](/SSCOP) as its transport protocol. There's no standard VP/VC for MEGACO over SSCOP

## Example traffic

H.248 over SCTP [decoded](uploads/__moin_import__/attachments/H248/MEGACO/H.248decoded.gif "decoded") by Ronnie Sahlberg's decoder in the 0.10.9-SVN-13213 build.

## Wireshark

The MEGACO dissector works for TEXT encoding of the protocol if EOL is used as SEParator. Dissection of binary encoding has recently been added (2004-10-25) as a separate dissector, it now handles binary H248 ower M3UA and SCTP.

If TCP is used there may be issues with desegmentation; such traces would be valuable.

## Preference Settings

  - You can change the ports on which MEGACO is dissected for UDP/TCP
  - You can specify whether the raw text of MEGACO packets is to be displayed
  - You can specify whether a detailed dissection of MEGACO packets is to be displayed

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of MEGACO display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/m/megaco.html)

A complete list of H.248 display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/h/h248.html)

Show only the MEGACO based traffic:

``` 
 megaco
```

Show only the H.248 based traffic:

``` 
 h248
```

## Capture Filter

You cannot directly filter MEGACO protocols while capturing. However, if you know the [TCP](/TCP) or [SCTP](/SCTP) port used (see above), you can filter on that one.

## External links

  - [RFC3015](http://www.ietf.org/rfc/rfc3015.txt) *Megaco Protocol Version 1.0*

  - [RFC3525](http://www.ietf.org/rfc/rfc3525.txt) *Gateway Control Protocol Version 1* (MEGACO version 2)

  - [IANA Megaco assignments](http://www.iana.org/assignments/megaco-h248)

  - ITU-T Recs. H.248.1 -\> H.248.59 (the datum is from Sep-2007, you can bet that by the time you read this there'll be many more\!)

  - [ITU-T H.248.1](http://www.itu.int/rec/T-REC-H.248.1-200509-I/) *Gateway control protocol: Version 3*

## Discussion

Given the fact that everyone extends the standard to make its implementation un-interoperable, was the standardization process really necessary???

---

Imported from https://wiki.wireshark.org/H248/MEGACO on 2020-08-11 23:14:36 UTC
