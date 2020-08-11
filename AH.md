# AH (Authentication Header)

The IP Authentication Header (AH) is used to provide connectionless integrity and data origin authentication for IP datagrams and to provide protection against replays. Currently AH is mainly described by the followings RFCs:

  - [RFC4301](http://www.ietf.org/rfc/rfc4301.txt), Security Architecture for the Internet Protocol, S. Kent, K. Seo, December 2005, PROPOSED STANDARD.

  - [RFC4302](http://www.ietf.org/rfc/rfc4302.txt), IP Authentication Header, S. Kent, December 2005, PROPOSED STANDARD.

The Algorithms to use and their requirements are described in [RFC4305](http://www.ietf.org/rfc/rfc4305.txt): Cryptographic Algorithm Implementation Requirements for Encapsulating Security Payload (ESP) and Authentication Header (AH), D. Eastlake 3rd, December 2005, PROPOSED STANDARD.

You also may use some others Cryptographic Algorithm (have a look at the IANA for some other examples).

## AH Algorithms (RFC 4305)

The AH Header described in [RFC4302](http://www.ietf.org/rfc/rfc4302.txt) is the following:

``` 
    0                   1                   2                   3
    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   | Next Header   |  Payload Len  |          RESERVED             |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                 Security Parameters Index (SPI)               |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    Sequence Number Field                      |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                                                               |
   +                Authentication Data (variable)                 |
   |                                                               |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

## AH Requirements

The implementation conformance requirements for security algorithms for AH are given below [RFC4305](http://www.ietf.org/rfc/rfc4305.txt). As you would suspect, all of these algorithms are authentication algorithms.

    Requirement    Algorithm (notes)
    -----------    ---------
    MUST           HMAC-SHA1-96 [RFC2404]
    SHOULD+        AES-XCBC-MAC-96 [RFC3566]
    MAY            HMAC-MD5-96 [RFC2403] (1)
    
    Note:
    
    (1) Weaknesses have become apparent in MD5; however, these should not
        affect the use of MD5 with HMAC.

---

Imported from https://wiki.wireshark.org/AH on 2020-08-11 23:11:04 UTC
