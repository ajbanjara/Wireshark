# PROFINET Real-Time Protocol (PN-RT)

Profinet RT is one of the protocols of the [Profinet](/PROFINET) family. It used for real time cyclic data transfer with Industrial Programable Logic Controllers. Communications using PN-RT bypass the standard TCP/IP interface provided by Profinet to provide high speed communications of up to 12MBd. Specifically it was designed for time critical discrete input/output and message transfer.

## History

The PN-RT protocol was released with Profinet specification v2.2 in June 2007.

## Protocol dependencies

  - [EthernetHardware](/EthernetHardware): PN-IO is directly on top of Ethernet and uses Ethernet type 0x8892

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The PN-RT dissector is fully functional.

## Preference Settings

(XXX add links to preference settings affecting how PN-RT is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of PN-RT display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/p/pn_rt.html)

Show only the PN-RT based traffic:

``` 
 pn_rt
```

## Capture Filter

Capture only the PN-RT based traffic:

``` 
 ether proto 0x8892
```

Capture everything except the PN-RT based traffic:

``` 
 not ether proto 0x8892
```

## External links

  - add link to PN-RT specification

  - [PROFINET Unplugged - An introduction to PROFINET IO](http://www.rtaautomation.com/profinetio/)

## Discussion

---

Imported from https://wiki.wireshark.org/PROFINET/RT on 2020-08-11 23:18:26 UTC
