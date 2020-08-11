# SMB2/Ioctl

Opcode 0x0b

This [SMB2](/SMB2) command is used to do Ioctl and Fcntl calls.

This command can transport several different types of Ioctl's, including acting as a transport for [DCE/RPC](/DCE/RPC).

# SMB2/Ioctl Request

## SMB2/Ioctl Request Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Buffer Code          |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                          Ioctl Function                       |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                              FID                              |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                           In Offset                           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                           In Length                           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                          Out Offset                           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                          Out Length                           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                          Max Out Length                       |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    
    +-+-+-+-+...
    | In buffer
    +-+-+-+-+...
    
    +-+-+-+-+...
    | Out buffer
    +-+-+-+-+...

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode) 0x39 = 0x38 | 0x01

## Ioctl Function

This field describes what type of ioctl or fsctl is issued. See [SMB2/Ioctl/Function](/SMB2/Ioctl/Function)

## FID

[SMB2/FID](/SMB2/FID) This i the object we want to send the ioctl to. For [DCE/RPC](/DCE/RPC) based transactions this would be a named pipe but it could also be a regular file or the special fid ffffffff-ffffffff-ffffffff-ffffffff

Currently only the meaning of transactions for [DCE/RPC](/DCE/RPC) on named pipes is known.

## In Offset

Offset relative to the start of the [SMB2](/SMB2) packet where the input buffer starts.

## In Length

Length of the input buffer.

## Out Offset

Offset relative to the start of the [SMB2](/SMB2) packet where the output buffer starts.

## Out Length

Length of the output buffer.

## Max Out Length

This field denotes the maximum amount of data we are prepared to accept in the response. If this is too small for the response, the response will just be truncated but no NT\_status will be set.

## In Buffer

If present, this field carries the ioctl in payload sent to the server. For [DCE/RPC](/DCE/RPC) transactions this would contain the [DCE/RPC](/DCE/RPC) request.

## Out Buffer

Present in the request but ignored by the server. This buffer carries the response data sent back from the server.

# SMB2/Ioctl Response

## SMB2/Ioctl Response Packet Format

    If it executed successfully:
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Buffer Code          |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                          Ioctl Function                       |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                              FID                              |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                           In Offset                           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                           In Length                           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                           Out Offset                          |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                           Out Length                          |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    
    +-+-+-+-+...
    | In buffer
    +-+-+-+-+...
    
    +-+-+-+-+...
    | Out buffer
    +-+-+-+-+...
    
    
    
    If there was an error:
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Buffer Code          |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode) 0x31 = 0x30 | 0x01

## Ioctl Function

This field describes what type of ioctl or fsctl is issued. See [SMB2/Ioctl/Function](/SMB2/Ioctl/Function)

## FID

[SMB2/FID](/SMB2/FID) This i the object we sent the ioctl to. For [DCE/RPC](/DCE/RPC) based transactions this would be a named pipe but it could also be a regular file or the special fid ffffffff-ffffffff-ffffffff-ffffffff

Currently only the meaning of transactions for [DCE/RPC](/DCE/RPC) on named pipes is known.

## In Offset

Offset relative to the start of the [SMB2](/SMB2) packet where the input buffer starts.

## In Length

Length of the input buffer.

## Out Offset

Offset relative to the start of the [SMB2](/SMB2) packet where the output buffer starts.

## Out Length

Length of the output buffer.

## In Buffer

If present, this field carries the ioctl in payload sent to the server. For [DCE/RPC](/DCE/RPC) transactions this would contain the [DCE/RPC](/DCE/RPC) request.

## Out Buffer

Present in the request but ignored by the server. This buffer carries the response data sent back from the server.

## NT Status Codes

# Discussion

update this later now that we know this is ioctl:

There are other, non-dcerpc transactions as well. Some transactions start with the byte 0x03 in the out buffer seen for the magic fid ffffffff-ffffffff-ffffffff-ffffffff issued immediately after a share is mapped. Some transactions operating on plain files take no output buffer at all but return some sort of input data back.

In the request : Immediately followinf the [MaxInSize](/MaxInSize) seems to be a set of flags (uint64). This field has the first byte as 0x01 for all transactions i have seen , dce/rpc or non-dce/rpc.

The four bytes prior to the FID in the request seems to control what kind of transaction it is, I have seen the following pattern :

    00.00.00.00 : no buffer content, status!=0 and error occured.
    
    94.01.06.00 
    c8.01.14.00 :  The two does not operate on a specific fid (fid==ffff-ffff-ffff... ) instead they operate on the tree or the entire server?
                   the c8. version is common when the payload in the request contains strings looking like \PIPE\LANMAN
                   the 94 version often contains payload of the type \<IPADDRESS>\sharename
                   Could this be calls to check if a file exists on a share   or ashare exists on a server?
    
    af.01.09.00 : these all operate on the fid for "" (the share itself?) and takes 8 bytes of output data.   Could this be IOCTL?
    
    c0.00.09.00 : No data in the request,  it returns 64 bytes of data.  operates on both "" as well as normal files.

---

Imported from https://wiki.wireshark.org/SMB2/Ioctl on 2020-08-11 23:25:01 UTC
