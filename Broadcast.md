# Broadcast

Any packet destined for all stations on a network segment is considered *broadcast* traffic.

Broadcast addresses are usually used by [ARP](/ARP), [DHCP](/DHCP), and other protocols that do some sort of *discovery*.

## Ethernet (and other 802.x networks)

Ethernet has designated the all-ones address (ff:ff:ff:ff:ff:ff) for broadcast traffic; this is used for other 802.x networks as well.

## IPv4

Similarly, the all-ones IP address (255.255.255.255) is broadcast. If the host portion of an IP address is all ones (e.g. if the address is 192.168.0.255 and the netmask is 255.255.255.0), that address is also a broadcast address.

The broadcast IP address in the early days were 0.0.0.0, but was a long time ago, and zeroes are no longer used in the wildcard section of broadcast addresses.

## IPv6

There are no broadcast IPv6 addresses - [RFC 2373](http://www.ietf.org/rfc/rfc2373.txt) states "There are no broadcast addresses in IPv6, their function being superseded by multicast addresses."

## See Also

[Multicast](/Multicast), [Unicast](/Unicast)

## Discussion

---

Imported from https://wiki.wireshark.org/Broadcast on 2020-08-11 23:11:37 UTC
