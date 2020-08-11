# Internet Control Message Protocol version 6 (ICMPv6)

See [ICMP](/ICMP) page for ICMP version 4.

ICMPv6 is used by IPv6 nodes to report errors encountered in processing packets, and to perform other internet-layer functions, such as diagnostics (ICMPv6 "ping"). ICMPv6 is an integral part of IPv6, and the base protocol must be fully implemented by every IPv6 node.

## History

XXX - add a brief description of ICMPv6 history

## Protocol dependencies

  - [IPv6](/IPv6): Typically, ICMPv6 uses [IPv6](/IPv6) as its transport protocol.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The ICMPv6 dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how ICMPv6 is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of ICMPv6 display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/i/icmpv6.html)

Show only the ICMPv6 based traffic:

``` 
 icmpv6 
```

## Capture Filter

Capture only the ICMPv6 based traffic:

``` 
 icmp6 
```

## External links

  - See [RFC 4443](http://tools.ietf.org/html/rfc4443) for more details.

## Discussion

---

Imported from https://wiki.wireshark.org/ICMPv6 on 2020-08-11 23:14:58 UTC
