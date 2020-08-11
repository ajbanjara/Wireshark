# SMB2/SMB2\_FILE\_INFO\_05

## Structure

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                Allocation Size                +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                  End Of File                  +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## End Of File

This is the byte position of the last byte of data for the file. For non-sparse files this is the same thing as the file size.

## Allocation Size

The amount of space the file takes up on the disk. This is usually a multiple of 4KByte for NTFS but can be different for "unusual" block sizes.

# Discussion

---

Imported from https://wiki.wireshark.org/SMB2/SMB2_FILE_INFO_05 on 2020-08-11 23:25:23 UTC
