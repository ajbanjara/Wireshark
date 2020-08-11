# Inter-Asterisk eXchange v2 (IAX2)

VoIP protocol developed primarily for communication between <http://www.asterisk.org> Asterisk servers.

## History

XXX -

## Protocol dependencies

  - [UDP](/UDP): Typically, IAX2 uses [UDP](/UDP) as its transport protocol. The well known UDP port for IAX2 traffic is 4569.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The IAX2 dissector is fully functional for non-trunked packets. Separate calls are identified and tracked, and provided the start of a call is captured, the payload is passed to subdissectors. Recent versions of wireshark also include logic to calculate how "late" a packet is relative to its timestamp. Trunked packets show only their type (3 - meta packet).

## Preference Settings

There are no configurable preferences for iax2.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/IAX2\_incoming\_call.acp](uploads/__moin_import__/attachments/SampleCaptures/IAX2_incoming_call.acp)

## Display Filter

A complete list of IAX2 display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/i/iax2.html)

## Capture Filter

You cannot directly filter IAX2 protocols while capturing. However, if you know the [UDP](/UDP) port used (see above), you can filter on that one.

Capture only the IAX2 traffic over the default port (4569):

``` 
 udp port 4569 
```

## External links

  - [RFC 5456 - IAX protocol specification](http://tools.ietf.org/html/rfc5456)

  - [voip-info.org wiki page](http://www.voip-info.org/wiki/view/IAX)

  - [IAX vs SIP](http://www.en.voipforo.com/IAX/IAXvsSIP.php)

## Discussion

---

Imported from https://wiki.wireshark.org/IAX2 on 2020-08-11 23:14:55 UTC
