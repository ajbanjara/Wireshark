# SMB2/SMB2\_FILE\_COMPRESSION\_INFO

## GetInfo Structure

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+              Compressed File Size             +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |       Compression Format      |   UnitShift   |  ChunkShift   |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    | ClusterShift  |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

# Discussion

Same as qfi level 1028 in [SMB](/SMB)

---

Imported from https://wiki.wireshark.org/SMB2/SMB2_FILE_COMPRESSION_INFO on 2020-08-11 23:25:20 UTC
