# Network Time Protocol (NTP)

NTP is used to synchronize the clock of a network client with a server. It's the primary work of [David L. Mills, PhD](https://www.eecis.udel.edu/~mills/index.html).

The NTP server will (hopefully) have the precise time (probably directly from an atomic clock). The NTP client asks the NTP server about the current time, and then will adjust it's internal clock to that value. Adjusting the clock is not instantaneously, but smoothed over time towards the reference time sources selected. A lot of intricate details are involved, which are described in the relevant research project pages

## History

The [Wikipedia article](https://en.wikipedia.org/wiki/Network_Time_Protocol) has a relevant writeup of the protocol.

## Protocol dependencies

  - [UDP](/UDP): Typically, NTP uses [UDP](/UDP) as its transport protocol. The well known UDP port for NTP traffic is 123.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The NTP dissector is fully functional.

## Preference Settings

There are no NTP related preference settings.

## Example capture file

  - [SampleCaptures/NTP\_sync.pcap](uploads/__moin_import__/attachments/SampleCaptures/NTP_sync.pcap)

  - [SampleCaptures/NTP\_with\_MD5\_key\_foobar.pcap](uploads/__moin_import__/attachments/SampleCaptures/NTP_with_MD5_key_foobar.pcap) (MD5 encryption key: "foobar")

## Display Filter

A complete list of NTP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/n/ntp.html)

Show only the NTP based traffic:

``` 
 ntp
```

## Capture Filter

You cannot directly filter NTP protocols while capturing. However, you can filter on the well known NTP UDP port 123.

Capture only the NTP based traffic:

``` 
 udp port 123
```

On many systems, you can say "udp port ntp" rather than "udp port 123".

## External links

Current RFC:

  - [RFC 5905](https://tools.ietf.org/rfcmarkup?rfc=5905) *Network Time Protocol Version 4: Protocol and Algorithms Specification*

Obsoleted RFCs:

  - [RFC 958](https://tools.ietf.org/rfcmarkup?rfc958) *Network Time Protocol*

  - [RFC 1059](https://tools.ietf.org/rfcmarkup?rfc=1059) *Network Time Protocol (Version 1) Specification and Implementation*

  - [RFC 1119](https://tools.ietf.org/rfcmarkup?rfc=1119) *Network Time Protocol (Version 2) Specification and Implementation*

  - [RFC 1305](https://tools.ietf.org/rfcmarkup?rfc=1305) *Network Time Protocol (Version 3) Specification, Implementation and Analysis*

Other Information:

  - [ntp.org](http://www.ntp.org/) Home of the Network Time Protocol

  - [Mills' NTP site](https://www.eecis.udel.edu/%7emills/ntp.html) Network Time Synchronization Research Project

  - [pool.ntp.org](http://www.pool.ntp.org/) The time server you should probably use

  - [NTP at wikipedia](http://en.wikipedia.org/wiki/Network_Time_Protocol) - a good overview

## Discussion

Note: On WinXP the 'Windows Time' service must be stopped for NTP packets to be passed up the stack and visible to Wireshark.

---

Imported from https://wiki.wireshark.org/NTP on 2020-08-11 23:17:35 UTC
