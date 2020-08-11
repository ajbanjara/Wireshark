# DirectPlay (DPLAY)

Direct`  `Play is part of the Microsoft DirectX suite and provides networking functionality to games using the Direct`  `Play API. Recently, it has been declared obsoleted by Microsoft, but many older popular games use if for network games. The networking protocol is completely undocumented by Microsoft.

## History

Direct`  `Play was launched together with the DirectX suite in 1995. From the network protocol side of it, the only other interesting reliable date is 2002, when the networking protocol received a major overhaul with DirectX 8.2 to make it more suitable for internet play. In 2004, Microsoft deprecated Direct`  `Play and removed the API documentation from their DirectX SDKs, but DirectX 9.x still ship with Direct`  `Play support

## Protocol dependencies

  - [TCP](/TCP): DPLAY uses [TCP](/TCP) For session setup. The ports used vary, but usually range from 2300 - 2400, with the lobby server listening on well-known port 47624.

  - [UDP](/UDP): DPLAY uses [UDP](/UDP) for transmitting game data.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The DPLAY dissector is partially functional.

## Preference Settings

(XXX add links to preference settings affecting how PROTO is dissected).

## Example capture file

  - [SampleCaptures/dplay7\_chat.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/dplay7_chat.pcap.gz)

## Display Filter

A complete list of DPLAY display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/d/dplay.html)

Show only the DPLAY based traffic:

``` 
 dplay 
```

## Capture Filter

You cannot directly filter DPLAY protocols while capturing. As the ports used vary, for older versions of DPLAY with every packet sent, you cannot set up a reasonable capture filter.

## External links

  - <http://code.google.com/p/contorted/wiki/PacketTypes> is the only place where part of the protocol is documented.

## Discussion

---

Imported from https://wiki.wireshark.org/DPlay on 2020-08-11 23:13:37 UTC
