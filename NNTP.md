# Network News Transfer Protocol (NNTP)

As the name implies, NNTP is used to send and receive (USENET) news.

## History

The USENET (and therefore NNTP) is used since the early days of the internet.

Although Mailing lists and RSS feeds doing something similar, the USENET is still widely used today.

## Protocol dependencies

  - [TCP](/TCP): Typically, NNTP uses [TCP](/TCP) as its transport protocol. The well known TCP port for NNTP traffic is 119.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The PROTO dissector is (fully functional, partially functional, not existing, ... whatever the current state is).

## Preference Settings

There are no NNTP specific preference settings.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of NNTP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/n/nntp.html)

Show only the NNTP based traffic:

``` 
 nntp 
```

## Capture Filter

You cannot directly filter NNTP protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

## External links

  - [RFC 977](http://www.ietf.org/rfc/rfc977.txt) *Network News Transfer Protocol*

  - [RFC 1036](http://www.ietf.org/rfc/rfc1036.txt) *Standard for Interchange of USENET Messages*

## Discussion

---

Imported from https://wiki.wireshark.org/NNTP on 2020-08-11 23:17:31 UTC
