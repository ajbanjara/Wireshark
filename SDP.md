# Session Description Protocol (SDP)

SDP is intended for describing multimedia sessions for the purposes of session announcement, session invitation, and other forms of multimedia session initiation.

## History

SDP was originally made an RFC in April 1998. A major update was published in June 2006.

## Protocol dependencies

  - SDP is used by other protocols to describe media sessions such as [SIP](/SIP), [MGCP](/MGCP), [RTSP](/RTSP), [BICC](/BICC), [H248/MEGACO](/H248/MEGACO)

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The SDP dissector is fully functional.

## Preference Settings

\*Establish RTP Conversation. Default ON

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of PROTO display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/s/sdp.html)

Show only the SDP based traffic:

``` 
 sdp 
```

## Capture Filter

You cannot directly filter SDP protocols while capturing.

## External links

  - [SDP: Session Description Protocol RFC4566](http://www.ietf.org/rfc/rfc4566.txt?number=4566)

  - [An Offer/Answer Model with the Session Description Protocol (SDP) RFC3264](http://www.ietf.org/rfc/rfc3264.txt?number=3264)

  - [IANA sdp-parameters](http://www.iana.org/assignments/sdp-parameters)

## Discussion

---

Imported from https://wiki.wireshark.org/SDP on 2020-08-11 23:24:30 UTC
