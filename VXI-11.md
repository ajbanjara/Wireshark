# TCP/IP Instrument Protocol (VXI-11)

The VXI-11 protocol is an [RPC](/RPC)-based communication protocol primarily designed for connecting instruments (such as oscilloscopes, multimeters, spectrum analyzers etc.) to controllers (e.g., PCs).

Instruments may support this protocol directly (e.g., as part of implementing the more recent [LXI](/LXI) interface), or may be connected by way of an adapter (gateway) that attaches to a dedicated bus (such as GPIB).

## History

The VXI-11 specification was published in 1995 by the VXIbus Consortium, Inc.

## Protocol dependencies

  - [ONC-RPC](/ONC-RPC): VXI-11 consists of 3 separate RPC programs with the numeric identifiers
    
    0x0607AF (DEVICE\_CORE), 0x0607B0 (DEVICE\_ASYNC) and 0x0607B1 (DEVICE\_INTR).

  - [TCP](/TCP): VXI-11 uses [TCP](/TCP) as its transport protocol.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The VXI-11 dissector is fully functional for the core VXI-11 protocol. It can also decode some of the GPIB-specific details described in the VXI-11.2 specification.

## Preference Settings

There are currently no preference settings specific to the VXI-11 dissector.

## Example capture file

  - [SampleCaptures/vxi-11.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/vxi-11.pcap.gz)

## Display Filter

A complete list of VXI-11 display filter fields can be found in the display filter reference:

  - [Core protocol](http://www.wireshark.org/docs/dfref/v/vxi11core.html)

  - [Asynchronous Abort protocol](http://www.wireshark.org/docs/dfref/v/vxi11async.html)

  - [Interrupt protocol](http://www.wireshark.org/docs/dfref/v/vxi11intr.html)

## Capture Filter

You cannot directly filter VXI-11 protocols while capturing. Since VXI-11 does not use a standard port you can not capture on a specific port either.

## External links

  - <http://www.vxibus.org/files/VXI_Specs/VXI-11.zip> Original protocol specifications.

## Discussion

---

Imported from https://wiki.wireshark.org/VXI-11 on 2020-08-11 23:27:15 UTC
