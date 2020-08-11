# NetBIOS Datagram Service (NBDS)

The NetBIOS Datagram Service is part of the NetBIOS-over-TCP protocol suite, see the [NetBIOS](/NetBIOS) page for further information.

## History

XXX - add a brief description of NBDS history

## Protocol dependencies

  - [UDP](/UDP): Typically, NBDS uses [UDP](/UDP) as its transport protocol. The well known UDP port for NBDS traffic is 138.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The NBDS dissector is partially functional; it should dissect all of the protocol, but does not reassemble datagrams fragmented at the NBDS layer.

## Preference Settings

(XXX add links to preference settings affecting how NBDS is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of NBDS display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/n/nbdgm.html)

Show only the NBDS based traffic:

``` 
 nbdgm 
```

## Capture Filter

You cannot directly filter NBDS while capturing. However, as it runs atop [UDP](/UDP) port 138, you can filter on that port.

Capture NBDS traffic:

``` 
 udp port 138 
```

## External links

  - [RFC1001](http://www.ietf.org/rfc/rfc1001.txt) *Protocol Standard For a NetBIOS Service on a TCP/UDP Transport: Concepts and Methods*

  - [RFC1002](http://www.ietf.org/rfc/rfc1002.txt) *Protocol Standard For a NetBIOS Service on a TCP/UDP Transport: Detailed Specifications*

## Discussion

---

Imported from https://wiki.wireshark.org/NetBIOS/NBDS on 2020-08-11 23:17:12 UTC
