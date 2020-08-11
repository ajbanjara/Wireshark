# SMB2/SMB2\_FILE\_DISPOSITION\_INFO

This infolevel is used with the [SMB2/SetInfo](/SMB2/SetInfo) command to delete a file.

## SetInfo Structure

    +-+-+-+-+-+-+-+-+
    |             :D|
    +-+-+-+-+-+-+-+-+

## D

Delete On Close : This bit when set to 1 means that the file will be deleted upon close.

# Discussion

When Vista deletes a file, it will open the file with [SMB2/Create](/SMB2/Create), then use [SMB2/SetFile](/SMB2/SetFile) and disposition to 1 and finally [SMB2/Close](/SMB2/Close) to close the file. Since disposition is set to delete on close the file or direcotry will be deleted.

It would be interesting to see if this method can be used to delete non-empty directory trees as well.

---

Imported from https://wiki.wireshark.org/SMB2/SMB2_FILE_DISPOSITION_INFO on 2020-08-11 23:25:21 UTC
