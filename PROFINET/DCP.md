# PROFINET Discovery and basic Configuration Protocol (PN-DCP)

The Discovery and Basic Configuration Protocol DCP is a protocol definition within the PROFINET context. It is a Data Link Layer based protocol to configure station names and IP addresses. It is restricted to one subnet and mainly used in small and medium applications without an installed DHCP server.

## History

XXX - add a brief description of PN-DCP history

## Protocol dependencies

  - [DCE/RPC](/DCE/RPC): Typically, PN-DCP uses [DCE/RPC](/DCE/RPC) as its transport protocol.

## Example traffic

![ChangeIPUsingDCPScreenshot.png](uploads/__moin_import__/attachments/PROFINET/DCP/ChangeIPUsingDCPScreenshot.png "ChangeIPUsingDCPScreenshot.png")

## Wireshark

The PN-DCP dissector is fully functional.

## Preference Settings

There are no PN-DCP specific preference settings.

## Example capture file

[ChangeIPUsingDCP.pcap](uploads/__moin_import__/attachments/PROFINET/DCP/ChangeIPUsingDCP.pcap)

## Display Filter

A complete list of PN-DCP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/p/pn_dcp.html)

Show only the PN-DCP based traffic:

``` 
 pn_dcp
```

## Capture Filter

You cannot directly filter PN-DCP protocols while capturing.

## External links

  - add link to PN-DCP specification and where to find additional info on the web about PN-DCP

## Discussion

---

Imported from https://wiki.wireshark.org/PROFINET/DCP on 2020-08-11 23:18:22 UTC
