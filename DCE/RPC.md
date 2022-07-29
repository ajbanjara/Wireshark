# Distributed Computing Environment/Remote Procedure Call (DCE/RPC)

DCE/RPC is a specification for a remote procedure call mechanism that defines both APIs and an over-the-network protocol.

A DCE/RPC server's endpoint mapper (EPMAP) will listen for incoming calls. A client will call this endpoint mapper and ask for a specific interface, which will be accessed on a different connection. After that, the client can request calls to the server.

Because of that, you cannot simply capture from a specific TCP port to see all traffic, as there are more connections used.

Binary blobs may be transported between client and server endpoints: apart from the packet type and opnum, the conversation is opaque to DCE/RPC.

## History

The specification documents ordered by release date:

- "P312 DCE: Remote Procedure Call" (not available online) is dated 15/10/1993
- "C309 DCE: Remote Procedure Call" (not available online) is dated 15/08/1994
- [Corrigenda U010 X/Open DCE: Remote Procedure Call](http://www.opengroup.org/pubs/corrigenda/u010f.htm) is dated 15/11/1995
- [C706 DCE 1.1: Remote Procedure Call](http://www.opengroup.org/onlinepubs/009629399/) is dated 15/08/1997, which is the current and complete specification

## Protocol dependencies

DCE/RPC can run atop a number of protocols, including:

- [TCP](/TCP): Typically, connection oriented DCE/RPC uses [TCP](/TCP) as its transport protocol. The well known TCP port for DCE/RPC EPMAP is 135. This transport is called [ncacn_ip_tcp](/ncacn_ip_tcp).
- [UDP](/UDP): Typically, connectionless DCE/RPC uses [UDP](/UDP) as its transport protocol. The well known UDP port for DCE/RPC EPMAP is 135. This transport is called [ncadg_ip_udp](/ncadg_ip_udp).
- [SMB](/SMB): Connection oriented DCE/RPC can also use authenticated named pipes on top of [SMB](/SMB) as its transport protocol. This transport is called [ncacn_np](/ncacn_np).
- [SMB2](/SMB2): Connection oriented DCE/RPC can also use authenticated named pipes on top of [SMB2](/SMB2) as its transport protocol. This transport is called [ncacn_np](/ncacn_np).

## Example traffic

```
Frame 16 (156 bytes on wire, 156 bytes captured)
    Arrival Time: Jan 25, 2006 13:30:30.722061000
    Time delta from previous packet: 0.003745000 seconds
    Time since reference or first frame: 0.072939000 seconds
    Frame Number: 16
    Packet Length: 156 bytes
    Capture Length: 156 bytes
    Protocols in frame: eth:ip:tcp:nbss:smb:dcerpc
Ethernet II, Src: 00:50:56:c0:00:08 (00:50:56:c0:00:08), Dst: 00:0c:29:90:06:7c (00:0c:29:90:06:7c)
    Destination: 00:0c:29:90:06:7c (00:0c:29:90:06:7c)
    Source: 00:50:56:c0:00:08 (00:50:56:c0:00:08)
    Type: IP (0x0800)
Internet Protocol, Src: 192.168.29.1 (192.168.29.1), Dst: 192.168.29.133 (192.168.29.133)
    Version: 4
    Header length: 20 bytes
    Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
        0000 00.. = Differentiated Services Codepoint: Default (0x00)
        .... ..0. = ECN-Capable Transport (ECT): 0
        .... ...0 = ECN-CE: 0
    Total Length: 142
    Identification: 0x0d71 (3441)
    Flags: 0x04 (Don't Fragment)
        0... = Reserved bit: Not set
        .1.. = Don't fragment: Set
        ..0. = More fragments: Not set
    Fragment offset: 0
    Time to live: 128
    Protocol: TCP (0x06)
    Header checksum: 0x3122 [correct]
        Good: True
        Bad : False
    Source: 192.168.29.1 (192.168.29.1)
    Destination: 192.168.29.133 (192.168.29.133)
Transmission Control Protocol, Src Port: 1107 (1107), Dst Port: 139 (139), Seq: 1777360425, Ack: 1042911032, Len: 102
    Source port: 1107 (1107)
    Destination port: 139 (139)
    Sequence number: 1777360425
    Next sequence number: 1777360527
    Acknowledgement number: 1042911032
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
    Window size: 16974
    Checksum: 0x3bfe [validation disabled]
    SEQ/ACK analysis
        This is an ACK to the segment in frame: 15
        The RTT to ACK the segment was: 0.003745000 seconds
NetBIOS Session Service
    Message Type: Session message
    Flags: 0x00
        .... ...0 = Add 0 to length
    Length: 98
SMB (Server Message Block Protocol)
    SMB Header
        Server Component: SMB
        Response in: 17
        SMB Command: Trans (0x25)
        Error Class: Success (0x00)
        Reserved: 00
        Error Code: No Error
        Flags: 0x00
            0... .... = Request/Response: Message is a request to the server
            .0.. .... = Notify: Notify client only on open
            ..0. .... = Oplocks: OpLock not requested/granted
            ...0 .... = Canonicalized Pathnames: Pathnames are not canonicalized
            .... 0... = Case Sensitivity: Path names are case sensitive
            .... ..0. = Receive Buffer Posted: Receive buffer has not been posted
            .... ...0 = Lock and Read: Lock&Read, Write&Unlock are not supported
        Flags2: 0x0001
            0... .... .... .... = Unicode Strings: Strings are ASCII
            .0.. .... .... .... = Error Code Type: Error codes are DOS error codes
            ..0. .... .... .... = Execute-only Reads: Don't permit reads if execute-only
            ...0 .... .... .... = Dfs: Don't resolve pathnames with Dfs
            .... 0... .... .... = Extended Security Negotiation: Extended security negotiation is not supported
            .... .... .0.. .... = Long Names Used: Path names in request are not long file names
            .... .... .... .0.. = Security Signatures: Security signatures are not supported
            .... .... .... ..0. = Extended Attributes: Extended attributes are not supported
            .... .... .... ...1 = Long Names Allowed: Long file names are allowed in the response
        Process ID High: 0
        Signature: 0000000000000000
        Reserved: 0000
        Tree ID: 2048
        Process ID: 1764
        User ID: 2048
        Multiplex ID: 0
    Trans Request (0x25)
        Word Count (WCT): 16
        Total Parameter Count: 0
        Total Data Count: 24
        Max Parameter Count: 1024
        Max Data Count: 65504
        Max Setup Count: 0
        Reserved: 00
        Flags: 0x0000
            .... .... .... ..0. = One Way Transaction: Two way transaction
            .... .... .... ...0 = Disconnect TID: Do NOT disconnect TID
        Timeout: Return immediately (0)
        Reserved: 0000
        Parameter Count: 0
        Parameter Offset: 74
        Data Count: 24
        Data Offset: 74
        Setup Count: 2
        Reserved: 00
        Byte Count (BCC): 31
        Transaction Name: \PIPE\
SMB Pipe Protocol
    Function: TransactNmPipe (0x0026)
    FID: 0x4000
DCE RPC Request, Fragment: Single, FragLen: 24, Call: 1 Ctx: 0, [Resp: #17]
    Version: 5
    Version (minor): 0
    Packet type: Request (0)
    Packet Flags: 0x03
        0... .... = Object: Not set
        .0.. .... = Maybe: Not set
        ..0. .... = Did Not Execute: Not set
        ...0 .... = Multiplex: Not set
        .... 0... = Reserved: Not set
        .... .0.. = Cancel Pending: Not set
        .... ..1. = Last Frag: Set
        .... ...1 = First Frag: Set
    Data Representation: 10000000
        Byte order: Little-endian (1)
        Character: ASCII (0)
        Floating-point: IEEE (0)
    Frag Length: 24
    Auth Length: 0
    Call ID: 1
    Alloc hint: 0
    Context ID: 0
    Opnum: 4
    Response in frame: 17
```

## Wireshark

The DCE/RPC dissector is fully functional. It also has some advanced features available, such as DCE/RPC defragmentation and alike.

You can get the response times (the time between a request and its response) of DCE/RPC interface calls by using the menu item "Statistics/Service Response Time/DCE-RPC...".

If you didn't capture the binding sequence at the start of a connection oriented DCE/RPC conversation, you can use the menu item "Analyze/Decode As..." to attach a specific interface to the selected conversation.

## Preference Settings

(XXX add links to preference settings affecting how DCE/RPC is dissected).

## Example capture file

XXX - Add a simple example capture file. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of DCE/RPC display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/d/dcerpc.html)

Show only the DCE/RPC based traffic (both connection oriented and connectionless):

```
 dcerpc 
```

## Capture Filter

You cannot directly filter DCE/RPC protocols while capturing.

## External links

- the [specification of DCE/RPC 1.1](http://www.opengroup.org/onlinepubs/009629399/) can be found on the [OpenGroup](/OpenGroup)'s Web site
- http://www.samba-tng.org/docs/tng-arch/tng-arch05.html some details about DCE/RPC from the Samba TNG people

### Implementations

- [OpenGroup](/OpenGroup)'s [DCE RPC 1.1](http://www.opengroup.org/dce/mall/free_dce.htm) reference implementation under a non-GPL license
- [OpenGroup](/OpenGroup)'s [DCE RPC 1.2.2](http://www.opengroup.org/dce/download/) reference implementation under the LGPL licence
- [FreeDCE](http://sourceforge.net/projects/freedce) at sourceforge, based on 1.1?

## Decryption

The "encrypted stub data" can be decrypted, either if using [NTLMSSP](NTLMSSP) or [Kerberos](Kerberos)

## Discussion

Ulf Lamping: one might explain **where** ncacn_ip_tcp is used, as I still don't know it :smiley: Ronnie: See the example capture mapi.cap.gz for an example of dcerpc using ncacn_ip_tcp

---

Imported from https://wiki.wireshark.org/DCE/RPC on 2020-08-11 23:12:33 UTC