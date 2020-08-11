# MTP 2 User Adaptation Layer (M2UA)

Member of the [SIGTRAN](/SIGTRAN) protocol family.

XXX - add a brief M2UA description here

## History

XXX - add a brief description of M2UA history

## Protocol dependencies

  - [SCTP](/SCTP): Typically, M2UA uses [SCTP](/SCTP) as its transport protocol. The well known SCTP port for M2UA traffic is 2904.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The M2UA dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how M2UA is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of M2UA display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/m/m2ua.html)

Show only the M2UA based traffic:

``` 
 m2ua 
```

## Capture Filter

You cannot directly filter M2UA protocols while capturing. However, if you know the [SCTP](/SCTP) port used (see above), you can filter on that one.

## External links

  - add link to M2UA specification and where to find additional info on the web about M2UA

## Discussion

---

Imported from https://wiki.wireshark.org/M2UA on 2020-08-11 23:16:23 UTC
