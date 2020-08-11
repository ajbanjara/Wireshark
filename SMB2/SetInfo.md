# SMB2/SetInfo

Opcode 0x11

This [SMB2](/SMB2) command can be used to set information about files and other types of objects on the server.

# SMB2/SetInfo Request

## SMB2/SetInfo Request Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Buffer Code          |   InfoClass   |   InfoLevel   |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                       Info Data Length                        |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Info Data Offset     |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                      FID                      +-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    | Info Data 
    +-+-+-+-+...

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode) 0x21 = 0x20 | 0x01

## InfoClass

Infoclass specifies what type of information we want to set for the object

    0x01     SMB2_CLASS_FILE_INFO
    0x02     SMB2_CLASS_FS_INFO
    0x03     SMB2_CLASS_SEC_INFO

## InfoLevel

Infolevel together with Infoclass specify a specific type of information to be set.

### Infolevels for SMB2\_CLASS\_FILE\_INFO

  - 0x04 [SMB2/SMB2\_FILE\_BASIC\_INFO](/SMB2/SMB2_FILE_BASIC_INFO)

  - 0x0a [SMB2/SMB2\_FILE\_RENAME\_INFO](/SMB2/SMB2_FILE_RENAME_INFO)

  - 0x0d [SMB2/SMB2\_FILE\_DISPOSITION\_INFO](/SMB2/SMB2_FILE_DISPOSITION_INFO)

  - 0x0e [SMB2/SMB2\_FILE\_POSITION\_INFO](/SMB2/SMB2_FILE_POSITION_INFO)

  - 0x10 [SMB2/SMB2\_FILE\_MODE\_INFO](/SMB2/SMB2_FILE_MODE_INFO)

  - 0x13 [SMB2/SMB2\_FILE\_ALLOCATION\_INFO](/SMB2/SMB2_FILE_ALLOCATION_INFO)

  - 0x14 [SMB2/SMB2\_FILE\_ENDOFFILE\_INFO](/SMB2/SMB2_FILE_ENDOFFILE_INFO)

  - 0x17 [SMB2/SMB2\_FILE\_PIPE\_INFO](/SMB2/SMB2_FILE_PIPE_INFO)

### Infolevels for SMB2\_CLASS\_FS\_INFO

### Infolevels for SMB2\_CLASS\_SEC\_INFO

  - 0x00 [SMB2/SMB2\_SEC\_INFO\_00](/SMB2/SMB2_SEC_INFO_00)

## FID

[SMB2/FID](/SMB2/FID) The object we want to set the information for.

## Info Data Length

The number of bytes of Info Data.

## Info Data Offset

TODO...

## Info Data

The information structure we want to set. There is no padding following this structure even if it is an odd number of bytes in size.

# SMB2/SetInfo Response

## SMB2/SetInfo Response Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Buffer Code          | 
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode) 0x02

## NT Status Codes

# Discussion

---

Imported from https://wiki.wireshark.org/SMB2/SetInfo on 2020-08-11 23:25:15 UTC
