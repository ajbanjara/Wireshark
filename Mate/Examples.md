# MATE: Example Configurations

The following is a collection of various configuration examples for MATE. Many of them are useless because the "conversations" facility does a better job. Anyway they are meant to help users understanding how to configure MATE.

[[_TOC_]]

### TCP session

The following example creates a GoP out of every TCP session.

    Pdu tcp_pdu Proto tcp Transport ip {
        Extract addr From ip.addr;
        Extract port From tcp.port;
        Extract tcp_start From tcp.flags.syn;
        Extract tcp_stop From tcp.flags.reset;
        Extract tcp_stop From tcp.flags.fin;
    };
    
    Gop tcp_ses On tcp_pdu Match (addr, addr, port, port) {
        Start (tcp_start=1);
        Stop (tcp_stop=1);
    };
    
    Done;

This probably would do fine in 99.9% of the cases but 10.0.0.1:20-\>10.0.0.2:22 and 10.0.0.1:22-\>10.0.0.2:20 would both fall into the same gop if they happen to overlap in time.

  - filtering with **mate.tcp\_ses.Time \> 1** will give all the sessions that last less than one second

  - filtering with **mate.tcp\_ses.NumOfPdus \< 5** will show all tcp sessions that have less than 5 packets.

  - filtering with **mate.tcp\_ses.Id == 3** will show all the packets for the third tcp session MATE has found

### a Gog for a complete FTP session

This configuration allows to tie a complete passive ftp session (including the data transfer) in a single Gog.

    Pdu ftp_pdu Proto ftp Transport tcp/ip {
            Extract ftp_addr From ip.addr;
            Extract ftp_port From tcp.port;
            Extract ftp_resp From ftp.response.code;
            Extract ftp_req From ftp.request.command;
            Extract server_addr From ftp.passive.ip;
            Extract server_port From ftp.passive.port;
    
            LastPdu true;
    };
    
    Pdu ftp_data_pdu Proto ftp-data Transport tcp/ip{
            Extract server_addr From ip.src;
            Extract server_port From tcp.srcport;
    
    };
    
    Gop ftp_data On ftp_data_pdu Match (server_addr, server_port) {
            Start (server_addr);
    };
    
    Gop ftp_ctl On ftp_pdu Match (ftp_addr, ftp_addr, ftp_port, ftp_port) {
            Start (ftp_resp=220);
            Stop (ftp_resp=221);
            Extra (server_addr, server_port);
    };
    
    Gog ftp_ses {
            Member ftp_ctl (ftp_addr, ftp_addr, ftp_port, ftp_port);
            Member ftp_data (server_addr, server_port);
    };
    
    Done;

The config file is here: [pasv\_ftp.mate](uploads/__moin_import__/attachments/Mate/Examples/pasv_ftp.mate)

Note: not having anything to distinguish between ftp-data packets makes this config to create one Gop for every ftp-data packet instead of each transfer. [Pre-started](/Mate/Discussion) Gops would avoid this

### using RADIUS to filter SMTP traffic of a specific user

Spying on people, in addition to being immoral, is illegal in many countries. This is an example meant to explain how to do it not an invitation to do so. It's up to the police to do this kind of job when there is a good reason to do so.

    Pdu radius_pdu On radius Transport udp/ip {
        Extract addr From ip.addr;
        Extract port From udp.port;
        Extract radius_id From radius.id;
        Extract radius_code From radius.code;
        Extract user_ip From radius.framed_addr;
        Extract username From radius.username;
    }
    
    Gop radius_req On radius_pdu (radius_id, addr, addr, port, port) {
        Start (radius_code {1|4|7} );
        Stop (radius_code {2|3|5|8|9} );
        Extra (user_ip, username);
    }
    
    // we define the smtp traffic we want to filter
    Pdu user_smtp Proto smtp Transport tcp/ip {
        Extract user_ip From ip.addr;
        Extract smtp_port From tcp.port;
        Extract tcp_start From tcp.flags.syn;
        Extract tcp_stop From tcp.flags.reset;
    }
    
    Gop user_smtp_ses On user_smtp (user_ip, user_ip, smtp_port!25) {
        Start (tcp_start=1);
        Stop (tcp_stop=1);
    }
    
    // with the following group of groups we'll group toghether the radius and the smtp
    // we set a long expiration to avoid the session expire on long pauses.
    Gog user_mail {
        Expiration 1800;
        Member radius_req (user_ip);
        Member user_smtp_ses (user_ip);
        Extra (username);
    }
    
    Done;

