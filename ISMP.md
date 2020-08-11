# InterSwitch Message Protocol (ISMP)

XXX - add a brief ISMP description here

## History

XXX - add a brief description of ISMP history

## Protocol dependencies

  - [Ethernet](/Ethernet): Typically, ISMP uses [Ethernet](/Ethernet) as its transport protocol.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The ISMP dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

There are no ISMP specific preference settings.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of ISMP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/i/ismp.html)

Show only the ISMP based traffic:

``` 
 ismp 
```

## Capture Filter

You cannot directly filter ISMP protocols while capturing. However, if you know the [Ethernet](/Ethernet) type used (see above), you can filter on that one.

## External links

  - add link to ISMP specification and where to find additional info on the web about ISMP

## Discussion

---

Imported from https://wiki.wireshark.org/ISMP on 2020-08-11 23:15:25 UTC
