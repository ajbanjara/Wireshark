# SMB2/BufferCode

All SMB2 command PDUs start with a buffer code that is two bytes in size.

SMB commands that return no data at all will have a buffer of only two bytes 0x02 0x00

## Structure

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |    Length   :D|               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## Length

The length in bytes of the fixed portion of the SMB command PDU.

## D

This is a flag that indicates whether this command PDU also may contain a dynamic part. The length of the dynamic part is specific to each command opcode and stored in the fixed part of the command.

If present the dynamic part of the command PDU will follow immediately after the fixed part.

---

Imported from https://wiki.wireshark.org/SMB2/BufferCode on 2020-08-11 23:24:52 UTC
