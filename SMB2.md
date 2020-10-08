# Server Message Block version 2 and 3

SMB2 is a new version of the old Windows filesharing protocol SMB and is used for filesharing on modern and future Windows hosts. Windows 8 introduced several new features, so Microsoft has decided to bump the revision number up to SMB v3.

As the packet signature is the same for SMB versions 2 and 3, Wireshark uses the display filter `smb2` for both versions.

## History

SMB2 was introduced with Microsoft Vista and is a redesign of the older SMB protocol. It adds larger types for various fields as well as a fixed size header. To separate it from the older SMB protocol it uses a slighty different signature 0xFE 'S' 'M' 'B' instead of the older 0xFF 'S' 'M' 'B' signature.

The following table lists the version number and the operating that brought them.

| version | Operating System            |
| ------- | --------------------------- |
| 2.0.2   | Windows Vista, Server 2008  |
| 2.1.0   | Windows 7, Server 2008 R2   |
| 3.0.0   | Windows 8, Server 2012      |
| 3.0.2   | Windows 8.1, Server 2012 R2 |
| 3.1.0   | Windows 10, Server 2016     |

## Protocol dependencies

SMB2 runs on top of TCP ports 139 and 445 which are the same ports used by the older SMB protocol.

  - [TCP](/TCP): SMB2 uses [TCP](/TCP) as its transport protocol. The well known TCP port for SMB2 is 445.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The SMB2 dissector is partially functional.

## Preference Settings

(XXX add links to preference settings affecting how [DCE/RPC](/DCE/RPC) is dissected).

## Example capture files

  - [ifstest.cap.gz](uploads/__moin_import__/attachments/SMB2/ifstest.cap.gz) A capture of two Vista beta2 boxes running ifstest.exe

  - [ifstest.out](uploads/__moin_import__/attachments/SMB2/ifstest.out) The log output from the ifstest.exe tool

  - [smb-on-windows-10.pcapng](uploads/__moin_import__/attachments/SMB2/smb-on-windows-10.pcapng) Handshake between two workstations running Windows 10

  - [smb2-peter.pcap](uploads/__moin_import__/attachments/SMB2/smb2-peter.pcap) Simulated traffic (containing file reads/writes) between a Samba 4.4.x client and server on Arch Linux (from June 2016).

## Display Filter

A complete list of SMB2 display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/s/smb2.html)

Show only the SMB2 based traffic :

``` 
 smb2 
```

## Capture Filter

You cannot directly filter on SMB2 while capturing but you can capture for TCP port 445

## External links

