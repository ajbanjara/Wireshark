# Internet Storage Name Server (iSNS)

iSNS is a protocol to provide discovery, notification, management and configuration of both [iSCSI](/iSCSI) as well as [FibreChannel](/FibreChannel) initiators and targets in an [IP](/IP) based [SAN](/SAN).

This protocol is a member of the [StorageProtocolFamily](/StorageProtocolFamily).

iSNS is supported by many [iSCSI](/iSCSI) initiator and target implementations but a good management system and interface is still lacking, possibly limiting the full potential of the protocol.

## History

iSNS is a protocol defined by the [IPS](http://www.ietf.org/html.charters/ips-charter.html) (IP Storage) working group of the [IETF](/IETF).  
While it is currently still in draft mode and not an [RFC](/RFC) standard, the iSNS protocol has received support from the industry and most/all iSCSI storage vendors today support iSNS.  
While the protocol as it is now is not yet a ratified standard/RFC it is semi-widely deployed and it is unlikely that the RFC when it will be published will contain any major changes to the protocol.

## Protocol dependencies

  - [TCP](/TCP) [UDP](/UDP): iSNS uses either [TCP](/TCP) or [UDP](/UDP) as its transport protocol. The well known port for iSNS traffic is 3205.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The iSNS dissector is fully functional.

## Preference Settings

See [iSNS\_Preferences](/iSNS_Preferences)

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of iSNS display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/i/isns.html)

Show only the iSNS based traffic:

``` 
 isns 
```

## Capture Filter

You cannot directly filter iSNS protocols while capturing. However, if you know the [TCP](/TCP)/[UDP](/UDP) port used (see above), you can filter on that one.

## External links

  - [iSNS internet draft](http://www.ietf.org/internet-drafts/draft-ietf-ips-isns-22.txt)

  - [IPS workgroup homepage](http://www.ietf.org/html.charters/ips-charter.html) IP storage workgroup of the [IETF](/IETF)

## Discussion

---

Imported from https://wiki.wireshark.org/Internet_Storage_Name_Server on 2020-08-11 23:15:09 UTC
