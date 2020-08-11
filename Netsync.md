# Monotone Netsync (netsync)

The Monotone distributed version control system uses the Netsync protocol for communication.

## History

TODO

## Protocol dependencies

  - [TCP](/TCP): Typically, netsync uses [TCP](/TCP) as its transport protocol. The well known TCP port for netsync traffic is 5253. Though IANA has assigned port 4691 to the protocol, which Monotone will soon migrate to.

## Example traffic

TODO

## Wireshark

The netsync dissector is (partially functional, dissecting of payload data isn't complete yet).

## Preference Settings

TODO

## Example capture file

  - [SampleCaptures/monotone-netsync.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/monotone-netsync.cap.gz)

## Display Filter

A complete list of netsync display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/n/netsync.html)

## Capture Filter

You cannot directly filter netsync protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the netsync traffic over the default port (5253):

``` 
 tcp port 5253 
```

## External links

  - <http://venge.net/monotone/> - The monotone development website.

## Discussion

---

Imported from https://wiki.wireshark.org/Netsync on 2020-08-11 23:17:16 UTC
