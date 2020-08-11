# RealDataTransport (RDT)

The Real Data Transport protocol is used by realPlayer and other players to transport media samples. RDT frames can either be interleaved within the controlling [RTSP](/RTSP) connection or can be setup over a separate [UDP](/UDP) stream.

## Protocol dependencies

  - [RTSP](/RTSP) is used by the client (player) and media server to set up RDT sessions.

## Wireshark

The RDT dissector is very nearly complete.

## Preference Settings

  - Show stream setup information (default `yes`)

  - Register default UDP client port (default `no`)

  - Default UDP client port (default `6970`, the port used by realPlayer)

## Display Filter

A complete list of RDT display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/r/rdt.html)

Show only the RDT based traffic: ` rdt `

## Capture Filter

You cannot directly filter RDT protocols while capturing. However, if you know the [RTSP](/RTSP) port used (`tcp port 554` by default), you can filter on that (this will work at least for the case where RDT frames are interleaved within the [RTSP](/RTSP) connection)

## External links

  - There seems not to be full specification of RDT available, but the source for a player and server that implement the protocol are at [Helix Community](http://www.helixcommunity.org/)

## Discussion

---

Imported from https://wiki.wireshark.org/RDT on 2020-08-11 23:23:50 UTC
