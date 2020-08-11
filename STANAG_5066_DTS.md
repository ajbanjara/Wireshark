# STANAG 5066 Data Transfer Sublayer (S5066\_DTS)

**STANAG 5066** (Profile for High Frequency (HF) Radio Data Communication) is a NATO protocol stack definition operated over HF modem/radio equipment. S5066 provides standard clients over SIS(Subnetwork Interface Sublayer) and an IP mapping/adaptation sublayer in order to make use of conventional IP applications over HF radio band in a transparent way.

## History

There exist three editions of **STANAG 5066** protocol specification. Edition 1, and Edition 2 radios do not attempt to transmit when it is known that another radio is transmitting. When there is silence, if two radios start transmitting together, they conflict with each other and all data is lost. It means that the data exchange is node to node and no more than two peers may communicate at the same time. With the release of **STANAG 5066 Edition 3**, this problem was resolved by using two genuine MAC methods, CSMA and HFTRP.

The DTS layers are same for Edition 1 and 2 but a new feature, especially two medium access control methods named as **HFTRP**(High Frequency Token Ring Protocol) and **CSMA**(Carrier Sense Multiple Access) that can be used interchangeably, was added to DTS layer of the STANAG 5066 Edition 3. In effect, the DTS sublayer of the Edition 3 is backward compatible with the old protocol editions(1,2).

## Protocol dependencies

  - [TCP](/TCP): When used with IP encapsulation(configurable), s5066dts uses [TCP](/TCP) as its transport protocol. The well known TCP port for s5066dts traffic is 5067.

  - Otherwise: D\_PDUs captured directly from the line(configurable as well) with pcap encapsulation. Link name is registered as **DLT\_STANAG\_5066\_D\_PDU**.

## Wireshark

The s5066dts dissector is fully functional.

## Preference Settings

  - When you want to dissect TCP encapsulated **STANAG 5066** DPDUs, you need to configure and check "Dissect STANAG 5066 DPDUs with prepending TCP headers" option.

  - Otherwise, when you want to dissect **STANAG 5066** DPDUs that are captured directly from the line, you need to uncheck "Dissect STANAG 5066 DPDUs with prepending TCP headers" option.

## Example capture file

  - [SampleCaptures/Stanag5066-RAW-ENCAP-Bftp-Exchange-tx.pcap](uploads/__moin_import__/attachments/SampleCaptures/Stanag5066-RAW-ENCAP-Bftp-Exchange-tx.pcap) - BFTP file transfer exchange D\_PDUs captured directly from the line

  - [SampleCaptures/Stanag5066-TCP-ENCAP-Bftp-Exchange-tx-rx.pcapng](uploads/__moin_import__/attachments/SampleCaptures/Stanag5066-TCP-ENCAP-Bftp-Exchange-tx-rx.pcapng) - BFTP file transfer exchange D\_PDUs encapsulated in TCP, then handed off to S5066 dissector

## Display Filter

A complete list of s5066dts display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/s/s5066dts.html)

Show only the s5066dts based traffic:

``` 
 s5066dts
```

## Capture Filter

You cannot directly filter s5066dts protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the s5066dts traffic over the default port (5067):

``` 
 tcp port 5067
```

## External links

  - <http://www.isode.com/whitepapers/stanag-5066.html>

  - <http://ham.zmailer.org/oh2mqk/HF-data/stanag5066.pdf>

---

Imported from https://wiki.wireshark.org/STANAG_5066_DTS on 2020-08-11 23:25:55 UTC
