# Asynchronous Transfer Mode (ATM)

[MFA Forum](http://www.mfaforum.com/)

The Asynchronous Transfer Mode (ATM) is a packet-oriented data transmission protocol. The elementary transport unit is an ATM cell, consisting of a 5-byte header and a 48-byte payload. The payload size of 48 bytes was a trade-off between the European telephony point of view requesting low packetization delays hence proposing 32 bytes of payload, and the USA data transmission point of view where overhead reduction was more important hence proposing 64 bytes of payload.

The ATM header contains the routing information, but it is rewritten in every router. The routing information in an ATM cell has only a hop-by-hop meaning. In this context it is common to see Virtual Paths (VPs) and Virtual Connections (VCs). A VP can be considered like a route, while a VC can be compared with a port in [TCP](/TCP) or [UDP](/UDP) hence it serves multiplexing purposes along a given VP.

ATM is often used to encapsulate specific traffic. In this context you'll see the ATM Adaptation Layer definitions. For instance:

  - AAL1 for a real-time constant bit rate (rt-CBR) service.
  - AAL2 for real-time variable bit rate (rt-VBR) service.
  - AAL3/4 for variable bit rate, no time constraints (complex).
  - AAL5 as simplification of AAL3/4.

## History

The Asynchronous Transfer Mode (ATM) emerged in the early 1980s. In the early days of ATM, the ATM cells were indeed transmitted in an asynchronous manner on an ATM network. However, in order to improve the bandwidth usage (and other reasons), the asynchronous character of ATM has been reduced as most current ATM network run in a rather synchronous mode, where ATM cells are transmitted at fixed time slots.

## Protocol dependencies

  - ATM is the lowest software layer, so it only depends on hardware.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The ATM dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Capturing from ATM hardware is only available on some platforms, see the [Supported Capture Media](/CaptureSetup/NetworkMedia) list for details.

## Preference Settings

There are no preference settings affecting how ATM is dissected.

## Example capture file

XXX - Add a simple example capture file. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of ATM display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/a/atm.html)

Show only the ATM based traffic:

``` 
 atm 
```

## Capture Filter

Currently unknown.

See the [Supported Capture Media](/CaptureSetup/NetworkMedia) page for Wireshark capturing support on various platforms.

## External links

  - [MFA Forum](http://www.mfaforum.com/), for MPLS, Frame Relay, and ATM

  - [Wikipedia article about ATM](http://en.wikipedia.org/wiki/Asynchronous_Transfer_Mode)

  - add links to ITU-T ATM specifications (?) and where to find additional info on the web about this ATM

## Discussion

---

Imported from https://wiki.wireshark.org/ATM on 2020-08-11 23:11:24 UTC
