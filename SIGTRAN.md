# Signaling Transport (SIGTRAN) protocol family

Transport of packet-based [PSTN](/PSTN) signaling over [IP](/IP) Networks.

For interworking with PSTN, IP networks will need to transport signaling such as [Q.931](/Q.931) or [SS7](/SS7) [ISUP](/ISUP) messages between IP nodes such as a Signaling Gateway and Media Gateway Controller or Media Gateway.

See the [IETF](/IETF)'s working group [sigtran-charter](http://www.ietf.org/html.charters/sigtran-charter.html).

# Protocols

  - RUDP: Reliable UDP, the predecessor to SCTP. Only an (expired) [Internet Draft](http://www3.ietf.org/proceedings/99mar/I-D/draft-ietf-sigtran-reliable-udp-00.txt), though a version of it is still used by Cisco.

  - [SCTP](/SCTP): Stream Control Transmission Protocol, [RFC2960](http://www.ietf.org/rfc/rfc2960.txt?number=2960)

SCTP has PPID's (Payload Protocol IDentifiers, see IANA's [list](http://www.iana.org/assignments/sctp-parameters)) for the following protocols:

  - [M2UA](/M2UA): Signaling System 7 (SS7) Message Transfer Part (MTP)2 - User Adaptation Layer [RFC3331](http://www.ietf.org/rfc/rfc3331.txt?number=3331)

  - [M2PA](/M2PA): Signaling System 7 (SS7) Message Transfer Part 2 (MTP2) - User Peer-to-Peer Adaptation Layer (M2PA) [RFC4165](http://www.ietf.org/rfc/rfc4165.txt?number=4165)

  - [M3UA](/M3UA): Signaling System 7 (SS7) Message Transfer Part (MTP)3 - User Adaptation Layer (M3UA) [RFC4666](http://www.ietf.org/rfc/rfc4666.txt?number=4666)

  - [IUA](/IUA): ISDN Q.921-User Adaptation Layer [RFC4233](http://www.ietf.org/rfc/rfc4233.txt)

  - [SUA](/SUA): Signalling Connection Control Part User Adaptation Layer (SUA) [RFC3868](http://www.ietf.org/rfc/rfc3868.txt?number=3868)

  - [V5UA](/V5UA): V5.2-User Adaption Layer (V5UA) [RFC3807](http://www.ietf.org/rfc/rfc3807.txt?number=3807)

  - [H248](/H248): MEGACO

  - [BICC](/BICC): Bearer Independent Call Control

  - [TALI](/TALI):

  - [DUA](/DUA): Digital Private Network Signaling System (DPNSS)/Digital Access Signaling System 2 (DASS 2)

  - Extensions to the IUA Protocol [RFC4129](http://www.ietf.org/rfc/rfc4129.txt?number=4129)

  - [ASAP](/ASAP):

  - [ENRP](/ENRP):

  - [H323](/H323):

  - [M2TP](/M2TP):

Which in turn can carry:

  - [ISDN](/ISDN): Integrated Services Digital Network

  - [Q.921](/Q.921): ISDN Q.921-User Adaptation Layer [RFC 3057](http://www.ietf.org/rfc/rfc3057.txt?number=3057)

  - [Q.931](/Q.931): ISDN user-network interface layer 3 specification for basic call control

  - [ISUP](/ISUP): ISDN User Part

  - [MTP3](/MTP3): Message Transfer Part Level 3

  - [SCCP](/SCCP): Signalling Connection Control Part

---

Imported from https://wiki.wireshark.org/SIGTRAN on 2020-08-11 23:24:41 UTC
