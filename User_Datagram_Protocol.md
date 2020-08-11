# User Datagram Protocol (UDP)

The [UDP](/UDP) layer provides datagram based connectionless transport layer (layer 4) functionality in the [InternetProtocolFamily](/InternetProtocolFamily).

UDP is only a thin layer, and provides not much more than the described UDP port multiplexing.

Just like [IP](/IP), UDP doesn't provide any mechanism to detect [PacketLoss](/PacketLoss), [DuplicatePackets](/DuplicatePackets), and the like.

There are a lot of protocols on top of UDP, including: [BOOTP](/BOOTP), [DNS](/DNS), [NTP](/NTP), [SNMP](/SNMP), ...

### UDP-Lite

Are you looking for Lightweight UDP? Then visit [UDP-Lite](/UDP-Lite).

## History

XXX - add a brief description of UDP history

## Protocol dependencies

  - [IP](/IP): Typically, UDP uses [IP](/IP) as its underlying protocol. The assigned protocol number for UDP on IP is 17.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The UDP dissector is fully functional.

There are two statistical menu items for UDP available: *Statistics/Endpoints* which contains a tab showing all UDP endpoints (combination of IP address and UDP port) and *Statistics/Conversations*, which contains a tab showing all UDP conversations (combination of two endpoints).

## Preference Settings

(XXX add links to preference settings affecting how UDP is dissected).

## Example capture file

XXX - Add a simple example capture file. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of UDP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/u/udp.html)

Show only the UDP based traffic:

``` 
 udp
```

## Capture Filter

Capture only the UDP based traffic:

``` 
 udp
```

## External links

  - [RFC768](http://www.ietf.org/rfc/rfc768.txt) User Datagram Protocol

## Discussion

---

Imported from https://wiki.wireshark.org/User_Datagram_Protocol on 2020-08-11 23:27:09 UTC
