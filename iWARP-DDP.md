# Direct Data Placement over Reliable Transports (iWARP-DDP)

The Direct Data Placement protocol provides information to Place the incoming data directly into an upper layer protocol's receive buffer without intermediate buffers.

## History

This protocol has been defined in [RFC 5041](http://www.ietf.org/rfc/rfc5041.txt) in October 2007.

## Protocol dependencies

  - [TCP](/TCP): Typically, iWARP-MPA uses [iWARP-MPA](/iWARP-MPA) on top of [TCP](/TCP) as its transport protocol.

  - [SCTP](/SCTP): iWARP-DDP can also run on top of [SCTP](/SCTP)

## Example traffic

    Frame 10 (106 bytes on wire, 106 bytes captured)
        Arrival Time: Mar 26, 2008 18:13:03.752539000
        [Time delta from previous captured frame: 0.000043000 seconds]
        [Time delta from previous displayed frame: 0.000043000 seconds]
        [Time since reference or first frame: 0.000355000 seconds]
        Frame Number: 10
        Frame Length: 106 bytes
        Capture Length: 106 bytes
        [Frame is marked: False]
        [Protocols in frame: eth:ip:tcp:iwarp_mpa:iwarp_ddp_rdmap:data]
        [Coloring Rule Name: TCP]
        [Coloring Rule String: tcp]
    Ethernet II, Src: Ibm_8d:3c:cd (00:11:25:8d:3c:cd), Dst: Ibm_8d:3b:73 (00:11:25:8d:3b:73)
        Destination: Ibm_8d:3b:73 (00:11:25:8d:3b:73)
        Source: Ibm_8d:3c:cd (00:11:25:8d:3c:cd)
        Type: IP (0x0800)
    Internet Protocol, Src: 10.0.0.19 (10.0.0.19), Dst: 10.0.0.18 (10.0.0.18)
        Version: 4
        Header length: 20 bytes
        Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
        Total Length: 92
        Identification: 0xbc5d (48221)
        Flags: 0x04 (Don't Fragment)
        Fragment offset: 0
        Time to live: 64
        Protocol: TCP (0x06)
        Header checksum: 0x6a1a [correct]
        Source: 10.0.0.19 (10.0.0.19)
        Destination: 10.0.0.18 (10.0.0.18)
    Transmission Control Protocol, Src Port: 35959 (35959), Dst Port: 4210 (4210), Seq: 28, Ack: 69, Len: 40
        Source port: 35959 (35959)
        Destination port: 4210 (4210)
        Sequence number: 28    (relative sequence number)
        [Next sequence number: 68    (relative sequence number)]
        Acknowledgement number: 69    (relative ack number)
        Header length: 32 bytes
        Flags: 0x18 (PSH, ACK)
        Window size: 5888 (scaled)
        Checksum: 0x1ae1 [correct]
        Options: (12 bytes)
    iWARP Marker Protocol data unit Aligned framing
        FPDU
            ULPDU length: 34 bytes
            CRC: 0x00000000
    iWARP Direct Data Placement and Remote Direct Memory Access Protocol
        DDP header
            DDP control field
                0... .... = Tagged flag: False
                .1.. .... = Last flag: True
                ..00 00.. = Reserved: 0x00
                .... ..01 = DDP protocol version: 1
            Reserved for use by the ULP: 4300000000
            Untagged buffer model
                Queue number: 0
                Message sequence number: 1
                Message offset: 0
        RDMAP header
    Data (16 bytes)
    
    0000  00 04 00 00 01 00 00 00 00 b0 05 08 00 00 00 00   ................
        Data: 000400000100000000B0050800000000

## Wireshark

The iWARP-DDP dissector is fully functional. Since the headers of iWARP-RDMAP and iWARP-DDP overlap and since iWARP-DDP is in practice never seen without RDMAP on top, we have built a combined dissector that implements both protocols together as *iwarp\_ddp\_rdmap*. We discussed this with Guy Harris at the latest Sharkfest.

We assume that it is running on top of [iWARP-MPA](/iWARP-MPA). [SCTP](/SCTP) support is not yet implemented since it is not used in practice. The following would have to be added for [SCTP](/SCTP) support:

    #define DDP_SEGMENT_CHUNK_ID 16
    #define DDP_STREAM_SESSION_CONTROL_ID 17
    
    static int
    dissect_ddp_segment_chunk(...)
    {
        /* dissection code for DDP segment chunk carried within SCTP */
    }
    
    static int
    dissect_ddp_stream_session_ctrl(...)
    {
        /* dissection code for DDP stream control carried within SCTP */
    }
    
    void
    proto_reg_handoff_iwarp_ddp_rdmap(voi)
    {
        dissector_handle_t seg_chunk_handle;
        dissector_handle_t str_ses_ctrl_handle;
    
        seg_chunk_handle = create_dissector_handle(dissect_ddp_segment_chunk, proto_iwarp_ddp_rdmap);
        str_ses_ctrl_handle = create_dissector_handle(dissect_ddp_stream_session_ctrl, proto_iwarp_ddp_rdmap);
    
        dissector_add("sctp.ppi", DDP_SEGMENT_CHUNK_ID, seg_chunk_handle);
        dissector_add("sctp.ppi", DDP_STREAM_SESSION_CONTROL_ID, str_ses_ctrl_handle);
    } 

## Preference Settings

No preference settings.

## Example capture file

  - [SampleCaptures/iwarp\_send\_recv.tar.gz](uploads/__moin_import__/attachments/SampleCaptures/iwarp_send_recv.tar.gz)

  - [SampleCaptures/iwarp\_rdma.tar.gz](uploads/__moin_import__/attachments/SampleCaptures/iwarp_rdma.tar.gz)

## Display Filter

A complete list of iWARP-DDP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/i/iWARP-DDP.html)

Show only the iWARP-DDP based traffic:

``` 
 iwarp_ddp_rdmap 
```

## Capture Filter

You cannot directly filter iWARP-DDP protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

## External links

  - [RFC 5041](http://www.ietf.org/rfc/rfc5041.txt) *Direct Data Placement over Reliable Transports*

## Discussion

---

Imported from https://wiki.wireshark.org/iWARP-DDP on 2020-08-11 23:15:34 UTC
