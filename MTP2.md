# Message Transfer Part Layer 2 (MTP2)

MTP2 is the Data Link layer used with in [SS7](/SS7); it is used to carry [MTP3](/MTP3) traffic from point to point.

## History

XXX - add a brief description of MTP2 history

## Protocol dependencies

  - MTP2 is carried by MTP Level 1 which is equivalent to the OSI Physical Layer. It defines the physical, electrical, and functional characteristics of the digital signaling link. Physical interfaces defined include:
    
      - E-1 (2048 kb/s: 32 64 kb/s channels)
      - DS-1 (1544 kb/s: 24 64kb/s channels)
      - V.35 (64 kb/s)
      - DS-0 (64 kb/s)
      - DS-0A (56 kb/s)

  - MTP2 carries [MTP3](/MTP3).

In IP networks MTP2 is logically replaced by the SIGTRAN protocols:

  - [M2PA](/M2PA)

  - [M2UA](/M2UA)

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The MTP2 dissector is fully functional.

## Preference Settings

The MTP2 dissector can dissect messages from either traditional (channelized) speed links (64k,56k) or high speed links (unchannelized E1/T1 from Q.703, Annex A), based on the dissector's preference setting. The difference between the two is the size of the sequence numbers.

## Example capture file

  - [SampleCaptures/ansi\_tcap\_over\_itu\_sccp\_over\_mtp3\_over\_mtp2.pcap](uploads/__moin_import__/attachments/SampleCaptures/ansi_tcap_over_itu_sccp_over_mtp3_over_mtp2.pcap) This capture contains a single MTP2 frame carrying ITU MTP3/SCCP which is carrying an ANSI TCAP message.

## Display Filter

A complete list of MTP2 display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/protofirstletter/proto.html)

Show only the MTP2 based traffic:

``` 
 mtp2
```

## Capture Filter

You cannot directly filter MTP2 while capturing.

## External links

  - The ITU specifications of MTP2 are available for free on the web:
      - [Q.701](http://www.itu.int/rec/T-REC-Q.701/en) gives an introduction to MTP (layers 1, 2, and 3)
    
      - [Q.702](http://www.itu.int/rec/T-REC-Q.702/en)
    
      - [Q.703](http://www.itu.int/rec/T-REC-Q.703/en)

## Discussion

---

Imported from https://wiki.wireshark.org/MTP2 on 2020-08-11 23:17:00 UTC
