# SMB2/FID

The File Identifier is 16 bytes in [SMB2](/SMB2). The file identifiers are similar enough to GUIDs so that wireshark will decode them as a GUID.

FIDs are Created by calls to [SMB2/Create](/SMB2/Create) and destroyed by calls to [SMB2/Close](/SMB2/Close).

Wireshark will snoop the create and close calls and build a database of in which frame a certain FID was opened and in which frame it was closed. Wireshark will also keep track of the mapping between FIDs and filenames and everytime a FID is dissected wireshark will also put the file name of the FID in the decode.

## SMB2/FID Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+                     FID                       +-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

# Discussion

It appears that FIDs are scoped per tcp connection and not TID. If a user session has mapped multiple trees, it can do I/O to a specific FID through any of the trees, not just the one where the FID was opened. This "feature" appears only to exist for file and printer shares and not ipc shares.

If the tree where the FID was originally created on is disconnected, the FID will be autoclosed and that FID can no longer be accessed, not even through any other remaining trees.

---

Imported from https://wiki.wireshark.org/SMB2/FID on 2020-08-11 23:24:57 UTC
