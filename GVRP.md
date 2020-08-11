# GARP VLAN Registration Protocol (GVRP)

GVRP stands for GARP (Generic Attribute Registration Protocol) VLAN Registration Protocol. It's a Layer 2 network protocol, for automatic configuration of switches in a VLAN network.

Each VLAN switch is configured with the VLANs it is part of. GVRP will spread this information and configure the needed VLANs.

So to add a switch to a VLAN, only 1 switch needs to be reconfigured. This is not the case within a standard VLAN, where all switches might need reconfiguration.

## History

XXX - add a brief description of GVRP history

## Protocol dependencies

  - [GARP](/GARP): GVRP uses [GARP](/GARP) as its transport protocol.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The GVRP dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

There are no GVRP specific preference settings.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of GVRP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/g/gvrp.html)

Show only the GVRP based traffic:

``` 
 gvrp 
```

## Capture Filter

You cannot directly filter GVRP protocols while capturing. However, GVRP packets are sent to the MAC address 01:80:C2:00:00:21, so you can filter on that.

Capture GVRP traffic:

``` 
 ether dst 01:80:c2:00:00:21 
```

XXX - filter on the LLC DSAP used for STP? Or just do "stp and"?

## External links

  - IEEE 802.1D: [IEEE standard for local and metropolitan area networks--Media access control (MAC) Bridges](http://standards.ieee.org/getieee802/download/802.1D-2004.pdf).

  - IEEE 802.1Q: [IEEE Standards for Local and metropolitan area networks—Virtual Bridged Local Area Networks](http://standards.ieee.org/getieee802/download/802.1Q-2003.pdf).

## Discussion

---

Imported from https://wiki.wireshark.org/GVRP on 2020-08-11 23:14:30 UTC
