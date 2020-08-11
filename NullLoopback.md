# Null / Loopback (Null)

The "null" protocol is the link-layer protocol used on the loopback device on most BSD operating systems. It is somewhat misnamed, in that the link-layer header isn't "null" in the sense that there isn't any link-layer header; instead, the link-layer header is a 4-byte integer, in the native byte order of the machine on which the traffic is captured, containing an "address family"/"protocol family" value for the protocol running atop the link layer, for example AF\_INET for IPv4 and AF\_INET6 for IPv6. AF\_INET is 2 on all BSD-based operating systems, as it was introduced at the same time the BSD versions with networking were released; however, AF\_INET6, unfortunately, has different values in {NetBSD,OpenBSD,BSD/OS}, {FreeBSD,DragonFlyBSD}, and {Darwin/macOS}, so an IPv6 packet might have a link-layer header with 24, 28, or 30 as the AF\_ value.

The byte order is that of the host on which the packet was captured, so the dissector has to be able to handle both big-endian and little-endian values.

The "loopback" protocol is used by recent versions of OpenBSD; it's the same as the "null" protocol, except that the 4-byte AF\_ value is in network byte order (big-endian) rather than host byte order.

## History

The "null" protocol dates back to the original BPF implementation on BSD.

## Protocol dependencies

The "null" and "loopback" protocols are the lowest software layers, so they only depend on the implementation of the loopback device.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The Null/Loopback dissector is fully functional.

## Preference Settings

(XXX add links to preference settings affecting how Null is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of Null display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/n/null.html)

Show only the Null based traffic:

``` 
 null 
```

## Capture Filter

You cannot directly filter Null/Loopback protocols while capturing. If you are capturing on a loopback device in a BSD system (including macOS), all traffic will use the "null" or "loopback" protocol; if you are capturing on another device, no traffic will be "null" or "loopback" traffic.

## External links

## Discussion

---

Imported from https://wiki.wireshark.org/NullLoopback on 2020-08-11 23:17:36 UTC
