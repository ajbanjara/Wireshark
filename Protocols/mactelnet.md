# Mikrotik MAC-Telnet (mactelnet)

Mikrotiks MAC-Telnet protocol, used in their RouterOS based products.

## History

The Mac-Telnet protocol is a proprietary protocol used by Mikrotik's RouterOS product. All hardware installed with their RouterOS has the (optional) possibility to accept telnet connections via UDP packets, even without having any IP address set on any interface at all. This way, if enabled, you can still telnet your router, even if you have lost it's IP address, or misconfigured the interface.

## Protocol dependencies

  - [UDP](/UDP): Mactelnet uses [UDP](/UDP) as its transport protocol. The UDP port for normal mactelnet traffic is 20561.

## Wireshark

The mactelnet dissector is fully functional, but may lack some information about all the possible data packet types.

## External links

  - <http://www.omniflux.com/devel/mikrotik/Mikrotik_MAC_Telnet_Procotol.txt> - The Mac Telnet protocol reverse engineered by Omni Flux

  - <http://www.mikrotik.com/> - The homepage of MikroTik

  - <https://github.com/haakonnessjoen/MAC-Telnet/> - Open source implementation of the Mac Telnet protocol

---

Imported from https://wiki.wireshark.org/Protocols/mactelnet on 2020-08-11 23:20:55 UTC
