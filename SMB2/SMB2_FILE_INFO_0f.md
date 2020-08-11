# SMB2/SMB2\_FILE\_INFO\_0F

Extended Attributes

This infolevel consists of a list of structures as described below.

## Request Parameter Block

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |           :S:B|               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## B

This bit when set specifies that the EAs should be fetched from the beginning of the list. Of this bit is 0, the command will return the next set of EAs in the list.

## S

Return just one single EA entry.

## Structure

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Next Offset          |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |    EA Flags   |  Name Length  |  Data Length  |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    | Name 
    +-+-+-+-+...
    
    +-+-+-+-+-+-+-+-+
    |     0x00      |
    +-+-+-+-+-+-+-+-+
    
    +-+-+-+-+...
    | Data 
    +-+-+-+-+...

## Next Offset

Offset to the next EA structure, or 0 if there are no more structures.

## EA Flags

## Name Length

Length in bytes of the Name. This string is not null terminated.

## Data Length

Length in bytes of the Data. This string is not null terminated.

## Name

Name Length number of bytes of the Name.

## 0x00

A single byte that separates the EA Name from the EA Data

## Data

Data Length number of bytes of Data.

# NT Status codes

  - STATUS\_NO\_MORE\_EAS will be returned if the B bit is set to 0 and there are no more EAs to return.

# Discussion

If there are more than one entry? are the next entries padded to start at a 4/8 byte boundary?

---

Imported from https://wiki.wireshark.org/SMB2/SMB2_FILE_INFO_0f on 2020-08-11 23:25:25 UTC
