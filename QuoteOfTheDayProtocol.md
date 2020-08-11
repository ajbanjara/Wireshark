# Quote of the day (qod)

The qod protocol allows a client to get a random quote from a server.

## History

The protocol is as old as TCP and is part of the basic protocols.

## Protocol dependencies

  - [TCP](/TCP): Qod uses [TCP](/TCP) as its transport protocol. The TCP port for qod traffic is 17.

## Example traffic

Do'h - Homer Simpson

## Wireshark

No qod dissector exists; the protocol is raw text without any formatting or commands.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/qod.pcap](uploads/__moin_import__/attachments/SampleCaptures/qod.pcap "Upload new attachment \"qod.pcap\"")

## Display Filter

A complete list of qod display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/q/qod.html)

Show only the qod based traffic:

``` 
 qod 
```

## Capture Filter

You cannot directly filter qod traffic while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the qod traffic over the default port (17):

``` 
 tcp port 17 
```

## External links

  - [RFC 865](http://www.ietf.org/rfc/rfc865.txt) *Quote of the Day Protocol* - description of the qod protocol.

## Discussion

---

Imported from https://wiki.wireshark.org/QuoteOfTheDayProtocol on 2020-08-11 23:23:45 UTC
