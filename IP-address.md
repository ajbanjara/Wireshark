# IP Address

The [IP](/IP) address, something like 192.168.0.10, is used to address an IP endpoint. The IP address is typically used to address a single network interface card ([NIC](/NIC)). Every NIC used to communicate through IP, must have at least one IP address.

One machine can have a lot of IP addresses, as a machine can have more than one NIC, and a NIC can have more than one IP address (however, that's not widely used).

The IP address can be statically assigned to a NIC through system specific configuration, or dynamically assigned using [DHCP](/DHCP) or [APIPA](/APIPA).

## IP address classes

  - 0.1.0.0 - 126.0.0.0 Class A
  - 128.0.0.0 - 191.255.0.0 Class B
  - 192.0.1.0 - 223.255.255.0 Class C
  - 224.0.0.0 - 239.255.255.255 Class D
  - 240.0.0.0 - 247.255.255.255 Class E

## Special IP addresses

  - 127.0.0.0 - 127.255.255.255 local loopback, should never appear on the network

  - 169.254.0.0 - 169.254.255.254 link local for use with Automatic Private IP Addressing ([APIPA](/APIPA))

  - 224.0.0.0 - 239.255.255.255 multicasting [RFC1112](http://www.ietf.org/rfc/rfc1112.txt), transmission to a host group

  - 255.255.255.255 limited broadcast, send to all nodes

## Private IP Addresses

The following IP addresses should be used for private networks:

  - 10.0.0.0 - 10.255.255.255 private in Class A
  - 172.16.0.0 - 172.31.255.255 private in Class B
  - 192.168.0.0 - 192.168.255.255 private in Class C

## Stupid Tricks Involving IP Addresses

Most operating systems let you specify an IP address as an integer as opposed to the traditional dotted-quad format. For instance, the following commands are equivalent:

``` 
 ping 192.168.5.1
 ping 0xc0a80501   # Hexadecimal
 ping 3232236801   # Decimal
 ping 030052002401 # Octal
```

## External Links

  - [RFC1166](http://www.ietf.org/rfc/rfc1166.txt) "INTERNET NUMBERS" list of assigned IP addresses is a very out-of-date list of IP address ranges. To find out to whom an IP address belongs, you can use various "WHOIS" services:
    
      - Asia: [Asia Pacific Network Information Centre (APNIC)](http://www.apnic.net/) [WHOIS site](http://www.apnic.net/apnic-bin/whois.pl)
    
      - Europe: [Réseaux IP Européens (RIPE)](http://www.ripe.net/) [WHOIS site](http://www.ripe.net/db/whois/whois.html) [Assigned IP addresses in Europe](ftp://ftp.ripe.net/ripe/stats/)
    
      - Latin America and Caribbean: [Latin American and Caribbean Internet Addresses Registry (LACNIC)](http://lacnic.net/en/index.html) [WHOIS site](http://lacnic.net/cgi-bin/lacnic/whois?lg=EN).
    
      - United States and Canada: [American Registry for Internet Numbers (ARIN)](http://www.arin.net) [WHOIS site](http://www.arin.net/whois/index.html)

  - [RFC1918](http://www.ietf.org/rfc/rfc1918.txt) Private IP addresses

  - [RFC3330](http://www.ietf.org/rfc/rfc3330.txt) Special-Use IPv4 Addresses

  - [My IP Tool](http://www.iptool.us/extensions/iptool.us) Quickly detect your local and public IP Addresses. Firefox extension.

## Discussion

What about IPv6? See, for example, RFC 2373. - *Guy Harris*

---

Imported from https://wiki.wireshark.org/IP-address on 2020-08-11 23:15:11 UTC
