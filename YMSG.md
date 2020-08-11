# Yahoo YMSG Messenger Protocol (YMSG)

The protocol has changed in the last version of Yahoo Messenger. The service verification and the login are done on the port 199.

XXX - add a brief YMSG description here

## History

XXX - add a brief description of YMSG history

## Protocol dependencies

  - [TCP](/TCP): Typically, YMSG uses [TCP](/TCP) as its transport protocol. There is no well known TCP port for YMSG traffic but 5050 seems to be often used.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The YMSG dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how YMSG is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of YMSG display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/y/ymsg.html)

Show only the YMSG based traffic:

``` 
 ymsg 
```

## Capture Filter

You cannot directly filter YMSG protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the YMSG traffic over the default port (5050):

``` 
 tcp port 5050 
```

## External links

  - <http://en.wikipedia.org/wiki/Yahoo%21_Messenger>

## Discussion

---

Imported from https://wiki.wireshark.org/YMSG on 2020-08-11 23:27:50 UTC
