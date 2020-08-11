# SMB2/SMB2\_FILE\_PIPE\_INFO

This structure is used with [SMB2/SetInfo](/SMB2/SetInfo) and is used every time a named pipe is opened but before any [DCE/RPC](/DCE/RPC) traffic is issued with either [SMB2/Read](/SMB2/Read), [SMB2/Write](/SMB2/Write) or [SMB2/Ioctl](/SMB2/Ioctl).

## SetInfo Structure

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                           Pipe Mode                           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## Pipe Mode

When an named pipe is opened, this infolevel is set with Pipe Mode == 0x00000001 .

# Discussion

Named pipes and [DCE/RPC](/DCE/RPC) still work without setting this "mode" but maybe it is used to set the pipe in unbuffered or synchronous mode or something? Would be interesting to know if it can be set on normal files and directories as well or if it can only be used for named pipes.

---

Imported from https://wiki.wireshark.org/SMB2/SMB2_FILE_PIPE_INFO on 2020-08-11 23:25:31 UTC
