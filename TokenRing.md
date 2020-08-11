# Token Ring (IEEE 802.5)

Token Ring is a local area networking technology originally devised by IBM. It has largely been replaced by [Ethernet](/Ethernet), but some Token Ring installations still exist.

It is specified by [various IEEE 802.5 specifications](http://standards.ieee.org/getieee802/802.5.html).

Token Ring sends network packets from the sending host to one ([Unicast](/Unicast)) or more ([Multicast](/Multicast)/[Broadcast](/Broadcast)) receiving hosts.

Information how to capture on a Token Ring network can be found at the [CaptureSetup/TokenRing](/CaptureSetup/TokenRing) page.

## History

XXX - add a brief description of Token Ring history

## Protocol dependencies

  - Token Ring is the lowest software layer, so it only depends on hardware.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The Token Ring dissector is fully functional.

## Preference Settings

(XXX add links to preference settings affecting how Token Ring is dissected).

## Example capture file

XXX - Add a simple example capture file. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of Token Ring display filter fields can be found in the [display filter reference for Token Ring](http://www.wireshark.org/docs/dfref/t/tr.html) and [display filter reference for Token Ring Media Access Control](http://www.wireshark.org/docs/dfref/t/trmac.html)

Show only the Token Ring-based traffic:

``` 
 tr 
```

Show only the Token Ring-based traffic to and from Token Ring MAC address 08:00:08:15:ca:fe:

``` 
 tr.addr==08.00.08.15.ca.fe 
```

## Capture Filter

Capture only the Token Ring-based traffic to and from Token Ring MAC address 08:00:08:15:ca:fe:

``` 
 tr host 08:00:08:15:ca:fe 
```

## External links

## Discussion

---

Imported from https://wiki.wireshark.org/TokenRing on 2020-08-11 23:26:44 UTC
