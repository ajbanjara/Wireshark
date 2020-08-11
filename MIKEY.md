# Multimedia Internet KEYing (MIKEY)

MIKEY is a key management scheme used with SIP/SDP and H.323/H.235.

## History

MIKEY was made an RFC in August 2004, and was updated with two new modes in September 2006 and November 2006.

## Protocol dependencies

  - [SDP](/SDP): Typically, MIKEY is transported in a key-mgmt attribute in a [SDP](/SDP) offer or answer.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The MIKEY dissector is partially functional. There are currently no support for CHASH and ERR payloads, and no support for authentication and decryption.

## Preference Settings

  - MIKEY UDP port: [UDP](/UDP) port to expect MIKEY traffic on (default 2269).

  - MIKEY TCP port: [TCP](/TCP) port to expect MIKEY traffic on (default 2269).

## Example capture file

Capture file containing two MIKEY messages: Pre-shared and PSK ver msg. Pre-shared key is "secret".

  - [SampleCaptures/mikey\_psk.pcap](uploads/__moin_import__/attachments/SampleCaptures/mikey_psk.pcap)

## Display Filter

A complete list of MIKEY display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/m/mikey.html)

Show only the MIKEY based traffic:

``` 
 mikey 
```

## Capture Filter

You cannot directly filter MIKEY protocols while capturing.

## External links

  - [RFC 3830](http://www.ietf.org/rfc/rfc3830.txt) *MIKEY: Multimedia Internet KEYing*.

  - [RFC 4650](http://www.ietf.org/rfc/rfc4650.txt) *HMAC-Authenticated Diffie-Hellman*
    
    for Multimedia Internet KEYing (MIKEY)
    
    </em>.
    
    </p>

<li>

[RFC 4738](http://www.ietf.org/rfc/rfc4738.txt) *MIKEY-RSA-R: An Additional Mode of Key Distribution in Multimedia Internet KEYing (MIKEY)*.

</li>

<li>

<http://www.minisip.org/publications.html> Secure VoIP publications from KTH, Stockholm.

</li>

## Discussion

---

Imported from https://wiki.wireshark.org/MIKEY on 2020-08-11 23:16:44 UTC
