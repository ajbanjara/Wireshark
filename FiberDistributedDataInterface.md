# Fiber Distributed Data Interface (FDDI)

[ANSI](/ANSI) standardized this link layer technology based on fiber optics (as the name implies).

This technology is obsoleted by [Ethernet](/Ethernet), but still (rarely) used today.

It is specified by [various INCITS specifications](http://www.incits.org/list_INCITS.htm) - look for "Fibre Distributed Data Interface" in that list.

See [Wireshark: Supported Capture Media](http://www.wireshark.org/media.html) page for Wireshark capturing support on various platforms.

See [the Wikipedia article on FDDI](http://en.wikipedia.org/wiki/Fddi) for further technology details.

FDDI sends network packets from the sending host to one ([Unicast](/Unicast)) or more ([Multicast](/Multicast)/[Broadcast](/Broadcast)) receiving hosts.

## History

XXX - add a brief description of FDDI history

## Protocol dependencies

  - FDDI is the lowest software layer, so it only depends on hardware.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The FDDI dissector is party functional; it can dissect the FDDI header, and data packets, but does not, for example, dissect SMT packets.

## Preference Settings

(XXX add links to preference settings affecting how FDDI is dissected).

## Example capture file

XXX - Add a simple example capture file. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of FDDI display filter fields can be found in the [display filter reference for FDDI](http://www.wireshark.org/docs/dfref/f/fddi.html).

Show only the FDDI-based traffic:

``` 
 fddi 
```

Show only the FDDI-based traffic to and from FDDI MAC address 08:00:08:15:ca:fe:

``` 
 fddi.addr==08.00.08.15.ca.fe 
```

## Capture Filter

Capture only the FDDI-based traffic to and from FDDI MAC address 08:00:08:15:ca:fe:

``` 
 fddi host 08:00:08:15:ca:fe 
```

## External links

## Discussion

---

Imported from https://wiki.wireshark.org/FiberDistributedDataInterface on 2020-08-11 23:14:01 UTC
