# Aeronautical Telecommunication Networks

The ATN protocol family (along with VDL-Mode2) was designed as a successor for the Aircraft Communications Addressing and Reporting System (ACARS). It implements a reliable air ground datalink based on OSI protocols (which were considered "state of the art" when the standardisation began) and VDL-Mode2.

The system is currently deployed along with VDL-Mode2 in Europe in the scope of the LINK2000 plus program.

At present only CMv1 and CPDLCv1 (PO and PM) applications are suported by Wireshark; the dissector is based on ICAO doc 9705 Ed2 including ammendements for Protected Mode CPDLC.

A simplified overview of the core ATN protocols looks like this:

| Layer | Description                                             |
| :---: | ------------------------------------------------------- |
|   7   | Application layer (**ULCS/ACSE**,**CM**,**CPDLC**, ...) |
|   6   | **ULCS/Presentation**,**ULCS/PDV**                      |
|   5   | **ULCS/Session**                                        |
|   4   | **COTP** (TP4 connections)                              |
|   3   | Internet (**CLNP**, **ES-IS**,**IS-IS**,**IDRP**)       |
|   2   | Link layer (**LLC**,**IP**,**X.25**, ...)               |

## Wireshark

ATN reuses CLNP and COTP dissectors and stacks the "atn-ulcs" dissector on top of COTP. Technically "atn-ulcs" implements the "ATN upper layers" containing the SES, PRES and ACSE protocols (ASN.1 Packed Encoding Rules).

The "atn-ulcs" dissector then calls application-level dissecctors like CM("atn-cm") and CPDLC("atn-cpdlc").

## Enable ATN support in wireshark

The dissector should be compiled in by default (developper version) and can be enabled by tuning the Wireshark protocol Preferences/Settings.

The following settings are required to decode ATN traffic: CLNP dissector:

  - "Always try to decode NSDU as Transport PDU's" -\> Enabled

  - "Decode ATN security label" -\> Enabled

COTP dissector:

  - "Decode ATN TPDU's" -\> Enabled

T.125 dissector

  - the T.125 dissector should be disabled, for some CM/CPDLC PDU may be incorrectly decoded as "T.125" (Main Menu: "Analyze"-\>"Enabled Protocols" disable checkbox on "T.125 Multipoint-communication" entry).

No settings tabs are available for "atn-ulcs", "atn-cm" and "atn-cpdlc" dissectors.

## Bugs

plenty ;-). IMHO the dissector is far from beeing usable in production systems (it is better than nothing though, as network monitors for OSI are expensive/inappropriate when compared to tools in the TCP/IP world).

Layers up to OSI Layer 6 (ATN-ULCS/ACSE) are working in most cases; decoding of CM and CPDLC is flawed.

The main problem is that there is no working "conversation" function for the TP4 layer which is needed do differentiate between PER encoded CM and CPDLC PDU's; this function would allow to decode all PDU's of a transport connection an CM or CPDLC, for some PDU's share the same bit encoding.

Known bugs:

  - atn-ulcs (ACSE): AARE incorrectly decoded; probably related to the incorrect handling of "CpdlcStart confirmation"

  - atn-cpdlc (CPDLC): the dissector incorrectly decodes "CpdlcStart confirmation" as "Cpdlc message"

  - some PDU's of CM and CPDLC have the same PER encoding, which may lead to a wrong encoding.

## External Links

### Background:

  - ACARS \[<http://en.wikipedia.org/wiki/ACARS>\]

  - VDL-Mode2 \[<http://en.wikipedia.org/wiki/VHF_Data_Link>\]

  - Controller Pilot Data Link Communications \[<http://en.wikipedia.org/wiki/CPDLC>\]

  - A short introduction to air/ground datalink \[<http://members.optusnet.com.au/~cjr/introduction.htm>\]

### Standards

  - ICAO standards [Working Groups and Panels Library ](https://www.icao.int/safety/acp/ACPWGF/Forms/AllItems.aspx)

  - OSI standards \[<http://standards.iso.org/ittf/PubliclyAvailableStandards/index.html>\]

### Protocol Traces

Attached to [GitLab Issue 5622](https://gitlab.com/wireshark/wireshark/-/issues/5622):

  - [2011-01-26-lan-sndcf.pcap:](https://gitlab.com/wireshark/wireshark/uploads/211893857c93a2da3e565444cfdb573e/2011-01-26-lan-sndcf.pcap) ATN over ethernet SNDCF

  - [2011-01-27-dump-atn-over-ip.pcap:](https://gitlab.com/wireshark/wireshark/uploads/b3935cb6c14dcfeff2088c3ab2fd9ff8/2011-01-27-dump-atn-over-ip.pcap) ATN over IP SNDCF

Attached to [GitLab Issue 8293](https://gitlab.com/wireshark/wireshark/-/issues/8293):

  - [2013-01-08-dl-eduu1-38057a-a350-trials.pcap:](https://gitlab.com/wireshark/wireshark/uploads/494d74b8b8db77ff3dedec2e33552080/2013-01-08-dl-eduu1-38057a-a350-trials.pcap) ATN over IP SNDCF, Airbus A350 avionics evaluation
---

Imported from https://wiki.wireshark.org/ATN on 2020-08-11 23:11:26 UTC
