# Portmap

The Portmap protocol is part of the [ONC-RPC](/ONC-RPC) protocol family.

XXX - add a brief PROTO description here

## History

XXX - add a brief description of Portmap history

## Protocol dependencies

  - [ONC-RPC](/ONC-RPC): Portmap uses [ONC-RPC](/ONC-RPC) as its transport protocol. It is one of the two [ONC-RPC](/ONC-RPC) protocols that have a port number assigned to it; it is used to find out the port number or transport endpoint address assigned to a particular [ONC-RPC](/ONC-RPC) program, so it needs to have its port number be a well known port number. The well known port number for Portmap is 111.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The Portmap dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how Portmap is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of Portmap display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/p/portmap.html)

Show only the Portmap based traffic:

``` 
 portmap 
```

## Capture Filter

You cannot directly filter the Portmap protocol while capturing. However, as the port number used over [TCP](/TCP) and [UDP](/UDP) is well known (see above), you can filter on that one.

Capture Portmap traffic:

``` 
 port 111 
```

## External links

  - [RFC 1057](http://www.ietf.org/rfc/rfc1057.txt) *Remote Procedure Call, Version 2* - an older version of the ONC RPC specification, which describes, in appendix A, version 2 of the protocol.

  - [RFC 1833](http://www.ietf.org/rfc/rfc1833.txt) *Binding Protocols for ONC RPC Version 2* - describes version 3 and 4 of the protocol. Those versions are also called "RPCBIND", as they support binding transport endpoint addresses, not just port numbers, to an ONC RPC program number, for use with protocols other than [TCP](/TCP) or [UDP](/UDP), such as the OSI [COTP](/COTP) and [CLTP](/CLTP) protocols.

## Discussion

---

Imported from https://wiki.wireshark.org/Portmap on 2020-08-11 23:18:00 UTC
