# SMB2/TreeConnect

Opcode 0x03

This [SMB2](/SMB2) command is used to map a share. The Header TID value is specified as 0 in the request and will be filled in by the server in the response if the mapping of the share was successful.

# SMB2/TreeConnect Request

## SMB2/TreeConnect Request Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |           Buffer Code         |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |        Share Name Offset      |       Share Name Length       |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |    Share Name
    +++++....

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode) 0x09 = 0x08 | 0x01

## Length

Length is the number of bytes for the Share Name.

## Share Name

Share Name in unicode [UTF-16](/UTF-16) and not zero terminated. The Share Name is of the format :

``` 
 \\HOST\sharename
```

The Share Name is not null terminated.

# SMB2/TreeConnect Response

## SMB2/TreeConnect Response Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Buffer Code          |  Share Type   |   Reserved    |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                          Access Mask                          |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode) 0x10

## Share Type

``` 
  0x01   Physical disk share
  0x02   Named pipe share
  0x03   Printer share
```

## Access Mask

[SMB2/AccessMask](/SMB2/AccessMask) The access mask of the share. When opening the IPC$ share the accessmask is 0xffffffff.

## NT Status Codes

\* 0x00000000 STATUS\_SUCCESS The share was successfully mapped.

# Discussion

---

Imported from https://wiki.wireshark.org/SMB2/TreeConnect on 2020-08-11 23:25:41 UTC
