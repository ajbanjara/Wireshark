# UniDirectional Link Detection (UDLD)

UDLD is a Cisco Layer 2 protocol to detect a uni-directional fiber link between two Ethernet switches in order to prevent a looped network. UDLD is often used in switched Ethernet networks where Spanning-Tree is required to block one or more ports to prevent a loop from forming.

## History

UDLD was originally developed for the Cisco Catalyst 5000 series switches.

## Protocol dependencies

  - [Ethernet](/Ethernet): UDLD uses [Ethernet](/Ethernet) as its transport protocol using destination mac address 0100.0CCC.CCCC.

## Example traffic

## Wireshark

UDLD support was added in Wireshark 0.99.4.

## Preference Settings

There are no preference settings at the present time.

## Example capture file

\* [SampleCaptures/udld.pcap](uploads/__moin_import__/attachments/SampleCaptures/udld.pcap)

## Display Filter

Show only UDLD packets:

``` 
  udld 
```

A complete list of display filters can be found in the [Display Filter Reference](http://www.wireshark.org/docs/dfref/u/udld.html).

## Capture Filter

You cannot directly filter UDLD protocols while capturing. However, if you use the [Ethernet](/Ethernet) destination MAC address (see above), you can filter on that one:

``` 
  ether dst 01:00:0c:cc:cc:cc 
```

## External links

  - [RFC 5171](http://www.tools.ietf.org/rfc/rfc5171.txt) Informational UniDirectional Link Detection (UDLD) Protocol RFC

## Discussion

The originally stated sample capture was void, so please add the udld.pcap capture to the [SampleCaptures](/SampleCaptures) page.

---

Imported from https://wiki.wireshark.org/UDLD on 2020-08-11 23:26:59 UTC
