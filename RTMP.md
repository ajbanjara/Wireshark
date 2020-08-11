# Routing Table Maintenance Protocol (RTMP)

Member of the [AppleTalkProtocolFamily](/AppleTalkProtocolFamily).

XXX - add a brief RTMP description here

## History

XXX - add a brief description of RTMP history

## Protocol dependencies

  - [DDP](/DDP): Typically, RTMP uses [DDP](/DDP) as its transport protocol.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The RTMP dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how RTMP is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of RTMP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/r/rtmp.html)

Show only the RTMP based traffic:

``` 
 rtmp 
```

## Capture Filter

You cannot directly filter RTMP protocols while capturing.

## External links

  - add link to RTMP specification and where to find additional info on the web about RTMP

## Discussion

There is another protocol referering to the acronym RTMP - the Real Time Message Protocol. There is also RTMPT and RTMPS (for tunneling through HTTP/HTTPS). By now Wireshark has only partial support for it.

---

Imported from https://wiki.wireshark.org/RTMP on 2020-08-11 23:24:10 UTC
