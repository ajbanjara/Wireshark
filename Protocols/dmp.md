# Direct Message Protocol (DMP)

DMP is an MTA to MTA protocol, and is interoperable with STANAG 4406, [S4406](/S4406). This allows the exchange of messages with the strategic domain. This implies that it is also possible to have multi-hop connections using different protocols on different hops. DMP is very bandwidth-efficient. This allows DMP to be used for time-critical messages even when using low-bandwidth channels (e.g. HF radio).

The DMP uses existing bearers (such as IP), and only puts moderate demands on processing power. This allows DMP to be implemented on almost any platform, including hand-helds and laptops.

## History

The Direct Message Protocol is currently being proposed as a supplement to STANAG 4406 Annex E (see [S4406](/S4406)).

## Protocol dependencies

  - [UDP](/UDP): Typically, DMP uses [UDP](/UDP) as its transport protocol. The well known UDP port for DMP traffic is not known.

## Example traffic

![dmp.jpg](uploads/__moin_import__/attachments/Protocols/dmp/dmp.jpg "dmp.jpg")

## Wireshark

The DMP dissector is fully functional.

## Preference Settings

(XXX add links to preference settings affecting how DMP is dissected).

## Example capture file

  - [SampleCaptures/dmp-examples.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/dmp-examples.pcap.gz)

## Display Filter

A complete list of DMP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/d/dmp.html)

Show only the DMP based traffic:

``` 
 dmp
```

## Capture Filter

You cannot directly filter DMP protocols while capturing. However, if you know the [UDP](/UDP) port used (see above), you can filter on that one.

Capture only the DMP traffic over the default port (24209):

``` 
 udp port 24209
```

## External links

  - <http://mmhswg.fkie.fgan.de/archive/mmhswg772.zip> *Direct Messaging Profile – Protocol Description - Version 1.0* - (login required).

## Discussion

---

Imported from https://wiki.wireshark.org/Protocols/dmp on 2020-08-11 23:19:32 UTC
