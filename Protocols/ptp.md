# Precise Time Protocol (PTP)

PTP is used to synchronize the clock of a network client with a server (similar to NTP). However, PTP is mainly used in LANs, with much higher precision than NTP (usually 10's of microseconds to 10's of nanoseconds). Is is specified in IEEE 1588.

## History

For a detailed history, see <http://www.nist.gov/el/isd/ieee/intro1588.cfm>.

## Protocol dependencies

  - [UDP](/UDP): Typically, PTP uses [UDP](/UDP) as its transport protocol (although other transport protocols are possible). The well known UDP ports for PTP traffic are 319 (Event Message) and 320 (General Message).

  - [Ethernet](/Ethernet): Starting with IEEE1588 Version2, a native Layer2 [Ethernet](/Ethernet) implementation was designed. PTP can use Ethernet as its transport protocol. The well known Ethernet type for PTP traffic is 0x88F7

## Example traffic

Sync Message.

![sync message.PNG](uploads/__moin_import__/attachments/Protocols/ptp/sync-message.PNG "sync message.PNG")

Followup Message

![followup message.PNG](uploads/__moin_import__/attachments/Protocols/ptp/followup-message.PNG "followup message.PNG")

Delay Request Message

![delay req.PNG](uploads/__moin_import__/attachments/Protocols/ptp/delay-req.PNG "delay req.PNG")

Delay Response Message

![delay resp.PNG](uploads/__moin_import__/attachments/Protocols/ptp/delay-resp.PNG "delay resp.PNG")

## Wireshark

The PTP dissector seems to work properly.

## Preference Settings

There are no preference settings affecting PTP.

## Example capture file

  - [SampleCaptures/PTP\_sync.pcap](uploads/__moin_import__/attachments/SampleCaptures/PTP_sync.pcap)

  - [SampleCaptures/ptpv2.pcap](uploads/__moin_import__/attachments/SampleCaptures/ptpv2.pcap) some PTP version 2 packets

## Display Filter

A complete list of PTP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/p/ptp.html)

Show only the PTP based traffic:

``` 
 ptp
```

## Capture Filter

You cannot directly filter PTP protocols while capturing. However, if you know the [UDP](/UDP) port or [Ethernet](/Ethernet) type used (see above), you can filter on that one.

Capture only the PTP traffic over the default UDP ports (319 and 320):

``` 
 udp port 319 or udp port 320
```

Capture only the PTP traffic over the default Ethernet type (0x88F7):

``` 
 ether proto 0x88F7
```

## External links

  - [IEEE 1588 Standard](http://www.nist.gov/el/isd/ieee/ieee1588.cfm)

  - [PTP Wikipedia page](http://en.wikipedia.org/wiki/Precision_Time_Protocol)

  - [Texas Instruments - IEEE 1588 Application Report](http://www.ti.com/lit/an/snla098a/snla098a.pdf)

  - [National Instruments - Introduction to Distributed Clock Synchronization](http://www.ni.com/tutorial/2822/en/)

  - [National Instruments - Understanding the IEEE 1588 PTP](http://www.ni.com/newsletter/50130/en/)

## Discussion

---

Imported from https://wiki.wireshark.org/Protocols/ptp on 2020-08-11 23:22:01 UTC
