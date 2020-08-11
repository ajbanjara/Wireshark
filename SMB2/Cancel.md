# SMB2/Cancel

Opcode 0x0c

This [SMB2](/SMB2) command is used to cancel an outstanding [SMB2/Notify](/SMB2/Notify) command or other commands that could not complete immediately and where a STATUS\_PENDING reply was sent back.

Cancel always uses a Command Sequence Number of 0. The cancel command uses the Process ID field to identify which [SMB2/Notify](/SMB2/Notify) to cancel. The PID must be the same as the PID of the initial STATUS\_PENDING reply and the P bit must be set to 1 to indicate that a PID is present.

Cancel is used to abort any SMB2 commands that are "pending", i.e. that could not be completed immediately and where the server responded initially with STATUS\_PENDING. Some commands that may not complete immediately and may need to be later aborted using the Cancel call are [SMB2/Notify](/SMB2/Notify) calls but calls to read from a named pipe such as [SMB2/Read](/SMB2/Read) and [SMB2/Ioctl](/SMB2/Ioctl) can also be "pending".

When a call can not be completed immediately and the server responds with STATUS\_PENDING the server will specify TID=0 in the SMB2 header and it will also specify a ProcessID (PID) and set the P bit to 1 in the response. Later when call actually completes the server will respond with the same command sequence number, TID=0 and the same ProcessID as the P bit set to 1. If the client aborts the call prematurely by calling Cancel the client will use command sequnce number=0 and the same ProcessID value as in the "pending" response and the P bit set to 1.

# SMB2/Cancel Request

## SMB2/Cancel Request Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Buffer Code          |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode)

# SMB2/Cancel Response

There is no response packet.

# Discussion

---

Imported from https://wiki.wireshark.org/SMB2/Cancel on 2020-08-11 23:24:53 UTC
