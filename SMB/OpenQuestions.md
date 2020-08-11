There is a lot of stuff that is still unknown about the SMB protocol. This is a partial list of these open questions.

## QFS Info Levels

In trans2 QFS (sub command 3) we know how to decode all 11 info levels that windows servers support, plus the two extended unix info levels supported by Samba. What we don't know is why some windows server support level 1008 (OBJECTID\_INFORMATION) and some don't. In specific levels:

  - we don't know what the last 48 bytes of the 64 bytes returned from the OBJECTID\_INFORMATION level mean. It always seems to be zero, so perhaps it is room for future expansion, but perhaps not.
    
    Ronnie: see [http://wiki.wireshark.org/SMB2/Ioctl/FILE\_OBJECTID\_BUFFER](/SMB2/Ioctl/FILE_OBJECTID_BUFFER)

  - we don't know what the first 24 bytes of the 48 bytes returned by the QUOTA\_INFORMATION level (level 1006) mean. dave says: this may be documented in Nebbett (see my comments below).

## QPATHINFO/QFILEINFO Info Levels

In the QPATHINFO (sub command 5) and QFILEINFO (sub command 7) trans2 calls we know windows servers support 27 information levels (26 for QFILEINFO). A number of the levels contain fields we don't properly understand. In particular

  - in the ALL\_EAS level (level 4) what do the bits in the 8 bits flag field on each returned EA mean?
  - in the BASIC\_INFORMATION level (level 0x101 and its alias at level 1004) why do some windows servers return a 40 byte response, while some return a 36 byte response? Does this imply a new field has been added, or has the file attribute field been expanded to 64 bits? If it has been expanded to 64 bits, then what do the high 32 bits of a file attribute mean?
  - In the COMPRESSION\_INFORMATION level (level 0x10b and its alias at level 1028) what do the various fields mean? We know the first 8 bytes are the compressed size, but the other 8 bytes are less clear.
  - In the MODE\_INFORMATION level (level 1016) what is the 64 bit 'mode' that is returned? It seems to only take on 3 values (0, 1 or 2) and we know that clients can set these values using the SETFILEINFO level 1016 call but we don't know what the values mean.
  - what does the 64 bit ALIGNMENT\_INFORMATION field returned by QFILEINFO level 1017 mean? What affect does it have on file I/O ? dave says: see Nebbett for encoding. I think all this says is that if you're going to do uncached unbuffered local disk IO (DMA from user memory to disk) then you need to make sure the buffers are at least that aligned. I can't see it means anything where cifs is concerned, but I'm only guessing.
  - In the ATTRIBUTE\_TAG\_INFORMATION level (level 1035) what does the 2nd 32 bit field mean? We think it is the 'reparse\_tag' but don't know how this field is used.
  - What is the longevity of the 64 bit file\_id field that shows up in several levels (for example in the INTERNAL\_INFORMATION level 1006). This is clearly a unique file ID, but it is guaranteed to be unique for the life of the file, or only for the life of this connection? dave says: cifs has no opinion on this; it's a file system thing. For NTFS, this is the persistent index number of the file (think 'inode number')

## SETFILEINFO/SETPATHINFO levels

There are quite a few SETFILEINFO/SETPATHINFO trans2 levels that we don't understand. Windows servers support 19 levels, and we can decode only 13 of these. The levels we don't understand are:

  - level 1023, which seems to take an 8 byte value. filemon calls this '[FilePipeInformation](/FilePipeInformation)'

  - level 1025, which seems to take a 16 byte value. filemon calls this '[FilePipeRemoteInformation](/FilePipeRemoteInformation)'.

  - level 1029, which seems to take a 72 byte value. filemon calls this '[CopyOnWriteInformation](/CopyOnWriteInformation)'

  - level 1032, which seems to take a 56 byte value. filemon calls this '[OleClassInformation](/OleClassInformation)'

  - level 1039, which seems to take an 8 byte value. filemon calls this '[InheritContentIndexInfo](/InheritContentIndexInfo)'

  - level 1040, which seems to take an 8 byte value. filemon calls this '[OleInformation](/OleInformation)'
    
    dave says: levels \> 1000 are 'nt passthrough', which I think means that CIFS just transports the same data format that the NT system calls use. A wonderful reference for a lot of this material is the book 'Windows NT/2000 Native API Reference' by Gary Nebbett, though it's getting a bit stale. The 'pipe' levels are documented there. Watch out for alignment padding introduced by the C compiler.

## Error Codes

Throughout the protocol we don't know what error codes are considered valid for a particular operation. We have also not fully worked out when a operation uses forced DOS error codes even when NTSTATUS codes are negotiated.

For example, we know that windows servers will return an old style DOS error code ERRSRV:ERRbaduid when an invalid vuid is given in the SMBntcreatex and SMBntcancel calls, but use the NT\_STATUS\_INVALID\_HANDLE NTSTATUS code for other SMB commands with invalid vuid fields. We don't know in what other situations this happens.

## String Formatting

The available public documentation on the SMB protocol is very unclear when it comes to string formatting, but we have found that windows clients are extremely fussy about exact formatting conventions. In particular, some strings in the protocol must be always in UTF16 unicode format even when ASCII strings are negotiated, and some must always be in ASCII even UTF16 is negotiated.

Also, some strings must be NULL terminated, and some must not be NULL terminated, but the required termination is not known in many cases. The reason this is critical is that we know that some windows application look for a specific length of the returned string, so if for example a file name is returned with a null termination in a SMBfindfirst search and the client is expecting that the string not be terminated then the client will not recognise the file name, which can lead to data corruption.

Ideally we would extend the wireshark parser to display an error for strings that don't conform to the known 'correct' formatting and termination rules, so we can quickly find these errors in implementations.

A good example of this kind of thing is that the STANDARD info level in trans2 findfirst (level 1) needs to return a null terminated string, but the 8 bit length field at offset 22 in the same returned data must not include the termination in the length calculation. In Samba we mark this string as STR\_LEN8BIT|STR\_TERMINATE|STR\_LEN\_NOTERM.

In a similar fashion, most strings that are in UTF16 format are aligned on a 16 bit boundary relative to the start of the SMB packet, but there are exceptions to this rule. For example, the filename returned in the EA\_LIST SMB trans2 findfirst level (level 3) is not 16 bit aligned.

---

Imported from https://wiki.wireshark.org/SMB/OpenQuestions on 2020-08-11 23:24:50 UTC
