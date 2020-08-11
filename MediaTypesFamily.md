# Media Types Family

This page presents media types for which Wireshark provides dissection.

## Media Type aware Protocols

The media dissectors depend upon media-type aware protocols, like:

  - [HTTP](/HTTP): WWW

  - [JXTA](/JXTA): JXTA Peer-to-Peer

  - [RTSP](/RTSP): Real Time Streaming Protocol (RFC 2326)

  - [SIP](/SIP): Voice over IP telephony

  - [SMTP](/SMTP): e-mail

  - [WSP](/WSP): WAP

## Wireshark Media Type dissectors

The following media types are dissected:

  - Application/ISUP: [ISUP](/ISUP) Messages sent in the body of [SIP](/SIP) messages, SIP-T.

  - [GIF](/GIF): a common image file format.

  - [JPEG\_JFIF](/JPEG_JFIF): a common image file format.

  - [JXTA](/JXTA): JXTA Binary Message envelopes.

  - [Line\_based\_text](/Line_based_text): generic text.

  - [MIME\_multipart](/MIME_multipart): an encapsulation scheme.

  - [MSN messenger](/MSN-messenger): an instant messaging service.

  - [PNG](/PNG): a common image file format.

  - [SDP](/SDP): Session Description Protocol (RFC 2327)

  - [WBXML](/WBXML): a compact binary encoding of certain XML content, used in the [WapProtocolFamily](/WapProtocolFamily).

## Example capture file

See the protocols and Media Types pages for example capture files.

## External Links

  - [IANA media types](http://www.iana.org/assignments/media-types/index.html) the IANA list of MIME types

  - [RFC2045](http://www.rfc-editor.org/rfc/rfc2045.txt) *Multipurpose Internet Mail Extensions (MIME) Part One: Format of Internet Message Bodies*

  - [RFC2046](http://www.rfc-editor.org/rfc/rfc2046.txt) *Multipurpose Internet Mail Extensions (MIME) Part Two: Media Types*

  - [RFC2047](http://www.rfc-editor.org/rfc/rfc2047.txt) *MIME (Multipurpose Internet Mail Extensions) Part Three: Message Header Extensions for Non-ASCII Text*

  - [RFC2048](http://www.rfc-editor.org/rfc/rfc2048.txt) *Multipurpose Internet Mail Extensions (MIME) Part Four: Registration Procedures*

  - [RFC2049](http://www.rfc-editor.org/rfc/rfc2049.txt) *Multipurpose Internet Mail Extensions (MIME) Part Five: Conformance Criteria and Examples*

## Discussion

  - I didn't add any of the PKIX MIME types because I'm not sure they are real MIME types.

  - The WAP types set is incomplete.

  - The text type should probably broken up to discuss dissection of plain text, html & xml

---

Imported from https://wiki.wireshark.org/MediaTypesFamily on 2020-08-11 23:16:38 UTC
