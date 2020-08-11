# IEEE C37.118 Synchrophasor Protocol (synchrophasor)

The transmission format defined by IEEE C37.118 for reporting synchronized phasor measurements in power systems.

## Protocol dependencies

  - [TCP](/TCP), [UDP](/UDP): Synchrophasors use [TCP](/TCP) or [UDP](/UDP) as transport protocol. The (not IANA registered) ports listed in the standard are 4712 for [TCP](/TCP) and 4713 for [UDP](/UDP).

## Wireshark

The Wireshark dissector decodes synchrophasor frames as defined by IEEE C37.118-2005. Where the standard is ambiguous, the [recommendations](http://www.pes-psrc.org/h/C37_118_H11_FAQ_Jan2008.pdf) by the [Power System Relaying Committee WG H11](http://www.pes-psrc.org/h/h11.html) are used. The dissectors tries to find the correct configuration frames and uses them to decode the data streams.

## Preference Settings

The [TCP](/TCP) and [UDP](/UDP) ports the dissector is listening to can be changed in the protocol preference dialog.

## Example capture file

  - [C37.118\_1PMU\_TCP.pcap](uploads/__moin_import__/attachments/IEEE-C37.118/C37.118_1PMU_TCP.pcap) - One PMU (Phasor Measurement Unit) reporting synchrophasors over TCP.

  - [C37.118\_1PMU\_UDP.pcap](uploads/__moin_import__/attachments/IEEE-C37.118/C37.118_1PMU_UDP.pcap) - One PMU reporting synchrophasors over UDP.

  - [C37.118\_2PMUsInSync\_TCP.pcap](uploads/__moin_import__/attachments/IEEE-C37.118/C37.118_2PMUsInSync_TCP.pcap) - Two PMU sending synchrophasor data at the same time.

  - [C37.118\_4in1PMU\_TCP.pcap](uploads/__moin_import__/attachments/IEEE-C37.118/C37.118_4in1PMU_TCP.pcap) - Four data streams from a PDC (Phasor Data Concentrator).

## Display Filter

A complete list of synchrophasor display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/).

## Capture Filter

You cannot directly filter sychrophasors while capturing. However, if you know the [TCP](/TCP)/[UDP](/UDP) port used (see above), you can filter on that one.

## External links

  - [C37.118-2005 IEEE Standard for Synchrophasors for Power Systems](http://ieeexplore.ieee.org/servlet/opac?punumber=10719)

  - [Power System Relaying Committee WG H11](http://www.pes-psrc.org/h/h11.html)

  - [GE paper describing synchrophasors in detail](http://www.gedigitalenergy.com/multilin/products/synchrophasors/synchrophasors.pdf)

  - [NASPI - North American Synchrophasor Initiative](http://www.naspi.org)

---

Imported from https://wiki.wireshark.org/IEEE%20C37.118 on 2020-08-11 23:15:00 UTC
