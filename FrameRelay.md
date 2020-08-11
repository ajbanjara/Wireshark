# Frame Relay

[MFA Forum](http://www.mfaforum.com/) In computer networking, frame relay consists of an efficient data transmission technique used to send digital information quickly and cheaply in a relay of frames to one or many destinations from one or many end-points. Network providers commonly implement frame relay for voice and data as an encapsulation technique, used between local area networks (LANs) over a wide area network (WAN). Each end-user gets a private line (or leased line) to a frame-relay node. The frame-relay network handles the transmission over a frequently-changing path transparent to all end-users.

## History

Frame relay began as a stripped-down version of the X.25 protocol, releasing itself from the error-correcting burden most commonly associated with X.25. When frame relay detects an error, it simply drops the offending packet. Frame relay uses the concept of shared-access and relies on a technique referred to as "best-effort", whereby error-correction practically does not exist and practically no guarantee of reliable data delivery occurs. Frame relay provides an industry-standard encapsulation utilizing the strengths of high-speed, packet-switched technology able to service multiple virtual circuits and protocols between connected devices, such as two routers.

Eric Scace, an engineer at Sprint International, invented Frame Relay. He based the design on earlier work of his in the development of AX.25, a frame relay-like packet switching protocol created by amateur radio operators. Sprint International (as of 2005 a part of Sprint Nextel) subsequently contracted with [StrataCom](/StrataCom) for the first implementations, and deployed [StrataCom](/StrataCom) hardware in its public data network to offer the first frame relay public service.

## Protocol dependencies

  - Frame Relay is the lowest software layer, so it only depends on hardware.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The Frame Relay dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Capturing from Frame Relay hardware is only available on some platforms, see [Supported Capture Media](/CaptureSetup/NetworkMedia) list for details.

## Preference Settings

XXX - describe the preference settings

## Example capture file

XXX - Add a simple example capture file. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of Frame Relay display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/f/fr.html)

Show only the Frame Relay based traffic:

``` 
 fr 
```

## Capture Filter

Currently unknown.

See [Wireshark: Supported Capture Media](http://www.wireshark.org/media.html) page for Wireshark capturing support on various platforms.

## External links

  - [MFA Forum](http://www.mfaforum.com/), for MPLS, Frame Relay, and ATM

  - [Wikipedia article about Frame Relay](http://en.wikipedia.org/wiki/Frame_relay)

  - add links to ITU-T Frame Relay specifications (?) and where to find additional info on the web about Frame Relay

## Discussion

---

Imported from https://wiki.wireshark.org/FrameRelay on 2020-08-11 23:14:11 UTC
