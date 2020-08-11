# Network Status Monitoring Protocol (NSM)

Since [NFS](/NFS) is a lot less stateless than many documents claim, reality requires [NFS](/NFS) to keep track of state changes due to events like client or server restarts/reboots. The NSM protocol is used for [NFS](/NFS) versions 2 and 3 to inform peers about reboots in particular so that file locks can be cleaned up.  
The purpose of this protocol is to allow a client and /or a server to inform all its peers when the service has restarted so any hanging locks can be released or reclaimed. This is really important for [NFS](/NFS) since locks held by a client will never time-out and never be automatically released othervise. (Good DOS attack for NFS is to capture a lot of filehandles and then send [NLM](/NLM) requests to the server for them and just leave the locks hanging until someone reboots the server).  
These notifications of a peer reboot is issued by the rebooting client when the service restarts based on information for whom to notify recorded on stable storage. Usually this protocol is using [TCP](/TCP) as its transport and usually it will only send notifications to those peers where a file lock is being held using the [NLM](/NLM) protocol.  
Some implementations do not send notification to clients that only has locks in blocked state (not yet aquired/granted) since this state will anyway be resolved by the client reissuing the original (blocked) lock request after a timeout anyway. Other implementations send notification events to any and every peer it has that has talked [NLM](/NLM) to regardless of whether any locks were currently held or not.  
  
This protocol is not required if the [NFS](/NFS) share is exported read-only or if file locking is not used.

## History

The NSM protocol came after the original release of [NFS](/NFS) when byte-range locking support was added in SunOS, as locking more obviously requires a stateful protocol. The purpose of the protocol is to notify peers of when they have restarted their service and thus all held [NLM](/NLM) locks will have been purged.

## Protocol dependencies

  - [ONC-RPC](/ONC-RPC): The NSM protocols is implemented ontop of [ONC-RPC](/ONC-RPC) as program number 100024. NSM is usually implemented ontop of [TCP](/TCP) but clients using [UDP](/UDP) do exist.

  - [Portmap](/Portmap): A client usually needs the [Portmap](/Portmap) service in order to discover which port the NSM service is available on.

## Wireshark

The NSM dissector is fully functional. The [Service Response Time](/Service-Response-Time) statistics feature in both Wireshark and TShark can calculate response time statistics for this protocol.

## Preference Settings

There are no preference settings for the NSM protocol.

## Example capture file

[SampleCaptures/nsm.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/nsm.pcap.gz)

## Display Filter

A complete list of NSM display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/s/stat.html)

Show only the NSM protocol:

``` 
 stat 
```

The real name for this protocol is NSM but in wireshark this protocol is called "stat" after the name of the service that usually implements this protocol "rpc.statd". This was a mistake.

XXX should we rename if to NSM ? ronnie

## Capture Filter

You cannot directly filter on the NSM protocol while capturing. Since NSM does not use a standard port you can not capture on a specific port either.

## External links

  - [TheOpenGroups NFS standard which describes part of the NSM protocol](http://www.opengroup.org/pubs/catalog/c702.htm)

## Tools

  - rpcinfo can be used to "ping" the NSM service on a server.

## Discussion

---

Imported from https://wiki.wireshark.org/Network_Status_Monitoring_Protocol on 2020-08-11 23:17:23 UTC
