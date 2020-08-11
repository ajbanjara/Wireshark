# AppleTalk Address Resolution Protocol (AARP)

XXX - add a brief AARP description here

## History

XXX - add a brief description of AARP history

## Protocol dependencies

  - [Ethernet](/Ethernet): Typically, AARP uses [Ethernet](/Ethernet) as its transport protocol.

## Example traffic

[SampleCaptures/Obsolete\_Packets.cap](uploads/__moin_import__/attachments/SampleCaptures/Obsolete_Packets.cap) contains an example of this protocol.

## Wireshark

The AARP dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how AARP is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of AARP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/a/aarp.html)

Show only the AARP based traffic:

``` 
 aarp
```

## Capture Filter

Capture AARP traffic only:

``` 
 aarp 
```

That might not work with older versions of libpcap/WinPcap.

## External links

  - add link to AARP specification and where to find additional info on the web about AARP

## Discussion

---

Imported from https://wiki.wireshark.org/AARP on 2020-08-11 23:11:01 UTC
