# Marker PDU Aligned Framing (iWARP-MPA)

MPA is designed to work as an adaptation layer between TCP and the Direct Data Placement Protocol ([iWARP-DDP](/iWARP-DDP)). It preserves the reliable in-order delivery of ([TCP](/TCP)), while adding the preservation of higher-level protocol record boundaries that ([iWARP-DDP](/iWARP-DDP)) requires.

## History

This protocol has been defined in [RFC 5044](http://www.ietf.org/rfc/rfc5044.txt) in October 2007.

## Protocol dependencies

  - [TCP](/TCP): Typically, iWARP-MPA uses [TCP](/TCP) as its transport protocol. There is no well known port for iWARP-MPA.

## Example traffic

    Frame 4 (93 bytes on wire, 93 bytes captured)
        Arrival Time: Mar 26, 2008 18:13:03.752331000
        [Time delta from previous captured frame: 0.000040000 seconds]
        [Time delta from previous displayed frame: 0.000040000 seconds]
        [Time since reference or first frame: 0.000147000 seconds]
        Frame Number: 4
        Frame Length: 93 bytes
        Capture Length: 93 bytes
        [Frame is marked: False]
        [Protocols in frame: eth:ip:tcp:iwarp_mpa]
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
        Total Length: 79
        Identification: 0xbc5a (48218)
        Flags: 0x04 (Don't Fragment)
        Fragment offset: 0
        Time to live: 64
        Protocol: TCP (0x06)
        Header checksum: 0x6a2a [correct]
        Source: 10.0.0.19 (10.0.0.19)
        Destination: 10.0.0.18 (10.0.0.18)
    Transmission Control Protocol, Src Port: 35959 (35959), Dst Port: 4210 (4210), Seq: 1, Ack: 1, Len: 27
        Source port: 35959 (35959)
        Destination port: 4210 (4210)
        Sequence number: 1    (relative sequence number)
        [Next sequence number: 28    (relative sequence number)]
        Acknowledgement number: 1    (relative ack number)
        Header length: 32 bytes
        Flags: 0x18 (PSH, ACK)
        Window size: 5888 (scaled)
        Checksum: 0xb9af [correct]
        Options: (12 bytes)
    iWARP Marker Protocol data unit Aligned framing
        Request frame header
            ID Req frame: 4D504120494420526571204672616D65
            0... .... = Marker flag: False
            .0.. .... = CRC flag: False
            ..0. .... = Connection rejected flag: False
            ...0 0000 = Reserved: 0x00
            Revision: 1
            Private data length: 7 bytes
            Private data: 61637469766500

## Wireshark

The iWARP-MPA dissector is fully functional with some assumptions on the traffic which we have found to hold in all the recorded traffic so far. According to the [RFC 5044](http://www.ietf.org/rfc/rfc5044.txt) it does not always have to be like that.

  - We expect exactly one FPDU (Framed Protocol Data Unit) per TCP segment.

  - We cannot track FPDUs that are spread across several TCP segments. The *tcp\_dissect\_pdus()* method could be used to combine the payload of several TCP segments into the final FPDU.

  - Once the header alignment of iWARP-MPA and TCP is lost, we cannot track the iWARP-MPA communication anymore.

## Preference Settings

No preference settings.

## Example capture file

[SampleCaptures/iwarp\_connect.tar.gz](uploads/__moin_import__/attachments/SampleCaptures/iwarp_connect.tar.gz)

## Display Filter

A complete list of iWARP-MPA display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/i/iwarp-mpa.html)

Show only the PROTO based traffic:

``` 
 iwarp_mpa 
```

## Capture Filter

You cannot directly filter iWARP-MPA protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the iWARP-MPA traffic over port 4711:

``` 
 tcp.port == 4711
```

## External links

  - [RFC 5044](http://www.ietf.org/rfc/rfc5044.txt) *Marker PDU Aligned Framing*3

## Discussion

---

Imported from https://wiki.wireshark.org/iWARP-MPA on 2020-08-11 23:15:34 UTC
