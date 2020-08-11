# Remote Direct Memory Access Protocol (iWARP-RDMAP)

RDMAP operates over [iWARP-DDP](/iWARP-DDP). RDMAP provides read and write services directly to applications and enables data to be transferred directly into Upper Layer Protocol (ULP) Buffers without intermediate data copies. It also enables a kernel bypass implementation.

## History

This protocol has been defined in [RFC 5040](http://www.ietf.org/rfc/rfc5040.txt) in October 2007.

## Protocol dependencies

  - [iWARP-DDP](/iWARP-DDP): This is the underlying protocol over which RDMAP is designed to operate.

## Example traffic

{{{Frame 42 (1110 bytes on wire, 1110 bytes captured)

Arrival Time: Mar 27, 2008 17:31:45.022540000 \[Time delta from previous captured frame: 0.000040000 seconds\] \[Time delta from previous displayed frame: 0.000040000 seconds\] \[Time since reference or first frame: 0.001439000 seconds\] Frame Number: 42 Frame Length: 1110 bytes Capture Length: 1110 bytes \[Frame is marked: False\] \[Protocols in frame: eth:ip:tcp:iwarp\_mpa:iwarp\_ddp\_rdmap:data\] \[Coloring Rule Name: TCP\] \[Coloring Rule String: tcp\]

Ethernet II, Src: Ibm\_8d:3c:cd (00:11:25:8d:3c:cd), Dst: Ibm\_8d:3b:73 (00:11:25:8d:3b:73)

Destination: Ibm\_8d:3b:73 (00:11:25:8d:3b:73) Source: Ibm\_8d:3c:cd (00:11:25:8d:3c:cd) Type: IP (0x0800)

Internet Protocol, Src: 10.0.0.19 (10.0.0.19), Dst: 10.0.0.18 (10.0.0.18)

Version: 4 Header length: 20 bytes Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00) Total Length: 1096 Identification: 0x3077 (12407) Flags: 0x04 (Don't Fragment) Fragment offset: 0 Time to live: 64 Protocol: TCP (0x06) Header checksum: 0xf214 \[correct\] Source: 10.0.0.19 (10.0.0.19) Destination: 10.0.0.18 (10.0.0.18)

Transmission Control Protocol, Src Port: 34185 (34185), Dst Port: 4210 (4210), Seq: 68, Ack: 21001, Len: 1044

Source port: 34185 (34185) Destination port: 4210 (4210) Sequence number: 68 (relative sequence number) \[Next sequence number: 1112 (relative sequence number)\] Acknowledgement number: 21001 (relative ack number) Header length: 32 bytes Flags: 0x18 (PSH, ACK) Window size: 50048 (scaled) Checksum: 0xf4cd \[correct\] Options: (12 bytes) \[SEQ/ACK analysis\]

iWARP Marker Protocol data unit Aligned framing iWARP Direct Data Placement and Remote Direct Memory Access Protocol

DDP header RDMAP header

  - RDMAP control field
      - 01.. .... = Version: 1
    
      - .00 .... = Reserved: 0x00
    
      - ... 0010 = [OpCode](/OpCode): Read Response (0x02)

Data (1024 bytes)

0000 02 02 02 02 02 02 02 02 02 02 02 02 02 02 02 02 ................ 0010 02 02 02 02 02 02 02 02 02 02 02 02 02 02 02 02 ................ \<snip\> ... \<\\snip\> 03d0 02 02 02 02 02 02 02 02 02 02 02 02 02 02 02 02 ................ 03e0 02 02 02 02 02 02 02 02 02 02 02 02 02 02 02 02 ................ 03f0 02 02 02 02 02 02 02 02 02 02 02 02 02 02 02 02 ................

Data: 020202020202020202020202020202020202020202020202...

}}}

## Wireshark

The iWARP-RDMAP dissector is fully functional. Since the headers of iWARP-RDMAP and iWARP-DDP overlap and since iWARP-DDP is in practice never seen without RDMAP on top, we have built a combined dissector that implements both protocols together as *iwarp\_ddp\_rdmap*. We discussed this with Guy Harris at the latest Sharkfest.

## Preference Settings

No preference settings.

## Example capture file

  - [SampleCaptures/iwarp\_send\_recv.tar.gz](uploads/__moin_import__/attachments/SampleCaptures/iwarp_send_recv.tar.gz)

  - [SampleCaptures/iwarp\_rdma.tar.gz](uploads/__moin_import__/attachments/SampleCaptures/iwarp_rdma.tar.gz)

## Display Filter

A complete list of iWARP-RDMAP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/i/iWARP-RDMAP.html)

Show only the iWARP-RDMAP based traffic:

``` 
 iwarp_ddp_rdmap 
```

## Capture Filter

You cannot directly filter iWARP-RDMAP protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

## External links

  - [RFC 5040](http://www.ietf.org/rfc/rfc5040.txt) *A Remote Direct Memory Access Protocol Specification*

## Discussion

---

Imported from https://wiki.wireshark.org/iWARP-RDMAP on 2020-08-11 23:15:35 UTC
