# malformed "protocol"

The malformed protocol isn't a real protocol itself, but used by Wireshark to indicate a problem while dissecting the packet data. You could think of it as a pseudo dissector.

While Wireshark dissects the packet data, the protocol dissector in charge tried to read from the packet data at an offset simply not existing. This raised an internal Exception, leading to this malformed indication.

There are three main causes:

  - protocol data is malformed
  - protocol dissector is buggy
  - wrong protocol dissector used

It's difficult to say (in a general way) which is the real cause in a given scenario, without looking at the packet data and having some knowledge of the protocol (dissector) involved.

## History

This feature exists in Wireshark since version 0.9.0.

## Protocol dependencies

This pseudo-protocol can happen at any protocol dissector.

## Example traffic

XXX - add example traffic showing malformed.

## Wireshark

The malformed dissector is "fully functional" :wink:

## Preference Settings

There are no preference settings affecting how malformed is dissected.

## Example capture file

XXX - add a capture file example.

## Display Filter

There are no display filter fields for malformed, see: [display filter reference](http://www.wireshark.org/docs/dfref/m/malformed.html). You can simply filter on malformed to see all packets conaining malformed data:

Example: Show only malformed packets:

``` 
 malformed 
```

## Capture Filter

A capture filter for the malformed pseudo protocol wouldn't make sense, as the malformed status isn't detected while capturing.

## External links

  - there are no external links

## Discussion

---

Imported from https://wiki.wireshark.org/Protocols/malformed on 2020-08-11 23:20:57 UTC
