# NetBIOS Session Service (NBSS)

The NetBIOS Session Service is part of the NetBIOS-over-TCP protocol suite, see the [NetBIOS](/NetBIOS) page for further information.

## History

XXX - add a brief description of NBSS history

## Protocol dependencies

  - [TCP](/TCP): NBSS uses [TCP](/TCP) as its transport protocol. The well known TCP port for NBSS traffic is 139.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The NBSS dissector is fully functional.

## Preference Settings

(XXX add links to preference settings affecting how NBSS is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of NBSS display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/n/nbss.html)

Show only the NBSS based traffic:

``` 
 nbss 
```

## Capture Filter

You cannot directly filter NBSS while capturing. However, as it runs atop [TCP](/TCP) port 139, you can filter on that one.

Capture NBSS traffic:

``` 
 tcp port 139 
```

## External links

  - [RFC1001](http://www.ietf.org/rfc/rfc1001.txt) Protocol Standard For a NetBIOS Service on a TCP/UDP Transport: Concepts and Methods

  - [RFC1002](http://www.ietf.org/rfc/rfc1002.txt) Protocol Standard For a NetBIOS Service on a TCP/UDP Transport: Detailed Specifications

## Discussion

---

Imported from https://wiki.wireshark.org/NetBIOS/NBSS on 2020-08-11 23:17:13 UTC
