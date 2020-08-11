# Host Identity Protocol (HIP)

The Host Identity Protocol (HIP) is an Identity Exchange mechanism that enables secure communications with tunneling protocols such as ESP. HIP provides a method of separating the end-point identifier and locator roles of IP addresses. It introduces a new Host Identity (HI) name space, based on public keys, from which end-point identifiers are taken. The public keys are typically, but not necessarily, self generated. HIP uses existing IP addressing and forwarding for locators and packet delivery.

## Protocol dependencies

  - [TCP](/TCP): Typically, HIP uses [TCP](/TCP) as its transport protocol.

  - [UDP](/UDP): Typically, HIP uses [UDP](/UDP) as its transport protocol.
    
      Note: HIP is not limited to TCP and UDP usage.

## Example traffic

No. Time Source Destination Protocol Info

1 0.000000 193.167.187.26 193.234.218.203 HIP HIP I1 (HIP Initiator Packet)

... Host Identity Protocol

Payload Protocol: 59 Header Length: 4 Fixed P-bit: 0 (Always zero) Packet Type: 1 Version: 1, Reserved: 0 Fixed S-bit: 1 (HIP) Checksum: 0x3d4a (correct) HIP Controls: 0x0000

  - ... .... .... ...0 = Anonymous (Sender's HI is anonymous): False

Sender's HIT: 2001001c009d1d347d57bd541d10a393 Receiver's HIT: 2001001e2c023cbf8e65ee2b05a42820

No. Time Source Destination Protocol Info

2 0.037852 193.234.218.203 193.167.187.26 HIP HIP R1 (HIP Responder Packet)

... Host Identity Protocol

Payload Protocol: 59 Header Length: 74 Fixed P-bit: 0 (Always zero) Packet Type: 2 Version: 1, Reserved: 0 Fixed S-bit: 1 (HIP) Checksum: 0x9fb9 (correct) HIP Controls: 0x0000

  - ... .... .... ...0 = Anonymous (Sender's HI is anonymous): False

Sender's HIT: 2001001e2c023cbf8e65ee2b05a42820 Receiver's HIT: 2001001c009d1d347d57bd541d10a393 HIP Parameters

  - R1\_COUNTER (type=128, length=12)
      - Reserved: 0x00000000 R1 Counter: 0000000000001045
    PUZZLE (type=257, length=12)
      - Difficulty (K): 10 Lifetime: 37 Opaque Data: 0x0000 Random number (I): 23c8b08466518471
    DIFFIE\_HELLMAN (type=513, length=195)
      - 3 (1536-bit MODP group) Public Value Length: 192 Public Value: c6d90a4e31a12b297b00162e7ce87d4eac71f53e032a7088...
    HIP\_TRANSFORM (type=577, length=4)
      - 1 (AES-CBC with HMAC-SHA1) 2 (3DES-CBC with HMAC-SHA1)
    ESP\_TRANSFORM (type=4095, length=6)
      - Reserved: 0x0000 1 (AES-CBC with HMAC-SHA1) 2 (3DES-CBC with HMAC-SHA1)
    HOST\_ID (type=705, length=140)
      - Host Identity Length: 136 Domain Identifier Type: 0 Domain Identifier Length: 0 Host Identity flags: 0x0202ff05
          - 0000 0010 0000 0010 .... .... .... .... = Host Identity Header Flags: Key is associated with non-zone entity (0x00000202)
          - ... .... .... .... 1111 1111 .... .... = Host Identity Header Protocol: Key is valid for any protocol (0x000000ff)
          - ... .... .... .... .... .... 0000 0101 = Host Identity Header Algorithm: RSA (0x00000005)
        RSA Host Identity exponent length (e\_len): 3 RSA Host Identity exponent (e): 010001 RSA Host Identity public modulus (n): bb7af53ff1a61b2186c468e1680d46084af340ee252cb4ce...
    HIP\_SIGNATURE\_2 (type=61633, length=129)
      - 5 (RSA) Signature: 5c942e27bfb3002c645902d8106780f96bc71c503f11b00b...
    ECHO\_REQUEST\_UNSIGNED (type=63661, length=20)
      - Opaque Data: d390247cef89e3a61d8775701b1452bae218f0c6

No. Time Source Destination Protocol Info

3 0.052798 193.167.187.26 193.234.218.203 HIP HIP I2 (Second HIP Initiator Packet)

... Host Identity Protocol

Payload Protocol: 59 Header Length: 84 Fixed P-bit: 0 (Always zero) Packet Type: 3 Version: 1, Reserved: 0 Fixed S-bit: 1 (HIP) Checksum: 0x70ea (correct) HIP Controls: 0x0000

  - ... .... .... ...0 = Anonymous (Sender's HI is anonymous): False

Sender's HIT: 2001001c009d1d347d57bd541d10a393 Receiver's HIT: 2001001e2c023cbf8e65ee2b05a42820 HIP Parameters

  - ESP\_INFO (type=65, length=12)
      - Reserved: 0x0000 Keymaterial Index: 0x0048 Old SPI: 0x00000000 New SPI: 0xc1905228
    R1\_COUNTER (type=128, length=12)
      - Reserved: 0x00000048 R1 Counter: 0000000000001045
    SOLUTION (type=321, length=20)
      - Difficulty (K): 10 Reserved: 0 Opaque Data: 0x0000 Random number (I): 23c8b08466518471 Solution (J): 4540f2538515f5d3
    DIFFIE\_HELLMAN (type=513, length=195)
      - 3 (1536-bit MODP group) Public Value Length: 192 Public Value: 579c9096ead9be2d39e59173d4d4985a15910ea8702f3b5b...
    HIP\_TRANSFORM (type=577, length=2)
      - 1 (AES-CBC with HMAC-SHA1)
    ENCRYPTED (type=641, length=180)
      - Reserved: 0x00000000 Encrypted Parameter Data (176 bytes)
    ESP\_TRANSFORM (type=4095, length=4)
      - Reserved: 0x0000 1 (AES-CBC with HMAC-SHA1)
    HMAC (type=61505, length=20)
      - HMAC: 5357199e5c4251ff155a23479dbb1c813c4a7e5c
    HIP\_SIGNATURE (type=61697, length=129)
      - 5 (RSA) Signature: 505f0ddc50bc9067147ab6cb00ab99b1c9f87f271712f875...
    ECHO\_RESPONSE\_UNSIGNED (type=63425, length=20)
      - Opaque Data: d390247cef89e3a61d8775701b1452bae218f0c6

No. Time Source Destination Protocol Info

4 0.198993 193.234.218.203 193.167.187.26 HIP HIP R2 (Second HIP Responder Packet)

... Host Identity Protocol

Payload Protocol: 59 Header Length: 26 Fixed P-bit: 0 (Always zero) Packet Type: 4 Version: 1, Reserved: 0 Fixed S-bit: 1 (HIP) Checksum: 0x5728 (correct) HIP Controls: 0x0000

  - ... .... .... ...0 = Anonymous (Sender's HI is anonymous): False

Sender's HIT: 2001001e2c023cbf8e65ee2b05a42820 Receiver's HIT: 2001001c009d1d347d57bd541d10a393 HIP Parameters

  - ESP\_INFO (type=65, length=12)
      - Reserved: 0x0000 Keymaterial Index: 0x0048 Old SPI: 0x00000000 New SPI: 0x3b71d381
    HMAC\_2 (type=61569, length=20)
      - HMAC: abe35f9e9fc6e1ca12526eb4ed195a44f9e29dd1
    HIP\_SIGNATURE (type=61697, length=129)
      - 5 (RSA) Signature: 818c6d10afe29450f90159289948f55d3175ab94b514d947...

## Wireshark

The HIP dissector is fully functional and conforms to the following specifications:

RFC 5201, RFC 5202, RFC 5203, RFC 5204. RFC 5206, draft-ietf-hip-nat-traversal-09 (RFC 5770), draft-ietf-hip-cert-03

## Display Filter

A complete list of HIP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/protofirstletter/proto.html)

Show only the HIP based traffic:

``` 
 hip 
```

## External links

  - [RFC 4423](http://www.ietf.org/rfc/rfc4423.txt) *Host Identity Protocol (HIP) Architecture*.

  - [RFC 5201](http://www.ietf.org/rfc/rfc5201.txt) *Host Identity Protocol*.

  - [RFC 5202](http://www.ietf.org/rfc/rfc5202.txt) *Using the Encapsulating Security Payload (ESP) Transport Format with the Host Identity Protocol (HIP)*.

  - [RFC 5203](http://www.ietf.org/rfc/rfc5203.txt) *Host Identity Protocol (HIP) Registration Extension*.

  - [RFC 5204](http://www.ietf.org/rfc/rfc5204.txt) *Host Identity Protocol (HIP) Rendezvous Extension*.

  - [RFC 5206](http://www.ietf.org/rfc/rfc5206.txt) *End-Host Mobility and Multihoming with the Host Identity Protocol*.

  - [RFC 5770](http://www.ietf.org/rfc/rfc5770.txt) *Basic Host Identity Protocol (HIP) Extensions for Traversal of Network Address Translators*.

  - [Draft HIP CERT](http://www.ietf.org/id/draft-ietf-hip-cert-03.txt) *HIP Certificates*.

---

Imported from https://wiki.wireshark.org/HIP on 2020-08-11 23:14:40 UTC
