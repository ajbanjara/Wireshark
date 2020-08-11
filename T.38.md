# ITU-T Recommendation T.38 (T.38)

From <http://www.faqs.org/rfcs/rfc3362.html>

ITU-T Recommendation T.38 \[T.38\] describes the technical features necessary to transfer facsimile documents in real-time between two standard Group 3 facsimile terminals over the Internet or other networks using IP protocols. The Recommendation allows the use of either TCP or UDP depending on the service environment.

ITU-T Recommendation T.38 \[T.38\] Annex D describes system level requirements and procedures for internet aware facsimile implementations and internet aware facsimile gateways conforming to ITU-T T.38 to establish calls with other ITU-T T.38 implementations using the procedures defined in IETF [RFC 2543 (SIP)](http://www.ietf.org/rfc/rfc2543.txt) and IETF [RFC 2327 (SDP)](http://www.ietf.org/rfc/rfc2327.txt).

Note that ITU-T T.38 Recommendation T.38 (04/02) \[T.38\] is an aggregation of the original ITU-T Recommendation T.38 (06/98) \[T.38-98\] and all of the subsequent Amendments and Corrigendum including \[T.38D-00\]. While \[T.38\] and \[T.38D-00\] describe SIP procedures per \[SIP-99\], the procedures can also be applied to the revised Session Initiation Protocol specification \[SIP\].

## History

XXX - add a brief description of T.38 history

## Protocol dependencies

  - [TCP](/TCP): Typically, T.38 uses [TCP](/TCP) as its transport protocol. The port number used is determined dynamically (and is exchanged via signaling).

  - [UDP](/UDP): T.38 can also use [UDP](/UDP) as its transport protocol. The port number used is determined dynamically (and is exchanged via signaling).

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The T.38 dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how T.38 is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/PROTO.pcap](uploads/__moin_import__/attachments/SampleCaptures/PROTO.pcap)

## Display Filter

A complete list of T.38 display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/t/t38.html)

Show only the T.38 based traffic:

``` 
 t38 
```

## Capture Filter

You cannot directly filter T.38 protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the T.38 traffic over port 6004:

``` 
 tcp port 6004 
```

## External links

  - [ITU T.38 page](http://www.itu.int/rec/T-REC-T.38/e)

  - [RFC 3362](http://www.ietf.org/rfc/rfc3362.txt) *Real-time Facsimile (T.38) - image/t38 MIME Sub-type Registration*

## Discussion

---

Imported from https://wiki.wireshark.org/T.38 on 2020-08-11 23:26:21 UTC
