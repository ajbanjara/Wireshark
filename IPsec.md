# IPsec (Internet Protocol Security)

A set of protocols developed by the IETF to support secure exchange of packets at the IP layer.

## IPsec Algorithms And Keys

The currently used version of IPsec (or more specifically IKE) is version 1, which is specified in RFCs 2401-2412 (plus some more).

Version 2 of IPsec is mainly described by the three following RFCs. Note though, that there are very few products that already implement IPsec version 2.

  - [RFC4301](http://www.ietf.org/rfc/rfc4301.txt), Security Architecture for the Internet Protocol, S. Kent, K. Seo, December 2005, PROPOSED STANDARD.

  - [RFC4302](http://www.ietf.org/rfc/rfc4302.txt), IP Authentication Header, S. Kent, December 2005, PROPOSED STANDARD.

  - [RFC4303](http://www.ietf.org/rfc/rfc4303.txt), IP Encapsulating Security Payload (ESP), S. Kent, December 2005, PROPOSED STANDARD.

The Algorithms to use and their requirements are described in [RFC4305](http://www.ietf.org/rfc/rfc4305.txt): Cryptographic Algorithm Implementation Requirements for Encapsulating Security Payload ([ESP](/ESP)) and Authentication Header ([AH](/AH)), D. Eastlake 3rd, December 2005, PROPOSED STANDARD.

You also may use some other Cryptographic Algorithms (have a look at the IANA for some other examples).

## Wireshark

If linked with Libcrypt Wireshark provides some advanced features such as Decryption of ESP Payloads and/or Authentication Checking. see [ESP\_Preferences](/ESP_Preferences)

Is this true for Win32? *[UlfLamping](/UlfLamping)*

---

Imported from https://wiki.wireshark.org/IPsec on 2020-08-11 23:15:16 UTC
