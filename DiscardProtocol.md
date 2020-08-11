# discard

The discard protocol allows a client to send arbitrary data to a server. The data is then silently dropped.

## History

The discard protocol is one of the first protocols implemented atop TCP and UDP; it is described in RFC 863.

## Protocol dependencies

  - [TCP](/TCP): Typically, the discard protocol uses [TCP](/TCP) as its transport protocol, but it also uses UDP. The port for discard traffic is 9.

## Example traffic

No example is needed, since the protocol accepts any data and does not reply.

## Wireshark

No discard dissector exists; it would only mark the packet as a discard protocol packet in the summary.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/Discard.pcap](uploads/__moin_import__/attachments/SampleCaptures/Discard.pcap "Upload new attachment \"Discard.pcap\"")

## Display Filter

A complete list of Discard display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/d/discard.html)

Show only the discard based traffic:

``` 
 discard 
```

## Capture Filter

You cannot directly filter discard while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the discard traffic over the default port (9):

``` 
 tcp port 9 
```

## External links

  - [RFC 863](http://www.ietf.org/rfc/rfc863.txt) *Discard Protocol* - specification of the discard protocol.

## Discussion

---

Imported from https://wiki.wireshark.org/DiscardProtocol on 2020-08-11 23:13:33 UTC
