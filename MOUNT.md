# MOUNT

The MOUNT protocol is used in [NFS](/NFS) version 2 and 3 to find the initial filehandle for the mountpoint.

The protocol is no longer used in [NFS](/NFS) version 4 since this functionality has been incorporated into the [NFS](/NFS) protocol itself.  
Since MOUNT is not using a fixed standard port it is difficult to use MOUNT and thus [NFS](/NFS) through a firewall. Some vendors such as SUN do however implement extra features to the [NFS](/NFS) protocol to allow to eliminate the need of the MOUNT protocol (mount option public). This allows a client to mount an [NFS](/NFS) share through a firewall but does not address the issues with the [NLM](/NLM) lock management protocol nor the [NSM](/NSM) status monitoring protocols making this workaround only useable for read-only filesystems.

## History

The MOUNT protocol is a support protocol for versions 2 and 3 of [NFS](/NFS). (It is also used for version 1 of [NFS](/NFS) but no one I know of have ever seen such captures).  
Until today there has been 3 different versions of the MOUNT protocol, version 1, 2 and 3. These versions are virtually identical as far as normal unix [NFS](/NFS) servers and clients are concerned and only differ by version 2 and version 3 removing some of the procedures that are never used anyway.

## Protocol dependencies

  - [ONC-RPC](/ONC-RPC): The MOUNT protocols is implemented ontop of [ONC-RPC](/ONC-RPC) as program number 100005. MOUNT is usually implemented ontop of [UDP](/UDP) but clients using [TCP](/TCP) do exist.

  - [Portmap](/Portmap): A client usually needs the [Portmap](/Portmap) service in order to discover which port the MOUNT service is available on.

## Wireshark

The MOUNT dissector is fully functional. The [Service Response Time](/Service-Response-Time) statistics feature in both Wireshark and TShark can calculate response time statistics for this protocol.

## Preference Settings

There are no preference settings for the MOUNT protocol.

## Example capture file

[nfsv3.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/nfsv3.pcap.gz)

## Display Filter

A complete list of MOUNT display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/m/mount.html)

Show only the MOUNT protocol:

``` 
 mount 
```

## Capture Filter

You cannot directly filter on the MOUNT protocol while capturing. Since MOUNT does not use a standard port you can not capture on a specific port either.

## External links

  - [TheOpenGroups NFS standard which describes part of the MOUNT protocol](http://www.opengroup.org/pubs/catalog/c702.htm)

  - [RFC 1813](http://www.ietf.org/rfc/rfc1813.txt) *NFS Version 3 Protocol Specification* - contains an appendix for the MOUNT v3 protocol

## Tools

On Un\*xes that include RPC support, the following tools are usually part of the OS:

  - rpcinfo can be used to "ping" the MOUNT service on a server.
  - showmount can be used to interrogate a server, using the MOUNT protocol, to find out which shares are exported and which shares are mounted by which clients.

## Discussion

---

Imported from https://wiki.wireshark.org/MOUNT on 2020-08-11 23:16:52 UTC
