# DVB-S2 Baseband Frame (DVB-S2-BB)

This dissector is able to show the output of satellite receiving equipment. The dissector consists of three "layers".

First, the ***DVB-S2 Modeadaption Header*** shows details about receiver specific information and signal quality \[1\].

The ***DVB-S2 Baseband Frame*** is the data header for the transmission over satellite \[2\].

The payload within one baseband frame is encapsulated in ***DVB-S2 GSE Packets*** \[3\]. The GSE packets can be segmented and carry the user data.

## Protocol dependencies

  - [UDP](/UDP): Typically, DVB-S2-BB uses [UDP](/UDP) as its transport protocol. The port is not specified.

  - [RTP](/RTP): Alternatively the output can be sent within [RTP](/RTP) messages. This dissector currently only supports UDP dissection.

## Example traffic

The screenshot shows dissection of the baseband frames with several segmented and unsegmented GSE frames inside. The data is also available in the *example capture file* (below).

*![dvb-s2\_bb\_example.jpg](uploads/__moin_import__/attachments/DVB-S2/dvb-s2_bb_example.jpg "dvb-s2_bb_example.jpg")*

## Wireshark

The DVB-S2 dissector is fully functional. There are some missing features which might be implemented in future (this list is sorted with descending priority, highest priority is on the first bullet):

  - reassembly of segmented GSE packets (over several baseband frames)
  - display other baseband payload then GSE (e.g. MPE)
  - label re-use (display last used label)
  - RTP support
  - Header extensions

## Preference Settings

  - Enable dissector
  - Enable dissection of GSE data

In the protocol preference settings the DVB-S2 dissector can be globally enabled or disabled. This setting defaults to "disabled".

To dissect the content of the captured GSE frame the second check box has to be selected. In case of segmentation of the GSE packets over several baseband frames the dissection of the encapsulated content is not supported at the moment. The default setting is "disabled", i.e. the content of the GSE frame is displayed as hex data.

## Example capture file

The example capture file shows several pings with different sizes encapsulated in baseband frames. The data was sent over satellite with different modulations, fec's and frame lengths (different modeadaption headers).

  - [SampleCaptures/dvb-s2\_bb\_example.pcap](uploads/__moin_import__/attachments/SampleCaptures/dvb-s2_bb_example.pcap)

## Display Filter

Show only the protocol based traffic:

``` 
 dvb-s2_modeadapt or dvb-s2_bb or dvb-s2_gse 
```

## External links and Standards reference

1.  *[Mode Adaption Input and Output Interface](http://satlabs.org/pdf/sl_561_Mode_Adaptation_Input_and_Output_Interfaces_for_DVB-S2_Equipment_v1.3.pdf)*

2.  *[DVB Framing Structure](http://www.etsi.org/deliver/etsi_en/302300_302399/302307/01.02.01_60/en_302307v010201p.pdf)*

3.  *[DVB Generic Stream Encapsulation](http://www.etsi.org/deliver/etsi_ts/102600_102699/102606/01.01.01_60/ts_102606v010101p.pdf)*

## Discussion

---

Imported from https://wiki.wireshark.org/DVB-S2 on 2020-08-11 23:13:41 UTC
