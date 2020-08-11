# OUCH (ouch)

OUCH is an order entry protocol supported by the NASDAQ stock exchange.

## History

OUCH 4.x is a binary protocol, replacing OUCH 3.x and earlier that encoded all fields with printable ASCII values.

## Protocol dependencies

  - [SoupBinTCP](/SoupBinTCP): Typically, OUCH uses [SoupBinTCP](/SoupBinTCP) as its transport protocol. The OUCH dissector registers itself as a heuristic sub-dissector with SoupBinTCP, so once Wireshark is told to decode a TCP session as SoupBinTCP, OUCH should be detected and dissected automatically.

## Example traffic

*TBD*

## Wireshark

The OUCH dissector is awaiting code review <https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8490>.

## Preference Settings

*TBD*

## Example capture file

*TBD*

  - [SampleCaptures/PROTO.pcap](uploads/__moin_import__/attachments/SampleCaptures/PROTO.pcap)

## Display Filter

A complete list of PROTO display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/protofirstletter/proto.html)

Show only the PROTO based traffic:

``` 
 proto 
```

## Capture Filter

You cannot directly filter OUCH protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one, which will show both the [SoupBinTCP](/SoupBinTCP) encapsulation (generally of interest anyway), and the OUCH messages.

## External links

  - [Specification](http://www.nasdaqtrader.com/content/technicalsupport/specifications/TradingProducts/OUCH4.2.pdf) (at NASDAQ)

## Discussion

---

Imported from https://wiki.wireshark.org/OUCH on 2020-08-11 23:17:45 UTC
