# SMB2/CreateFlags

The create flags is used in the [SMB2/Create](/SMB2/Create) call to request that an oplock be granted to the file opened.

## SMB2/CreateFlags Buffer Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    
    0x0800 SMB2_CREATE_FLAGS_REQUEST_OPLOCK
    0x0100 SMB2_CREATE_FLAGS_REQUEST_EXCLUSIVE_OPLOCK
    
    0x0008 SMB2_CREATE_FLAGS_GRANTED_OPLOCK
    0x0001 SMB2_CREATE_FLAGS_GRANTED_EXCLUSIVE_OPLOCK

---

Imported from https://wiki.wireshark.org/SMB2/CreateFlags on 2020-08-11 23:24:57 UTC
