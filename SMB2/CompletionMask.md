# SMB2/CompletionMask

This is a 32 bit mask that describes what events we want [SMB2/Notify](/SMB2/Notify) to report.

## CompletionMask

List of the access bits that wireshark currently knows about:

    0x00000800  NOTIFY_STREAM_WRITE  Notify is someone wrote to an alternate stream
    0x00000400  NOTIFY_STREAM_SIZE   Notify is an alternate stream changed in size  i.e. was modified
    0x00000200  NOTIFY_STREAM_NAME   Notify is an alternate stream was created/deleted/renamed
    0x00000100  NOTIFY_SECURITY      Notify if the security descriptor was modified on an object
    0x00000080  NOTIFY_EA            Notify if the Extended Attributes were changed for an object
    0x00000040  NOTIFY_CREATION      Notify if the createion time field was changed for an object
    0x00000020  NOTIFY_LAST_ACCESS   Notify if the last access field was changed
    0x00000010  NOTIFY_LAST_WRITE    Notify if the last write field was changed for an object, i.e. was written to
    0x00000008  NOTIFY_SIZE          Notify if an object changes size
    0x00000004  NOTIFY_ATTRIBUTES    Notify if any attributes are changed
    0x00000002  NOTIFY_DIR_NAME      Notify if directories are created/deleted/renamed
    0x00000001  NOTIFY_FILE_NAME     Notify if files are created/deleted/renamed

# Discussion

---

Imported from https://wiki.wireshark.org/SMB2/CompletionMask on 2020-08-11 23:24:55 UTC
