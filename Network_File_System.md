# Network File System (NFS)

XXX - add a brief NFS description here

## History

XXX - add a brief description of NFS history

## Protocol dependencies

  - [ONC-RPC](/ONC-RPC): NFS uses [ONC-RPC](/ONC-RPC) as its transport protocol. It is one of the two [ONC-RPC](/ONC-RPC) protocols that have a port number assigned to it. The well known port number for NFS is 2049, although specialized NFS servers might use a different port.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The NFS dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

See [NFS\_Preferences](/NFS_Preferences).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of NFS display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/n/nfs.html)

Show only the NFS traffic:

``` 
 nfs
```

## Capture Filter

You cannot directly filter NFS while capturing. However, if you know the port used (see above), you can filter on that one.

Capture NFS traffic over the default port (2049):

``` 
 port 2049 
```

## External links

  - [RFC 1094](http://www.ietf.org/rfc/rfc1094.txt) *NFS: Network File System Protocol Specification* - describes NFS version 2 (version 1 was never released)

  - [RFC 1813](http://www.ietf.org/rfc/rfc1813.txt) *NFS Version 3 Protocol Specification*

  - [RFC 2054](http://www.ietf.org/rfc/rfc2054.txt) *WebNFS Client Specification*

  - [RFC 2055](http://www.ietf.org/rfc/rfc2055.txt) *WebNFS Client Specification* - this and RFC 2054 describe an extension for doing NFS more easily over the public Internet

  - [RFC 2224](http://www.ietf.org/rfc/rfc2224.txt) *NFS URL Scheme*

  - [RFC 2623](http://www.ietf.org/rfc/rfc2623.txt) *NFS Version 2 and Version 3 Security Issues and the NFS Protocol's Use of RPCSEC\_GSS and Kerberos V5*

  - [RFC 2624](http://www.ietf.org/rfc/rfc2624.txt) *NFS Version 4 Design Considerations*

  - [RFC 3530](http://www.ietf.org/rfc/rfc3530.txt) *Network File System (NFS) version 4 Protocol*

Obsolete:

  - [RFC 3010](http://www.ietf.org/rfc/rfc3010.txt) *NFS version 4 Protocol* - obsoleted by RFC 3530

## Discussion

---

Imported from https://wiki.wireshark.org/Network_File_System on 2020-08-11 23:17:22 UTC
