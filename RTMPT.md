# Real Time Messaging Protocol (Tunnel) (RTMPT)

## History

XXX - add a brief description of RTMPT history

The specification has been made available by Adobe here: <http://www.adobe.com/devnet/rtmp.html>

## Protocol dependencies

  - [TCP](/TCP): Typically, RTMPT uses [TCP](/TCP) as its transport protocol.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The RTMP dissector is partially functional, it only decodes basic functionalities of the protocol. Limitations :

  - Heuristics does not work for first packet : to avoid a too high rate of false positive, this heurisitics only matches the protocol from the first server response packet and not from the client request packets before. Therefore it is necessary to a "Decode as" to properly decode the first packets.
  - PDU which are "chunked" into sequences of 128-bytes are not properly reassembled. A more general case is when two PDUs are interleaved, with chunks of the two PDUs being interleaved.

## Preference Settings

None

## Example capture file

A sample capture can be found here [http://wiki.wireshark.org/SampleCaptures?action=AttachFile\&do=get\&target=rtmp\_sample.tgz](uploads/__moin_import__/attachments/SampleCaptures/rtmp_sample.tgz)

## Display Filter

A complete list of RTMPT display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/r/rtmpt.html)

Show only the RTMPT based traffic:

``` 
 rtmpt 
```

## Capture Filter

You cannot directly filter RTMPT protocols while capturing.

## External links

Documentation: RTMP protocol description on Wiki of Red5 Open Source Flash Server <http://osflash.org/documentation/rtmp>

## Discussion

This dissector is called RTMPT to avoid a conflict with the other RTMP protocol (Routing Table Maintenance Protocol) implemented in packet-atalk.c (RTMPT normally stands for RTMP-Tunnel via http)

---

Imported from https://wiki.wireshark.org/RTMPT on 2020-08-11 23:24:10 UTC
