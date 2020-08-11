# AOL Instant Messenger (AIM)

XXX - add a brief AIM description here

## History

XXX - add a brief description of AIM history

## Protocol dependencies

  - [TCP](/TCP): Typically, AIM uses [TCP](/TCP) as its transport protocol. The well known TCP port for AIM traffic is 5190.

## Example traffic

  - Following is a short sequence of nine packets of a failed direct connect.
      - In order they are:
        1.  Ack packet
        2.  Incoming msg
        3.  Outgoing msg
        4.  Ack packet
        5.  Broken DC packet (incoming)
        6.  Broken DC packet (outgoing)
        7.  Unbroken DC packet (incoming
        8.  Unbroken DC packet (outgoing)
        9.  Unbroken DC packet (incoming)
      - Buddy names have been removed, although if you actually cared you could pull them... surely you have something better to do

<!-- end list -->

    No.     Time        Source                Destination           Protocol Info
          1 0.000000    64.12.28.108          10.1.58.41            AIM Messaging AIM Messaging, Acknowledge
    
    Frame 1 (89 bytes on wire, 89 bytes captured)
        Arrival Time: Apr 19, 2005 10:24:35.796589000
        Time delta from previous packet: 0.000000000 seconds
        Time since reference or first frame: 0.000000000 seconds
        Frame Number: 1
        Packet Length: 89 bytes
        Capture Length: 89 bytes
        Protocols in frame: eth:ip:tcp:aim
    Ethernet II, Src: 00:30:48:51:c0:74, Dst: 00:08:74:48:ae:7c
        Destination: 00:08:74:48:ae:7c (10.1.58.41)
        Source: 00:30:48:51:c0:74 (10.1.1.1)
        Type: IP (0x0800)
    Internet Protocol, Src Addr: 64.12.28.108 (64.12.28.108), Dst Addr: 10.1.58.41 (10.1.58.41)
        Version: 4
        Header length: 20 bytes
        Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
            0000 00.. = Differentiated Services Codepoint: Default (0x00)
            .... ..0. = ECN-Capable Transport (ECT): 0
            .... ...0 = ECN-CE: 0
        Total Length: 75
        Identification: 0x7fce (32718)
        Flags: 0x04 (Don't Fragment)
            0... = Reserved bit: Not set
            .1.. = Don't fragment: Set
            ..0. = More fragments: Not set
        Fragment offset: 0
        Time to live: 101
        Protocol: TCP (0x06)
        Header checksum: 0xf53c (correct)
        Source: 64.12.28.108 (64.12.28.108)
        Destination: 10.1.58.41 (10.1.58.41)
    Transmission Control Protocol, Src Port: 5190 (5190), Dst Port: 2793 (2793), Seq: 0, Ack: 0, Len: 35
        Source port: 5190 (5190)
        Destination port: 2793 (2793)
        Sequence number: 0    (relative sequence number)
        Next sequence number: 35    (relative sequence number)
        Acknowledgement number: 0    (relative ack number)
        Header length: 20 bytes
        Flags: 0x0018 (PSH, ACK)
            0... .... = Congestion Window Reduced (CWR): Not set
            .0.. .... = ECN-Echo: Not set
            ..0. .... = Urgent: Not set
            ...1 .... = Acknowledgment: Set
            .... 1... = Push: Set
            .... .0.. = Reset: Not set
            .... ..0. = Syn: Not set
            .... ...0 = Fin: Not set
        Window size: 9468
        Checksum: 0x86cd (correct)
    AOL Instant Messenger
        Command Start: 0x2a
        Channel ID: SNAC Data (0x02)
        Sequence Number: 3843
        Data Field Length: 29
        FNAC: Family: AIM Messaging (0x0004), Subtype: Acknowledge (0x000c)
            Family: AIM Messaging (0x0004)
            Subtype: Acknowledge (0x000c)
            FNAC Flags: 0x0000
                .... .... .... ...0 = Followed By SNAC with related information: Not set
                0... .... .... .... = Contains Version of Family this SNAC is in: Not set
            FNAC ID: 0x001e0006
    AIM Messaging, Acknowledge
    
    No.     Time        Source                Destination           Protocol Info
          2 4.780826    64.12.28.108          10.1.58.41            AIM Messaging AIM Messaging, Incoming
    
    _____________________________________________________________________________
    
    Frame 2 (269 bytes on wire, 269 bytes captured)
        Arrival Time: Apr 19, 2005 10:24:40.577415000
        Time delta from previous packet: 4.780826000 seconds
        Time since reference or first frame: 4.780826000 seconds
        Frame Number: 2
        Packet Length: 269 bytes
        Capture Length: 269 bytes
        Protocols in frame: eth:ip:tcp:aim
    Ethernet II, Src: 00:30:48:51:c0:74, Dst: 00:08:74:48:ae:7c
        Destination: 00:08:74:48:ae:7c (10.1.58.41)
        Source: 00:30:48:51:c0:74 (10.1.1.1)
        Type: IP (0x0800)
    Internet Protocol, Src Addr: 64.12.28.108 (64.12.28.108), Dst Addr: 10.1.58.41 (10.1.58.41)
        Version: 4
        Header length: 20 bytes
        Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
            0000 00.. = Differentiated Services Codepoint: Default (0x00)
            .... ..0. = ECN-Capable Transport (ECT): 0
            .... ...0 = ECN-CE: 0
        Total Length: 255
        Identification: 0x99ae (39342)
        Flags: 0x04 (Don't Fragment)
            0... = Reserved bit: Not set
            .1.. = Don't fragment: Set
            ..0. = More fragments: Not set
        Fragment offset: 0
        Time to live: 101
        Protocol: TCP (0x06)
        Header checksum: 0xdaa8 (correct)
        Source: 64.12.28.108 (64.12.28.108)
        Destination: 10.1.58.41 (10.1.58.41)
    Transmission Control Protocol, Src Port: 5190 (5190), Dst Port: 2793 (2793), Seq: 35, Ack: 0, Len: 215
        Source port: 5190 (5190)
        Destination port: 2793 (2793)
        Sequence number: 35    (relative sequence number)
        Next sequence number: 250    (relative sequence number)
        Acknowledgement number: 0    (relative ack number)
        Header length: 20 bytes
        Flags: 0x0018 (PSH, ACK)
            0... .... = Congestion Window Reduced (CWR): Not set
            .0.. .... = ECN-Echo: Not set
            ..0. .... = Urgent: Not set
            ...1 .... = Acknowledgment: Set
            .... 1... = Push: Set
            .... .0.. = Reset: Not set
            .... ..0. = Syn: Not set
            .... ...0 = Fin: Not set
        Window size: 9468
        Checksum: 0xff65 (correct)
    AOL Instant Messenger
        Command Start: 0x2a
        Channel ID: SNAC Data (0x02)
        Sequence Number: 3844
        Data Field Length: 209
        FNAC: Family: AIM Messaging (0x0004), Subtype: Incoming (0x0007)
            Family: AIM Messaging (0x0004)
            Subtype: Incoming (0x0007)
            FNAC Flags: 0x0000
                .... .... .... ...0 = Followed By SNAC with related information: Not set
                0... .... .... .... = Contains Version of Family this SNAC is in: Not set
            FNAC ID: 0x864068c5
    AIM Messaging, Incoming
        ICBM Cookie: 3743383831323700
        Message Channel ID: 0x0001
        Buddy: **Buddy name deleted**
            Buddyname len: 8
            Buddy Name: **Buddy name deleted**
        Warning Level: 0
        TLV Count: 4
        TLV: User class
            Value ID: User class (0x0001)
            Length: 2
            Value: 0x0011
                .... .... .... .... .... .... .... ...1 = AOL Unconfirmed user flag: Set
                .... .... .... .... .... .... .... ..0. = AOL Administrator flag: Not set
                .... .... .... .... .... .... .... .0.. = AOL Staff User Flag: Not set
                .... .... .... .... .... .... .... 0... = AOL commercial account flag: Not set
                .... .... .... .... .... .... ...1 .... = ICQ non-commercial account flag: Set
                .... .... .... .... .... .... ..0. .... = AOL away status flag: Not set
                .... .... .... .... .... .... .0.. .... = ICQ user sign: Not set
                .... .... .... .... .... .... 0... .... = AOL wireless user: Not set
                .... .... .... .... .... ...0 .... .... = Unknown bit: Not set
                .... .... .... .... .... ..0. .... .... = Unknown bit: Not set
                .... .... .... .... .... .0.. .... .... = Unknown bit: Not set
                .... .... .... .... .... 0... .... .... = Unknown bit: Not set
        TLV: Session Length (sec)
            Value ID: Session Length (sec) (0x000f)
            Length: 4
            Value: 0
        TLV: Available Message
            Value ID: Available Message (0x001d)
            Length: 20
            Value
        TLV: Online since
            Value ID: Online since (0x0003)
            Length: 4
            Value: 4351252
        TLV: Message Block
            Value ID: Message Block (0x0002)
            Length: 82
            Message: <HTML><BODY BGCOLOR="#ffffff"><FONT LANG="0">k</FONT></BODY></HTML>
                Features: 0x0501
                Features Length: 3
                Features: 010102
                Block info: 0x0101
                Block length: 71
                Block Character set: 0x0000
                Block Character subset: 0x0000
                Message: <HTML><BODY BGCOLOR="#ffffff"><FONT LANG="0">k</FONT></BODY></HTML>
        TLV: Unknown
            Value ID: Unknown (0x000d)
            Length: 20
            Value
        TLV: Icon present
            Value ID: Icon present (0x0008)
            Length: 12
            Value
        TLV: Non-direct connect typing notification
            Value ID: Non-direct connect typing notification (0x000b)
            Length: 0
            Value
    
    No.     Time        Source                Destination           Protocol Info
          3 25.654100   10.1.58.41            64.12.28.108          AIM Messaging AIM Messaging, Outgoing to: **Buddy name deleted**
    
    
    _____________________________________________________________________________
    
    
    Frame 3 (147 bytes on wire, 147 bytes captured)
        Arrival Time: Apr 19, 2005 10:25:01.450689000
        Time delta from previous packet: 20.873274000 seconds
        Time since reference or first frame: 25.654100000 seconds
        Frame Number: 3
        Packet Length: 147 bytes
        Capture Length: 147 bytes
        Protocols in frame: eth:ip:tcp:aim
    Ethernet II, Src: 00:08:74:48:ae:7c, Dst: 00:30:48:51:c0:74
        Destination: 00:30:48:51:c0:74 (10.1.1.1)
        Source: 00:08:74:48:ae:7c (10.1.58.41)
        Type: IP (0x0800)
    Internet Protocol, Src Addr: 10.1.58.41 (10.1.58.41), Dst Addr: 64.12.28.108 (64.12.28.108)
        Version: 4
        Header length: 20 bytes
        Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
            0000 00.. = Differentiated Services Codepoint: Default (0x00)
            .... ..0. = ECN-Capable Transport (ECT): 0
            .... ...0 = ECN-CE: 0
        Total Length: 133
        Identification: 0x8efb (36603)
        Flags: 0x04 (Don't Fragment)
            0... = Reserved bit: Not set
            .1.. = Don't fragment: Set
            ..0. = More fragments: Not set
        Fragment offset: 0
        Time to live: 128
        Protocol: TCP (0x06)
        Header checksum: 0xcad5 (correct)
        Source: 10.1.58.41 (10.1.58.41)
        Destination: 64.12.28.108 (64.12.28.108)
    Transmission Control Protocol, Src Port: 2793 (2793), Dst Port: 5190 (5190), Seq: 0, Ack: 250, Len: 93
        Source port: 2793 (2793)
        Destination port: 5190 (5190)
        Sequence number: 0    (relative sequence number)
        Next sequence number: 93    (relative sequence number)
        Acknowledgement number: 250    (relative ack number)
        Header length: 20 bytes
        Flags: 0x0018 (PSH, ACK)
            0... .... = Congestion Window Reduced (CWR): Not set
            .0.. .... = ECN-Echo: Not set
            ..0. .... = Urgent: Not set
            ...1 .... = Acknowledgment: Set
            .... 1... = Push: Set
            .... .0.. = Reset: Not set
            .... ..0. = Syn: Not set
            .... ...0 = Fin: Not set
        Window size: 64538
        Checksum: 0x495a (correct)
        SEQ/ACK analysis
            This is an ACK to the segment in frame: 2
            The RTT to ACK the segment was: 20.873274000 seconds
    AOL Instant Messenger
        Command Start: 0x2a
        Channel ID: SNAC Data (0x02)
        Sequence Number: 10744
        Data Field Length: 87
        FNAC: Family: AIM Messaging (0x0004), Subtype: Outgoing (0x0006)
            Family: AIM Messaging (0x0004)
            Subtype: Outgoing (0x0006)
            FNAC Flags: 0x0000
                .... .... .... ...0 = Followed By SNAC with related information: Not set
                0... .... .... .... = Contains Version of Family this SNAC is in: Not set
            FNAC ID: 0x001f0006
    AIM Messaging, Outgoing
        ICBM Cookie: 3743384634424600
        Message Channel ID: 0x0002
        Buddy: **Buddy name deleted**
            Buddyname len: 8
            Buddy Name: **Buddy name deleted**
        TLV: Rendez Vous Data
            Value ID: Rendez Vous Data (0x0005)
            Length: 50
            Value
                Message Type: Request (0x0000)
                ICBM Cookie: 3743384634424600
                Direct Instant Messaging {09461345-4c7f-11d1-8222-444553540000}
                TLV: Unknown
                    Value ID: Unknown (0x000a)
                    Length: 2
                    Value
                TLV: Unknown
                    Value ID: Unknown (0x000f)
                    Length: 0
                    Value
                TLV: Internal IP
                    Value ID: Internal IP (0x0003)
                    Length: 4
                    Value: 655674
                TLV: External Port
                    Value ID: External Port (0x0005)
                    Length: 2
                    Value: 5190
        TLV: Server Ack Requested
            Value ID: Server Ack Requested (0x0003)
            Length: 0
            Value
    
    No.     Time        Source                Destination           Protocol Info
          4 25.698634   64.12.28.108          10.1.58.41            AIM Messaging AIM Messaging, Acknowledge
    
    _____________________________________________________________________________
    
    
    Frame 4 (89 bytes on wire, 89 bytes captured)
        Arrival Time: Apr 19, 2005 10:25:01.495223000
        Time delta from previous packet: 0.044534000 seconds
        Time since reference or first frame: 25.698634000 seconds
        Frame Number: 4
        Packet Length: 89 bytes
        Capture Length: 89 bytes
        Protocols in frame: eth:ip:tcp:aim
    Ethernet II, Src: 00:30:48:51:c0:74, Dst: 00:08:74:48:ae:7c
        Destination: 00:08:74:48:ae:7c (10.1.58.41)
        Source: 00:30:48:51:c0:74 (10.1.1.1)
        Type: IP (0x0800)
    Internet Protocol, Src Addr: 64.12.28.108 (64.12.28.108), Dst Addr: 10.1.58.41 (10.1.58.41)
        Version: 4
        Header length: 20 bytes
        Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
            0000 00.. = Differentiated Services Codepoint: Default (0x00)
            .... ..0. = ECN-Capable Transport (ECT): 0
            .... ...0 = ECN-CE: 0
        Total Length: 75
        Identification: 0x0d77 (3447)
        Flags: 0x04 (Don't Fragment)
            0... = Reserved bit: Not set
            .1.. = Don't fragment: Set
            ..0. = More fragments: Not set
        Fragment offset: 0
        Time to live: 101
        Protocol: TCP (0x06)
        Header checksum: 0x6794 (correct)
        Source: 64.12.28.108 (64.12.28.108)
        Destination: 10.1.58.41 (10.1.58.41)
    Transmission Control Protocol, Src Port: 5190 (5190), Dst Port: 2793 (2793), Seq: 250, Ack: 93, Len: 35
        Source port: 5190 (5190)
        Destination port: 2793 (2793)
        Sequence number: 250    (relative sequence number)
        Next sequence number: 285    (relative sequence number)
        Acknowledgement number: 93    (relative ack number)
        Header length: 20 bytes
        Flags: 0x0018 (PSH, ACK)
            0... .... = Congestion Window Reduced (CWR): Not set
            .0.. .... = ECN-Echo: Not set
            ..0. .... = Urgent: Not set
            ...1 .... = Acknowledgment: Set
            .... 1... = Push: Set
            .... .0.. = Reset: Not set
            .... ..0. = Syn: Not set
            .... ...0 = Fin: Not set
        Window size: 9375
        Checksum: 0x73b1 (correct)
        SEQ/ACK analysis
            This is an ACK to the segment in frame: 3
            The RTT to ACK the segment was: 0.044534000 seconds
    AOL Instant Messenger
        Command Start: 0x2a
        Channel ID: SNAC Data (0x02)
        Sequence Number: 3845
        Data Field Length: 29
        FNAC: Family: AIM Messaging (0x0004), Subtype: Acknowledge (0x000c)
            Family: AIM Messaging (0x0004)
            Subtype: Acknowledge (0x000c)
            FNAC Flags: 0x0000
                .... .... .... ...0 = Followed By SNAC with related information: Not set
                0... .... .... .... = Contains Version of Family this SNAC is in: Not set
            FNAC ID: 0x001f0006
    AIM Messaging, Acknowledge
    
    No.     Time        Source                Destination           Protocol Info
          5 31.520083   64.12.28.108          10.1.58.41            AIM Messaging [TCP Previous segment lost] AIM Messaging, Incoming
    
    _____________________________________________________________________________
    
    
    Frame 5 (225 bytes on wire, 225 bytes captured)
        Arrival Time: Apr 19, 2005 10:25:07.316672000
        Time delta from previous packet: 5.821449000 seconds
        Time since reference or first frame: 31.520083000 seconds
        Frame Number: 5
        Packet Length: 225 bytes
        Capture Length: 225 bytes
        Protocols in frame: eth:ip:tcp:aim
    Ethernet II, Src: 00:30:48:51:c0:74, Dst: 00:08:74:48:ae:7c
        Destination: 00:08:74:48:ae:7c (10.1.58.41)
        Source: 00:30:48:51:c0:74 (10.1.1.1)
        Type: IP (0x0800)
    Internet Protocol, Src Addr: 64.12.28.108 (64.12.28.108), Dst Addr: 10.1.58.41 (10.1.58.41)
        Version: 4
        Header length: 20 bytes
        Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
            0000 00.. = Differentiated Services Codepoint: Default (0x00)
            .... ..0. = ECN-Capable Transport (ECT): 0
            .... ...0 = ECN-CE: 0
        Total Length: 211
        Identification: 0x2c8c (11404)
        Flags: 0x04 (Don't Fragment)
            0... = Reserved bit: Not set
            .1.. = Don't fragment: Set
            ..0. = More fragments: Not set
        Fragment offset: 0
        Time to live: 101
        Protocol: TCP (0x06)
        Header checksum: 0x47f7 (correct)
        Source: 64.12.28.108 (64.12.28.108)
        Destination: 10.1.58.41 (10.1.58.41)
    Transmission Control Protocol, Src Port: 5190 (5190), Dst Port: 2793 (2793), Seq: 337, Ack: 99, Len: 171
        Source port: 5190 (5190)
        Destination port: 2793 (2793)
        Sequence number: 337    (relative sequence number)
        Next sequence number: 508    (relative sequence number)
        Acknowledgement number: 99    (relative ack number)
        Header length: 20 bytes
        Flags: 0x0018 (PSH, ACK)
            0... .... = Congestion Window Reduced (CWR): Not set
            .0.. .... = ECN-Echo: Not set
            ..0. .... = Urgent: Not set
            ...1 .... = Acknowledgment: Set
            .... 1... = Push: Set
            .... .0.. = Reset: Not set
            .... ..0. = Syn: Not set
            .... ...0 = Fin: Not set
        Window size: 9369
        Checksum: 0x4864 (correct)
        SEQ/ACK analysis
            TCP Analysis Flags
                A segment before this frame was lost
    AOL Instant Messenger
        Command Start: 0x2a
        Channel ID: SNAC Data (0x02)
        Sequence Number: 3847
        Data Field Length: 165
        FNAC: Family: AIM Messaging (0x0004), Subtype: Incoming (0x0007)
            Family: AIM Messaging (0x0004)
            Subtype: Incoming (0x0007)
            FNAC Flags: 0x0000
                .... .... .... ...0 = Followed By SNAC with related information: Not set
                0... .... .... .... = Contains Version of Family this SNAC is in: Not set
            FNAC ID: 0x8640ca49
    AIM Messaging, Incoming
        ICBM Cookie: 3743384634424600
        Message Channel ID: 0x0002
        Buddy: **Buddy name deleted**
            Buddyname len: 8
            Buddy Name: **Buddy name deleted**
        Warning Level: 0
        TLV Count: 4
        TLV: User class
            Value ID: User class (0x0001)
            Length: 2
            Value: 0x0011
                .... .... .... .... .... .... .... ...1 = AOL Unconfirmed user flag: Set
                .... .... .... .... .... .... .... ..0. = AOL Administrator flag: Not set
                .... .... .... .... .... .... .... .0.. = AOL Staff User Flag: Not set
                .... .... .... .... .... .... .... 0... = AOL commercial account flag: Not set
                .... .... .... .... .... .... ...1 .... = ICQ non-commercial account flag: Set
                .... .... .... .... .... .... ..0. .... = AOL away status flag: Not set
                .... .... .... .... .... .... .0.. .... = ICQ user sign: Not set
                .... .... .... .... .... .... 0... .... = AOL wireless user: Not set
                .... .... .... .... .... ...0 .... .... = Unknown bit: Not set
                .... .... .... .... .... ..0. .... .... = Unknown bit: Not set
                .... .... .... .... .... .0.. .... .... = Unknown bit: Not set
                .... .... .... .... .... 0... .... .... = Unknown bit: Not set
        TLV: Session Length (sec)
            Value ID: Session Length (sec) (0x000f)
            Length: 4
            Value: 0
        TLV: Available Message
            Value ID: Available Message (0x001d)
            Length: 20
            Value
        TLV: Online since
            Value ID: Online since (0x0003)
            Length: 4
            Value: 4351252
        TLV: Rendez Vous Data
            Value ID: Rendez Vous Data (0x0005)
            Length: 82
            Value
                Message Type: Request (0x0000)
                ICBM Cookie: 3743384634424600
                Direct Instant Messaging {09461345-4c7f-11d1-8222-444553540000}
                TLV: Unknown
                    Value ID: Unknown (0x000a)
                    Length: 2
                    Value
                TLV: Unknown
                    Value ID: Unknown (0x0014)
                    Length: 2
                    Value
                TLV: Unknown
                    Value ID: Unknown (0x0002)
                    Length: 4
                    Value
                TLV: Unknown
                    Value ID: Unknown (0x0016)
                    Length: 4
                    Value
                TLV: Internal IP
                    Value ID: Internal IP (0x0003)
                    Length: 4
                    Value: 655872
                TLV: External Port
                    Value ID: External Port (0x0005)
                    Length: 2
                    Value: 2804
                TLV: Unknown
                    Value ID: Unknown (0x0017)
                    Length: 2
                    Value
                TLV: External IP
                    Value ID: External IP (0x0004)
                    Length: 4
                    Value: 13563037
    
    No.     Time        Source                Destination           Protocol Info
          6 32.579719   10.1.58.41            64.12.28.108          AIM Messaging [TCP Previous segment lost] AIM Messaging, Outgoing to: **Buddy name deleted**
    
    _____________________________________________________________________________
    
    
    Frame 6 (125 bytes on wire, 125 bytes captured)
        Arrival Time: Apr 19, 2005 10:25:08.376308000
        Time delta from previous packet: 1.059636000 seconds
        Time since reference or first frame: 32.579719000 seconds
        Frame Number: 6
        Packet Length: 125 bytes
        Capture Length: 125 bytes
        Protocols in frame: eth:ip:tcp:aim
    Ethernet II, Src: 00:08:74:48:ae:7c, Dst: 00:30:48:51:c0:74
        Destination: 00:30:48:51:c0:74 (10.1.1.1)
        Source: 00:08:74:48:ae:7c (10.1.58.41)
        Type: IP (0x0800)
    Internet Protocol, Src Addr: 10.1.58.41 (10.1.58.41), Dst Addr: 64.12.28.108 (64.12.28.108)
        Version: 4
        Header length: 20 bytes
        Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
            0000 00.. = Differentiated Services Codepoint: Default (0x00)
            .... ..0. = ECN-Capable Transport (ECT): 0
            .... ...0 = ECN-CE: 0
        Total Length: 111
        Identification: 0x8f0c (36620)
        Flags: 0x04 (Don't Fragment)
            0... = Reserved bit: Not set
            .1.. = Don't fragment: Set
            ..0. = More fragments: Not set
        Fragment offset: 0
        Time to live: 128
        Protocol: TCP (0x06)
        Header checksum: 0xcada (correct)
        Source: 10.1.58.41 (10.1.58.41)
        Destination: 64.12.28.108 (64.12.28.108)
    Transmission Control Protocol, Src Port: 2793 (2793), Dst Port: 5190 (5190), Seq: 99, Ack: 508, Len: 71
        Source port: 2793 (2793)
        Destination port: 5190 (5190)
        Sequence number: 99    (relative sequence number)
        Next sequence number: 170    (relative sequence number)
        Acknowledgement number: 508    (relative ack number)
        Header length: 20 bytes
        Flags: 0x0018 (PSH, ACK)
            0... .... = Congestion Window Reduced (CWR): Not set
            .0.. .... = ECN-Echo: Not set
            ..0. .... = Urgent: Not set
            ...1 .... = Acknowledgment: Set
            .... 1... = Push: Set
            .... .0.. = Reset: Not set
            .... ..0. = Syn: Not set
            .... ...0 = Fin: Not set
        Window size: 64280
        Checksum: 0xe978 (correct)
        SEQ/ACK analysis
            This is an ACK to the segment in frame: 5
            The RTT to ACK the segment was: 1.059636000 seconds
            TCP Analysis Flags
                A segment before this frame was lost
    AOL Instant Messenger
        Command Start: 0x2a
        Channel ID: SNAC Data (0x02)
        Sequence Number: 10746
        Data Field Length: 65
        FNAC: Family: AIM Messaging (0x0004), Subtype: Outgoing (0x0006)
            Family: AIM Messaging (0x0004)
            Subtype: Outgoing (0x0006)
            FNAC Flags: 0x0000
                .... .... .... ...0 = Followed By SNAC with related information: Not set
                0... .... .... .... = Contains Version of Family this SNAC is in: Not set
            FNAC ID: 0x00200006
    AIM Messaging, Outgoing
        ICBM Cookie: 3743384634424600
        Message Channel ID: 0x0002
        Buddy: **Buddy name deleted**
            Buddyname len: 8
            Buddy Name: **Buddy name deleted**
        TLV: Rendez Vous Data
            Value ID: Rendez Vous Data (0x0005)
            Length: 32
            Value
                Message Type: Cancel (0x0001)
                ICBM Cookie: 3743384634424600
                Direct Instant Messaging {09461345-4c7f-11d1-8222-444553540000}
                TLV: Unknown
                    Value ID: Unknown (0x000b)
                    Length: 2
                    Value
    
    No.     Time        Source                Destination           Protocol Info
          7 45.510247   64.12.28.108          10.1.58.41            AIM Messaging AIM Messaging, Incoming
    
    _____________________________________________________________________________
    
    
    Frame 7 (223 bytes on wire, 223 bytes captured)
        Arrival Time: Apr 19, 2005 10:25:21.306836000
        Time delta from previous packet: 12.930528000 seconds
        Time since reference or first frame: 45.510247000 seconds
        Frame Number: 7
        Packet Length: 223 bytes
        Capture Length: 223 bytes
        Protocols in frame: eth:ip:tcp:aim
    Ethernet II, Src: 00:30:48:51:c0:74, Dst: 00:08:74:48:ae:7c
        Destination: 00:08:74:48:ae:7c (10.1.58.41)
        Source: 00:30:48:51:c0:74 (10.1.1.1)
        Type: IP (0x0800)
    Internet Protocol, Src Addr: 64.12.28.108 (64.12.28.108), Dst Addr: 10.1.58.41 (10.1.58.41)
        Version: 4
        Header length: 20 bytes
        Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
            0000 00.. = Differentiated Services Codepoint: Default (0x00)
            .... ..0. = ECN-Capable Transport (ECT): 0
            .... ...0 = ECN-CE: 0
        Total Length: 209
        Identification: 0x78de (30942)
        Flags: 0x04 (Don't Fragment)
            0... = Reserved bit: Not set
            .1.. = Don't fragment: Set
            ..0. = More fragments: Not set
        Fragment offset: 0
        Time to live: 101
        Protocol: TCP (0x06)
        Header checksum: 0xfba6 (correct)
        Source: 64.12.28.108 (64.12.28.108)
        Destination: 10.1.58.41 (10.1.58.41)
    Transmission Control Protocol, Src Port: 5190 (5190), Dst Port: 2793 (2793), Seq: 508, Ack: 170, Len: 169
        Source port: 5190 (5190)
        Destination port: 2793 (2793)
        Sequence number: 508    (relative sequence number)
        Next sequence number: 677    (relative sequence number)
        Acknowledgement number: 170    (relative ack number)
        Header length: 20 bytes
        Flags: 0x0018 (PSH, ACK)
            0... .... = Congestion Window Reduced (CWR): Not set
            .0.. .... = ECN-Echo: Not set
            ..0. .... = Urgent: Not set
            ...1 .... = Acknowledgment: Set
            .... 1... = Push: Set
            .... .0.. = Reset: Not set
            .... ..0. = Syn: Not set
            .... ...0 = Fin: Not set
        Window size: 9298
        Checksum: 0x4a42 (correct)
        SEQ/ACK analysis
            This is an ACK to the segment in frame: 6
            The RTT to ACK the segment was: 12.930528000 seconds
    AOL Instant Messenger
        Command Start: 0x2a
        Channel ID: SNAC Data (0x02)
        Sequence Number: 3848
        Data Field Length: 163
        FNAC: Family: AIM Messaging (0x0004), Subtype: Incoming (0x0007)
            Family: AIM Messaging (0x0004)
            Subtype: Incoming (0x0007)
            FNAC Flags: 0x0000
                .... .... .... ...0 = Followed By SNAC with related information: Not set
                0... .... .... .... = Contains Version of Family this SNAC is in: Not set
            FNAC ID: 0x8640fef4
    AIM Messaging, Incoming
        ICBM Cookie: 5CA93A52E60B0000
        Message Channel ID: 0x0002
        Buddy: **Buddy name deleted**
            Buddyname len: 8
            Buddy Name: **Buddy name deleted**
        Warning Level: 0
        TLV Count: 4
        TLV: User class
            Value ID: User class (0x0001)
            Length: 2
            Value: 0x0011
                .... .... .... .... .... .... .... ...1 = AOL Unconfirmed user flag: Set
                .... .... .... .... .... .... .... ..0. = AOL Administrator flag: Not set
                .... .... .... .... .... .... .... .0.. = AOL Staff User Flag: Not set
                .... .... .... .... .... .... .... 0... = AOL commercial account flag: Not set
                .... .... .... .... .... .... ...1 .... = ICQ non-commercial account flag: Set
                .... .... .... .... .... .... ..0. .... = AOL away status flag: Not set
                .... .... .... .... .... .... .0.. .... = ICQ user sign: Not set
                .... .... .... .... .... .... 0... .... = AOL wireless user: Not set
                .... .... .... .... .... ...0 .... .... = Unknown bit: Not set
                .... .... .... .... .... ..0. .... .... = Unknown bit: Not set
                .... .... .... .... .... .0.. .... .... = Unknown bit: Not set
                .... .... .... .... .... 0... .... .... = Unknown bit: Not set
        TLV: Session Length (sec)
            Value ID: Session Length (sec) (0x000f)
            Length: 4
            Value: 0
        TLV: Available Message
            Value ID: Available Message (0x001d)
            Length: 20
            Value
        TLV: Online since
            Value ID: Online since (0x0003)
            Length: 4
            Value: 4351252
        TLV: Rendez Vous Data
            Value ID: Rendez Vous Data (0x0005)
            Length: 80
            Value
                Message Type: Request (0x0000)
                ICBM Cookie: 5CA93A52E60B0000
                Direct Instant Messaging {09461345-4c7f-11d1-8222-444553540000}
                TLV: Unknown
                    Value ID: Unknown (0x000a)
                    Length: 2
                    Value
                TLV: Unknown
                    Value ID: Unknown (0x000f)
                    Length: 0
                    Value
                TLV: Unknown
                    Value ID: Unknown (0x0002)
                    Length: 4
                    Value
                TLV: Unknown
                    Value ID: Unknown (0x0016)
                    Length: 4
                    Value
                TLV: Internal IP
                    Value ID: Internal IP (0x0003)
                    Length: 4
                    Value: 655872
                TLV: External Port
                    Value ID: External Port (0x0005)
                    Length: 2
                    Value: 2805
                TLV: Unknown
                    Value ID: Unknown (0x0017)
                    Length: 2
                    Value
                TLV: External IP
                    Value ID: External IP (0x0004)
                    Length: 4
                    Value: 13563037
    
    No.     Time        Source                Destination           Protocol Info
          8 52.991865   10.1.58.41            64.12.28.108          AIM Messaging AIM Messaging, Outgoing to: **Buddy name deleted**
    
    _____________________________________________________________________________
    
    
    Frame 8 (143 bytes on wire, 143 bytes captured)
        Arrival Time: Apr 19, 2005 10:25:28.788454000
        Time delta from previous packet: 7.481618000 seconds
        Time since reference or first frame: 52.991865000 seconds
        Frame Number: 8
        Packet Length: 143 bytes
        Capture Length: 143 bytes
        Protocols in frame: eth:ip:tcp:aim
    Ethernet II, Src: 00:08:74:48:ae:7c, Dst: 00:30:48:51:c0:74
        Destination: 00:30:48:51:c0:74 (10.1.1.1)
        Source: 00:08:74:48:ae:7c (10.1.58.41)
        Type: IP (0x0800)
    Internet Protocol, Src Addr: 10.1.58.41 (10.1.58.41), Dst Addr: 64.12.28.108 (64.12.28.108)
        Version: 4
        Header length: 20 bytes
        Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
            0000 00.. = Differentiated Services Codepoint: Default (0x00)
            .... ..0. = ECN-Capable Transport (ECT): 0
            .... ...0 = ECN-CE: 0
        Total Length: 129
        Identification: 0x8f37 (36663)
        Flags: 0x04 (Don't Fragment)
            0... = Reserved bit: Not set
            .1.. = Don't fragment: Set
            ..0. = More fragments: Not set
        Fragment offset: 0
        Time to live: 128
        Protocol: TCP (0x06)
        Header checksum: 0xca9d (correct)
        Source: 10.1.58.41 (10.1.58.41)
        Destination: 64.12.28.108 (64.12.28.108)
    Transmission Control Protocol, Src Port: 2793 (2793), Dst Port: 5190 (5190), Seq: 170, Ack: 677, Len: 89
        Source port: 2793 (2793)
        Destination port: 5190 (5190)
        Sequence number: 170    (relative sequence number)
        Next sequence number: 259    (relative sequence number)
        Acknowledgement number: 677    (relative ack number)
        Header length: 20 bytes
        Flags: 0x0018 (PSH, ACK)
            0... .... = Congestion Window Reduced (CWR): Not set
            .0.. .... = ECN-Echo: Not set
            ..0. .... = Urgent: Not set
            ...1 .... = Acknowledgment: Set
            .... 1... = Push: Set
            .... .0.. = Reset: Not set
            .... ..0. = Syn: Not set
            .... ...0 = Fin: Not set
        Window size: 65535
        Checksum: 0x7654 (correct)
        SEQ/ACK analysis
            This is an ACK to the segment in frame: 7
            The RTT to ACK the segment was: 7.481618000 seconds
    AOL Instant Messenger
        Command Start: 0x2a
        Channel ID: SNAC Data (0x02)
        Sequence Number: 10747
        Data Field Length: 83
        FNAC: Family: AIM Messaging (0x0004), Subtype: Outgoing (0x0006)
            Family: AIM Messaging (0x0004)
            Subtype: Outgoing (0x0006)
            FNAC Flags: 0x0000
                .... .... .... ...0 = Followed By SNAC with related information: Not set
                0... .... .... .... = Contains Version of Family this SNAC is in: Not set
            FNAC ID: 0x00210006
    AIM Messaging, Outgoing
        ICBM Cookie: 5CA93A52E60B0000
        Message Channel ID: 0x0002
        Buddy: **Buddy name deleted**
            Buddyname len: 8
            Buddy Name: **Buddy name deleted**
        TLV: Rendez Vous Data
            Value ID: Rendez Vous Data (0x0005)
            Length: 50
            Value
                Message Type: Request (0x0000)
                ICBM Cookie: 5CA93A52E60B0000
                Direct Instant Messaging {09461345-4c7f-11d1-8222-444553540000}
                TLV: Unknown
                    Value ID: Unknown (0x000a)
                    Length: 2
                    Value
                TLV: Unknown
                    Value ID: Unknown (0x000f)
                    Length: 0
                    Value
                TLV: Internal IP
                    Value ID: Internal IP (0x0003)
                    Length: 4
                    Value: 655674
                TLV: External Port
                    Value ID: External Port (0x0005)
                    Length: 2
                    Value: 5190
    
    No.     Time        Source                Destination           Protocol Info
          9 54.465028   64.12.28.108          10.1.58.41            AIM Messaging AIM Messaging, Incoming
    
    
    _____________________________________________________________________________
    
    
    Frame 9 (213 bytes on wire, 213 bytes captured)
        Arrival Time: Apr 19, 2005 10:25:30.261617000
        Time delta from previous packet: 1.473163000 seconds
        Time since reference or first frame: 54.465028000 seconds
        Frame Number: 9
        Packet Length: 213 bytes
        Capture Length: 213 bytes
        Protocols in frame: eth:ip:tcp:aim
    Ethernet II, Src: 00:30:48:51:c0:74, Dst: 00:08:74:48:ae:7c
        Destination: 00:08:74:48:ae:7c (10.1.58.41)
        Source: 00:30:48:51:c0:74 (10.1.1.1)
        Type: IP (0x0800)
    Internet Protocol, Src Addr: 64.12.28.108 (64.12.28.108), Dst Addr: 10.1.58.41 (10.1.58.41)
        Version: 4
        Header length: 20 bytes
        Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
            0000 00.. = Differentiated Services Codepoint: Default (0x00)
            .... ..0. = ECN-Capable Transport (ECT): 0
            .... ...0 = ECN-CE: 0
        Total Length: 199
        Identification: 0xaad1 (43729)
        Flags: 0x04 (Don't Fragment)
            0... = Reserved bit: Not set
            .1.. = Don't fragment: Set
            ..0. = More fragments: Not set
        Fragment offset: 0
        Time to live: 101
        Protocol: TCP (0x06)
        Header checksum: 0xc9bd (correct)
        Source: 64.12.28.108 (64.12.28.108)
        Destination: 10.1.58.41 (10.1.58.41)
    Transmission Control Protocol, Src Port: 5190 (5190), Dst Port: 2793 (2793), Seq: 677, Ack: 259, Len: 159
        Source port: 5190 (5190)
        Destination port: 2793 (2793)
        Sequence number: 677    (relative sequence number)
        Next sequence number: 836    (relative sequence number)
        Acknowledgement number: 259    (relative ack number)
        Header length: 20 bytes
        Flags: 0x0018 (PSH, ACK)
            0... .... = Congestion Window Reduced (CWR): Not set
            .0.. .... = ECN-Echo: Not set
            ..0. .... = Urgent: Not set
            ...1 .... = Acknowledgment: Set
            .... 1... = Push: Set
            .... .0.. = Reset: Not set
            .... ..0. = Syn: Not set
            .... ...0 = Fin: Not set
        Window size: 9209
        Checksum: 0x1af5 (correct)
        SEQ/ACK analysis
            This is an ACK to the segment in frame: 8
            The RTT to ACK the segment was: 1.473163000 seconds
    AOL Instant Messenger
        Command Start: 0x2a
        Channel ID: SNAC Data (0x02)
        Sequence Number: 3849
        Data Field Length: 153
        FNAC: Family: AIM Messaging (0x0004), Subtype: Incoming (0x0007)
            Family: AIM Messaging (0x0004)
            Subtype: Incoming (0x0007)
            FNAC Flags: 0x0000
                .... .... .... ...0 = Followed By SNAC with related information: Not set
                0... .... .... .... = Contains Version of Family this SNAC is in: Not set
            FNAC ID: 0x86411f21
    AIM Messaging, Incoming
        ICBM Cookie: 5CA93A52E60B0000
        Message Channel ID: 0x0002
        Buddy: **Buddy name deleted**
            Buddyname len: 8
            Buddy Name: **Buddy name deleted**
        Warning Level: 0
        TLV Count: 4
        TLV: User class
            Value ID: User class (0x0001)
            Length: 2
            Value: 0x0011
                .... .... .... .... .... .... .... ...1 = AOL Unconfirmed user flag: Set
                .... .... .... .... .... .... .... ..0. = AOL Administrator flag: Not set
                .... .... .... .... .... .... .... .0.. = AOL Staff User Flag: Not set
                .... .... .... .... .... .... .... 0... = AOL commercial account flag: Not set
                .... .... .... .... .... .... ...1 .... = ICQ non-commercial account flag: Set
                .... .... .... .... .... .... ..0. .... = AOL away status flag: Not set
                .... .... .... .... .... .... .0.. .... = ICQ user sign: Not set
                .... .... .... .... .... .... 0... .... = AOL wireless user: Not set
                .... .... .... .... .... ...0 .... .... = Unknown bit: Not set
                .... .... .... .... .... ..0. .... .... = Unknown bit: Not set
                .... .... .... .... .... .0.. .... .... = Unknown bit: Not set
                .... .... .... .... .... 0... .... .... = Unknown bit: Not set
        TLV: Session Length (sec)
            Value ID: Session Length (sec) (0x000f)
            Length: 4
            Value: 0
        TLV: Available Message
            Value ID: Available Message (0x001d)
            Length: 20
            Value
        TLV: Online since
            Value ID: Online since (0x0003)
            Length: 4
            Value: 4351252
        TLV: Rendez Vous Data
            Value ID: Rendez Vous Data (0x0005)
            Length: 70
            Value
                Message Type: Request (0x0000)
                ICBM Cookie: 5CA93A52E60B0000
                Direct Instant Messaging {09461345-4c7f-11d1-8222-444553540000}
                TLV: Unknown
                    Value ID: Unknown (0x000a)
                    Length: 2
                    Value
                TLV: Unknown
                    Value ID: Unknown (0x0014)
                    Length: 2
                    Value
                TLV: Unknown
                    Value ID: Unknown (0x0002)
                    Length: 4
                    Value
                TLV: Unknown
                    Value ID: Unknown (0x0016)
                    Length: 4
                    Value
                TLV: External Port
                    Value ID: External Port (0x0005)
                    Length: 2
                    Value: 5125
                TLV: Unknown
                    Value ID: Unknown (0x0017)
                    Length: 2
                    Value
                TLV: Unknown
                    Value ID: Unknown (0x0010)
                    Length: 0
                    Value

## Wireshark

The AIM dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how AIM is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/aol.pcap](uploads/__moin_import__/attachments/SampleCaptures/aol.pcap)

## Display Filter

A complete list of AIM display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/a/aim.html)

Show only the AIM based traffic:

``` 
 aim 
```

## Capture Filter

You cannot directly filter AIM protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the AIM traffic over the default port (5190):

``` 
 tcp port 5190 
```

## External links

  - <http://en.wikipedia.org/wiki/AOL_Instant_Messenger> - wikipedia mentioning OSCAR and TOP protocols for AIM

## Discussion

---

Imported from https://wiki.wireshark.org/AIM on 2020-08-11 23:11:06 UTC
