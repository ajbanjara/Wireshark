# IOCTL\_REQUEST\_DCERPC

0x0011c017

This [SMB2/Ioctl](/SMB2/Ioctl) function transports [DCE/RPC](/DCE/RPC) request/responses atop ioctl calls to a named pipe.

## Device

[SMB2/Ioctl/Function](/SMB2/Ioctl/Function) Device == FILE\_DEVICE\_NAMED\_PIPE

## Access

[SMB2/Ioctl/Function](/SMB2/Ioctl/Function) Device == FILE\_READ\_WRITE\_ACCESS

## Function

[SMB2/Ioctl/Function](/SMB2/Ioctl/Function) Function == 0x0005

## Method

[SMB2/Ioctl/Function](/SMB2/Ioctl/Function) Method == METHOD\_NEITHER

# In Data

A connection oriented [DCE/RPC](/DCE/RPC) request PDU.

# Out Data

A connection oriented [DCE/RPC](/DCE/RPC) response PDU.

---

Imported from https://wiki.wireshark.org/SMB2/Ioctl/Function/FILE_DEVICE_NAMED_PIPE/IOCTL_REQUEST_DCERPC on 2020-08-11 23:25:08 UTC
