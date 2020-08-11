# Logical Link Control (LLC, IEEE 802.2)

XXX - add a brief LLC description here

## History

XXX - add a brief description of LLC history

## Protocol dependencies

LLC can use a number of LAN (and MAN/WAN?) protocols as its transport protocol:

  - [Ethernet](/Ethernet): LLC can be used for packets on [Ethernet](/Ethernet) networks, although many protocols don't use it when running atop Ethernet.

  - [IEEE\_802.11](/IEEE_802.11): LLC is used for data packets on [IEEE\_802.11](/IEEE_802.11) networks.

  - [FDDI](/FDDI): LLC is used for data packets on [FDDI](/FDDI) networks.

  - [TokenRing](/TokenRing): LLC is used for data packets on [TokenRing](/TokenRing) networks.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The LLC dissector is fully functional.

## Preference Settings

(XXX add links to preference settings affecting how LLC is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of LLC display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/l/llc.html)

Show only the LLC based traffic:

``` 
 llc 
```

## Capture Filter

The way you capture only LLC-based protocols depends on the link-layer type of the network on which you're capturing.

XXX: Ethernet - look for packets with a length field, and maybe worry about IPX-over-raw-802.3; Token Ring, FDDI, and 802.11, check for data packets.

## External links

  - [IEEE 802.2 specification](http://standards.ieee.org/getieee802/802.2.html)

  - [IEEE 802.2 LLC](http://ckp.made-it.com/ieee8022.html)

## Discussion

---

Imported from https://wiki.wireshark.org/LLC on 2020-08-11 23:16:01 UTC
