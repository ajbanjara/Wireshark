# Virtual Router Redundancy Protocol (VRRP)

XXX - add a brief VRRP description here

## History

XXX - add a brief description of VRRP history

## Protocol dependencies

  - [IP](/IP): Typically, VRRP uses [IP](/IP) as its transport protocol. The well known IP protocol type for VRRP traffic is 0x70.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The VRRP dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

There are no VRRP specific preference settings.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of VRRP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/v/vrrp.html)

Show only the VRRP based traffic:

``` 
 vrrp 
```

## Capture Filter

Capture only the VRRP based traffic:

``` 
 vrrp 
```

## External links

  - [RFC 2338](http://www.ietf.org/rfc/rfc2338.txt) *Virtual Router Redundancy Protocol*

## Discussion

---

Imported from https://wiki.wireshark.org/VRRP on 2020-08-11 23:27:14 UTC
