# Extreme Discovery Protocol (EDP)

EDP is a vendor proprietary protocol from Extreme Networks. It is used to send information like system MAC, device name or VLAN information to neighboring Extreme devices. It is also used to transport "higher level" protocols like EAPS and ESRP.

## History

XXX todo

## Protocol dependencies

  - [LLC](/LLC)/[SNAP](/SNAP): EDP is encapsulated as LLC/SNAP with an OUI of 0x00E02B and a protocol ID of 0x00BB.

## Example capture file

[SampleCaptures/edp.trace.gz](uploads/__moin_import__/attachments/SampleCaptures/edp.trace.gz) General EDP traffic

[SampleCaptures/edp1.trace.gz](uploads/__moin_import__/attachments/SampleCaptures/edp1.trace.gz)

[SampleCaptures/edp.esrp.gz](uploads/__moin_import__/attachments/SampleCaptures/edp.esrp.gz) EDP/ESRP traffic

[SampleCaptures/edp.eaps.mirror1.trace.gz](uploads/__moin_import__/attachments/SampleCaptures/edp.eaps.mirror1.trace.gz)

[SampleCaptures/edp.eaps.mirror2.trace.gz](uploads/__moin_import__/attachments/SampleCaptures/edp.eaps.mirror2.trace.gz)

## Wireshark

The EDP dissector is fully functional, but is lacking information on some fields / packet types as the vendors doesn't release this information.

## Preference Settings

N/A

## Display Filter

A complete list of EDP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/protofirstletter/proto.html)

Show only the EDP based traffic on Ethernet:

``` 
 edp 
```

## Capture Filter

You can filter EDP protocols while capturing.

Capture only the EDP traffic:

``` 
   ether[12:2] <= 1500 and ether[14:4] = 0xaaaa0300 and ether[18:4] = 0xe02b00bb 
```

That filter checks for packets where the Ethernet type/length field is \<= 1500, meaning that it's a length field, and then checks the 802.2 LLC header for a DSAP of 0xaa and an SSAP of 0xaa, meaning a SNAP packet, and for a type field of 0x03, meaning a UI frame, and checks the following SNAP header for an OUI of 0x00e02b and a protocol ID of 0x00bb.

## External links

  - Information can be found at the Extreme Network support pages (login required).

## Discussion

---

Imported from https://wiki.wireshark.org/EDP on 2020-08-11 23:13:44 UTC
