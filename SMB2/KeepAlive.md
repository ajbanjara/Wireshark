# SMB2/KeepAlive

Opcode 0x0d

This [SMB2](/SMB2) command can be used to "ping" that the other end is still alive. It can even be used prior to the [SMB2/SessionSetup](/SMB2/SessionSetup) command.

# SMB2/KeepAlive Request

## SMB2/KeepAlive Request Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |           Buffer Code         |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode) 0x04

# SMB2/KeepAlive Response

## SMB2/KeepAlive Response Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Buffer Code          |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode) 0x04

## NT Status Codes

# Discussion

---

Imported from https://wiki.wireshark.org/SMB2/KeepAlive on 2020-08-11 23:25:10 UTC
