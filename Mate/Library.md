# MATE Library

The MATE library (will) contains GoP definitions for several protocols. Library protocols are included in your MATE config using: ` Action=Include; Lib=proto_name; `

For Every protocol with a library entry, we'll find defined what from the PDU is needed to create a GoP for that protocol, eventually any criteria and the very essential GoP definition (i.e. `GopDef`, `GopStart` and `GopStop`).

[[_TOC_]]

## General use protocols

### TCP

It will create a GoP for every TCP session, If it is used it should be the last one in the list. And every other proto on top of TCP should be declared with `Stop=TRUE;` so the a TCP PDU is not created where we got already one going on.

``` 
   Action=PduDef; Name=tcp_pdu; Proto=tcp; Transport=ip; addr=ip.addr; port=tcp.port; tcp_start=tcp.flags.syn; tcp_stop=tcp.flags.fin; tcp_stop=tcp.flags.reset;
   Action=GopDef; Name=tcp_session; On=tcp_pdu; addr; addr; port; port;
   Action=GopStart; For=tcp_session; tcp_start=1;
   Action=GopStop; For=tcp_session; tcp_stop=1;
```

### DNS

will create a GoP containing every request and it's response (eventually retransmissions too)

    Action=PduDef; Name=dns_pdu; Proto=dns; Transport=udp/ip; addr=ip.addr; port=udp.port; dns_id=dns.id; dns_rsp=dns.flags.response;
    
    Action=GopDef; Name=dns_req; On=dns_pdu; addr; addr; port!53; dns_id;
    Action=GopStart; For=dns_req; dns_rsp=0;
    Action=GopStop; For=dns_req; dns_rsp=1;

### RADIUS

A Gop for every transaction

    Action=PduDef; Name=radius_pdu; Proto=radius; Transport=udp/ip; addr=ip.addr; port=udp.port; radius_id=radius.id; radius_code=radius.code;
    
    Action=GopDef; Name=radius_req; On=radius_pdu; radius_id; addr; addr; port; port;
    Action=GopStart; For=radius_req; radius_code|1|4|7;
    Action=GopStop; For=radius_req; radius_code|2|3|5|8|9;

### RTSP

    Action=PduDef; Name=rtsp_pdu; Proto=rtsp; Transport=tcp/ip; addr=ip.addr; port=tcp.port; rtsp_method=rtsp.method;
    Action=PduExtra; For=rtsp_pdu; rtsp_ses=rtsp.session; rtsp_url=rtsp.url;
    
    Action=GopDef; Name=rtsp_ses; On=rtsp_pdu; addr; addr; port; port;
    Action=GopStart; For=rtsp_ses; rtsp_method=DESCRIBE;
    Action=GopStop; For=rtsp_ses; rtsp_method=TEARDOWN;
    Action=GopExtra; For=rtsp_ses; rtsp_ses; rtsp_url;

## VoIP/Telephony

Most protocol definitions here will create one Gop for every Call Leg unless stated.

### ISUP

    Action=PduDef; Name=isup_pdu; Proto=isup; Transport=mtp3; mtp3pc=mtp3.dpc; mtp3pc=mtp3.opc; cic=isup.cic; isup_msg=isup.message_type;
    
    Action=GopDef; Name=isup_leg; On=isup_pdu; ShowPduTree=TRUE; mtp3pc; mtp3pc; cic;
    Action=GopStart; For=isup_leg; isup_msg=1;
    Action=GopStop; For=isup_leg; isup_msg=16;

### Q931

    Action=PduDef; Name=q931_pdu; Proto=q931; Stop=TRUE; Transport=tcp/ip; addr=ip.addr; call_ref=q931.call_ref; q931_msg=q931.message_type;
    
    Action=GopDef; Name=q931_leg; On=q931_pdu; addr; addr; call_ref;
    Action=GopStart; For=q931_leg; q931_msg=5;
    Action=GopStop; For=q931_leg; q931_msg=90;

### H225 RAS

    Action=PduDef; Name=ras_pdu; Proto=h225.RasMessage; Transport=udp/ip; addr=ip.addr; ras_sn=h225.RequestSeqNum; ras_msg=h225.RasMessage;
    Action=PduExtra; For=ras_pdu; guid=h225.guid;
    
    Action=GopDef; Name=ras_leg; On=ras_pdu; addr; addr; ras_sn;
    Action=GopStart; For=ras_leg; ras_msg|0|3|6|9|12|15|18|21|26|30;
    Action=GopStop; For=ras_leg; ras_msg|1|2|4|5|7|8|10|11|13|14|16|17|19|20|22|24|27|28|29|31;
    Action=GopExtra; For=ras_leg; guid;

### SIP

    Action=PduDef; Proto=sip_pdu; Transport=tcp/ip; addr=ip.addr; port=tcp.port; sip_method=sip.Method; sip_callid=sip.Call-ID; calling=sdp.owner.username;
    
    Action=GopDef; Name=sip_leg; On=sip_pdu; addr; addr; port; port;
    Action=GopStart; For=sip; sip_method=INVITE;
    Action=GopStop; For=sip; sip_method=BYE;

### MEGACO

Will create a Gop out of every transaction

To "tie" them to your call's GoG use: ` Action=GogKey; Name=your_call; On=mgc_tr;   addr!mgc_addr; megaco_ctx;`

    Action=PduDef; Name=mgc_pdu; Proto=megaco; Transport=ip; addr=ip.addr; megaco_ctx=megaco.context; megaco_trx=megaco.transid; megaco_msg=megaco.transaction; term=megaco.termid;
    
    Action=GopDef; Name=mgc_tr; On=mgc_pdu; addr; addr; megaco_trx;
    Action=GopStart; For=mgc_tr; megaco_msg|Request|Notify;
    Action=GopStop; For=mgc_tr; megaco_msg=Reply;
    Action=GopExtra; For=mgc_tr; term^DS1; megaco_ctx!Choose one;

---

Imported from https://wiki.wireshark.org/Mate/Library on 2020-08-11 23:16:33 UTC
