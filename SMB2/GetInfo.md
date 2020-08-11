# SMB2/GetInfo

Opcode 0x10

This [SMB2](/SMB2) command can be used to get information about files and other types of objects from the server.

# SMB2/GetInfo Request

## SMB2/GetInfo Request Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Buffer Code          |   InfoClass   |   Infolevel   |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                   Max Response Buffer Size                    |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+                   Parameters                  +-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                      FID                      +-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode) 0x29 = 0x28 | 0x01 (but why? where's the dynamic part?)

## InfoClass

Infoclass specifies what type of object we want information about.

    0x01     SMB2_CLASS_FILE_INFO
    0x02     SMB2_CLASS_FS_INFO
    0x03     SMB2_CLASS_SEC_INFO

## InfoLevel

Infolevel together with Infoclass specify a specific type of information to be returned.

### Infolevels for SMB2\_CLASS\_FILE\_INFO

  - 0x04 [SMB2/SMB2\_FILE\_BASIC\_INFO](/SMB2/SMB2_FILE_BASIC_INFO)

  - 0x05 [SMB2/SMB2\_FILE\_STANDARD\_INFO](/SMB2/SMB2_FILE_STANDARD_INFO)

  - 0x06 [SMB2/SMB2\_FILE\_INTERNAL\_INFO](/SMB2/SMB2_FILE_INTERNAL_INFO)

  - 0x07 [SMB2/SMB2\_FILE\_EA\_INFO](/SMB2/SMB2_FILE_EA_INFO)

  - 0x08 [SMB2/SMB2\_FILE\_ACCESS\_INFO](/SMB2/SMB2_FILE_ACCESS_INFO)

  - 0x0e [SMB2/SMB2\_FILE\_POSITION\_INFO](/SMB2/SMB2_FILE_POSITION_INFO)

  - 0x0f [SMB2/SMB2\_FILE\_INFO\_0f](/SMB2/SMB2_FILE_INFO_0f)

  - 0x10 [SMB2/SMB2\_FILE\_MODE\_INFO](/SMB2/SMB2_FILE_MODE_INFO)

  - 0x11 [SMB2/SMB2\_FILE\_ALIGNMENT\_INFO](/SMB2/SMB2_FILE_ALIGNMENT_INFO)

  - 0x12 [SMB2/SMB2\_FILE\_ALL\_INFO](/SMB2/SMB2_FILE_ALL_INFO)

  - 0x15 [SMB2/SMB2\_FILE\_ALTERNATE\_NAME\_INFO](/SMB2/SMB2_FILE_ALTERNATE_NAME_INFO)

  - 0x16 [SMB2/SMB2\_FILE\_STREAM\_INFO](/SMB2/SMB2_FILE_STREAM_INFO)

  - 0x1c [SMB2/SMB2\_FILE\_COMPRESSION\_INFO](/SMB2/SMB2_FILE_COMPRESSION_INFO)

  - 0x22 [SMB2/SMB2\_FILE\_NETWORK\_OPEN\_INFO](/SMB2/SMB2_FILE_NETWORK_OPEN_INFO)

  - 0x23 [SMB2/SMB2\_FILE\_ATTRIBUTE\_TAG\_INFO](/SMB2/SMB2_FILE_ATTRIBUTE_TAG_INFO)

