# NetBIOS over IPX

The NetBIOS over IPX protocol is a variant of the various NetBIOS API protocol implementations, see the [NetBIOS](/NetBIOS) page for further information.

It is obsolete and superseded by NetBIOS over TCP/IP (see [NetBIOS](/NetBIOS)).

## History

XXX - add a brief description of NetBIOS over IPX history

## Protocol dependencies

  - [IPX](/IPX): NetBIOS over IPX.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The NetBIOS over IPX dissector is (fully functional, partially functional, not existing, ... whatever the current state is).

## Preference Settings

(XXX add links to preference settings affecting how NetBIOS over IPX is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of NetBIOS over IPX display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/n/nbipx.html)

Show only the NetBIOS over IPX based traffic:

``` 
 nbipx 
```

Beware: this will **not** show other NetBIOS variants like NetBIOS over TCP/IP.

## Capture Filter

You cannot directly filter NetBIOS over IPX while capturing. XXX - fix this as this seems to be untrue\!

## External links

See the [NetBIOS](/NetBIOS) page for further reference.

## Discussion

---

Imported from https://wiki.wireshark.org/NetBIOS/IPX on 2020-08-11 23:17:11 UTC
