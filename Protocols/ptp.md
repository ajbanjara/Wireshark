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

![220209_PTP_UDP_ports](uploads/bdaf8f0923efde9cfc27423d550ad6f4/220209_PTP_UDP_ports.png)
  
 - UDP port(s):  
UDP port(s)/range(s) to decode as PTP     (Default: 319-320)

Future release - not in current 3.6.1 version  
  
 - "analyze_ptp_messages", "Analyze PTP messages",
"Make the PTP dissector analyze PTP messages. Accurate Capture Timestamps required!",
&ptp_analyze_messages);

### Expert Information messages
```
    static ei_register_info ei[] = {
        { &ei_ptp_v2_msg_len_too_large, { "ptp.v2.msg_len_too_large", PI_MALFORMED, PI_ERROR, "Message length goes past the end of the packet", EXPFILL }},
        { &ei_ptp_v2_msg_len_too_small, { "ptp.v2.msg_len_too_small", PI_MALFORMED, PI_ERROR, "Message length too short to include the message length field", EXPFILL }},
```
Future release - not in current 3.6.1 version  
```
        { &ei_ptp_v2_sync_no_followup,  { "ptp.v2.sync_no_fup", PI_PROTOCOL, PI_WARN, "No Follow Up for this 2-Step Sync", EXPFILL }},
        { &ei_ptp_v2_followup_no_sync,  { "ptp.v2.fup_without_sync", PI_PROTOCOL, PI_WARN, "No Sync for this Follow Up", EXPFILL }},
        { &ei_ptp_v2_pdreq_no_pdresp,   { "ptp.v2.pdelay_req_without_resp", PI_PROTOCOL, PI_WARN, "No Response for this Peer Delay Request", EXPFILL }},
        { &ei_ptp_v2_pdresp_no_pdreq,   { "ptp.v2.pdelay_resp_without_req", PI_PROTOCOL, PI_WARN, "No Request for this Peer Delay Response", EXPFILL }},
        { &ei_ptp_v2_pdresp_no_pdfup,   { "ptp.v2.pdelay_resp_without_fup", PI_PROTOCOL, PI_WARN, "No Follow Up for this Peer Delay Response", EXPFILL }},
        { &ei_ptp_v2_pdfup_no_pdresp,   { "ptp.v2.pdelay_fup_without_resp", PI_PROTOCOL, PI_WARN, "No Response for this Peer Delay Follow Up", EXPFILL }},
    };
```

## Example capture file

  - [SampleCaptures/PTP\_sync.pcap](uploads/__moin_import__/attachments/SampleCaptures/PTP_sync.pcap)

  - [SampleCaptures/ptpv2.pcap](uploads/__moin_import__/attachments/SampleCaptures/ptpv2.pcap) some PTP version 2 packets

  - [SampleCaptures/ptpv2_anon.pcapng](uploads/faca5622d7ec2f07f1a9ee3f062fdfac/ptpv2_anon.pcapng) ptpv2.pcap modified with [TraceWrangler](http://www.tracewrangler.com/) to use non-standard ports (42319,42320)  

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
