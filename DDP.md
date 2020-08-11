# Datagram Delivery Protocol (DDP)

XXX - add a brief DDP description here

## History

XXX - add a brief description of DDP history

## Protocol dependencies

  - [Ethernet](/Ethernet): Typically, DDP uses [Ethernet](/Ethernet) as its transport protocol.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The DDP dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how DDP is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of DDP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/d/ddp.html)

Show only the DDP based traffic:

``` 
 ddp 
```

## Capture Filter

You cannot directly filter DDP protocols while capturing.

## External links

  - add link to DDP specification and where to find additional info on the web about DDP

## Discussion

---

Imported from https://wiki.wireshark.org/DDP on 2020-08-11 23:12:35 UTC
