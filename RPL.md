# Remote Program Load (RPL)

XXX - add a brief RPL description here

## History

XXX - add a brief description of RPL history

## Protocol dependencies

  - [Ethernet](/Ethernet): Typically, RPL uses [Ethernet](/Ethernet) as its transport protocol.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The RPL dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how RPL is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of RPL display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/r/rpl.html)

Show only the RPL based traffic:

``` 
 rpl 
```

## Capture Filter

You cannot directly filter RPL protocols while capturing. However, if you know the [Ethernet](/Ethernet) protocol type used (see above), you can filter on that one.

## External links

  - add link to RPL specification and where to find additional info on the web about RPL

## Discussion

---

Imported from https://wiki.wireshark.org/RPL on 2020-08-11 23:24:05 UTC
