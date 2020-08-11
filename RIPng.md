# Routing Information Protocol next generation (RIPng)

XXX - add a brief RIPng description here

## History

XXX - add a brief description of RIPng history

## Protocol dependencies

  - [UDP](/UDP): Typically, RIPng uses [UDP](/UDP) as its transport protocol. The well known UDP port for RIPng traffic is 521.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The RIPng dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how RIPng is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of RIPng display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/r/ripng.html)

Show only the RIPng based traffic:

``` 
 ripng 
```

## Capture Filter

You cannot directly filter RIPng protocols while capturing. However, if you know the [UDP](/UDP) port used (see above), you can filter on that one.

Capture RIPng traffic over the default port (521):

``` 
 udp port 521 
```

## External links

  - [RFC 2080](http://www.ietf.org/rfc/rfc2080.txt) *RIPng for IPv6*

  - [RFC 2081](http://www.ietf.org/rfc/rfc2081.txt) *RIPng Protocol Applicability Statement*

## Discussion

---

Imported from https://wiki.wireshark.org/RIPng on 2020-08-11 23:23:58 UTC