The [smb2-protocol](http://www.wireshark.org/lists/) mailing list.

An [implementation](http://samba.org/ftp/unpacked/samba4/source/libcli/smb2/) in Samba4.

Microsoft's [\[MS-SMB2\]: Server Message Block (SMB) Version 2 Protocol Specification](http://msdn.microsoft.com/en-us/library/cc246482\(PROT.10\).aspx)

### Implementations

# SMB2 Header Structure

As for the older SMB protocol, all multibyte integers are represented in little-endian format.

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |     0xFE      |      'S'      |      'M'      |      'B'      |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Header Length        |           (padding)           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                          NT_Status                            |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |            Opcode             |            (padding)          |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |       :S:C:P:R|               |               |               |    Flags
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                          Chain Offset                         |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                        Command Sequence-                      |
    +-+-+-+-+-+-+                                     +-+-+-+-+-+-+-+
    |                             Number                            |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                           Process ID                          |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                            Tree ID                            |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                    User ID                    +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+                   Signature                   +-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## Header Length

Total length of the SMB2 header including the 0xFE 'S' 'M' 'B' signature. Minimum header length is 64 bytes.

## NT\_Status

The NT Status error code. Same as for SMB.

## Opcode

The command being issued. See below for a list of known command opcodes.

## Flags

    R:    Response flag.     ==1 if this is a response,          ==0 for a request
    P:    PID valid.         ==1 the PID field is valid,         ==0 PID is not valid
    C:    End of Chain       ==1 this is the last PDU in a chain
    S:    Signature present. ==1 signature is present,           ==0 signature is not present

## Chain Offset

The offset to the next SMB2 PDU within the current NBT PDU.

## Command Sequence Number

This is the command sequnce number for the TCP session used to match requests to responses. The command sequnce number starts with 0 for the initial [SMB2/NegotiateProtocol](/SMB2/NegotiateProtocol) command and is incremented by one for each additional command.

Command sequence number -1 is used when servers sends unsolicited oplock breaks [SMB2/Break](/SMB2/Break) to clients.

## Process ID

The Process ID of the server process/thread for a command with deferred/async completion. If a SMB2 command can not be completed immediately the server will respond immediately with STATUS\_PENDING and specify a value for the PID that the client can use later to Cancel the request. This STATUS\_PENDING reply has the P bit set to 1 to indicate that the PID is valid. Once the command completes later the server will send a second reply to the command, this time still keeping the P bit set to 1 and repeating the same PID as in the initial STATUS\_PENDING reply.

If the client wants to [SMB2/Cancel](/SMB2/Cancel) a pending command it can do so by sending a [SMB2/Cancel](/SMB2/Cancel) to the server with the P bit set to 1 and the PID as was returned in the initial STATUS\_PENDING reply.

This is used by [SMB2/Notify](/SMB2/Notify) and [SMB2/Cancel](/SMB2/Cancel) to set and cancel a directory watch but can also be used for reads from named pipes if they can not be completed immediately. See [SMB2/Cancel](/SMB2/Cancel) for a discussion on how the PID is used in these cases.

Normally for non-async commands the P bit will be set to 0 and the PID will be set to the default value of 0x0000feff.

## Tree ID

An integer that identifies a specific share that is mounted. The value of this integer is generated by the server upon completion of a successful [SMB2/TreeConnect](/SMB2/TreeConnect) call. The Tree ID is scoped by UID/Session.

## User ID

A 64 bit integer that identifies a specific authenticated user on this TCP session. The server will generate this identifier upon completion of a [SMB2/SessionSetup](/SMB2/SessionSetup) command. (In fact, the server will assign this id already in the second packet of the four packet [NTLMSSP](/NTLMSSP) Challenge/Response dance.)

## Signature

Is the S bit is set this field contains the signature for SMB2 Signing. If the S bit is clear this field is 0. It is not yet known how the signature is calculated.

# SMB2 Opcodes

SMB2 commands listed by opcode value. Every Command PDU starts with a [SMB2/BufferCode](/SMB2/BufferCode).

  - 0x00 [SMB2/NegotiateProtocol](/SMB2/NegotiateProtocol)

  - 0x01 [SMB2/SessionSetup](/SMB2/SessionSetup)

  - 0x02 [SMB2/SessionLogoff](/SMB2/SessionLogoff)

  - 0x03 [SMB2/TreeConnect](/SMB2/TreeConnect)

  - 0x04 [SMB2/TreeDisconnect](/SMB2/TreeDisconnect)

  - 0x05 [SMB2/Create](/SMB2/Create)

  - 0x06 [SMB2/Close](/SMB2/Close)

  - 0x07 [SMB2/Flush](/SMB2/Flush)

  - 0x08 [SMB2/Read](/SMB2/Read)

  - 0x09 [SMB2/Write](/SMB2/Write)

  - 0x0a [SMB2/Lock](/SMB2/Lock)

  - 0x0b [SMB2/Ioctl](/SMB2/Ioctl)

  - 0x0c [SMB2/Cancel](/SMB2/Cancel)

  - 0x0d [SMB2/KeepAlive](/SMB2/KeepAlive)

  - 0x0e [SMB2/Find](/SMB2/Find)

  - 0x0f [SMB2/Notify](/SMB2/Notify)

  - 0x10 [SMB2/GetInfo](/SMB2/GetInfo)

  - 0x11 [SMB2/SetInfo](/SMB2/SetInfo)

  - 0x12 [SMB2/Break](/SMB2/Break)

# SMB2 Discovery

When a client tries to discover whether a server supports the SMB2 protocol or not it will initiate a TCP session to port 445 on the server and issue a normal [SMB/NegotiateProtocol](/SMB/NegotiateProtocol) to the server but also specify the new dialect "SMB 2.001".

If the server supports [SMB2](/SMB2) instead of sending a [SMB/NegotiateProtocol](/SMB/NegotiateProtocol) back selecting this dialect it will send a [SMB2/NegotiateProtocol](/SMB2/NegotiateProtocol) back. The client now knows the server supports SMB2 and will issue a new [SMB2/NegotiateProtocol](/SMB2/NegotiateProtocol) request to the server and from thereon the client will only talk SMB2 on that session.

A client will "remember" that a server supports "SMB2" so later setups of new sessions will attempt SMB2 immediately.

## Discussion

---

Imported from https://wiki.wireshark.org/SMB2 on 2020-08-11 23:24:50 UTC
