# Datagram Congestion Control Protocol (DCCP)

\--- from IETF wg ---

The Datagram Congestion Control Protocol (DCCP) is a transport protocol that provides bidirectional unicast connections of congestion-controlled unreliable datagrams. DCCP is suitable for applications that transfer fairly large amounts of data, but can benefit from control over the tradeoff between timeliness and reliability.

DCCP is intended for applications such as streaming media that can benefit from control over the tradeoffs between delay and reliable in-order delivery. TCP is not well-suited for these applications, since reliable in-order delivery and congestion control can cause arbitrarily long delays. UDP avoids long delays, but UDP applications that implement congestion control must do so on their own. DCCP provides built-in congestion control, including ECN support, for unreliable datagram flows, avoiding the arbitrary delays associated with TCP. It also implements reliable connection setup, teardown, and feature negotiation.

## History

DCCP was developed as a standalone, unreliable congestion-control protocol since about 2001. It has been fully standardised as standards-track RFC in 2006.

## Protocol dependencies

  - [IP](/IP): Typically, DCCP uses [IP](/IP) as its underlying protocol.

  - [IPv6](/IPv6): DCCPv6 is also in use (see the sample captures).

The assigned protocol/next-hop number for DCCP on IP/IPv6 is 33.

## Example traffic

    0.000000 20.22.3.176 -> 20.22.3.65 DCCP 52667 > 5001 [Request] Seq=33164071488 (service=0)
    0.000478 20.22.3.65 -> 20.22.3.176 DCCP 5001 > 52667 [Response] Seq=1925546833 (Ack=33164071488) (service=0)
    0.000599 20.22.3.176 -> 20.22.3.65 DCCP 52667 > 5001 [Ack] Seq=33164071489 (Ack=1925546833)
    0.001269 20.22.3.176 -> 20.22.3.65 DCCP 52667 > 5001 [DataAck] Seq=33164071490 (Ack=1925546833)
    0.001707 20.22.3.65 -> 20.22.3.176 DCCP 5001 > 52667 [Ack] Seq=1925546834 (Ack=33164071490)
    0.003431 20.22.3.176 -> 20.22.3.65 DCCP 52667 > 5001 [Close] Seq=33164071491 (Ack=1925546834)
    0.003959 20.22.3.65 -> 20.22.3.176 DCCP 5001 > 52667 [Reset] Seq=1925546835 (Ack=33164071491) (code=Closed)

## Wireshark

The DCCP dissector is functional.

## Preference Settings

XXX - add links to preference settings affecting how DCCP is dissected.

## Example capture file

  - [SampleCaptures/dccp\_trace.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/dccp_trace.pcap.gz)

  - [SampleCaptures/dccp\_partial\_csum\_v4\_simple.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/dccp_partial_csum_v4_simple.pcap.gz)

  - [SampleCaptures/dccp\_partial\_csum\_v6\_simple.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/dccp_partial_csum_v6_simple.pcap.gz)

  - [SampleCaptures/dccp\_partial\_csum\_v4\_longer.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/dccp_partial_csum_v4_longer.pcap.gz)

  - [SampleCaptures/dccp\_partial\_csum\_v6\_longer.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/dccp_partial_csum_v6_longer.pcap.gz)

## Display Filter

A complete list of DCCP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/d/dcp.html)

Show only the DCCP based traffic:

``` 
 dcp 
```

## Capture Filter

XXX - to be done

## External links

  - <http://linux-net.osdl.org/index.php/DCCP> OSDL DCCP Implementation Page

  - <http://www.rfc-editor.org/rfc/rfc4336.txt> RFC 4340 - DCCP Problem Statement

  - <http://www.rfc-editor.org/rfc/rfc4340.txt> RFC 4340 - DCCP Protocol Spec

  - <http://www.read.cs.ucla.edu/dccp/> DCCP homepage

## Discussion

DCCP is an evolving protocol which uses modules called CCIDs (congestion control IDs) to adapt to various congestion scenarios. There is ongoing research in these CCIDs and so continuing evolution of the protocol and its use is likely.

---

Imported from https://wiki.wireshark.org/DCCP on 2020-08-11 23:12:32 UTC
