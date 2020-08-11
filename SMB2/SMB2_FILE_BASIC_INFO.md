# SMB2/SMB2\_FILE\_BASIC\_INFO

This infolevel is present both for [SMB2/GetInfo](/SMB2/GetInfo) and [SMB2/SetInfo](/SMB2/SetInfo). It contains basic file information.

## GetInfo/SetInfo Structure

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                    Create                     +-+-+-+-+
    |                           TimeStamp                           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                  Last Access                  +-+-+-+-+
    |                           TimeStamp                           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                  Last Write                   +-+-+-+-+
    |                           TimeStamp                           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                  Last Change                  +-+-+-+-+
    |                           TimeStamp                           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                        File Attributes                        |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## File Attributes

[SMB2/FileAttributes](/SMB2/FileAttributes)

# Discussion

Same as qfi level 1004 in [SMB](/SMB)

---

Imported from https://wiki.wireshark.org/SMB2/SMB2_FILE_BASIC_INFO on 2020-08-11 23:25:19 UTC
