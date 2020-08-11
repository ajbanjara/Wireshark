# Internet Printing Protocol (IPP)

XXX - add a brief IPP description here

## History

XXX - add a brief description of IPP history

## Protocol dependencies

  - [TCP](/TCP): Typically, IPP uses [TCP](/TCP) as its transport protocol. The well known TCP port for IPP traffic is 631.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The IPP dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how IPP is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/ipp.pcap](uploads/__moin_import__/attachments/SampleCaptures/ipp.pcap)

## Display Filter

A complete list of IPP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/i/ipp.html)

Show only the IPP based traffic:

``` 
 ipp 
```

## Capture Filter

You cannot directly filter IPP protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the IPP traffic over the default port (631):

``` 
 tcp port 631 
```

## External links

  - add link to IPP specification and where to find additional info on the web about it, e.g.:

  - [RFC 123](http://www.ietf.org/rfc/rfc123.txt) *The RFC title* - explanation of the RFC content.

## Discussion

---

Imported from https://wiki.wireshark.org/IPP on 2020-08-11 23:15:14 UTC
