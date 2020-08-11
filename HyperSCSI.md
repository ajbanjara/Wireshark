# HyperSCSI

HyperSCSI is an older protocol used to transport SCSI directly over Ethernet frames to allow a much cheaper interconnect between an Initiator and a SCSI Target than [FibreChannel](/FibreChannel) is. (XXX - the DSI Web site mentions HyperSCSI over IP.)

There are initiator drivers available for HyperSCSI for at least Linux and Windows.

## History

HyperSCSI was initially developed by the [Data Storage Institute](http://www.dsi.a-star.edu.sg/) as a research project but is today developed and maintained by ???.

## Protocol dependencies

  - [Ethernet](/Ethernet): HyperSCSI is transported directly on top of Ethernet II frames and has the Ethernet type 0x889A

  - [SCSI](/SCSI): SCSI is transported on top of the HyperSCSI protocol.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The HyperSCSI dissector is believed to be fully functional.

## Preference Settings

There are no preference settings for HyperSCSI.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of HyperSCSI display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/h/hyperscsi.html)

Show only HyperSCSI traffic:

``` 
 hyperscsi 
```

## Capture Filter

Capture only HyperSCSI traffic:

``` 
 ether proto 0x889a 
```

## External links

  - [HyperSCSI development homepage](http://nst.dsi.a-star.edu.sg/mcsa/hyperscsi)

## Discussion

---

Imported from https://wiki.wireshark.org/HyperSCSI on 2020-08-11 23:14:53 UTC
