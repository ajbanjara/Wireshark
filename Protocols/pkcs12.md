# Personal Information Exchange Syntax (pkcs12)

(Public Key Cryptography Standard 12)

This standard describes a transfer syntax for personal identity information, including private keys, certificates, miscellaneous secrets, and extensions. Machines, applications, browsers, Internet kiosks, and so on, that support this standard will allow a user to import, export, and exercise a single set of personal identity information.

This standard supports direct transfer of personal information under several privacy and integrity modes. The most secure of the privacy and integrity modes require the source and destination platforms to have trusted public/private key pairs usable for digital signatures and encryption, respectively. The standard also supports lower security, password-based privacy and integrity modes for those cases where trusted public/private key pairs are not available.

## History

PKCS12 was developed by RSA Laboratories in 1999, based upon PKCS8.

## Protocol dependencies

There are no protocol dependencies for PKCS12.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The PKCS12 dissector is fully functional though it is not capable of decrypting and displaying the encrypted components.

## Preference Settings

There are no preference settings for PKCS12.

## Example capture file

Below is a sample PKCS12 file, which is a raw ASN.1 file and not a network capture file.

  - [SampleCaptures/pkcs12.pfx](uploads/__moin_import__/attachments/SampleCaptures/pkcs12.pfx)

There are many more samples available within the *Certificate Builder and Test Utilities* package available at the [BAe Systems website](http://www.digitalnet.com/knowledge/download.htm).

## Display Filter

A complete list of PROTO display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/p/pkcs12.html)

Show only the PKCS12 based traffic:

``` 
 pkcs12 
```

## Capture Filter

There is no specific capture filter for the PKCS12. However, PKCS12 may be dissected by loading *.pfx* or *.p12* files directly into Wireshark. PKCS12 may also be seen in an [LDAP](/LDAP) capture within a *userPKCS12* attribute.

## External links

  - <ftp://ftp.rsasecurity.com/pub/pkcs/pkcs-12/pkcs-12v1.pdf> *PKCS 12 v1.0: Personal Information Exchange Syntax*

  - <ftp://ftp.rsasecurity.com/pub/pkcs/pkcs-12/pkcs-12.asn> *ASN.1 Module*

## Discussion

---

Imported from https://wiki.wireshark.org/Protocols/pkcs12 on 2020-08-11 23:21:50 UTC
