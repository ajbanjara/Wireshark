# PROFINET CBA (PN-CBA)

The PROFINET CBA (PN-CBA) protocol is a field bus protocol related to platform independent data exchange.

PN-CBA is based on [DCOM](/DCOM) and the "lightweight" [PROFINET/RT](/PROFINET/RT) ([Ethernet](/Ethernet) type 0x8892) protocols:

  - The connection management part is using [DCOM](/DCOM) as its underlying protocol.

  - The acyclic data transfer (transfer of data if value changed) also uses the [DCOM](/DCOM) protocol.

  - The cyclic data transfer uses the "lightweight" [PROFINET/RT](/PROFINET/RT) protocol.

## History

XXX - add a brief description of PROFINET CBA history

## Protocol dependencies

  - [DCOM](/DCOM): PN-CBA uses [DCOM](/DCOM) as its transport protocol.

  - [PROFINET/RT](/PROFINET/RT): PN-CBA uses [PROFINET/RT](/PROFINET/RT) as its cyclic data transport protocol.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The PN-CBA dissector is fully functional.

## Preference Settings

There are no PN-CBA specific preference settings.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

PN-CBA splits into several [DCOM](/DCOM) interfaces, so there's no single PN-CBA filter available. A complete list of PN-CBA display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/#section_c), look for all protocols (DCOM interfaces) beginning with the *cba\_* prefix there.

For this reason, theres no simple PN-CBA filter. However, you can filter on the underlying [DCOM](/DCOM) protocol.

Show only the DCOM (PN-CBA) based traffic:

``` 
 dcom 
```

## Capture Filter

You cannot directly filter PN-CBA protocols while capturing.

## External links

  - the *PROFINET CBA Architecture Description and Specification* can be found at <http://www.profibus.com> -\> *downloads* -\> *specifications and standards*

  - add link where to find additional info on the web about PN-CBA

## Discussion

---

Imported from https://wiki.wireshark.org/PROFINET/CBA on 2020-08-11 23:18:21 UTC
