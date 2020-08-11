# FSCTL\_GET\_SHADOW\_COPY\_DATA

0x00144064

This [SMB2/Ioctl](/SMB2/Ioctl) function will query a file or a filesystem about the number of shadow copies and their labels.

## Device

[SMB2/Ioctl/Function](/SMB2/Ioctl/Function) Device == FILE\_DEVICE\_NETWORK\_FILE\_SYSTEM

## Access

[SMB2/Ioctl/Function](/SMB2/Ioctl/Function) Device == FILE\_READ\_ACCESS

## Function

[SMB2/Ioctl/Function](/SMB2/Ioctl/Function) Function == 0x0019

## Method

[SMB2/Ioctl/Function](/SMB2/Ioctl/Function) Method == METHOD\_BUFFERED

# In Data

There is no in data

# Out Data

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                         Num Volumes                           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                          Num Labels                           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                             Count                             |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    | Labels
    +-+-+-+-+...

## Num Volumes

The number of volumes

## Num Labels

Number of labels

## Count

Number of bytes in list of labels

## Labels

A sequence of Num Label null-terminated unicode strings

# Discussion

Clients will sometimes issue this ioctl with Max Out Length set to 16. This is not sufficient to return any labels and is only a method to probe how big the out buffer has to be before making the real call.

If the out buffer is not big enough to hold all labels the buffer will just be truncated and no error will be returned.

---

Imported from https://wiki.wireshark.org/SMB2/Ioctl/Function/FILE_DEVICE_NETWORK_FILE_SYSTEM/FSCTL_GET_SHADOW_COPY_DATA on 2020-08-11 23:25:09 UTC
