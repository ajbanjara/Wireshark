# Link Control Protocol (LCP)

The Link Control Protocol is part of the PPP protocol and is used to configure the settings for the subsequent protocols inside PPP.

This file was just generated from the Protocol template in this Wiki

The text below is copied from Wikipedia <http://en.wikipedia.org/wiki/Link_Control_Protocol>

The LCP protocol:

  - checks the identity of the linked device and either accepts or rejects the peer device
  - determines the acceptable packet size for transmission
  - searches for errors in configuration
  - can terminate the link if requirements exceed the parameters

Devices cannot use PPP to transmit data over a network until the LCP packet determines the acceptability of the link, but LCP packets are embedded into PPP packets and therefore a basic PPP connection has to be established before LCP can reconfigure it. The LCP over PPP packets have control code 0xC021 and their info field contains the LCP packet, which has four fields. (Code, Id, Length, Data)

  - Code: Operation requested: configure link, terminate link, ... and acknowledge and deny codes.
  - data: Parameters for the operation

## History

XXX - add a brief description of PROTO history

## Protocol dependencies

  - [PPP](/PPP): LCP is part of the PPP protocol suite.

## Example traffic

Here is a a screenshot of some LCP traffic:

![lcp.png](uploads/__moin_import__/attachments/Protocols/lcp/lcp.png "lcp.png")

## Wireshark

The LCP dissector is fully functional.

## Preference Settings

Currently, there are no preferences for the LCP dissector.

## Example capture file

A sample capture file containing LCP traffic is available on the [SampleCaptures](/SampleCaptures) page.

  - [SampleCaptures/ppp\_lcp\_ipcp.pcap](uploads/__moin_import__/attachments/SampleCaptures/ppp_lcp_ipcp.pcap)

## Display Filter

A complete list of LCP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/)

Example: Show only LCP traffic:

``` 
 lcp 
```

## Capture Filter

## External links

  - [RFC1570](http://tools.ietf.org/html/rfc1570.html): PPP LCP Extensions

  - [RFC1661](http://tools.ietf.org/html/rfc1661.html): The Point-to-Point Protocol (PPP)

  - [RFC1663](http://tools.ietf.org/html/rfc1663.html): PPP Reliable Transmission

  - [IANA assigned PPP numbers](http://www.iana.org/assignments/ppp-numbers)

## Discussion

---

Imported from https://wiki.wireshark.org/Protocols/lcp on 2020-08-11 23:20:43 UTC
