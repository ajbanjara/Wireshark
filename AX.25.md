# Amateur Radio X.25 (AX.25)

I can not really do better than the introduction on [the AX.25 article on Wikipedia](http://en.wikipedia.org/wiki/AX.25)

## History

Again I can not really do better than the introduction on [the AX.25 article on Wikipedia](http://en.wikipedia.org/wiki/AX.25)

First included in version 1.10.0

## Protocol dependencies

I think the answer here is none as AX.25 can be found encapsulated in IP, UDP, TCP, KISS, 6PACK as well as in the more usual HDLC when "on air".

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The AX.25 dissector is fully functional. However not all of the protocols for which there are PID's (Packet Identifiers) defined have dissectors.

PID's are defined for:

  - \!ARP - implemented (WS 1.10.0)

  - AppleTalk - not currently implemented

  - AppleTalk ARP - not currently implemented

  - \!Flexnet - implemented (WS 1.10.0)

  - \!IP - calls IP dissector (WS 1.10.0)

  - \!L3 esc - not currently implemented

  - \!Link Quality protocol - not currently implemented

  - NetRom - implemented (WS 1.10.0)

  - \!No L3 - implemented (WS 1.10.0)

  - \!RFC1144 (compressed) - not currently implemented

  - \!RFC1144 (uncompressed) - not currently implemented

  - \!Rose - calls X.25 dissector (WS 1.10.0)

  - \!Segment - not currently implemented

  - \!Texnet - not currently implemented

Protocols marked as "not currently implemented" will be shown as a hex dump

## Preference Settings

For the "No L3" PID there are DX cluster and APRS dissectors selectable in the Preferences menu.

## Example capture file

XXX - \* [SampleCaptures/ax25.pcap](uploads/__moin_import__/attachments/SampleCaptures/ax25.pcap "Upload new attachment \"ax25.pcap\"")

## Display Filter

A complete list of AX.25 display filter fields can be found in the [display filter reference](https://www.wireshark.org/docs/dfref/a/ax25.html)

Show only the AX.25 based traffic:

``` 
 ax25 
```

## Capture Filter

Currently none.

## External links

  - <https://www.tapr.org/pub_ax25.html>

  - <http://www.ax25.net/AX25.2.2-Jul%2098-2.pdf>

## Discussion

---

Imported from https://wiki.wireshark.org/AX.25 on 2020-08-11 23:11:27 UTC
