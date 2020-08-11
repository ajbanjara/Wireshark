# SMB2/SMB2\_FILE\_INFO\_STANDARD

This structure contains standard file information returned by commands such as [SMB2/Find](/SMB2/Find) If there is a list of structures, every structure except the last one in the list will be padded so that the next structure will always start aligned to 8 bytes.

There is no padding added to the end of the last structure in a list.

## Structure

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                          Next Offset                          |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
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
    +-+-+-+-+                   Last Write                  +-+-+-+-+
    |                           TimeStamp                           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                   Last Change                 +-+-+-+-+
    |                           TimeStamp                           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                     8.3 Name Buffer Size                      |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                        Long Name Length                       |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |           8.3 Name Length     | 8.3 Name Buffer
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-...
    
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    | Long  Name 
    +-+-+-+-+...

### Next Offset

Offset to the next structure in the list. Since the structures are padded to be 8 byte aligned, this offset is always a multiple of 8.

An Offset of 0 indicates that no more structures follow this one.

### 8.3 Name Buffer Size

The size of the 8.3 name buffer. There can be a name buffer in the packet even if there is no name specified (i.e. 8.3 Name Length == 0)

### Long Name Length

Length in bytes of the long name.

### 8.3 Name Length

Length in bytes of the 8.3 name.

### 8.3 Name Buffer

This is a buffer of the size specified in "8.3 Name Buffer Length".

If "8.3 Name Length" is non-zero, this buffer will contain the unicode 8.3 file name. This name is not null terminated.

### Long Name

The long file name in unicode. This file name is not null-terminated and may contain random garbage in the padding that follows this field to make it 8 byte aligned.

# Discussion

This structuire is quite similar to the SMB\_FIND\_FILE\_FULL\_DIRECTORY\_INFO (section 4.3.4.5 in the snia cifs doc). One difference is though that the second uint32 in these packets are always as far as i can tell 0 and not a file-index. It is possible that the [NextOffset](/NextOffset) is actually a 64bit relative pointer/offset. Or it could just be 4 bytes of padding to make the timestamps aligned to 8 bytes.

---

Imported from https://wiki.wireshark.org/SMB2/SMB2_FILE_INFO_STANDARD on 2020-08-11 23:25:28 UTC