Filtering the capture file with **mate.user\_mail.username == "theuser"** will filter the radius packets and smtp traffic for *"theuser"*

### H323 Calls

This configuration will create a Gog out of every call.

    Pdu q931 Proto q931 Transport ip {
            Extract addr From ip.addr;
            Extract call_ref From q931.call_ref;
            Extract q931_msg From q931.message_type;
            Extract calling From q931.calling_party_number.digits;
            Extract called From q931.called_party_number.digits;
            Extract guid From h225.guid;
            Extract q931_cause From q931.cause_value;
    };
    
    Gop q931_leg On q931 Match (addr, addr, call_ref) {
            Start (q931_msg=5);
            Stop (q931_msg=90);
            Extra (calling, called, guid, q931_cuase);
    };
    
    Pdu ras Proto h225.RasMessage Transport ip {
            Extract addr From ip.addr;
            Extract ras_sn From h225.requestSeqNum;
            Extract ras_msg From h225.RasMessage;
            Extract guid From h225.guid;
    };
    
    Gop ras_req On ras Match (addr, addr, ras_sn) {
            Start (ras_msg {0|3|6|9|12|15|18|21|26|30} );
            Stop (ras_msg {1|2|4|5|7|8|10|11|13|14|16|17|19|20|22|24|27|28|29|31});
            Extra (guid);
    };
    
    Gog call {
            Member ras_req (guid);
            Member q931_leg (guid);
            Extra (called,calling,q931_cause);
    };
    
    Done;

with this we can:

  - filter all signalling for a specific caller: **mate.call.caller == "123456789"**

  - filter all signalling for calls with a specific release cause: **mate.call.q931\_cause == 31**

  - filter all signalling for very short calls: **mate.q931\_leg.Time \< 5**

### MMS

With this example, all the components of an MMS send or receive will be tied into a single Gog. Note that this example uses the `Payload` clause because MMS delivery uses MMSE over either HTTP or WSP. As it is not possible to relate the retrieve request to a response by the means of MMSE only (the request is just an HTTP GET without any MMSE), a Gop is made of HTTP Pdus but MMSE data need to be extracted from the bodies.

    ## WARNING: this example has been blindly translated from the "old" MATE syntax and it has been verified that Wireshark accepts it. However, it has not been tested against any capture file due to lack of the latter. See the original example below if in doubt.
    
    Transform rm_client_from_http_resp1 {
            Match (http_rq);
            Match Every (addr) Insert (not_rq);
    };
    
    Transform rm_client_from_http_resp2 {
            Match (not_rq,ue) Replace ();
    };
    
    Pdu mmse_over_http_pdu Proto http Transport tcp/ip {
            Payload mmse;
            Extract addr From ip.addr;
            Extract port From tcp.port;
            Extract http_rq From http.request;
            Extract content From http.content_type;
            Extract resp From http.response.code;
            Extract method From http.request.method;
            Extract host From http.host;
            Extract content From http.content_type;
            Extract trx From mmse.transaction_id;
            Extract msg_type From mmse.message_type;
            Extract notify_status From mmse.status;
            Extract send_status From mmse.response_status;
            Transform rm_client_from_http_resp1, rm_client_from_http_resp2;
    };
    
    Gop mmse_over_http On mmse_over_http_pdu Match (addr, addr, port, port) {
            Start (http_rq);
            Stop (http_rs);
            Extra (host, ue, resp, notify_status, send_status, trx);
    };
    
    Transform mms_start {
            Match Loose() Insert (mms_start);
    };
    
    Pdu mmse_over_wsp_pdu Proto wsp Transport ip {
            Payload mmse;
            Extract trx From mmse.transaction_id;
            Extract msg_type From mmse.message_type;
            Extract notify_status From mmse.status;
            Extract send_status From mmse.response_status;
            Transform mms_start;
    };
    
    Gop mmse_over_wsp On mmse_over_wsp_pdu Match (trx) {
            Start (mms_start);
            Stop (never);
            Extra (ue, notify_status, send_status);
    };
    
    Gog mms {
            Member mmse_over_http (trx);
            Member mmse_over_wsp (trx);
            Extra (ue, notify_status, send_status, resp, host, trx);
            Expiration 60.0;
    };