### Infolevels for SMB2\_CLASS\_FS\_INFO

  - 0x01 [SMB2/SMB2\_FS\_VOLUME\_INFO](/SMB2/SMB2_FS_VOLUME_INFO) same as SMB qfs level 1001

  - 0x03 [SMB2/SMB2\_FS\_SIZE\_INFO](/SMB2/SMB2_FS_SIZE_INFO) same as SMB qfs level 1003

  - 0x04 [SMB2/SMB2\_FS\_DEVICE\_INFO](/SMB2/SMB2_FS_DEVICE_INFO) same as SMB qfs level 1004

  - 0x05 [SMB2/SMB2\_FS\_ATTRIBUTE\_INFO](/SMB2/SMB2_FS_ATTRIBUTE_INFO) same as SMB qfs level 1005

  - 0x06 [SMB2/SMB2\_FS\_QUOTA\_INFO](/SMB2/SMB2_FS_QUOTA_INFO) same as SMB qfs level 1006

  - 0x07 [SMB2/SMB2\_FS\_FULL\_SIZE\_INFO](/SMB2/SMB2_FS_FULL_SIZE_INFO) same as SMB qfs level 1007

  - 0x08 [SMB2/SMB2\_FS\_OBJECTID\_INFO](/SMB2/SMB2_FS_OBJECTID_INFO) same as SMB qfs level 1008

### Infolevels for SMB2\_CLASS\_SEC\_INFO

  - 0x00 [SMB2/SMB2\_SEC\_INFO\_00](/SMB2/SMB2_SEC_INFO_00)

## Max Response Buffer Size

This field specifies the maximum amount of data that the server can send back in the response. If the response is truncated the server will set the NT Status Code STATUS\_BUFFER\_OVERFLOW

## Parameters

A block of 16 bytes with extra parameters specific to the class/infolevel.

## FID

[SMB2/FID](/SMB2/FID) Identifier for the object to get the info from.

# SMB2/GetInfo Response

## SMB2/GetInfo Response Packet Format

    If STATUS_SUCCESS or STATUS_BUFFER_OVERFLOW
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |           Buffer Code           |    Response Buffer Offset   |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               Response Buffer Size (16 or 32 bit?)            |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |    Data depending of Infoclass/Infolevel in the request
    +-+-+-+-+...
    
    
    if STATUS_BUFFER_TOO_SMALL
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |           Buffer Code           |            0x0000           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                   Response Buffer Size == 4                   |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                       Required Buffer Size                    |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    
    
    if STATUS_INVALID_PARAMETER or STATUS_INVALID_INFO_CLASS or 
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |           Buffer Code           |            0x0000           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                            0x00000000                         |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode) 0x09 = 0x08 | 0x01

## Response Buffer Size

The number of bytes of returned data that follows.

## NT Status Codes

  - 0xc0000023 STATUS\_BUTTER\_TOO\_SMALL This indicates that the buffer was too small to hold the returned data. The response packet will only contain 4 bytes which represents the required size of the buffer.
  - 0x80000005 STATUS\_BUFFER\_OVERFLOW This indicates that the buffer was too small and that the response data is truncated. There is no indication of how big the buffer needs to be.

# Discussion

Some of the 16 bytes between maxresponsebuffersize and the fid in the request holds data specific to the class/level used and will alter what kind of data is returned. Bytes 8-11 have been seen to definitely fall in this range. but it could be bytes 4-15 or even all of them. This blob should be documented on the corresponding class/level page.

## Examples

Here is a [capture](uploads/__moin_import__/attachments/SMB2/GetInfo/smb2-getinfo.cap "capture") of a scanner trying every SMB2 getinfo level. The file being queried had the following settings:

    scan-getinfo.dat:
            create_time:    Thu Aug 10 09:11:44 2006 EST
            access_time:    Fri May 12 09:11:44 2006 EST
            write_time:     Sat Feb 11 10:11:44 2006 EST
            change_time:    Sun Nov 13 10:08:13 2005 EST
            attrib:         0x20
            alloc_size:     8
            size:           7
            nlink:          1
            delete_pending: 0
            directory:      0
            ea_size:        41
            fname:          '\test\scan-getinfo.dat'

Here is a [capture](uploads/__moin_import__/attachments/SMB2/GetInfo/getinfo.cap "capture") of running the SMB2-GETINFO and SMB2-SETINFO smbtorture tests. This demonstrates working with EAs, ACLs and many getinfo and setinfo levels.

---

Imported from https://wiki.wireshark.org/SMB2/GetInfo on 2020-08-11 23:25:00 UTC
