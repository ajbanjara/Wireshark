# File Transfer Protocol (FTP)

As the name implies, FTP is used to transfer files.

## Security

FTP uses plain text passwords, so take care.

## History

XXX - add a brief description of FTP history

## Protocol dependencies

  - [TCP](/TCP): Typically, FTP uses [TCP](/TCP) as its transport protocol. The well known TCP port for FTP control is 21 and for FTP data is 20. However, the FTP data port is negotiated through the control port and will typically vary in an "unpredictable" manner.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The FTP dissector is fully functional.

## Preference Settings

There are no FTP specific preference settings.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of FTP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/f/ftp.html)

Show only the FTP based traffic:

``` 
 ftp 
```

## Capture Filter

You cannot directly filter FTP protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

## External links

  - [RFC 959](http://www.ietf.org/rfc/rfc959.txt) *FILE TRANSFER PROTOCOL (FTP)*

  - [FTP](http://en.wikipedia.org/wiki/Ftp) at Wikipedia.org

## Discussion

---

Imported from https://wiki.wireshark.org/FTP on 2020-08-11 23:14:13 UTC
