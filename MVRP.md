# Multiple VLAN Registration Protocol (MVRP)

Multiple VLAN Registration Protocol (MVRP) formerly known as GARP VLAN Registration Protocol (GVRP) is a standards-based Layer 2 network protocol, for automatic configuration of VLAN information on switches. It was defined in the 802.1ak amendment to 802.1Q-2005.

Within a layer 2 network, MVRP provides a method to dynamically share VLAN information and configure the needed VLANs. For example, in order to add a switch port to a VLAN, only the end port, or the VLAN-supporting network device connected to the switchport, need be reconfigured, and all necessary VLAN trunks are dynamically created on the other MVRP-enabled switches. Without using MVRP, either a manual configuration of VLAN trunks or use of a manufacturer's proprietary method is necessary.

## History

The replaced GARP VLAN Registration Protocol (GVRP) was essentially the same thing, but it used the services of the 802.1D based GARP Application. GVRP made use of GARP Information Declaration (GID) and GARP Information Propagation (GIP), which correspond to the MAP and MID in MRP. It was defined in the original release of 802.1Q-1998 until it was replaced by MVRP.

It was replaced because the non-VLAN aware GARP had serious deficiencies when operating in large VLAN networks.

## Protocol dependencies

The Multiple VLAN Registration Protocol (MVRP) defines a Multiple Registration Protocol (MRP) Application that provides the VLAN registration service. MVRP makes use of MRP Attribute Declaration (MAD) and MRP Attribute Propagation (MAP), which provide the common state machine descriptions and the common information propagation mechanisms defined for use in MRP-based applications. MRP operates at the Data Link Layer (like [Ethernet](/Ethernet)).

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The MVRP dissector is fully functional.

## Preference Settings

None.

## Example capture file

  - [SampleCaptures/mrp-mvrp.pcap](uploads/__moin_import__/attachments/SampleCaptures/mrp-mvrp.pcap)

## Display Filter

A complete list of MVRP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/m/mrp-mvrp.html)

Show only the MVRP based traffic:

``` 
 mrp-mvrp 
```

## Capture Filter

You can directly filter MVRP protocols while capturing.

Capture only the MVRP traffic using its ethertype:

``` 
 ether proto 0x88F5 
```

Capture only the MVRP traffic using MAC address:

``` 
 ether dst 01:80:C2:00:00:21
```

## External links

  - <http://standards.ieee.org/getieee802/download/802.1ak-2007.pdf> *IEEE 802.1ak standard*

  - <http://standards.ieee.org/getieee802/download/802.1Q-2005_Cor1-2008.pdf> *IEEE 802.1ak corrigendum*

  - <http://standards.ieee.org/findstds/standard/802.1Q-2011.html> *IEEE 802.1Q-2011* - New revision of 802.1Q that incorporates previous documents

## Discussion

---

Imported from https://wiki.wireshark.org/MVRP on 2020-08-11 23:17:04 UTC
