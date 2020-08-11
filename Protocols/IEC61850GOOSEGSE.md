# IEC 61850 GOOSE/GSE (GOOSE/GSE)

Generic substation Events (GSE) is a control model defined as per [IEC 61850](http://en.wikipedia.org/wiki/IEC61850) which provides a fast and reliable mechanism of transferring event data over electrical substation networks. This provides facility to transfer the same event message to multiple physical devices using multicast / broadcast services. GSE control model is further subdivided into GOOSE (Generic Object Oriented Substation Events) and GSSE (Generic Substation State Events).

## History

XXX - add a brief description of GOOSE history

## Protocol dependencies

  - GOOSE data is directly embedded into [Ethernet](/Ethernet) data packets and works on publisher-subscriber mechanism on multicast or broadcast MAC addresses.

  - GOOSE also uses [VLAN](/VLAN) and priority tagging as per IEEE 802.1Q to have separate virtual network within the same physical network & setting high priority for the message.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The GOOSE/GSE dissector is created using the [Asn2wrs](/Asn2wrs) compiler.

## Preference Settings

(XXX add links to preference settings affecting how GOOSE/GSE is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/GOOSE.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/GOOSE.pcap.gz)

## Display Filter

A complete list of GOOSE/GSE display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/g/goose.html)

Show only the GOOSE/GSE based traffic:

``` 
 goose 
```

## Capture Filter

Capture only the GOOSE/GSE traffic over the ethernet type 0x88B8 (IEC 61850 GOOSE):

``` 
 ether proto 0x88B8 
```

## External links

  - <http://en.wikipedia.org/wiki/GSE_(Generic_Substation_Events)>

## Discussion

---

Imported from https://wiki.wireshark.org/Protocols/IEC61850GOOSEGSE on 2020-08-11 23:20:06 UTC
