# Media Gateway Control Protocol (MGCP)

Media Gateway Control Protocol (MGCP) is a protocol used within a distributed Voice over IP system. Details on wikipedia <http://en.wikipedia.org/wiki/MGCP>

## History

XXX - add a brief description of MGCP history

## Protocol dependencies

  - [TCP](/TCP), [UDP](/UDP): MGCP uses [TCP](/TCP) or [UDP](/UDP) as its transport protocol. The well known port for MGCP gateway traffic is 2427. The well known port for MGCP callagent traffic is 2727.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The MGCP dissector is fully functional.

## Preference Settings

  - MGCP Gateway TCP Port: Set the TCP port for gateway messages (if other than the default of 2427).
  - MGCP Gateway UDP Port: Set the UDP port for gateway messages (if other than the default of 2427).
  - MGCP Callagent TCP Port: Set the TCP port for callagent messages (if other than the default of 2727).
  - MGCP Callagent UDP Port: Set the UDP port for callagent messages (if other than the default of 2727).
  - Display raw text for MGCP message: Specifies that the raw text of the MGCP message should be displayed instead of (or in addition to) the dissection tree.
  - Display the number of MGCP messages: Display the number of MGCP messages found in a packet in the protocol column.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/MGCP.pcap](uploads/__moin_import__/attachments/SampleCaptures/MGCP.pcap)

## Display Filter

A complete list of MGCP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/protofirstletter/proto.html)

Show only the MGCP based traffic:

``` 
 mgcp 
```

## Capture Filter

You cannot directly filter MGCP protocols while capturing. However, if you know the port used (see above), you can filter on that one.

Capture only the MGCP traffic over the [TCP](/TCP) port (2427):

``` 
 tcp port 2427 
```

## External links

  - [RFC 2705](http://www.ietf.org/rfc/rfc2705.txt) *Media Gateway Control Protocol (MGCP) Version 1.0* - The last update of the draft of this protocol.

  - [RFC 3435](http://www.ietf.org/rfc/rfc3435.txt) *Media Gateway Control Protocol (MGCP) Version 1.0* - A much more complete definition of the protocol.

## Discussion

---

Imported from https://wiki.wireshark.org/MGCP on 2020-08-11 23:16:41 UTC
