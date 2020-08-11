# Message Transfer Part Level 3 (MTP3)

MTP3 is part of the [SS7](/SS7) stack. It is NOT part of the [SIGTRAN](/SIGTRAN) family of protocols. The purpose of the [SIGTRAN](/SIGTRAN) family of protocols is to carry [SS7](/SS7) traffic over IP networks.

The hardware and software functions of the [SS7](/SS7) protocols are divided into functional abstractions called "levels". These levels map loosely to the Open Systems Interconnect (OSI) 7-layer model defined by the International Standards Organization ([ISO](/ISO)).

Different MTP3 flavors exist:

  - [ANSI](/ANSI) T1.111.4-1996

  - [ITU-T](/ITU-T) Q.704 7/1996

  - GF 001-9001 (Chinese ITU variant)

## History

XXX - add a brief description of MTP3 history

## Protocol dependencies

The Message Transfer Part (MTP) is divided into three levels.

1.  MTP Level 1 is equivalent to the OSI Physical Layer. It defines the physical, electrical, and functional characteristics of the digital signaling link. Physical interfaces defined include:
    
      - E-1 (2048 kb/s: 32 64 kb/s channels)
      - DS-1 (1544 kb/s: 24 64kb/s channels)
      - V.35 (64 kb/s)
      - DS-0 (64 kb/s)
      - DS-0A (56 kb/s)

2.  MTP Level 2 ([MTP2](/MTP2)) is equivalent to the OSI Data Link Layer. It ensures accurate end-to-end transmission of a message across a signaling link. Level 2 implements flow control, message sequence validation, and error checking. When an error occurs on a signaling link, the message (or set of messages) is retransmitted.

3.  MTP Level 3 is equivalent to the OSI Network Layer. It provides message routing between signaling points in the SS7 network. MTP Level 3 re-routes traffic away from failed links (usually without losing any messages and always without re-ordering messages) and controls traffic when congestion occurs or a signaling point fails.

In IP networks

  - MTP3 is frequently carried on [M2PA](/M2PA) or [M2UA](/M2UA) (both of which logically replace MTP2 and below)

  - [M3UA](/M3UA) is used to transport MTP3 payloads across IP networks (it logically replaces MTP3 in a [SIGTRAN](/SIGTRAN) network). Early versions (Internet Drafts) of M3UA simply transported the entire MTP3 message across IP but the RFC3332 version of M3UA does not.

MTP3 is sometimes carried over [SSCF-NNI](/SSCF-NNI) over [SSCOP](/SSCOP) over [ATM](/ATM). Then it is usually referred to as MTP3-b (for "broadband").

MTP3 is commonly used to carry [ISUP](/ISUP) and [SCCP](/SCCP) messages. Other SS7 protocols above MTP3 include [TUP](/TUP) (a predecessor to ISUP which is only still used in some parts of China) and [IUP](/IUP) (used in England).

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The MTP3 dissector is fully functional. It supports standard ITU MTP3 as well as the ANSI, Chinese, and Japanese variants (the variant selection is a Preference of the dissector). Some national options (such as congestion levels) are supported via preference settings.

Wireshark also contains an "MTP3MG" ("MTP3 Management") dissector for MTP3 control messages. These are messages exchanged between the MTP3 layer management at each endpoint.

## Preference Settings

The most important preference setting for [SS7](/SS7) and [SIGTRAN](/SIGTRAN) dissection in Wireshark is the MTP3 variant. All of the SS7-related dissectors (except [TCAP](/TCAP)) follow MTP3's preference setting.

## Example capture file

  - [SampleCaptures/isup.cap](uploads/__moin_import__/attachments/SampleCaptures/isup.cap) a single call's signalling sequence using ISUP/MTP3/M3UA/SCTP/IP

## Display Filter

A complete list of MTP3 display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/m/mtp3.html)

Show only the MTP3 based traffic:

``` 
 mtp3 
```

## Capture Filter

You cannot directly filter MTP3 protocols while capturing.

## External links

  - The ITU specifications of MTP3 are available for free on the web:
    
      - [Q.701](http://www.itu.int/rec/T-REC-Q.701/en) gives an introduction to MTP (layers 1, 2, and 3)
    
      - [Q.704](http://www.itu.int/rec/T-REC-Q.704/en) describes MTP3

  - Wikipedia's [Message\_Transfer\_Part](http://en.wikipedia.org/wiki/Message_Transfer_Part) page has more info.

## Discussion

It might be a good idea to have a page with the SS7 family and "only" refer to it from here. Or is MTP3 the family (sorry, telephonie neebie)? - *[UlfLamping](/UlfLamping)*

I think SS7 would be thought of as the family; MTP3 is just a member of the family, at the network layer (with MTP2 at the logical link layer). - *Guy Harris*

---

Imported from https://wiki.wireshark.org/MTP3 on 2020-08-11 23:17:01 UTC
