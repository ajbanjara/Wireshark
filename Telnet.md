# Full PROTO name (Telnet)

The Telnet protocol is unsecure, it's better to use [SSH](/SSH) instead.

XXX - add a brief Telnet description here

## History

XXX - add a brief description of Telnet history

## Protocol dependencies

  - [TCP](/TCP): Typically, Telnet uses [TCP](/TCP) as its transport protocol. The well known TCP port for PROTO traffic is 23.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The Telnet dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how Telnet is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of Telnet display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/t/telnet.html)

Show only the Telnet based traffic:

``` 
 telnet 
```

## Capture Filter

You cannot directly filter Telnet protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

## External links

  - RFC854

  - RFC855

  - see the wikipedia's [telnet](http://en.wikipedia.org/wiki/Telnet) page

## Discussion

---

Imported from https://wiki.wireshark.org/Telnet on 2020-08-11 23:26:37 UTC
