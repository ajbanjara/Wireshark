# SMB2/Lock

Opcode 0x0a

This [SMB2](/SMB2) command is used to Lock / Unlock a FID.

# SMB2/Lock Request

## SMB2/Lock Request Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Buffer Code          |               |0 0 0 0 0 0 0 1|
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                              FID                              |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                     Offset                    +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                     Count                     +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |         |U|E| |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode) 0x30

## FID

[SMB2/FID](/SMB2/FID) This is the object we want to Lock/Unlock

## Offset

The offset in the file you want to start the lock.

## Count

The byte count you want to lock started at offset.

## U flag

Means Unlock

## E flag

Means get an Explusiv Lock

# SMB2/Lock Response

## SMB2/Lock Response Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Buffer Code          |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode) 0x04

## NT Status Codes

# Discussion

---

Imported from https://wiki.wireshark.org/SMB2/Lock on 2020-08-11 23:25:10 UTC
