# SMB2/SessionLogoff

Opcode 0x02

This [SMB2](/SMB2) command is used to logoff an existing session created by [SMB2/SessionSetup](/SMB2/SessionSetup).

# SMB2/SessionLogoff Request

## SMB2/SessionLogoff Request Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |           Buffer Code         |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode) 0x04

# SMB2/SessionLogoff Response

## SMB2/SessionLogoff Response Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Buffer Code          |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode) 0x04

## NT Status Codes

# Discussion

---

Imported from https://wiki.wireshark.org/SMB2/SessionLogoff on 2020-08-11 23:25:13 UTC
