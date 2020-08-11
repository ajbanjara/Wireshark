# SMB2/FileAttributes

This is a 32 bit mask that describes the attributes of a file.

## FileAttributes

List of the attribute bits that wireshark currently knows about:

    0x80000000
    0x40000000
    0x20000000
    0x10000000
    0x08000000
    0x04000000
    0x02000000
    0x01000000
    0x00800000  
    0x00400000
    0x00200000
    0x00100000
    0x00080000
    0x00040000
    0x00020000
    0x00010000
    0x00008000
    0x00004000  Encrypted
    0x00002000  Content Indexed
    0x00001000  Offline
    0x00000800  Compressed
    0x00000400  Reparse
    0x00000200  Sparse
    0x00000100  Temporary
    0x00000080  Normal
    0x00000040  Device
    0x00000020  Archive
    0x00000010  Directory
    0x00000008  Volume ID
    0x00000004  System
    0x00000002  Hidden
    0x00000001  Read Only

# Discussion

---

Imported from https://wiki.wireshark.org/SMB2/FileAttributes on 2020-08-11 23:24:58 UTC
