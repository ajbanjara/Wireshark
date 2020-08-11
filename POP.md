# Post Office Protocol (POP)

This protocol is widely use to receive e-Mail from a mail server.

An alternative to receive mail is the more recent [IMAP](/IMAP) protocol, which additionally allows to manage the mails on the server without moving them to the mail client first.

Sending mail to a server - on the other hand - is done using [SMTP](/SMTP).

## History

The RFC 918 describes the "POST OFFICE PROTOCOL" version 2, which is obsoleted by RFC 1939 "Post Office Protocol - Version 3" used today.

The successor protocol [IMAP](/IMAP) offers some advanced features (not available with POP), but both IMAP and POP protocols are still widely used today.

## Protocol dependencies

  - [TCP](/TCP): Typically, POP uses [TCP](/TCP) as its transport protocol. The well known TCP port for POP traffic is 110.

  - POP uses [MIME\_multipart](/MIME_multipart) to transfer attachments.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The POP dissector is fully functional.

## Preference Settings

(XXX add links to preference settings affecting how POP is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of POP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/p/pop.html)

Show only the POP based traffic:

``` 
 pop 
```

## Capture Filter

You cannot directly filter POP protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Show only the POP based traffic:

``` 
 tcp port pop3 
```

## External links

  - [RFC 1939](http://www.ietf.org/rfc/rfc1939.txt) *Post Office Protocol - Version 3*

  - [RFC 1082](http://www.ietf.org/rfc/rfc1082.txt) *POP3 Extended Service Offerings*

  - [RFC 1734](http://www.ietf.org/rfc/rfc1734.txt) *POP3 AUTHentication command*

  - [RFC 2595](http://www.ietf.org/rfc/rfc2595.txt) *Using TLS with IMAP, POP3 and ACAP*

  - [RFC 2449](http://www.ietf.org/rfc/rfc2449.txt) *POP3 Extension Mechanism*

  - [RFC 3206](http://www.ietf.org/rfc/rfc3206.txt) *The SYS and AUTH POP Response Codes*

  - [RFC 918](http://www.ietf.org/rfc/rfc918.txt) *POST OFFICE PROTOCOL* (this is obsolete version 2)

## Discussion

---

Imported from https://wiki.wireshark.org/POP on 2020-08-11 23:17:59 UTC
