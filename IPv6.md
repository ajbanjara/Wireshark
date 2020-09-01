# Internet Protocol version 6 (IPv6)

IPv6 is short for "Internet Protocol version 6". IPv6 is the "next generation" protocol designed by the [IETF](http://www.ietf.org) to replace the current version of [Internet\_Protocol](/Internet_Protocol), IP Version 4 or IPv4.

IPv6 was initially designed with a compelling reason in mind: the need for more IP addresses. This need arose from fast Internet growth: billions of new devices (cell phones, PDAs, appliances, cars, etc.), and billions of new users (China, India, Latin America). This, combined with new 'always-on' access technologies such as xDSL, cable, ethernet-to-the-home, were increasing the appetite for new devices and new users.

There may be alternative technical solutions, such as NAT (Network Address Translation), but they won't work so easily to allow this growth. \<\!-- what's this have to do with IPv6?: Furthermore, those alternative solutions make the Internet, the applications, and even the devices more complex; this means increased costs. On the other hand, IPv6 can make, in the medium/long-term, every IP device cheaper, more powerful, and even consume less power (which is important not only for ecologic conservation, but also to have longer battery life in portable devices such as cell phones). --\>

Consequently, the design of IPv6 was an opportunistic way to improve the Internet, with new benefits such as:

  - Expanded addressing capabilities.
  - Server-less autoconfiguration ("plug-n-play") and reconfiguration.
  - More efficient and robust mobility mechanisms.
  - End-to-end security, with built-in, strong IP-layer encryption and authentication.
  - Streamlined header format and flow identification.
  - Enhanced support for multicast and QoS.
  - Extensibility: Improved support for options / extensions.

## History

The History of IPv6 started in 1994-1995 with documents such as: [RFC1719](http://www.ietf.org/rfc/rfc1719.txt) "A Direction for IPng", [RFC1726](http://www.ietf.org/rfc/rfc1726.txt) "Technical Criteria for Choosing IP The Next Generation (IPng)" and [RFC1752](http://www.ietf.org/rfc/rfc1719.txt) RFC1752 "The Recommendation for the IP Next Generation Protocol".

Then the main document was published in December 1995: [RFC1883](http://www.ietf.org/rfc/rfc1883.txt) "Internet Protocol, Version 6 (IPv6) Specification".

Which was obsoleted in December 1998 by: [RFC2460](http://www.ietf.org/rfc/rfc2460.txt)"Internet Protocol, Version 6 (IPv6) Specification".

## Protocol dependencies

  - [Ethernet](/Ethernet): Typically, IPv6 uses [Ethernet](/Ethernet) as its transport protocol.

IPv6 can be transported over a wide variety of other protocols as well.

## Example traffic

    Frame 1: 94 bytes on wire (752 bits), 94 bytes captured (752 bits)
    Ethernet II, Src: 86:93:23:d3:37:8e (86:93:23:d3:37:8e), Dst: 22:1a:95:d6:7a:23 (22:1a:95:d6:7a:23)
        Destination: 22:1a:95:d6:7a:23 (22:1a:95:d6:7a:23)
        Source: 86:93:23:d3:37:8e (86:93:23:d3:37:8e)
        Type: IPv6 (0x86dd)
    Internet Protocol Version 6, Src: fc00:2:0:2::1 (fc00:2:0:2::1), Dst: fc00:2:0:1::1 (fc00:2:0:1::1)
        0110 .... = Version: 6
        .... 0000 0000 .... .... .... .... .... = Traffic class: 0x00 (DSCP: CS0, ECN: Not-ECT)
        .... .... .... 1101 0110 1000 0100 1010 = Flow label: 0xd684a
        Payload length: 40
        Next header: TCP (6)
        Hop limit: 64
        Source: fc00:2:0:2::1 (fc00:2:0:2::1)
        Destination: fc00:2:0:1::1 (fc00:2:0:1::1)
        [Source GeoIP: Unknown]
        [Destination GeoIP: Unknown]
    Transmission Control Protocol, Src Port: 43424, Dst Port: 8080, Seq: 0, Len: 0

## Wireshark

The IPv6 dissector is fully functional. (Add info of additional Wireshark features where appropriate, like special statistics of this protocol.)

## Preference Settings

  - Reassemble fragmented IPv6 datagrams
  - Show IPv6 summary in protocol tree
  - Enable GeoIP lookups
  - Perform strict checking for adherence to the RFC for RPL Source Routing Header
  - Try heuristic sub-dissector fist
  - Display IPv6 extension headers under the root protocol tree
  - Use a single field for IPv6 extension header length

## Example capture file

[Sample IPv6 captures](/SampleCaptures#ipv6-and-tunneling-mechanism)

## Display Filter

A complete list of IPv6 display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/i/ipv6.html)

  - Show only the IPv6 based traffic:
    
    ``` 
     ipv6
    ```

  - Filter for specific IPv6 address(es):
    
    ``` 
     ipv6.addr eq fe80::f61f:c2ff:fe58:7dcb or ipv6.addr eq ff02::1
    ```

## Capture Filter

Capture IPv6 based traffic only:

``` 
 ip6
```

Capture only the IPv6 based traffic to or from host fe80::1:

``` 
 host fe80::1
```

Capture IPv6-over-IPv4 tunneled traffic only:

``` 
 ip proto 41
```

Capture native IPv6 traffic only:

``` 
 ip6 and not ip proto 41
```

## External links

  - [RFC2460](http://www.ietf.org/rfc/rfc2460.txt) *Internet Protocol, Version 6 (IPv6) Specification*

  - [RFC4191](http://www.ietf.org/rfc/rfc4191.txt) *IP Version 6 Addressing Architecture*

  - [IPv6 Web page](http://www.ipv6.org)

  - [The IPv6 Portal](http://www.ipv6tf.org)

## Discussion

The Wireshark web site is available over IPv6 at <http://ipv6.wireshark.org> (IPv6-only). -- *[GeraldCombs](/GeraldCombs)*

---

Imported from https://wiki.wireshark.org/IPv6 on 2020-08-11 23:15:17 UTC
