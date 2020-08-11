# Freeciv

Freeciv is a open source clone of the popular game series called Civilization.

## History

Freeciv was created in 1996 by some Danish computer science students as an exercise in creating a multiplayer networking game, and was playable early on. Computer players and many other improvements were added later by other developers. Around 1999 it was one of the few truly addictive graphical games available for Linux. Ports to Amiga, Windows and many other platforms were made. Development has been very slow for years, but continues to this day.

## Protocol dependencies

  - [TCP](/TCP): Freeciv uses an undocumented, Freeciv-specific client/server protocol based on [TCP](/TCP). The default listening TCP port is 5556, but it can be altered.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The Freeciv dissector does not exist.

## Preference Settings

(XXX add links to preference settings affecting how Freeciv is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/Freeciv.pcap](uploads/__moin_import__/attachments/SampleCaptures/Freeciv.pcap)

## Display Filter

A complete list of Freeciv display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/protofirstletter/freeciv.html)

Show only the PROTO based traffic:

``` 
 proto 
```

## Capture Filter

You cannot directly filter Freeciv traffic while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the Freeciv traffic over the default port (5555):

``` 
 tcp port 5555 
```

## External links

  - <http://www.freeciv.org/> Official site

## Discussion

---

Imported from https://wiki.wireshark.org/Freeciv on 2020-08-11 23:14:12 UTC
