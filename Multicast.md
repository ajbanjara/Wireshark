# Multicast

*Multicast* allows a single network packet to be delivered to a group of receivers.

Any Ethernet, or other 802.x, address with a high-order bit set to 1 (that is, if its first octet is odd) is multicast, except for the [Broadcast](/Broadcast) address (which is all ones).

IP addresses in the range 224.0.0.0 to 239.255.255.255 (224/4) have been reserved for multicast. [Specific addresses](http://www.iana.org/assignments/multicast-addresses) have been reserved by IANA for different multicast applications.

## Mapping IPv4 Multicast Addresses to Ethernet

In order for multicast to work properly in IP-over-Ethernet, each IP multicast address must be mapped to a corresponding Ethernet multicast address. The IANA owns an [Ethernet](/Ethernet) OUI (01:00:5e), half of which has been reserved for this purpose. There's a slight problem, however — the address space for IP multicast addresses (28 bits) is bigger than the range of addresses reserved in the Ethernet OUI (23 bits).

To get around this, only the lower 23 bits of each IP multicast address are used for the mapping.

## See Also

[Broadcast](/Broadcast), [Unicast](/Unicast)

[www.tcpipguide.com](http://www.tcpipguide.com/free/t_IPv6MulticastandAnycastAddressing.htm) Information on IPv6 Multicasting.

---

Imported from https://wiki.wireshark.org/Multicast on 2020-08-11 23:17:02 UTC
