# Network Block Device (NBD)

NBD is a simple protocol for Linux to export a block device across a network.

## History

The NBD protocol was devised and written by Pavel Machek in 1998. Since the protocol is so simple (see below), there hasn't been any need to modify it since, and the protocol is still very much like the original version.

## Protocol dependencies

  - [TCP](/TCP): NBD uses [TCP](/TCP) as its transport protocol. There is no well known port used for NBD.

## Example traffic

  - Client and Server perform negotiation (not dissected by wireshark)
  - Client sends a read request to the server, specifying the start offset and the length of the data to be read.
  - Server replies with a read reply, containing an error code (if any); if the error code is zero, reply header will be followed by immediate data
  - Client sends a write request, specifying the start offset and the length of the data to be written, immediately followed by raw data.
  - Server writes data out and sends a write reply, which contains an error code that may specify if an error occurred. If no error did occur, data is assumed to have been written to disk.
  - Client sends a disconnect request
  - Server disconnects.

## Wireshark

The NBD dissector is fully functional for everything after the initial negotiation phase.

## Preference Settings

(XXX add links to preference settings affecting how PROTO is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of NBD display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/n/nbd.html)

Show only the NBD based traffic:

``` 
 nbd 
```

## Capture Filter

You cannot directly filter NBD protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

## External links

  - add link to PROTO specification and where to find additional info on the web about it, e.g.:

  - [Sourceforge NBD projects page](http://sourceforge.net/projects/nbd/) - Homepage for the NBD project.

## Discussion

---

Imported from https://wiki.wireshark.org/NBD on 2020-08-11 23:17:06 UTC
