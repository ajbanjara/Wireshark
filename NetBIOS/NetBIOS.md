# NetBIOS (NetBEUI) Protocol

The NetBIOS (NetBEUI) protocol is a variant of the various NetBIOS API protocol implementations, see the [NetBIOS](/NetBIOS) page for further information.

The NetBIOS protocol is often called NetBIOS Extended User Interface (NetBEUI).

However, both the NetBIOS API and this Ethernet based networking protocol is/were often both called NetBIOS, leading to a lot of confusion.

Even the Wireshark dissection calls the NetBEUI part of the "NetBIOS world" simply NetBIOS, but this term ignores other NetBIOS protocol variants.

The NetBIOS protocol is obsolete and superseded by NetBIOS over TCP/IP (see [NetBIOS](/NetBIOS)).

## History

XXX - add a brief description of NetBIOS protocol history

## Protocol dependencies

  - [Ethernet](/Ethernet): NetBIOS over Ethernet.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The NetBIOS dissector is (fully functional, partially functional, not existing, ... whatever the current state is).

## Preference Settings

(XXX add links to preference settings affecting how NetBIOS protocol is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of NetBIOS protocol display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/n/netbios.html)

Show only the NetBIOS protocol based traffic:

``` 
 netbios 
```

Beware: this will **not** show other NetBIOS variants such as NetBIOS-over-TCP/IP.

## Capture Filter

Capture NetBIOS based traffic only:

``` 
 netbeui 
```

This might not work with older versions of libpcap/WinPcap.

Beware: this will **not** capture other NetBIOS variants such as NetBIOS-over-TCP/IP.

## External links

See the [NetBIOS](/NetBIOS) page for further reference.

## Discussion

---

Imported from https://wiki.wireshark.org/NetBIOS/NetBIOS on 2020-08-11 23:17:14 UTC
