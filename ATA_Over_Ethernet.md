# ATA Over Ethernet (AOE)

ATA Over Ethernet is a protocol designed to transport ATA frames directly ontop of Ethernet frames.

AOE Initiator drivers are available for Linux. Rumours say that Linux kernel guru Alan Cox sometime in the past developed a long lost prototype implementation for a userspace Target.

## History

ATA Over Ethernet was developed by the company Coraid which also sells products based on AOE.  

## Protocol dependencies

  - [Ethernet](/Ethernet): AOE uses [Ethernet](/Ethernet) as its transport protocol. The well known Ethernet type for AOE traffic is 0x88A2.

  - [ATA](/ATA): The ATA protocol is transported ontop of AOE. The ATA support is currently minimal and is implemented inside the AOE dissector.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The AOE dissector is partially functional. The dissector can match requests to responses and measure the responsetime

    aoe.time 

which can be plotted using IOGraphs.

## Preference Settings

There are no preference setting for AOE.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of AOE display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/a/aoe.html)

Show only the AOE based traffic:

``` 
 aoe 
```

## Capture Filter

You cannot directly filter AOE protocols while capturing. However, if you know the [Ethernet](/Ethernet) type used (see above), you can filter on that one.

## External links

  - [Coraid webpage](http://www.coraid.com) (they developed AOE and it is where the specification is located)

## Discussion

---

Imported from https://wiki.wireshark.org/ATA_Over_Ethernet on 2020-08-11 23:11:24 UTC
