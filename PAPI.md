# PAPI

PAPI is the protocol use by [ArubaNetworks](/ArubaNetworks) for manage Access Point

## Protocol dependencies

  - PAPI uses [UDP](/UDP) as its transport protocol. The well known UDP port for PAPI traffic is 8211.

## Wireshark

The PAPI dissector is experimental state (There is not public documentation about PAPI Protocol)

## Example capture file

\- Sample of AP Boot \!

  - [SampleCaptures/papi\_apboot\_5.0.pcap](uploads/__moin_import__/attachments/SampleCaptures/papi_apboot_5.0.pcap)

## Display Filter

A complete list of PAPI display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/p/papi.html)

Show only the PAPI based traffic:

``` 
 papi 
```

## Capture Filter

You cannot directly filter PAPI protocols while capturing. However, if you know the [UDP](/UDP) port used (see above), you can filter on that one.

Capture only the PAPI traffic over the default port (8211):

``` 
 udp port 8211 
```

## External links

  - [Aruba Networks](http://www.arubanetworks.com) *Aruba Networks website*

## Discussion

---

Imported from https://wiki.wireshark.org/PAPI on 2020-08-11 23:17:49 UTC
