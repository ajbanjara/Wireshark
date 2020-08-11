# DisplayFilters

Wireshark uses display filters for general packet filtering while viewing and for its [ColoringRules](/ColoringRules).

The basics and the syntax of the display filters are described in the [User's Guide](https://www.wireshark.org/docs/wsug_html_chunked/ChWorkBuildDisplayFilterSection.html).

The master list of display filter protocol **fields** can be found in the [display filter reference](https://www.wireshark.org/docs/dfref/).

If you need a display filter for a specific protocol, have a look for it at the [ProtocolReference](/ProtocolReference).

[[_TOC_]]

## Display filter is not a capture filter

Capture filters (like `tcp port 80`) are not to be confused with display filters (like `tcp.port == 80`). See also [CaptureFilters\#Capture\_filter\_is\_not\_a\_display\_filter](/CaptureFilters#Capture_filter_is_not_a_display_filter).

## Examples

Show only [SMTP](/SMTP) (port 25) and [ICMP](/ICMP) traffic:

``` 
 tcp.port eq 25 or icmp
```

Show only traffic in the LAN (192.168.x.x), between workstations and servers -- no Internet:

    ip.src==192.168.0.0/16 and ip.dst==192.168.0.0/16

[TCP](/TCP) buffer full *-- Source is instructing Destination to stop sending data*

``` 
 tcp.window_size == 0 && tcp.flags.reset != 1
```

Filter on Windows *-- Filter out noise, while watching Windows Client - DC exchanges*

``` 
 smb || nbns || dcerpc || nbss || dns
```

Sasser worm: *--What sasser really did--*

``` 
  ls_ads.opnum==0x09
```

Match packets containing the (arbitrary) 3-byte sequence 0x81, 0x60, 0x03 at the beginning of the [UDP](/UDP) payload, skipping the 8-byte UDP header. Note that the values for the byte sequence implicitly are in hexadecimal only. *(Useful for matching homegrown packet protocols.)*

``` 
  udp[8:3]==81:60:03
```

The "slice" feature is also useful to filter on the vendor identifier part (OUI) of the MAC address, see the [Ethernet](/Ethernet) page for details. Thus you may restrict the display to only packets from a specific device manufacturer. E.g. for DELL machines only:

``` 
  eth.addr[0:3]==00:06:5B
```

It is also possible to search for characters appearing anywhere in a field or protocol by using the contains operator.

Match packets that contains the 3-byte sequence 0x81, 0x60, 0x03 anywhere in the UDP header or payload:

``` 
  udp contains 81:60:03
```

Match packets where SIP To-header contains the string "a1762" anywhere in the header:

``` 
  sip.To contains "a1762"
```

The matches, or \~, operator makes it possible to search for text in string fields and byte sequences using a regular expression, using Perl regular expression syntax. Note: Wireshark needs to be built with libpcre in order to be able to use the matches operator.

Match HTTP requests where the last characters in the uri are the characters "gl=se":

``` 
  http.request.uri matches "gl=se$"
```

Note: The $ character is a PCRE punctuation character that matches the end of a string, in this case the end of http.request.uri field.

Filter by a protocol ( e.g. SIP ) and filter out unwanted IPs:

``` 
  ip.src != xxx.xxx.xxx.xxx && ip.dst != xxx.xxx.xxx.xxx && sip
```

*\[ Feel free to contribute more \]*

## Gotchas

Some *filter fields* match against multiple *protocol fields*. For example, "ip.addr" matches against both the [IP](/IP) source and destination addresses in the IP header. The same is true for "tcp.port", "udp.port", "eth.addr", and others. It's important to note that

``` 
 ip.addr == 10.43.54.65
```

is equivalent to

``` 
 ip.src == 10.43.54.65 or ip.dst == 10.43.54.65
```

This can be counterintuitive in some cases. Suppose we want to filter out any traffic to or from 10.43.54.65. We might try the following:

``` 
 ip.addr != 10.43.54.65
```

which is equivalent to

``` 
 ip.src != 10.43.54.65 or ip.dst != 10.43.54.65
```

This translates to "pass all traffic except for traffic with a source IPv4 address of 10.43.54.65 **and** a destination IPv4 address of 10.43.54.65", which isn't what we wanted.

Instead we need to negate the expression, like so:

``` 
 ! ( ip.addr == 10.43.54.65 )
```

which is equivalent to

``` 
 ! (ip.src == 10.43.54.65 or ip.dst == 10.43.54.65)
```

This translates to "pass any traffic except with a source IPv4 address of 10.43.54.65 **or** a destination IPv4 address of 10.43.54.65", which is what we wanted.

This can also happen if, for example, you have tunneled protocols, so that you might have two separate IPv4 or IPv6 layers and two separate IPv4 or IPv6 headers, or if you have multiple instances of a field for other reasons, such as multiple IPv6 "next header" fields.

If you have a filter expression of the form *name* *op* *value*, where *name* is the name of a field, *op* is a comparison operator such as `==` or `!=` or `<` or..., and *value* is a value against which you're comparing, it should be thought of as meaning "match a packet if there is *at least one* instance of the field named *name* whose value is (equal to, not equal to, less than, ...) *value*". The negation of that is "match a packet if there are *no* instances of the field named *name* whose value is (equal to, not equal to, less than, ...) *value*"; simply negating *op*, e.g. replacing `==` with `!=` or `<` with `>=`, give you another "if there is at least one" check, which is not the negation of the original check.

## See Also

[CaptureFilters](/CaptureFilters)

## External Links

  - [Displaying HTTP traffic to debug Apache](http://www.askapache.com/htaccess/sniff-http-to-debug-apache-htaccess-and-httpdconf.html)

  - Capture and display filter [Cheat sheets](http://packetlife.net/blog/2008/oct/18/cheat-sheets-tcpdump-and-wireshark/)

---

Imported from https://wiki.wireshark.org/DisplayFilters on 2020-08-11 23:13:34 UTC
