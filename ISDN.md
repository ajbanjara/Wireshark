# Integrated Services Digital Network (ISDN)

XXX - add a brief ISDN description here

## History

XXX - add a brief description of ISDN history

## Protocol dependencies

ISDN runs on top of the hardware supplying time-domain-multiplexed channels on a BRI or PRI line, so it depends only on hardware.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The ISDN dissector is partially functional. It assumes that it is supplied with a frame for some protocol layer (such as [LAPD](/LAPD) on a D-channel, or a protocol such as [PPP](/PPP) on a B-channel), ,and an indication of the channel, displays the channel number, and dissects all D-channel traffic as [Q.931](/Q.931). It attempts to guess whether B-channel traffic is [V.120](/V.120) or [PPP](/PPP); it could perhaps be enhanced either to attempt to guess other traffic types or to allow a traffic type to be specified by a preference.

## Preference Settings

There are no ISDN specific preference settings.

## Example capture file

  - [SampleCaptures/toshiba.general.gz](uploads/__moin_import__/attachments/SampleCaptures/toshiba.general.gz)

## Display Filter

A complete list of ISDN display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/i/isdn.html)

Show only the ISDN based traffic:

``` 
 isdn 
```

## Capture Filter

As Wireshark doesn't support capturing raw ISDN traffic, there are no capture filters for it.

## External links

  - <http://en.wikipedia.org/wiki/ISDN>

## Discussion

---

Imported from https://wiki.wireshark.org/ISDN on 2020-08-11 23:15:23 UTC
