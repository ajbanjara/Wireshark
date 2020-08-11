# SMB2/SMB2\_FILE\_STANDARD\_INFO

## GetInfo Structure

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                Allocation Size                +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                  End Of File                  +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                         Number of Links                       |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    | DeletePending |  IsDirectory  |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## End Of File

This is the byte position of the last byte of data for the file. For non-sparse files this is the same thing as the file size.

## Allocation Size

The amount of space the file takes up on the disk. This is usually a multiple of 4KByte for NTFS but can be different for "unusual" block sizes.

# Discussion

This is the same as qfi level 1005 in [SMB](/SMB)

---

Imported from https://wiki.wireshark.org/SMB2/SMB2_FILE_STANDARD_INFO on 2020-08-11 23:25:33 UTC
