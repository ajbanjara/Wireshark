# DIAMETER

\[*From RFC 3588*\] "The Diameter base protocol is intended to provide an Authentication, Authorization and Accounting (AAA) framework for applications such as network access or IP mobility. Diameter is also intended to work in both local Authentication, Authorization & Accounting and roaming situations. This document specifies the message format, transport, error reporting, accounting and security services to be used by all Diameter applications. The Diameter base application needs to be supported by all Diameter implementations".

## History

This is the successor of the [RADIUS](/RADIUS) protocol.

## Protocol dependencies

  - [TCP](/TCP) or [SCTP](/SCTP): Typically DIAMETER uses [TCP](/TCP) or [SCTP](/SCTP) as its transport protocol. Its well-known port is 3868. Its well-known SCTP Payload Protocol Identifier is 46 (47 when encrypted with [DTLS](/DTLS)).

## Example traffic

    Diameter Protocol
        Version: 0x01
        Length: 312
        Flags: 0x80
        Command Code: 272 Credit-Control
        ApplicationId: 16777266
        Hop-by-Hop Identifier: 0x00000002
        End-to-End Identifier: 0x00000002
        [Answer In: 6]
        AVP: Session-Id(263) l=47 f=-M- val=rosso.C1R1.com;4FD78691;5458;3B9ACA00;0
        AVP: Origin-Host(264) l=22 f=-M- val=rosso.C1R1.com
        AVP: Origin-Realm(296) l=16 f=-M- val=C1R1.com
        AVP: Destination-Realm(283) l=14 f=-M- val=R1.com
        AVP: CC-Request-Type(416) l=12 f=-M- val=INITIAL_REQUEST (1)
        AVP: CC-Request-Number(415) l=12 f=-M- val=0
        AVP: Subscription-Id(443) l=44 f=-M-

## Wireshark

The DIAMETER dissector is fully functional. The dissection of AVPs is specified in .xml files in the diameter directory. You can add AVP dissection of vendor-specific or missing AVPs by editing those files. If you add publicly available AVPs please send us the updates.

Currently there is a problem with application Id: if two AVPs have the same vendor Id but different Application ID WS can't distinguish between them ([Bug 1494](http://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1494)).

A known problem is 3GPP vendor specific AVPs in the range 1 - 26 in TGPPGmb.xml and imscxdx.xml which are mutually exclusive; depending on which 3GPP interface you are tracing one set will have to be commented out. (In the Wireshark distribution, the set in imscxdx.xml is commented out).

## Preference Settings

  - TCP Port(s)/range. TCP packets on this port(s)/range will be dissected as Diameter.
  - SCTP port(s)/range. SCTP packets on this port will be dissected as Diameter.
  - Reassemble Diameter messages spanning multiple TCP segments. Default on.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of DIAMETER display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/d/diameter.html)

Show only DIAMETER traffic:

``` 
 diameter 
```

## Capture Filter

You cannot directly filter DIAMETER protocols while capturing. However, if you know the [TCP](/TCP) or [SCTP](/SCTP) port used (see above), you can filter on that one.

Capture DIAMETER traffic over the default TCP port (3868):

``` 
 tcp port 3868 
```

Capture DIAMETER traffic over the default SCTP port (3868):

``` 
 sctp port 3868 
```

## External links

  - [RFC 3588](http://www.ietf.org/rfc/rfc3588.txt) *Diameter Base Protocol*

  - [RFC 3589](http://www.ietf.org/rfc/rfc3589.txt) *Diameter Command Codes for Third Generation Partnership Project (3GPP) Release 5*

  - [RFC 4004](http://www.ietf.org/rfc/rfc4004.txt) *Diameter Mobile IPv4 Application*

  - [RFC 4005](http://www.ietf.org/rfc/rfc4005.txt) *Diameter Network Access Server Application*

  - [RFC 4006](http://www.ietf.org/rfc/rfc4006.txt) *Diameter Credit-control Application*

  - [RFC 4072](http://www.ietf.org/rfc/rfc4072.txt) *Diameter Extensible Authentication Protocol (EAP) Application*

  - [RFC 4740](http://www.ietf.org/rfc/rfc4740.txt) *Diameter Session Initiation Protocol (SIP) Application*

  - [aaa-parameters](http://www.iana.org/assignments/aaa-parameters)

  - [IETF aaa-charter](http://www.ietf.org/html.charters/aaa-charter.html)

  - [Introduction to Diameter](http://www.interlinknetworks.com/whitepapers/Intro_to_Diameter.htm)

Internet-drafts:

\* [Client SMTP Validation (CSV)](http://www.ietf.org/internet-drafts/draft-ietf-marid-csv-intro-02.txt)

Open source Diameter implementation:

  - [freeDiameter : Open Source (BSD) C implementation of Diameter for Linux, FreeBSD, ...](http://www.freediameter.net/)

  - [Open Source GPL Diameter in Java, maintained by Traffix Systems](http://www.traffixsystems.com/)

  - [Open Diameter](http://diameter.sourceforge.net/) - last updated in 2004

## Discussion

---

Imported from https://wiki.wireshark.org/DIAMETER on 2020-08-11 23:13:31 UTC
