# Automatic Private IP Addressing (APIPA)

If a network client fails to get an [IP](/IP) address using [DHCP](/DHCP), it can discover an address on its own using APIPA.

To get an IPv4 address, the client will select an address at random in the range 169.254.1.0 to 169.254.254.255 (inclusive), with a netmask of 255.255.0.0. The client will then send an [ARP](/ARP) packet asking for the MAC address that corresponds to the randomly-generated IPv4 address. If any other machine is using that address, the client will generate another random address and try again.

The entire address range 169.254.0.0/16 has been set aside for "link local" addresses (the first and last 256 addresses have been reserved for future use). They should not be manually assigned or assigned using DHCP. See [RFC 3330](http://www.ietf.org/rfc/rfc3330.txt), which describes various special-use IPv4 addresses and address ranges, including the link local range.

In many cases the presence of a "link local" address indicates a loss of network connectivity, or that a [DHCP](/DHCP) server is down.

APIPA is implemented in Windows 98 and later, and is used only if DHCP is activated. It can be disabled by following the directions in Microsoft KB article [244268](http://support.microsoft.com/default.aspx?scid=kb;EN-US;244268).

APIPA is available in classic Mac OS 8.5 through 9 and in macOS.

APIPA is part of [Zeroconf](http://www.zeroconf.org/). See the [Dynamic Configuration of IPv4 Link-Local Addresses](http://files.zeroconf.org/draft-ietf-zeroconf-ipv4-linklocal.txt) Internet-Draft for more information.

The IPv6 specification includes self-assigned link-local addressing.

## Discussion

We need a screenshot / example capture here

---

Imported from https://wiki.wireshark.org/APIPA on 2020-08-11 23:11:15 UTC
