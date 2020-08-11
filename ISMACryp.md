# ISMA Encryption & Authentication (ISMACryp)

An Internet Streaming Media Alliance (ISMA) specification covering "content encryption, message authentication (integrity) services, an RTP payload format and a file format for pre-encrypted content for ISMA 1.0, ISMA 2.0 and more generally any media that can be stored as elementary stream in an ISO media file \[14496-12." The official name of the specification is "ISMA Encryption and Authentication" but it is unofficially (commonly) called "ISMACryp", a term used throughout the specification.

ISMACryp protocol for Wireshark relates only to the content encryption part in terms of header analysis (no decryption of encrypted payloads).

## History

Nov. 2007 - ISMACryp 2.0 published, providing codec agnostic encryption.

Oct. 2006 - ISMACryp 1.1 released, providing support for the encryption of H.264/AVC video and HE-AAC audio for [RTP](/RTP) transport and storage in MPEG-4 files.

## Protocol dependencies

  - [RTP](/RTP): For streaming, ISMACryp uses [RTP](/RTP) as its transport protocol.

  - [SDP](/SDP): ISMACryp uses [SDP](/SDP) to set parameters. This is not currently supported so parameters have to be set manually via preferences.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The ISMACryp dissector is fully functional for analysis of ISMACryp 2.0 & 1.1 [RTP](/RTP) streams. However, no decryption is done, only interpretation of ISMACryp headers / parameters. Currently ISMACryp configuration parameters are set via preferences as support for [SDP](/SDP) (typically provided via [SAP](/SAP)) is not provided.

TODO - enable automatic setup of ISMACryp parameters via [SDP](/SDP),if present. Currently values are set manually via preferences.

## Preference Settings

There are some [ISMACryp\_Preferences](/ISMACryp_Preferences).

## Example capture file

The following capture file contains ISMACryp protected audio and video streams. [SDP](/SDP) information for [RTP](/RTP) and ISMACryp can be found via [SAP](/SAP)/[SDP](/SDP).

  - [SampleCaptures/ISMACryp.pcap](uploads/__moin_import__/attachments/SampleCaptures/ISMACryp.pcap)

## Display Filter

A complete list of ISMACryp display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/protofirstletter/proto.html)

Show only the ISMACryp based traffic:

``` 
 ismacryp 
```

You can isolate different [RTP](/RTP) streams (e.g. audio / video) via [RTP](/RTP) payload type &/or the [UDP](/UDP) port used.

Show only the ISMACryp traffic over [UDP](/UDP) port XXX:

``` 
 ismacryp && udp.port==XXX 
```

Show only the ISMACryp traffic for [RTP](/RTP) dynamic payload type 96:

``` 
 ismacryp && rtp.p_type==96 
```

## Capture Filter

You cannot directly filter ISMACryp protocol while capturing, but you can, for example, filter a given [UDP](/UDP) port YYY:

``` 
 udp port YYY 
```

## External links

  - <http://www.isma.tv> Internet Streaming Media Alliance (ISMA) main page.

  - <http://www.isma.tv/specreq.nsf/SpecRequest> Technical specifications available here upon request, free of charge.

  - <http://en.wikipedia.org/wiki/ISMACryp> Wikipedia entry.

## Discussion

---

Imported from https://wiki.wireshark.org/ISMACryp on 2020-08-11 23:15:24 UTC
