# HP Encapsulated Remote Mirror (HP ERM)

HP ERM, Hewlett-Packard Encapsulated Remote Mirror protocol is used by the HPE (Hewlett-Packard Enterprise) switches based on [ProVision](/ProVision) ASICs formerly of the [ProCurve](/ProCurve) family, now branded under Aruba Networks, a Hewlett Packard Enterprise company. Unlike Cisco RSPAN, HP ERM encapsulates the frames to be mirrored inside UDP datagrams with a proprietary header, allowing it to be transported over any IP network (like Cisco ERSPAN). Switches running K, KA, and KB firmwares since K.12.01 support this feature.

It's uncertain if this can be carried over IPv6 at this time. If someone can confirm, it would be appreciated.

Page is a work in progress.

## History

Around January 2007 with the release of K.12.01, it was first available on switches running the K firmware. As of February 2017, no apparent change has been made to the protocol. [HP ProCurve LAN products software feature matrix](http://h20565.www2.hpe.com/hpsc/doc/public/display?docId=emr_na-c02694321&lang=en-us&cc=us)

## Protocol dependencies

  - [UDP](/UDP): HPERM uses [UDP](/UDP) as its transport protocol. The common UDP port for HPERM traffic is 7932.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The HP ERM dissector is partially functional with some bits as yet unknown and labeled such.

## Preference Settings

[HPERM\_Preferences](/HPERM_Preferences) only has one setting, the UDP port.

## Example capture file

  - [SampleCaptures/hp-erm-1.pcap](uploads/__moin_import__/attachments/SampleCaptures/hp-erm-1.pcap "Upload new attachment \"hp-erm-1.pcap\"")

  - [SampleCaptures/hp-erm-2.pcap](uploads/__moin_import__/attachments/SampleCaptures/hp-erm-2.pcap "Upload new attachment \"hp-erm-2.pcap\"")

## Display Filter

A complete list of HP ERM display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/h/hp_erm.html)

Show only the HP ERM based traffic:

``` 
 hp_erm 
```

## Capture Filter

You cannot directly filter HP ERM protocol while capturing. However, if you know the [UDP](/UDP) port used (see above), you can filter on that one.

Capture only the HP ERM traffic over the default port (7932):

``` 
 udp port 7932 
```

## External links

  - [Wireshark bug 7483](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7483) Better documents the protocol than merely unknown data.

## Discussion

---

Imported from https://wiki.wireshark.org/HPERM on 2020-08-11 23:14:46 UTC
