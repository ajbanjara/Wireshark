# SMB2/SessionSetup

Opcode 0x01

This [SMB2](/SMB2) command is to authenticate a user and get a UserID assigned. This command is often the very first command issued from a client after the [SMB2/NegotiateProtocol](/SMB2/NegotiateProtocol) phase has completed.

# SMB2/SessionSetup Request

## SMB2/SessionSetup Request Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |         Buffer Code           |            Padding            |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |        Sec Blob Offset        |        Sec Blob Length        |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    | Sec Blob
    +-+-+-+-+...

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode)

## Sec Blob Offset

This is the offset in bytes of the security blob, starting from the start of the [SMB2/Header](/SMB2/Header).

## Sec Blob Length

This is the number of bytes for the security blob.

## Sec Blob

This is the ASN.1/DER encoded security blob.

# SMB2/SessionSetup Response

## SMB2/SessionSetup Response Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Buffer Code          |           Padding             |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |        Sec Blob Offset        |        Sec Blob Length        |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    | Sec Blob
    +-+-+-+-+...

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode)

## Sec Blob Offset

This is the offset in bytes of the security blob, starting from the start of the [SMB2/Header](/SMB2/Header).

## Sec Blob Length

This is the number of bytes for the security blob.

## Sec Blob

This is the ASN.1/DER encoded security blob.

## NT Status Codes

# Discussion

---

Imported from https://wiki.wireshark.org/SMB2/SessionSetup on 2020-08-11 23:25:14 UTC
