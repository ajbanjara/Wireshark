# Simple Mail Transfer Protocol (SMTP)

This protocol is widely use to send e-Mail from the authors mail program to the mail server and between servers too.

Receiving mail from a server - on the other hand - is done using [POP](/POP) or [IMAP](/IMAP).

## History

SMTP is existing since the early days of the internet and was one of the first protocols used.

## Protocol dependencies

  - [TCP](/TCP): Typically, SMTP uses [TCP](/TCP) as its transport protocol. The well known TCP port for SMTP traffic is 25.

  - SMTP uses [MIME\_multipart](/MIME_multipart) to transfer attachments

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The SMTP dissector is fully functional.

## Preference Settings

(XXX add links to preference settings affecting how SMTP is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of SMTP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/s/smtp.html)

  - Show only the SMTP based traffic:
    
    ``` 
     smtp
    ```

  - Show only the SMTP based traffic with the "MAIL FROM" command:
    
    ``` 
     smtp.req.parameter contains "FROM"
    ```

## Capture Filter

You cannot directly filter SMTP protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

## External links

  - [RFC821](http://www.ietf.org/rfc/rfc821.txt) SIMPLE MAIL TRANSFER PROTOCOL

  - [RFC822](http://www.ietf.org/rfc/rfc822.txt) STANDARD FOR THE FORMAT OF ARPA INTERNET TEXT MESSAGES

  - [RFC2821](http://www.ietf.org/rfc/rfc2821.txt) Simple Mail Transfer Protocol (updates and clarification)

  - [More Info on SMTP](http://blog.webhosting.uk.com/2006/06/07/simple-mail-transfer-protocol-smtp)

## Discussion

---

Imported from https://wiki.wireshark.org/SMTP on 2020-08-11 23:25:44 UTC
