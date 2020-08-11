# ISDN user-network interface layer 3 specification for basic call control (Q.931)

## History

XXX - add a brief description of Q.931 history

## Protocol dependencies

Q.931 was originally used as the call control protocol for [ISDN](/ISDN). It is also used for VoIP; when used for VoIP, it's usually transported atop [TPKT](/TPKT) atop [TCP](/TCP).

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The Q.931 dissector is fully functional.

## Preference Settings

  - Make sure that preferences in [TCP](/TCP) and [TPKT](/TPKT) are set to allow reassembly of packets.

  - Whether to reassemble Q.931 messages spanning multiple TCP segments or not. (Default: yes)

  - Reassemble segmented Q.931 messages or not. (Default: yes)

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of Q.931 display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/q/q931.html)

Show only the Q.931 based traffic:

``` 
 q931 
```

## Capture Filter

You cannot directly filter Q.931 protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

## External links

  - Q.931 is specified by ITU in [Q.931](http://www.itu.int/rec/T-REC-Q.931-199805-I).

## Discussion

---

Imported from https://wiki.wireshark.org/Q.931 on 2020-08-11 23:23:44 UTC
