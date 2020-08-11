# Kernel Lock Manager Protocol (KLM)

The KLM protocol is used, in some operating systems, to manage lock requests between the NFS client kernel of a [NFS](/NFS) host and the user space lock manager daemon. This protocol is only used across the loopback interface and will never be seen on a network.

## History

This protocol was developed at the same time as [NLM](/NLM) and is semi-similar to [NLM](/NLM).

## Protocol dependencies

  - [ONC-RPC](/ONC-RPC): KLM uses [ONC-RPC](/ONC-RPC) as its transport mechanism; it runs on top of [ONC-RPC](/ONC-RPC) as program 100020.

## Example traffic

XXX - Add example traffic here as plain text or Wireshark screenshot).

## Wireshark

The KLM dissector is fully functional.

## Preference Settings

There are no preferences for the KLM protocol itself, but since it shares the filehandle structure with [NFS](/NFS) there are some [NFS](/NFS) preferences related to filehandles that do affect the dissection of KLM.  
See [NFS\_Preferences](/NFS_Preferences)

## Example capture file

[SampleCaptures/klm.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/klm.pcap.gz)

## Display Filter

A complete list of KLM display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/k/klm.html)

Show only the KLM based traffic:

``` 
 klm 
```

## Capture Filter

You cannot directly filter KLM while capturing. However, if you know the [UDP](/UDP) port used (see above), you can filter on that one. KLM only exists ontop of the loopback interface so one can only capture KLM on a host that allows capturing of loopback.

## External links

A KLM specification does not exist, however most unixen do have an interface specification for the protocol in /usr/include/rpcsvc

## Discussion

---

Imported from https://wiki.wireshark.org/Kernel_Lock_Manager on 2020-08-11 23:15:47 UTC
