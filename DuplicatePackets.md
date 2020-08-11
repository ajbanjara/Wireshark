# Duplicate Packets

Duplicate packets are an often observed network behaviour.

A packet is duplicated somewhere on the network and received twice at the receiving host. It is very often not desireable to get these duplicates, as the receiving application might think that's "fresh" data (which it isn't).

If a sending host thinks a packet is not transmitted correctly because of a [PacketLoss](/PacketLoss), it might [Retransmit](/Retransmit) that packet. The receiving host might already got the first packet, and will receive a second one, which is a duplicated packet.

[ConnectionOrientedProtocols](/ConnectionOrientedProtocols) such as [TCP](/TCP) will detect duplicate packets, and will ignore them completely.

[ConnectionlessProtocols](/ConnectionlessProtocols) such as [UDP](/UDP) won't detect duplicate packets, because there's no information in, for example, the UDP header to identify a packet so that packets can be recognized as duplicates. The data from that packet will be indicated twice (or even more) to the application; it's the responsibility of the application to detect duplicates (perhaps by supplying enough information in *its* headers to do so) and process them appropriately, if necessary.

## Reasons

For most networks, duplicate packets is a typical behaviour, e.g. this will happen if the sending side transmitted a packet correctly, but think it wasn't received at all.

Sometimes, defective hardware/software simply duplicates packets.

## Troubleshooting

If the network is configured correctly, there's not much that can be done against duplicate packets as this is a somewhat "intended" behaviour.

## Discussion

**Q:** Is it possible to turn off the display of duplicate packets? Over 25% of the packets for many of my TCP scans are duplicates. I must decode the traffic of the systems now, before the network engineers have had time to flush out the congestion causes.  
**A:** Try using

``` 
 not tcp.analysis.duplicate_ack and not tcp.analysis.retransmission
```

(or some subset therein) as a display filter. - *Gerald Combs*

---

Imported from https://wiki.wireshark.org/DuplicatePackets on 2020-08-11 23:13:40 UTC
