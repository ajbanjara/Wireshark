TRANSUM is a Wireshark plugin that calculates response time information and delivers it through an additional branch in the dissector tree displayed in the Packet Detail pane.

# User Guide

A TRANSUM User Guide can be found [here](https://gitlab.com/wireshark/wireshark/-/wikis/TRANSUM-User-Guide).

# Development Notes

The objective of the notes added here is to help developers maintain the code.

## Request-Response Pair Detection

The simplest form of detection is referred to in TRANSUM as Generic TCP and Generic UDP. In these cases, TRANSUM just looks for turns i.e. if the last data packet on a stream (TCP or UDP) was going from service-to-client, and the current packet is going client-to-service, TRANSUM assumes a turn. A turn marks the start of a new RR Pair. When we refer to a data packet we mean a TCP or UDP payload of greater than zero bytes.

For example, imagine the following:

1.  c2s - Packet with 1460 bytes payload
2.  c2s - Packet with 248 bytes payload
3.  s2c - Packet with 1460 bytes payload
4.  s2c - Packet with 1460 bytes payload
5.  s2c - Packet with 1460 bytes payload
6.  s2c - Packet with 960 bytes payload
7.  c2s - Packet with 248 bytes payload
8.  s2c - Packet with 1280 bytes payload

In this case:

  - Packets 1 and 2 are assumed to be a Request APDU
  - Packets 3, 4, 5 and 6 are assumed to be a Response APDU
  - Packet 7 is assumed to be a second Request APDU
  - Packet 8 is assumed to be a second Response APDU

This pattern works for many protocols, in particular where a TCP connect supports a single application session. However, some protocols multiplex multiple application sessions onto a single TCP connection; SMB2 and DCE-RPC are two such protocols. In these cases, TRANSUM takes into account session ID and message ID information. Both these protocols can also overlap requests and responses, and so you see patterns like this:

  - Request APDU a
  - Request APDU b
  - Response APDU b
  - Request APDU c
  - Response APDU a
  - Response APDU c

Another protocol that produces similar patterns is DNS, and for this protocol TRANSUM uses the DNS Transaction ID as the message ID.

## RRPD List

Wireshark scans the packets in a pcap / pcapng file at least twice. During the first scan, TRANSUM extracts information from the packets to build a chained list of Request-Response Pairs. These pairs are added to a list called the rrpd\_list (request response descriptor list). The list is in the chronological order of the APDU Request.

The list is searched in reverse order. The performance of TRANSUM is strongly linked to the number of rrpd\_list entries searched, and so there are some measures in the function find\_latest\_rrpd(...) that attempt to minimize the searching. The basic strategy is to stop searching and return from this function as quickly as possible.

---

Imported from https://wiki.wireshark.org/TRANSUM on 2020-08-11 23:26:53 UTC
