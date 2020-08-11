# SMB2/Create

Opcode 0x05

This [SMB2](/SMB2) command is used to open/create and object for access.

# SMB2/Create Request

## SMB2/Create Request Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Buffer Code          |         Create Flags          |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                      Impersonation Level                     |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                          Access Mask                          |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                        File Attributes                        |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                          Share Access                         |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                           Disposition                         |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                         Create Options                        |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |         File Name offset      |        File Name Length       |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                        ExtraInfo Offset                       |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                        ExtraInfo Length                       | 
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    | File Name Buffer...
    +-+-+-+-+...
    | ExtraInfo Buffer(aligned to an 8 byte boundary)...
    +-+-+-+-+...

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode) 0x39 = 0x38 | 0x01

## Create Flags

[SMB2/CreateFlags](/SMB2/CreateFlags) These flags are used to specify whether an oplock is requested and if so what kind of oplocks are desired.

    SMB2_CREATE_FLAG_REQUEST_OPLOCK           0x0100
    SMB2_CREATE_FLAG_REQUEST_EXCLUSIVE_OPLOCK 0x0800
    SMB2_CREATE_FLAG_GRANT_OPLOCK             0x0001
    SMB2_CREATE_FLAG_GRANT_EXCLUSIVE_OPLOCK   0x0080

## Impersonation Level

[SMB2/ImpersonationLevel](/SMB2/ImpersonationLevel)

## Access Mask

The requested [SMB2/AccessMask](/SMB2/AccessMask)

## File Attributes

## Share Access

## Disposition

## Create Options

## File Name Offset

This value will specify the offset into the SMB2 packet buffer where the File Name Buffer starts.

## File Name Length

This is the number of bytes for the filename stored in the File Name Buffer.

## ExtraInfo Offset

The Create command can be chained with some extra info. If there is an extra blob present this value will specify the offset into the SMB2 packet buffer where the [SMB2/Create/ExtraInfo](/SMB2/Create/ExtraInfo) Buffer starts. If there is no more blobs, this value is zero.

## ExtraInfo Buffer Length

Length of the [SMB2/Create/ExtraInfo](/SMB2/Create/ExtraInfo) Buffer, if present.

## File Name Buffer

This is a buffer holding the file name in [UTF-16](/UTF-16) non-zero-terminated.

## ExtraInfo

See [SMB2/Create/ExtraInfo](/SMB2/Create/ExtraInfo)

# SMB2/Create Response

## SMB2/Create Response Packet Format

    If the create was successful:
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |         Buffer Code           |          Create Flags         |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                        Create Action                          |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                    Create                     +-+-+-+-+
    |                           Timestamp                           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                  Last Access                  +-+-+-+-+
    |                           Timestamp                           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                  Last Write                   +-+-+-+-+
    |                           Timestamp                           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                  Last Access                  +-+-+-+-+
    |                           Timestamp                           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                Allocation Size                +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                  End Of File                  +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                         File Attributes                       |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                              FID                              |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                        ExtraInfo Offset                       |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                        ExtraInfo Length                       |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    | ExtraInfo Buffer...
    +++
    
    
    
    If there was an error:
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |         Buffer Code           |                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode) 0x59 = 0x58 | 0x01

## Create Flags

[SMB2/CreateFlags](/SMB2/CreateFlags) This field specifies if an oplock was granted and if so what kind. All the bits that were set in the request will remain set in the reply.

## FID

[SMB2/FID](/SMB2/FID) This is the 16 byte file identifier for the object created/opened.

## ExtraInfo Offset

The Create command can be chained with some extra info. If there is an extra blob present this value will specify the offset into the [SMB2](/SMB2) packet buffer where the [SMB2/Create/ExtraInfo](/SMB2/Create/ExtraInfo) Buffer starts. If there is no more blobs, this value is zero.

## ExtraInfo Length

Length of the [SMB2/Create/ExtraInfo](/SMB2/Create/ExtraInfo) Buffer, if present.

## ExtraInfo

See [SMB2/Create/ExtraInfo](/SMB2/Create/ExtraInfo)

## NT Status Codes

# Discussion

There is no [SMB2/Create/ExtraInfo](/SMB2/Create/ExtraInfo) Buffer, when pipes are opened.

-----

---

Imported from https://wiki.wireshark.org/SMB2/Create on 2020-08-11 23:24:55 UTC
