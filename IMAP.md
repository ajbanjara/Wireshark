# Internet Message Access Protocol (IMAP)

This protocol is widely use to manage e-Mail at a mail server and receive e-Mail from it.

An alternative to receive mail is the former [POP](/POP) protocol, which doesn't allow to manage the mails on the server.

Sending mail to a server - on the other hand - is done using [SMTP](/SMTP).

## History

The "former" [POP](/POP) protocol offers less features, but both IMAP and POP protocols are still widely used today.

## Protocol dependencies

  - [TCP](/TCP): Typically, IMAP uses [TCP](/TCP) as its transport protocol. The well known TCP port for IMAP traffic is 143.

  - IMAP uses [MIME\_multipart](/MIME_multipart) to transfer attachments.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The IMAP dissector is fully functional (is this true?).

## Preference Settings

There are no IMAP specific preference settings.

## Example capture file

[imap.cap](uploads/__moin_import__/attachments/SampleCaptures/imap.cap) (libpcap) A short IMAP session using Mutt against an MSX server.

File: imap-ssl.pcapng (10 KB, from <https://git.lekensteyn.nl/peter/wireshark-notes/commit/tls/imap-ssl.pcapng?id=1123e936365c89d43e9f210872778d81223af36d>, SSL keys in capture file comments)

## Display Filter

A complete list of IMAP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/i/imap.html)

Show only the IMAP based traffic:

``` 
 imap 
```

## Capture Filter

You cannot directly filter IMAP protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

## External links

  - [RFC 2060](http://www.ietf.org/rfc/rfc2060.txt) *INTERNET MESSAGE ACCESS PROTOCOL - VERSION 4rev1 (obsolete)*

  - [RFC 3501](http://www.ietf.org/rfc/rfc3501.txt) *INTERNET MESSAGE ACCESS PROTOCOL - VERSION 4rev1*

  - [RFC 3502](http://www.ietf.org/rfc/rfc3502.txt) *Internet Message Access Protocol (IMAP) - MULTIAPPEND Extension*

  - [RFC 3503](http://www.ietf.org/rfc/rfc3503.txt) *Message Disposition Notification (MDN) profile for Internet Message Access Protocol (IMAP)*

## Discussion

---

Imported from https://wiki.wireshark.org/IMAP on 2020-08-11 23:15:05 UTC
