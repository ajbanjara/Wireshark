# SMB2/Find

Opcode 0x0e

This [SMB2](/SMB2) command is used to scan for files (and subdirectories) in a directory. This command fills the same purpose as the pair FIND\_FIRST2/FIND\_NEXT2 in SMB.

The Find response might not return the full list of files in a single packet so the client must loop on this command until the server responds with STATUS\_NO\_MORE\_FILES

# SMB2/Find Request

## SMB2/Find Request Packet Format

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
    |       Search Pattern Offset   |       Search Pattern Length   |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    | Search Pattern Buffer...
    +-+-+-+-+...

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode)

## FID

[SMB2/FID](/SMB2/FID) Identifier for the directory to search.

## Search Pattern Offset

TODO...

## Search Pattern Length

The length in bytes of the search pattern.

## Search Pattern Buffer

The search pattern indicating which files we want the results from. The Search pattern is specified in [UTF-16](/UTF-16) and is not null terminated.

The search pattern can contain wildcards such as '\*'

# SMB2/Find Response

## SMB2/Find Response Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |        Buffer Code            |         Response Offset       |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                         Response Size                         |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |   Response Data
    +-+-+-+...

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode)

## Response Size

This field contains the number of bytes of Response Data returned. If there are no more files to report Response Size will be 0 and NT Status code will be set to STATUS\_NO\_MORE\_FILES.

## Response Data

The response data contains a list of [SMB2/SMB2\_FILE\_INFO\_STANDARD](/SMB2/SMB2_FILE_INFO_STANDARD) structures. All structures except the last one in the list will be padded to 8 bytes so that the next structure always starts aligned to 8 bytes.

## NT Status Codes

  - 0x00000000 STATUS\_SUCCESS
  - 0x80000006 STATUS\_NO\_MORE\_FILES

# Discussion

There is possibly an infolevel in the request. all current traces show the same kind of response data so i will call it SMB2\_FILE\_INFO\_STANDARD for now and assume all commands use the same infolevel.

---

Imported from https://wiki.wireshark.org/SMB2/Find on 2020-08-11 23:24:59 UTC
