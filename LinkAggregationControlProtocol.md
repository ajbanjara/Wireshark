# Link Aggregation Control Protocol (LACP, IEEE 802.3ad)

Link Aggregation Control Protocol (LACP) is a layer 2 control protocol that can be used to automatically detect, configure and manage, as one logical link, multiple physical links between two adjacent LACP enabled devices.

## History

After at least two years of development LACP was formally published as IEEE Std 802.3ad-2000.

## Protocol dependencies

XXX - Check on dependencies -- (FWIW: LACP support is implemented within the "slow protocols" dissector).

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The LACP protocol appears to be at least partially supported.

XXX - Without access to the formal IEEE spec, it hard to know how complete the current dissector is.

## Preference Settings

N/A

## Example capture file

  - [SampleCaptures/lacp1.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/lacp1.pcap.gz)

## Display Filter

A complete list of LACP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/l/lacp.html)

LACP support is implemented within the "Slow Protocols" dissector. The following presence filter will select LACP as well as other the other "Slow Protocols":

``` 
 slow 
```

While there currently is no specific "lacp" presence filter, the following filter appears to successfully extract just frames containing lacp:

``` 
 lacp.version 
```

## Capture Filter

Capture frames containing lacp:

``` 
 ether proto 0x8809 
```

## External links

Details on obtaining the formal LACP specification (which, unfortunately, is not free) is available at:

  - [IEEE Std 802.3ad-2000](http://ieeexplore.ieee.org/xpl/standardstoc.jsp?isnumber=18464&isYear=2000) *Amendment to carrier sense multiple access with collision detection (CSMA/CD) access method and physical layer specifications-aggregation of multiple link segments*

Included below are some links with potentially useful information regarding LACP and/or link aggregation:

  - [How To - Configure, Verify, and Debug Link Aggregation Control Protocol (LACP)](http://www.alliedtelesyn.co.uk/site/files/Documents/HowTo/C613-16040-00.pdf) from Allied Telesyn

  - [Link Aggregation according to IEEE 802.3ad](http://www.triumf.ca/canarie/amsterdam-test/References/wp-lag-e.pdf) from [SysKonnect](/SysKonnect)

  - [Link Aggregation Control Protocol (LACP) / 802.3ad](http://www.cisco.com/en/US/tech/tk389/tk213/tk833/tsd_technology_support_sub-protocol_home.html) from cisco.com

  - [Merlink (Link Aggregation)](http://www.esolpartners.com/prd/prd001e.html) from Embedded Solution Partners

  - [Link Aggregation](http://www.linktionary.com/l/link_aggregation.html) from linktionary.com

  - [Link Aggregation Interoperability](http://www.dell.com/downloads/global/products/pwcnt/en/app_note_2.pdf) from dell.com

For some perspective on how the LACP came to be, see the following from ieee802.org:

  - [Link Aggregation Control Protocol - Presentation to the Link Aggregation Task Force, July 1998](http://www.ieee802.org/3/ad/public/july98/jeffree_070798.pdf)

  - [Link Aggregation Control Protocol - Presentation to the Link Aggregation Study Group, April 1998](http://www.ieee802.org/3/trunk_study/april98/jeffree_1_042898.pdf)

## Discussion

The capture file "lacp1.pcap" referenced above was captured while connected to an end user port that originated from an Extreme Network's Summit300 series switch. While "link aggregation" was explicitly disabled on this port, the Extreme switch did have their "loop detect" feature enabled. Apparently Extreme has recognized that some of the features of LACP can be also used to prevent certain types of layer 2 loops.

---

Imported from https://wiki.wireshark.org/LinkAggregationControlProtocol on 2020-08-11 23:15:59 UTC
