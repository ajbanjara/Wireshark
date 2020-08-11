# Domain Name System (DNS)

DNS is the system used to resolve store information about domain names including IP addresses, mail servers, and other information.

## History

DNS was invented in 1982-1983 by Paul Mockapteris and Jon Postel.

## Protocol dependencies

  - [TCP](/TCP)/[UDP](/UDP): Typically, DNS uses [TCP](/TCP) or [UDP](/UDP) as its transport protocol. The well known TCP/UDP port for DNS traffic is 53.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The DNS dissector is fully functional. Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

The DNS dissector has one preference: "Reassemble DNS messages spanning multiple TCP segments". As you might have guessed, this takes a DNS request or reply that has been split across multiple TCP segments and reassembles it back into one message. [TCP\_Reassembly](/TCP_Reassembly) has to be enabled for this feature to work.

## Example capture file

The [SampleCaptures](/SampleCaptures) has many DNS capture files.

## Display Filter

A complete list of DNS display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/d/dns.html)

Show only the DNS based traffic:

``` 
 dns 
```

## Capture Filter

You cannot directly filter DNS protocols while capturing if they are going to or from arbitrary ports. However, DNS traffic normally goes to or from port 53, and traffic to and from that port is normally DNS traffic, so you can filter on that port number.

Capture only traffic to and from port 53:

``` 
 port 53 
```

On many systems, you can say "port domain" rather than "port 53".

DNS servers that allow recursive queries from external networks can be used to perform [denial of service (DDoS) attacks](http://blogs.securiteam.com/index.php/archives/332). You can look for external recursive queries with a filter such as

``` 
  udp port 53 and (udp[10] & 1 == 1) and src net not <net1> and src net not <net2> 
```

where \<net1\> and \<net2\> are network specifiers, such as 10.0.0.0/8.

## External links

  - [RFC 1034](http://www.ietf.org/rfc/rfc1034.txt) Domain Names - Concepts and Facilities

  - [RFC 1035](http://www.ietf.org/rfc/rfc1035.txt) Domain Names - Implementation and Specification

  - [RFC 2671](http://www.ietf.org/rfc/rfc2671.txt) Extension Mechanisms for DNS (EDNS0)

  - [DNS Resources Directory](http://www.dns.net/dnsrd/) - includes [a page listing DNS-related RFCs](http://www.dns.net/dnsrd/rfc/)

## Discussion

---

Imported from https://wiki.wireshark.org/DNS on 2020-08-11 23:13:34 UTC
