# Homeplug Protocol v1.0.1 (Homeplug)

It is a protocol used by transceivers in powerlines communication.

## History

The plugin has been coded based on the INT51X1 datasheet (available [here](http://www.tandel.be/spip/article.php3?id_article=6)).

## Protocol dependencies

  - [Ethernet](/Ethernet): Typically, Homeplug uses [Ethernet](/Ethernet) as its layer-2 protocol. The well known ethertype is 0x887B.

## Example traffic

[HomePlug](/HomePlug) protocol

MAC Control Field: 1

  - Reserved
  - 000 0001 = Number of MAC Data Entries: 1

MAC Management Entry Header

1.  .... = MAC Entry Version: 0
2.  ..1 1010 = MAC Entry Type: 0x1a

MAC Management Entry Length: 187 Network Statistics Basic

  - \= Action Control: False
  - ... .000 = IC\_ID: INT5130A1 (0x00) Bytes in 40 symbols in ROBO: 0 Fails Received in ROBO: 0 Frame Drops in ROBO: 0 Tone Map \#1
      - Address of Network DA: 00:00:00\_00:00:00 (00:00:00:00:00:00) Bytes in 40 symbols: 0 Fails Received: 0 Frame Drops: 0
    Tone Map \#2
      - Address of Network DA: 00:00:00\_00:00:00 (00:00:00:00:00:00) Bytes in 40 symbols: 0 Fails Received: 0 Frame Drops: 0
    Tone Map \#3
      - Address of Network DA: 00:00:00\_00:00:00 (00:00:00:00:00:00) Bytes in 40 symbols: 0 Fails Received: 0 Frame Drops: 0
    Tone Map \#4
      - Address of Network DA: 00:00:00\_00:00:00 (00:00:00:00:00:00) Bytes in 40 symbols: 0 Fails Received: 0 Frame Drops: 0
    Tone Map \#5
      - Address of Network DA: 00:00:00\_00:00:00 (00:00:00:00:00:00) Bytes in 40 symbols: 0 Fails Received: 0 Frame Drops: 0
    Tone Map \#6
      - Address of Network DA: 00:00:00\_00:00:00 (00:00:00:00:00:00) Bytes in 40 symbols: 0 Fails Received: 0 Frame Drops: 0
    Tone Map \#7
      - Address of Network DA: 00:00:00\_00:00:00 (00:00:00:00:00:00) Bytes in 40 symbols: 0 Fails Received: 0 Frame Drops: 0
    Tone Map \#8
      - Address of Network DA: 00:00:00\_00:00:00 (00:00:00:00:00:00) Bytes in 40 symbols: 0 Fails Received: 0 Frame Drops: 0
    Tone Map \#9
      - Address of Network DA: 00:00:00\_00:00:00 (00:00:00:00:00:00) Bytes in 40 symbols: 0 Fails Received: 0 Frame Drops: 0
    Tone Map \#10
      - Address of Network DA: 00:00:00\_00:00:00 (00:00:00:00:00:00) Bytes in 40 symbols: 0 Fails Received: 0 Frame Drops: 0
    Tone Map \#11
      - Address of Network DA: 00:00:00\_00:00:00 (00:00:00:00:00:00) Bytes in 40 symbols: 0 Fails Received: 0 Frame Drops: 0
    Tone Map \#12
      - Address of Network DA: 00:00:00\_00:00:00 (00:00:00:00:00:00) Bytes in 40 symbols: 0 Fails Received: 0 Frame Drops: 0
    Tone Map \#13
      - Address of Network DA: 00:00:00\_00:00:00 (00:00:00:00:00:00) Bytes in 40 symbols: 0 Fails Received: 0 Frame Drops: 0
    Tone Map \#14
      - Address of Network DA: 00:00:00\_00:00:00 (00:00:00:00:00:00) Bytes in 40 symbols: 0 Fails Received: 0 Frame Drops: 0
    Tone Map \#15
      - Address of Network DA: 00:00:00\_00:00:00 (00:00:00:00:00:00) Bytes in 40 symbols: 0 Fails Received: 0 Frame Drops: 0

## Wireshark

The Homeplug dissector is fully functional.

## Preference Settings

\---

## Example capture file

  - [SampleCaptures/homeplug\_request\_channel\_estimation.pcap](uploads/__moin_import__/attachments/SampleCaptures/homeplug_request_channel_estimation.pcap)

  - [SampleCaptures/homeplug\_request\_parameters\_and\_statistics.pcap](uploads/__moin_import__/attachments/SampleCaptures/homeplug_request_parameters_and_statistics.pcap)

  - [SampleCaptures/homeplug\_network\_statistics\_basic.pcap](uploads/__moin_import__/attachments/SampleCaptures/homeplug_network_statistics_basic.pcap)

## Display Filter

A complete list of Homeplug display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/protofirstletter/proto.html)

\---

Show only the Homeplug based traffic:

``` 
 homeplug 
```

## Capture Filter

\---

## External links

  - Specifications based on INT51X1 data sheet may be found [here](http://www.tandel.be/spip/article.php3?id_article=6)

  - <http://www.intellon.com/>

## Discussion

---

Imported from https://wiki.wireshark.org/Homeplug on 2020-08-11 23:14:42 UTC
