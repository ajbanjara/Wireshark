# CVS pserver (cvspserver)

This is the protocol used between a CVS client and password server to interact with the repository.

## History

Some background on CVS can be found on the [Wikipedia page](https://en.wikipedia.org/wiki/Concurrent_Versions_System).

## Protocol dependencies

  - [TCP](/TCP): Typically, CVS pserver uses [TCP](/TCP) as its transport protocol. The well known TCP port for CVS pserver traffic is 2401.

## Example traffic

``` 
  Frame 4: 149 bytes on wire (1192 bits), 149 bytes captured (1192 bits) on interface 0
  ...
  Ethernet II, Src: 08:00:27:14:11:61 (08:00:27:14:11:61), Dst: 00:25:90:7e:1a:e4 (00:25:90:7e:1a:e4)
  ...
  Internet Protocol Version 4, Src: 10.10.11.61 (10.10.11.61), Dst: 10.10.0.15 (10.10.0.15)
  ...
  Transmission Control Protocol, Src Port: 43941 (43941), Dst Port: 2401 (2401), Seq: 1, Ack: 1, Len: 83
  ...
  CVS pserver
      Data: BEGIN AUTH REQUEST
      Data: /export/cvsroot/rep/myrepo
      Data: theuser
      Data: A(? Z,Abcd]
      Data: END AUTH REQUEST
```

## Wireshark

The cvspserver dissector is fully functional.

## Preference Settings

  - TCP port: the port used by the CVS pserver.

## Example capture file

  - [SampleCaptures/cvspserver.pcap](uploads/__moin_import__/attachments/SampleCaptures/cvspserver.pcap)

## Display Filter

A complete list of cvspserver display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/c/cvspserver.html)

Show only the CVS pserver based traffic:

``` 
 cvspserver 
```

## Capture Filter

You cannot directly filter CVS pserver protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the CVS pserver traffic over the default port (2401):

``` 
 tcp port 2401 
```

## External links

  - [CVS homepage](http://www.nongnu.org/cvs/)

## Discussion

---

Imported from https://wiki.wireshark.org/cvspserver on 2020-08-11 23:12:25 UTC
