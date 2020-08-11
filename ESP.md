# ESP (Encapsulating Security Payload)

ESP is used to provide confidentiality, data origin authentication, connectionless integrity, an anti-replay service (a form of partial sequence integrity), and limited traffic flow confidentiality. Currently ESP is mainly described by the following RFCs:

  - [RFC4301](http://www.ietf.org/rfc/rfc4301.txt), Security Architecture for the Internet Protocol, S. Kent, K. Seo, December 2005, PROPOSED STANDARD.

  - [RFC4303](http://www.ietf.org/rfc/rfc4303.txt), IP Encapsulating Security Payload (ESP), S. Kent, December 2005, PROPOSED STANDARD.

The Algorithms to use and their requirements are described in [RFC4305](http://www.ietf.org/rfc/rfc4305.txt): Cryptographic Algorithm Implementation Requirements for Encapsulating Security Payload (ESP) and Authentication Header (AH), D. Eastlake 3rd, December 2005, PROPOSED STANDARD.

You also may use some other Cryptographic Algorithms (have a look at the IANA for some other examples).

## ESP Algorithms (RFC 4305)

The ESP Format is the following:

``` 
    0                   1                   2                   3    
    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1    
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               Security Parameters Index (SPI)                 |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                      Sequence Number                          |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                    Payload Data (variable)                    |
    ~                                                               ~
    |                                                               |
    +               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |     Padding (0-255 bytes)                     |
    +-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                               |  Pad Length   | Next Header   |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                 Authentication Data (variable)                |
    ~                                                               ~
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

## ESP Requierements

The followings tables [RFC4305](http://www.ietf.org/rfc/rfc4305.txt) list Encryption and Authentication algorithms for the IPsec Encapsulating Security Payload protocol.

    Requirement    Encryption Algorithm (notes)
    -----------    --------------------
    MUST           NULL (1)
    MUST-          TripleDES-CBC [RFC2451]
    SHOULD+        AES-CBC with 128-bit keys [RFC3602]
    SHOULD         AES-CTR [RFC3686]
    SHOULD NOT     DES-CBC [RFC2405] (3)
    
    Requirement    Authentication Algorithm (notes)
    -----------    ------------------------
    MUST           HMAC-SHA1-96 [RFC2404]
    MUST           NULL (1)
    SHOULD+        AES-XCBC-MAC-96 [RFC3566]
    MAY            HMAC-MD5-96 [RFC2403] (2)
    
    Notes:
    
    (1) Since ESP Encryption and Authentication are optional, support
        for the two "NULL" algorithms is required to maintain consistency
        with the way these services are negotiated.  Note that while
        Authentication and Encryption can each be "NULL", they MUST NOT
        both be "NULL".
    (2) Weaknesses have become apparent in MD5; however, these should not
        affect the use of MD5 with HMAC.
    (3) DES, with its small key size and publicly demonstrated and
        open-design special-purpose cracking hardware, is of questionable
        security for general use.

## Wireshark

ESP dissector is fully functional. If libgcrypt was linked with Wireshark, Wireshark provides some advanced features such as Decryption of ESP Payloads and/or Authentication Checking.

Currently it takes into account following encryption Algorithms :

  - NULL Encryption.

  - TripleDES-CBC [RFC2451](http://www.ietf.org/rfc/rfc2451.txt) with key length of 192 bits.

  - AES-CBC with 128-bit keys [RFC3602](http://www.ietf.org/rfc/rfc3602.txt) with key length of 128/192/256 bits.

  - AES-CTR [RFC3686](http://www.ietf.org/rfc/rfc3686.txt) with key length of 160/224/288 bits. The remaining 32 bits will be used as nonce.

  - DES-CBC [RFC2405](http://www.ietf.org/rfc/rfc2405.txt) with key length of 64 bits.

  - BLOWFISH-CBC [RFC2451](http://www.ietf.org/rfc/rfc2451.txt) with key length of only 128 bits.

  - TWOFISH-CBC with key of 128/256 bits.

It also permit to check Authentication for following Algorithms :

  - NULL Authentication.

  - HMAC-SHA1-96 [RFC2404](http://www.ietf.org/rfc/rfc2404.txt) : any keylen

  - HMAC-MD5-96 [RFC2403](http://www.ietf.org/rfc/rfc2403.txt) : any keylen

  - HMAC-SHA256 : any keylen

## Preference Settings

To be able to decrypt ESP Payload or check ESP Authenticator, you need to give corresponding elements to the ESP Preferences Menu of Wireshark (cf [ESP\_Preferences](/ESP_Preferences)).

## Example capture file

Some Examples capture files with the Security Associations used are available Here :

  - [SampleCaptures/ipsec\_esp\_capture\_1.tgz](uploads/__moin_import__/attachments/SampleCaptures/ipsec_esp_capture_1.tgz)
    
    Example for ESP payload Decryption and Authentication Checking for simple transport mode in v4/v6.

  - [SampleCaptures/ipsec\_esp\_capture\_2.tgz](uploads/__moin_import__/attachments/SampleCaptures/ipsec_esp_capture_2.tgz)
    
    Example for ESP payload Decryption and Authentication Checking for tunnel mode in v4.

  - [SampleCaptures/ipsec\_esp\_capture\_3.tgz](uploads/__moin_import__/attachments/SampleCaptures/ipsec_esp_capture_3.tgz)
    
    Example for ESP payload Decryption with Authentication Checking for some more Encryption Algorithms not defined in RFC4305.

  - [SampleCaptures/ipsec\_esp\_capture\_4.tgz](uploads/__moin_import__/attachments/SampleCaptures/ipsec_esp_capture_4.tgz "Upload new attachment \"ipsec_esp_capture_4.tgz\"")
    
    Example of ESP Authentication Checking without Decryption for HMAC-MD5-96 \[RFC2403\] / HMAC-SHA1-96 \[RFC2404\] / Null Authentication.

  - [SampleCaptures/ipsec\_esp\_capture\_5.tgz](uploads/__moin_import__/attachments/SampleCaptures/ipsec_esp_capture_5.tgz)
    
    Example of Authentication Checking and Decryption using Hexadecimal keys.

---

Imported from https://wiki.wireshark.org/ESP on 2020-08-11 23:13:50 UTC
