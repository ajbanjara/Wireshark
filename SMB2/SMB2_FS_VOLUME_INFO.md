# SMB2/SMB2\_FS\_VOLUME\_INFO

## GetInfo Structure

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                  Create Time                  +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                     Volume Serial Number                      |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                      Volume Label Length                      |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |           reserved            |     Label
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+...

## Create Time

Timestamp when this volume was created.

## Volume Serial number

## Volume Label Length

Length on bytes of the volume label, or 0 if there is no label.

## Label

Label of this volume in unicode.

# Discussion

Same as QFS 1001 in [SMB](/SMB)

---

Imported from https://wiki.wireshark.org/SMB2/SMB2_FS_VOLUME_INFO on 2020-08-11 23:25:40 UTC
