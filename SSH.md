# Secure Shell (SSH)

Secure Shell (SSH) is a replacement for older remote shell programs such as telnet. SSH uses encryption to protect the contents (most notably passwords) being sent over its connection.

## History

XXX - add a brief description of SSH history

## Protocol dependencies

  - [TCP](/TCP): Typically, SSH uses [TCP](/TCP) as its transport protocol. The well known TCP port for SSH traffic is 22.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The SSH dissector in Wireshark is functional, dissecting most of the connection setup packets which are not encrypted.

Unlike the [TLS](/TLS) dissector, no code has been written to decrypt encrypted SSH packets/payload (yet). This is also not possible unless the shared secret (from the Diffie-Hellman key exchange) is extracted from the SSH server or client (see, as an example of a mechanism to extract internal information of that sort, the "SSLKEYLOGFILE" method in [TLS](/TLS)). Work on SSH2 decryption is tracked at <https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=16054>

## Preference Settings

The SSH dissector has a preference to determine whether it should reassemble PDUs spread across multiple TCP segments. For this to work the [TCP](/TCP) option "Allow subdissectors to reassemble TCP streams" must be enabled.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of SSH display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/s/ssh.html)

Show only the SSH based traffic:

``` 
 ssh 
```

## Capture Filter

You cannot directly filter SSH protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

## External links

  - [RFC 4250 - The Secure Shell (SSH) Protocol Assigned Numbers](https://tools.ietf.org/html/rfc4250)

  - [RFC 4251 - The Secure Shell (SSH) Protocol Architecture](https://tools.ietf.org/html/rfc4251)

  - [RFC 4252 - The Secure Shell (SSH) Authentication Protocol](https://tools.ietf.org/html/rfc4252)

  - [RFC 4253 - The Secure Shell (SSH) Transport Layer Protocol](https://tools.ietf.org/html/rfc4253)

  - [RFC 4254 - The Secure Shell (SSH) Connection Protocol](https://tools.ietf.org/html/rfc4254)

  - [RFC 4419 - Diffie-Hellman Group Exchange for the Secure Shell (SSH) Transport Layer Protocol](https://tools.ietf.org/html/rfc4419)

  - [RFC 5656 - Elliptic Curve Algorithm Integration in the Secure Shell Transport Layer](https://tools.ietf.org/html/rfc5656)

  - [Other documents from the concluded Secure Shell (secsh) IETF working group](https://datatracker.ietf.org/wg/secsh/documents/)

  - [IANA: Secure Shell (SSH) Protocol Parameters](https://www.iana.org/assignments/ssh-parameters/ssh-parameters.xhtml)

## Discussion

---

Imported from https://wiki.wireshark.org/SSH on 2020-08-11 23:25:52 UTC
