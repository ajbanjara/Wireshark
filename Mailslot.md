# SMB MailSlot Protocol (Mailslot)

The Mailslot protocol is part of the [SMB](/SMB) protocol family.

A mailslot is a (temporary) RAM-based file to which numerous records of data can be written and read by several computers on the same network (i.e., domain). See <http://msdn2.microsoft.com/en-us/library/aa365130.aspx> for details on the Microsoft Developer Network.

## History

XXX - add a brief description of Mailslot history

## Protocol dependencies

  - [SMB](/SMB): Typically, Mailslot uses [SMB](/SMB) as its transport protocol.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The Mailslot dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

There are no Mailslot specific preference settings.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of Mailslot display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/m/mailslot.html)

Show only the Mailslot based traffic:

``` 
 mailslot 
```

## Capture Filter

You cannot directly filter Mailslot protocols while capturing.

## External links

  - see [SMB](/SMB) page for further information

## Discussion

---

Imported from https://wiki.wireshark.org/Mailslot on 2020-08-11 23:16:26 UTC
