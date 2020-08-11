# Linux netlink (netlink)

Linux netlink is a communication channel between Linux kernel space and user space. \[To be extended\].

## History

The netlink socket interface appeared in Linux kernel 2.2.

## Protocol dependencies

  - [SLL](/SLL): Netlink uses [a cooked header very similar to SLL](https://www.tcpdump.org/linktypes/LINKTYPE_NETLINK.html), but it has its own DLT now, so with current [LibPcap](/LibPcap) versions does not depend on SLL anymore.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The netlink dissector is fully functional, although not all netlink families are dissected.

## Preference Settings

The netlink dissector has no preference settings.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/PROTO.pcap](uploads/__moin_import__/attachments/SampleCaptures/PROTO.pcap)

## Display Filter

A complete list of netlink display filter fields can be found in the [display filter reference](https://www.wireshark.org/docs/dfref/n/netlink.html)

Show only the netlink based traffic:

``` 
 netlink 
```

## Capture Filter

You cannot directly filter netlink protocols while capturing.

## External links

  - [libnl](https://www.infradead.org/~tgr/libnl/) Netlink Protocol Library Suite.

  - [RFC 3549](https://tools.ietf.org/html/rfc3549) *Linux Netlink as an IP Services Protocol* - The use of netlink for IP Services.

## Discussion

  - This page needs to be extended with
      - how to setup a capture point (\# modprobe nlmon; ip link add type nlmon; ip link set nlmon0 up)
      - what family members there are (rtnetlink, netfilter, generic netlink, ...)
      - what generic netlink family member there are and how to learn them ($ genl-ctrl-list)
      - what net\_dm is for (\#dropwatch -l kas)
      - what taskstats is for (\#iotop)

---

Imported from https://wiki.wireshark.org/Protocols/netlink on 2020-08-11 23:21:25 UTC
