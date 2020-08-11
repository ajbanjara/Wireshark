# SMB2/TreeDisconnect

Opcode 0x04

This [SMB2](/SMB2) command is used to unmap a share mapped by [SMB2/TreeConnect](/SMB2/TreeConnect).

# SMB2/TreeDisconnect Request

## SMB2/TreeDisconnect Request Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |           Buffer Code         |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode) 0x04

# SMB2/TreeDisconnect Response

## SMB2/TreeDisonnect Response Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Buffer Code          |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode) 0x04

## NT Status Codes

# Discussion

---

Imported from https://wiki.wireshark.org/SMB2/TreeDisconnect on 2020-08-11 23:25:42 UTC
