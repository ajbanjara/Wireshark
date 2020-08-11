# SMB2/Read

Opcode 0x08

This [SMB2](/SMB2) command is used to read from an open FID.

# SMB2/Read Request

## SMB2/Read Request Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Buffer Code          |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                    Requested Data Length                      |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                  File Offset                  +-+-+-+-+
    |                                                               |
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
    |               |
    +-+-+-+-+-+-+-+-+

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode)

## Requested Data Length

This is the amount of data to read.

## File Offset

At which offset in the file to read data.

## FID

[SMB2/FID](/SMB2/FID) This is the object to read the data from

# SMB2/Read Response

## SMB2/Read Response Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Buffer Code          |          Data Offset          |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                          Data Length                          |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |  Data Buffer
    +-+-+-+-+...

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode)

## Data Offset

TODO...

## Data Length

The number of bytes read.

## Data Buffer

Length number of bytes containin the data ead.

## NT Status Codes

# Discussion

---

Imported from https://wiki.wireshark.org/SMB2/Read on 2020-08-11 23:25:13 UTC