Below is the same example noted using the "old" MATE grammar for reference.

    ## WARNING: this example uses the "old" MATE syntax so it won't work in modern versions of Wireshark.  See the examples above for the correct syntax.
    
    # MMSE over HTTP
    Action=PduDef;   Name=mmse_over_http_pdu; Proto=http; Transport=tcp/ip; Payload=mmse; addr=ip.addr; port=tcp.port; http_rq=http.request; content=http.content_type;
    Action=PduExtra; For=mmse_over_http_pdu;  resp=http.response.code; method=http.request.method; host=http.host; content=http.content_type;
    Action=PduExtra; For=mmse_over_http_pdu;  method=http.request.method; host=http.host;
    Action=PduExtra; For=mmse_over_http_pdu;  trx=mmse.transaction_id; msg_type=mmse.message_type; notify_status=mmse.status; send_status=mmse.response_status;
    
    Action=Transform; Name=rm_client_from_http_resp1; Mode=Insert; Match=Strict; http_rq;
    Action=Transform; Name=rm_client_from_http_resp1; Mode=Insert; Match=Every; addr; .not_rq;
    
    Action=Transform; Name=rm_client_from_http_resp2; Mode=Replace; Match=Strict; not_rq; ue;
    
    Action=PduTransform; For=mmse_over_http_pdu; Name=rm_client_from_http_resp1;
    Action=PduTransform; For=mmse_over_http_pdu; Name=rm_client_from_http_resp2;
    
    Action=GopDef; Name=mmse_over_http; On=mmse_over_http_pdu; addr; addr; port; port;
    Action=GopStart; For=mmse_over_http; http_rq;
    Action=GopStop; For=mmse_over_http; http_rs;
    
    Action=GopExtra; For=mmse_over_http; host; ue; resp; notify_status; send_status; trx;
    
    # MMSE over WSP
    Action=PduDef; Name=mmse_over_wsp_pdu; Proto=wsp; Payload=mmse; Transport=ip; trx=mmse.transaction_id; msg_type=mmse.message_type; notify_status=mmse.status; send_status=mmse.response_status;
    
    Action=Transform; Name=mms_start; Match=Loose; .mms_start;
    
    Action=PduTransform;  Name=mms_start; For=mmse_over_wsp_pdu;
    
    Action=GopDef; Name=mmse_over_wsp; On=mmse_over_wsp_pdu; trx;
    Action=GopStart; For=mmse_over_wsp; mms_start;
    Action=GopStop; For=mmse_over_wsp; never;
    
    Action=GopExtra; For=mmse_over_wsp; ue; notify_status; send_status;
    
    # the MMS GoG
    Action=GogDef; Name=mms; GogExpiration=60.0;
    Action=GogKey; For=mms; On=mmse_over_http; trx;
    Action=GogKey; For=mms; On=mmse_over_wsp; trx;
    Action=GogExtra; For=mms; ue; notify_status; send_status; resp; host; trx;

### MATE's reason

This example is [the cause](/Mate/Accident) of MATE existence. It's meant to work with Ericsson's ViG (Video Gateway).

