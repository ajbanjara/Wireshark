# X.25

Wireshark currently can't capture raw X.25 packets as there's no support for that in libpcap/WinPcap.

It can, however, dissect X.25 traffic captured by some other network analyzers and X.25 packets transported over [XOT](/XOT) ([RFC 1613](http://tools.ietf.org/rfcmarkup?rfc=1613)).

X.25 was standardized by the [CCITT](/CCITT) and later by the [ITU-T](/ITU-T) and is obsolete right now.

X.25 provides services to deliver data packets (layer 2 and 3 in the OSI model) over serial lines. (XXX - split into LAPB and X.25 Packet Layer Protocol?)

Anyone with more knowledge about X.25 might continue here ...

## History

XXX - add a brief description of X.25 history

## Protocol dependencies

  - The X.25 Packet Layer Protocol is transported atop [LAPB](/LAPB) (Link Access Protocol-B), or atop [XOT](/XOT) (X.25-over-TCP).

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The X.25 dissector is fully functional.

## Preference Settings

  - If CALL REQUEST not seen or didn't specify protocol, dissect as QLLC/SNA. Default: FALSE
  - If CALL REQUEST has no data, assume the protocol handled is COTP. Default: FALSE
  - If CALL REQUEST not seen or didn't specify protocol, check user data before checking heuristic dissectors. Default: FALSE
  - Reassemble fragmented X.25 packets. Default: TRUE

## Example capture file

XXX - Add a simple example capture file. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of X.25 display filter fields can be found in the [display filter reference for X.25](http://www.wireshark.org/docs/dfref/x/x.25.html).

Show only the X.25-based traffic:

``` 
 x.25 
```

## Capture Filter

As Wireshark doesn't support capturing X.25 traffic, there are no capture filters for it.

## External links

  - [ITU-T Recommendation X.25](http://www.itu.int/rec/T-REC-X.25-199610-I)

  - [X.25 Networking Guide](http://www.farsite.co.uk/X.25/X.25_info/X.25.htm) Far`  `Site Communications Ltd. X.25 info page

  - [X.25](http://www.cisco.com/univercd/cc/td/doc/cisintwk/ito_doc/x25.htm) chapter from Cisco's *Internetworking Technology Handbook*

  - [X.25](http://en.wikipedia.org/wiki/X.25) at Wikipedia.org

  - [RFC 1613](http://tools.ietf.org/rfcmarkup?rfc=1613) X.25-over-TCP

## Discussion

---

Imported from https://wiki.wireshark.org/X.25 on 2020-08-11 23:27:45 UTC
