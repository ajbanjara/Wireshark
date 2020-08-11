# SMB2/Notify

Opcode 0x0f

This [SMB2](/SMB2) command is used to set a notification watch on a specific file or a directory. It can be used to "watch" for changes to either the file/directory itself or any child directories.

When used to set the Notification watch, the server will immediately respond with STATUS\_PENDING (and a process id of the watch process) to indicate that the watch has been activated. As for all async commands that return with STATUS\_PENDING this reply will also have the P bit set to 1 in the header.

Once there is a change made to the watched item, the server will send a second response back to the client, this time with the status code STATUS\_NOTIFY\_ENUM\_DIR with some information about exactly what changes occured. This async reply will have the P bit set to 1 in the header and also specify the same PID value in the header as for the initial STATUS\_PENDING reply.

If the client wants to cancel an active watch it can use the [SMB2/Cancel](/SMB2/Cancel) command and specify Command Sequence Number as 0 and the same Process ID as the Notify it wants to cancel. The client also has to set the P bit in the header to indicate that the PID field is valid. The server will then acknowledge that the Notify has been canceled by sending back a response to the notify with status STATUS\_CANCELLED, the same PID as in the initial reply and the P bit set to 1.

# SMB2/Notify Request

## SMB2/Notify Request Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |           Buffer Code         |             :T|               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                              FID                              |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                        CompletionMask                         |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |     BUG       |
    +-+-+-+-+-+-+-+-+

## T

This bit represents whether we want to watch the entire tree or not.

    0:   watch only this directory
    1:   watch this directory and all subdirectories

## FID

[SMB2/FID](/SMB2/FID) Identifier for the directory to put the notification on.

## CompletionMask

The [SMB2/CompletionMask](/SMB2/CompletionMask) is a bitmask controlling what kind of changes we want be notified about.

# SMB2/Notify Response

## SMB2/Notify Response Packet Format

    If STATUS_PENDING
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |           Buffer Code         |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |     BUG       |
    +-+-+-+-+-+-+-+-+
    
    
    If STATUS_CANCELLED
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |           Buffer Code         |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |     BUG       |
    +-+-+-+-+-+-+-+-+
    
    
    
    If status STATUS_NOTIFY_ENUM_DIR
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |           Buffer Code         |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode)

## BUG

this trailing single byte always have the same value as the byte at the same position of the request (byte \#1 of the FID). This is evidently a bug in Vista that

  - it does not clear the buffer before reusing it
  - it send one byte too much back for these status codes

## NT Status Codes

# Discussion

The [CompletionMask](/CompletionMask) field is currently just a guess. The T bit is a guess.

What also might be here is a Maximum amount of returned data (bytes 4-7) or what i always found missing in SMB Notify, a maximum number od subtree levels to watch.

---

Imported from https://wiki.wireshark.org/SMB2/Notify on 2020-08-11 23:25:12 UTC
