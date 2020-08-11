# Packet Loss

Unfortunately not all networks are perfect. This is especially true for the [RealWorld](/RealWorld), and that means that sometimes packets sent by the network will never arrive at the proper destination. Even worse, sometimes packets will be reordered by the network, or even duplicated by the network.

This is no biggie for network protocols however since it is all based on "Duh, the network is supposed to be lossy. Deal with it or suffer".

In some situations when Packet Loss occurs there can be a significant performance degradation and thus it might be interesting to us to try to minimize the amount of packetloss occuring. (Which is easy once one has figured out WHY the packets are being lost, and where they are lost) ((The art of determining this information is often seen as [BlackMagic](/BlackMagic)))

[ConnectionOrientedProtocols](/ConnectionOrientedProtocols) such as [TCP](/TCP) will detect a packet loss, and try to [Retransmit](/Retransmit) the packet data.

[ConnectionlessProtocols](/ConnectionlessProtocols) such as [UDP](/UDP) won't detect a packet loss, the data in that packet will simply be lost. (UDP includes no acknowledgment information, so PacketLoss can't be detected by UDP implementations, and UDP implementations won't [Retransmit](/Retransmit) the packet. Protocols above UDP would be the ones whose implementations detect packet loss and retransmit packets.)

## Reasons

For most networks, packet loss is a typical behaviour, e.g. this will happen if a [Router](/Router) is receiving more data than it can transmit.

Sometimes, defective hardware/software simply "forgets" packets.

## Troubleshooting

If the network is configured correctly, there's not much that can be done against packet loss as this is a somewhat "intended" behaviour.

For TCP based protocols this is often reasonably easy to detect and analysis of [PacketLossPattern](/PacketLossPattern)s can often give a hint of what is causing the problem. Common reasons are [DuplexMismatch](/DuplexMismatch)es or [Congestion](/Congestion).

Great resources on [Congestion](/Congestion) can be found by googling for Sally Floyd.

---

Imported from https://wiki.wireshark.org/PacketLoss on 2020-08-11 23:17:46 UTC
