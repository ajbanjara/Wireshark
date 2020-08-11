# Skinny Client Control Protocol (SKINNY)

SKINNY is a proprietary VoIP protocol from Cisco.

XXX - add a brief SKINNY description here

## History

XXX - add a brief description of SKINNY history

## Protocol dependencies

  - [TCP](/TCP): Typically, SKINNY uses [TCP](/TCP) as its transport protocol. The well known TCP port for SKINNY traffic is 2000.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The SKINNY dissector is partially functional. It decodes SKINNY versions 17 and earlier pretty well, but fails on version 18. Notably, SKINNY version 18 has changed the definition for the second u\_int32 field of the packet from all zeros (0x00000000) to a version number (as of v18, 0x00000012).

## Preference Settings

  - Reassemble SCCP messages spanning multiple TCP segments. Default: TRUE

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of SKINNY display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/s/skinny.html)

Show only the SKINNY based traffic:

``` 
 skinny 
```

## Capture Filter

You cannot directly filter SKINNY protocols while capturing. However if it flows though the default TCP port you can filter on that:

``` 
 tcp port 2000 
```

## External links

  - <http://www.ixiacom.com/library/technology_guides/tg_display.php?skey=skinny>

  - <http://en.wikipedia.org/wiki/Skinny>

## Discussion

---

Imported from https://wiki.wireshark.org/SKINNY on 2020-08-11 23:24:45 UTC
