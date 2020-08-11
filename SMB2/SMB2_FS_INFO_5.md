# SMB2/SMB2\_FS\_INFO\_5

## Structure

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |       FSType Name Length      |   FSType Name
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+...

## FSType Name Length

Number of bytes for the FSType Name

## FSType Name

The name of the file system type. This is usually the string "NTFS"

# Discussion

---

Imported from https://wiki.wireshark.org/SMB2/SMB2_FS_INFO_5 on 2020-08-11 23:25:37 UTC
