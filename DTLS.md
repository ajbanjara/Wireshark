# Datagram Transport Layer Security (DTLS)

DTLS is a derivation of SSL protocol. It provides the same security services (integrity, authentification and confidentiality) but under UDP protocol. DTLS is implemented by several projects including [CyaSSL](http://www.yassl.com) and the [OpenSSL project](http://www.openssl.org).

## History

This protocol was created to do that which SSL can't : to create a secure protocol under UDP. It's why this protocol is an adaptation of TLS 1.1

## Protocol dependencies

  - [UDP](/UDP): Typically DTLS uses [UDP](/UDP) as its transport protocol. There is no well known UDP port for DTLS traffic. OpenSSL v0.9.8b uses port 4433.

## Wireshark

The DTLS dissector works with the OpenSSL v0.9.8b DTLS implementation. It was written by [Authesserre Samuel](mailto:sauthess@gmail.com).

## Preference Settings

If Wireshark is compiled with SSL decryption support, there will be a new option in the preferences for DTLS. This only works for RSA key exchange if the RSA keys can be provided. Study the [SSL](/SSL) page for details how to configure the RSA private key.

## Example capture file

Set RSA configuration to IP address:127.0.0.1, Port:4433, Protocol:data, Key File:/path/to/snakeoil-rsa.key

  - [SampleCaptures/snakeoil.tgz](uploads/__moin_import__/attachments/SampleCaptures/snakeoil.tgz)

## Create sample data

From ASK quesiton [Decrypt DTLS packet](https://ask.wireshark.org/question/23865/decrypt-dtls-packet/) :  

Here's a working scenario on a Linux box,

Start Wireshark, set DTLS preferences Pre-Shared Key to `0102030405060708090a0b0c0d0e0f`  
(Important to start capture before bringing up session below)  

As a server run this in a Linux console

```
$ PSK=0102030405060708090a0b0c0d0e0f
$ openssl s_server -dtls -psk $PSK -cipher PSK-AES128-CBC-SHA -nocert -accept 23000
```
As a client run this in another Linux console

```
$ PSK=0102030405060708090a0b0c0d0e0f
$ openssl s_client -psk $PSK -dtls -connect 127.0.0.1:23000
```
Type something in the client console and press enter, it should show up on the server console, and in Wireshark the DTLS packets should show this same data in an Application Data packet.

## Display Filter

A complete list of PROTO display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/d/dtls.html).

Show only the DTLS based traffic:

``` 
 dtls 
```

## Capture Filter

You cannot directly filter DTLS protocols while capturing. However, if you know the [UDP](/UDP) port used (see above), you can filter on that one.

Capture only the DTLS traffic over the default port (80):

``` 
 udp port 80 
```

## External links

  - [RFC 4347](http://tools.ietf.org/html/4347) *Datagram Transport Layer Security* - Definition of the DTLS protocol.

  - <http://crypto.stanford.edu/~nagendra/papers/dtls.pdf> *The Design and Implementation of Datagram TLS* - Why and how DTLS was made...

## Discussion

---

Imported from https://wiki.wireshark.org/DTLS on 2020-08-11 23:13:39 UTC