By filtering with **mate.vig\_call.calling == "1234567890"** I get all the signalling of the calls made by "1234567890".

    ## WARNING: this example uses the "old" MATE syntax so it won't work in modern versions of Wireshark.  See the examples above for the correct syntax.
    
    # The file MGC-MGw.mate is a series of transformations necessary to map isup cics to megaco terminations
    Action=Include; Filename=MGC-MGw.mate;
    
    # this are set before we load the Library so that these are the defaults when Lib items are loaded
    Action=Settings; ShowPduTree=FALSE; DiscardPduData=TRUE;
    
    # see Mate/Library to see what these are
    Action=Include; Lib=isup;
    Action=Include; Lib=h225_ras;
    Action=Include; Lib=q931;
    Action=Include; Lib=megaco;
    Action=Include; Lib=rtsp;
    Action=Include; Lib=sip;
    
    # extra attributes needed to trac a call
    Action=PduExtra; For=q931_pdu; guid=h225.guid; calling=q931.calling_party_number.digits; q931_cause=q931.cause_value;
    Action=PduExtra; For=isup_pdu; calling=isup.calling; isup_cause=isup.cause_indicator;
    Action=PduExtra; For=ras_pdu; guid=h225.guid;
    Action=PduExtra; For=rtsp_pdu; calling=X_Vig_Msisdn;
    Action=PduExtra; For=sip_pdu; calling=sdp.owner.username;
    
    # extra attributes moved from Pdu to Gop
    Action=GopExtra; For=q931_leg; calling; q931_cause; guid;
    
    Action=GopExtra; For=isup_leg;  calling; isup_cause;
    
    # mgw_mgc and mgw_mgc transformation mapping are defined in MGC-MGw.mate
    Action=GopTransform; For=isup_leg; Name=mgw_mgc;
    Action=GopTransform; For=mgc_tr; Name=mgc_mgw;
    
    Action=GopExtra; For=ras_leg; guid;
    
    Action=GopExtra; For=rtsp_ses; calling;
    
    Action=GopExtra; For=sip_leg; calling;
    
    
    Action=GogDef; Name=vig_call; GogExpiration=0.5;
    Action=GogExtra; For=vig_call; isup_cause; q931_cause; term; calling; guid; megaco_ctx; mtp3pc; mtp3pc; cic;
    
    # A call has sessions of the following protocols
    Action=GogKey; For=vig_call; On=isup_leg; calling;
    Action=GogKey; For=vig_call; On=isup_leg; term;
    
    
    Action=GogKey; For=vig_call; On=q931_leg; calling;
    Action=GogKey; For=vig_call; On=q931_leg; guid;
    
    Action=GogKey; For=vig_call; On=ras_leg; guid;
    
    Action=GogKey; For=vig_call; On=mgc_tr; megaco_ctx;
    Action=GogKey; For=vig_call; On=mgc_tr; term;
    Action=GogKey; For=vig_call; On=mgc_tr; mtp3pc; mtp3pc; cic;
    
    Action=GogKey; For=vig_call; On=rtsp_ses; calling;
    
    Action=GogKey; For=vig_call; On=sip_leg; calling;

the **MGC-MGw.mate** file is generated using [mgw.pl](uploads/__moin_import__/attachments/Mate/Examples/mgw.pl) and looks like:

    ## WARNING: this example uses the "old" MATE syntax so it won't work in modern versions of Wireshark.  See the examples above for the correct syntax.
    
    Action=Transform; Name=mgw_mgc; Match=Strict; Mode=Insert; mtp3pc=12163;  mtp3pc=5378; cic=128; .term=DS1/0/3/0;
    Action=Transform; Name=mgc_mgw; Match=Strict; Mode=Insert; term=DS1/0/3/0; .mtp3pc=12163; .mtp3pc=5378; .cic=128;

---

Imported from https://wiki.wireshark.org/Mate/Examples on 2020-08-11 23:16:31 UTC
