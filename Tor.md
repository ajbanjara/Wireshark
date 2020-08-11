# Tor Protocol (tor)

Tor is a distributed overlay network designed to anonymize low-latency TCP-based applications such as web browsing, secure shell, and instant messaging. Clients choose a path through the network and build a `  `circuit*, in which each node (or `  `onion router* or `  `OR*) in the path knows its predecessor and successor, but no other nodes in the circuit. Traffic flowing down the circuit is sent in fixed-size `  `cells*, which are unwrapped by a symmetric key at each node (like the layers of an onion) and relayed downstream.

## History

XXX - add a brief description of Tor history

## Protocol dependencies

  - [TCP](/TCP): Typically, Tor uses [TLS](/TLS) over [TCP](/TCP) as its transport protocol. The well known TLS port for Tor traffic is 443. Tor commonly uses ports 9001 and 9030 for network traffic and directory information.

## Example traffic

## Wireshark

The Tor dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how Tor is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of Tor display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/t/tor.html)

Show only the Tor based traffic:

``` 
 tor 
```

## Capture Filter

You cannot directly filter Tor protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the Tor traffic over the default port (80):

``` 
 tcp port 80 
```

## External links

  - <https://svn.torproject.org/svn/tor/trunk/doc/spec/tor-spec.txt> Tor Protocol Specification

  - <https://svn.torproject.org/svn/tor/trunk/doc/spec/rend-spec.txt> Tor Hidden Service Specification

  - [RFC 123](http://www.ietf.org/rfc/rfc123.txt) *The RFC title* - explanation of the RFC content.

## Discussion

---

Imported from https://wiki.wireshark.org/Tor on 2020-08-11 23:26:46 UTC
