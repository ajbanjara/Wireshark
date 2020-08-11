# Parallel Virtual file System (PVFS)

The goals PVFS project are to provide both a testbed for parallel I/O research as well as a freely available, production level parallel file system for use in the cluster community.

The dissector currently implemented in Wireshark is PVFS version 2 abbreviated as PVFS2. No known dissector exists for PVFS version 1.

## History

PVFS1 is still being very actively maintained and improved.

PVFS2 is the latest project from the Parallel Virtual File System development team. As with the original PVFS, PVFS2 is a parallel file system for Linux clusters. It harnesses commodity storage and network technology to provide concurrent access to data that is distributed across a (potentially large) collection of servers.

PVFS2 is completely new design from the ground up. It is based on concepts, technologies, and research results that have evolved since the introduction of PVFS1. It also features expanded flexibility and modularity for future growth.

## Protocol dependencies

  - [TCP](/TCP): PVFS2 uses [TCP](/TCP) as its transport protocol. The well known TCP port for PVFS2 traffic is 3334.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The PVFS2 dissector is fully functional, however the protocol is still under development and subject to change.

## Preference Settings

(XXX add links to preference settings affecting how PROTO is dissected).

## Example capture file

  - [SampleCaptures/pvfs2-sample.pcap](uploads/__moin_import__/attachments/SampleCaptures/pvfs2-sample.pcap)

## Display Filter

A complete list of PVFS2 display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/protofirstletter/proto.html)

Show only the PVFS2 based traffic:

``` 
 pvfs2 
```

## Capture Filter

You cannot directly filter PVFS2 protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the PVFS2 traffic over the default port (3334):

``` 
 tcp port 3334 
```

## External links

  - [Parallel Virtual File System, Version 2 (aka PVFS2)](http://www.pvfs.org/pvfs2/)

  - [PVFS2 Online Documentation](http://www.pvfs.org/pvfs2/documentation.html)

## Discussion

---

Imported from https://wiki.wireshark.org/PVFS on 2020-08-11 23:23:43 UTC
