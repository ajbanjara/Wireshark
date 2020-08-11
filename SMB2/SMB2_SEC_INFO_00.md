# SMB2/SMB2\_SEC\_INFO\_00

This is used by both [SMB2/GetInfo](/SMB2/GetInfo) and [SMB2/SetInfo](/SMB2/SetInfo) to get/set a security descriptor. The [SMB2/GetInfo](/SMB2/GetInfo) command takes 4 flags that control what parts of the security descriptor to read. The [SMB2/SetInfo](/SMB2/SetInfo) always specify the full security descriptor.

## GetInfo Parameter Block

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |       :S:D:G:O|               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## S

Return the SACL

## D

Return the DACL

## G

Return the Group

## O

Return the Owner

## Security Descriptor Structure

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |           Revision            |              Type             |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    | 
    +-+-+-+-+...

## Revision

Revision of the security descriptor structure. The only known revision so far is 0x0001. This description will cover revision 0x0001 of this structure.

## Type

This is a bitmask of 16 bits describing this structure.

    0x8000  Self Relative
    0x4000  RM Control valid
    0x2000  SACL Protected
    0x1000  DACL Protected
    0x0800  SACL Auto Inherited
    0x0400  DACL Auto Inherited
    0x0200  SACL Auto Inherit Required
    0x0100  DACL Auto Inherit Required
    0x0080  Server Security
    0x0040  DACL trusted
    0x0020  SACL Defaulted
    0x0010  SACL Present
    0x0008  DACL Defaulted
    0x0004  DACL Present
    0x0002  Group Defaulted
    0x0001  Owner Defaulted

# Discussion

Please somebody fill this out with the rest of the structures and a page for ACL ACE SID.

---

Imported from https://wiki.wireshark.org/SMB2/SMB2_SEC_INFO_00 on 2020-08-11 23:25:40 UTC
