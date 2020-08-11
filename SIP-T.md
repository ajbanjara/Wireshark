# Session Initiation Protocol for Telephones (SIP-T)

SIP-T is used to carry ISDN signaling inside of SIP messages (in the body).

## History

## Protocol dependencies

SIP-T is carried in [SIP](/SIP) messages.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

Wireshark can dissect SIP-T traffic. There is no separate SIP-T dissector; it's all done by the SIP ISUP and mixed-multipart dissectors.

## Preference Settings

See [SIP](/SIP) and [ISUP](/ISUP) and mixed-multipart

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of PROTO display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/PROTO/PROTO.html)

Show only the PROTO based traffic:

``` 
 PROTO 
```

## Capture Filter

You cannot directly filter SIP-T protocols while capturing. See [SIP](/SIP) for information on filtering SIP, but note that even if you filter SIP traffic, you can't filter out non-SIP-T traffic.

## External links

  - [RFC3204 MIME media types for ISUP and QSIG Objects](http://www.ietf.org/rfc/rfc3204.txt?number=3204)

  - [More info on Session Initiation Protocol (SIP)](http://blog.eukhost.com/2006/11/13/sip-session-initiation-protocol)

## Discussion

---

Imported from https://wiki.wireshark.org/SIP-T on 2020-08-11 23:24:45 UTC
