# Radio Link Control (RLC)

The Radio Link Control protocol connects the [MAC](/MAC) layer with the RRC layer on the control plane and the PDCP layer on the data plane. It offers transparent, unacknowledged and acknowledged data transfer and supports segmentation and reassembly. The protocol is specified in [3GPP TS 25.322](http://www.3gpp.org/ftp/Specs/html-info/25322.htm).

## Protocol dependencies

  - The RLC dissector can call the IP handle for data traffic and the RRC dissector for control messages.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The RLC dissector is partially functional. It supports limited reordering for unacknowledged and acknowledged mode (the last packet must appear in order right now). Acknowledged mode sequence wrapping is currently not handled.

To work correctly, the RLC dissector requires the following information for each RLC frame:

  - U-RNTI, if available
  - mode (transparent, unacknowledged, acknowledged)
  - Radio Bearer ID
  - Ciphered flag
  - Deciphered flag

At the moment, this information can be provided via the [FP Hint](/FP-Hint) protocol.

Alternatively, you can use the UDP framing format (described in [packet-rlc.h](http://anonsvn.wireshark.org/wireshark/trunk/epan/dissectors/packet-rlc.h), purely for use with Wireshark). This (BSD-licensed) [program](http://www.wireshark.org/~martinm/rlc_logger.c) gives an example of how you might send RLC frames in this format.

## Preference Settings

  - Try heuristic RLC over UDP framing. Default is OFF. Starting from Wireshark 2.0, heuristic activation is moved to Enabled Protocols window.
  - Try to reassemble SDUs. Default is ON.
  - May see RLC headers only. Default is OFF.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of RLC display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/r/rlc.html)

Show only the RLC based traffic:

``` 
 rlc 
```

## Capture Filter

You cannot directly filter PROTO protocols while capturing.

## External links

  - [3GPP TS 25.322](http://www.3gpp.org/ftp/Specs/html-info/25322.htm) Radio Link Control protocol specification

## Discussion

---

Imported from https://wiki.wireshark.org/RLC on 2020-08-11 23:23:59 UTC
