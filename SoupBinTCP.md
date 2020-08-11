# SoupBinTCP (soupbintcp)

SoupBinTCP provides framing, authentication, heartbeats, message sequencing and recovery for a higher-level application protocol. In practice, it's used by NASDAQ's ITCH and [OUCH](/OUCH) protocols.

## History

Originally, SOUP was an ASCII-based protocol, with messages terminated by an EOL character. SoupBinTCP replaces SOUP, and supports framing messages that contain arbitrary byte values.

SoupBinTCP version 3.0 was released to support OUCH-4.0 and ITCH-4.0, the first versions of those protocols that required arbitrary byte contents.

## Protocol dependencies

  - [TCP](/TCP): Typically, SoupBinTCP uses [TCP](/TCP) as its transport protocol. There are no well-known ports or even port ranges for SoupBinTCP: each exchange customer is allocated ports by the exchange.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The SoupBinTCP dissector was added to version 1.10.0

## Example capture file

*TDB*

  - [SampleCaptures/PROTO.pcap](uploads/__moin_import__/attachments/SampleCaptures/PROTO.pcap)

## Display Filter

A complete list of SoupBinTCP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/s/soupbintcp.html)

Show only the SoupBinTCP based traffic:

``` 
 soupbintcp 
```

## Capture Filter

You cannot directly filter SoupBinTCP protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the SoupBinTCP traffic over port (34567):

``` 
 tcp port 34567 
```

## External links

  - [Specification](http://www.nasdaqtrader.com/content/technicalsupport/specifications/dataproducts/soupbintcp.pdf) (at NASDAQ)

## Discussion

---

Imported from https://wiki.wireshark.org/SoupBinTCP on 2020-08-11 23:25:47 UTC
