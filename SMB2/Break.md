# SMB2/Break

Opcode 0x12

This [SMB2](/SMB2) command is used to break an oplock. The command sequence number for unsolicited oplock breaks is -1.

The user id, tree id and process id are all 0 for these calls.

# SMB2/Break Request

## SMB2/Break Request Packet Format

Break requests have not yet been observed

# SMB2/Break Response

## SMB2/Break Response Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Buffer Code          |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                      FID                      +-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode) 0x18

## FID

[SMB2/FID](/SMB2/FID) This is the object to break the oplock for.

## NT Status Codes

# Discussion

In the 6 unknown bytes between buffercode and the fid there is probably a field that contains what oplock type the client holds after this command. I.e. no-oplock or level-2 oplock. (in smb1 the same command is used to either break an oplock or to downgrade it to a level 2 oplock)

The buffer code is 0x18 which would indicate that the PDU ends immediately after the fid. Does this mean the trailing 24 bytes are just padding or a bug in vista?

---

Imported from https://wiki.wireshark.org/SMB2/Break on 2020-08-11 23:24:52 UTC
