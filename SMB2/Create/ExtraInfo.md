# SMB2/Create/ExtraInfo

The [SMB2/Create](/SMB2/Create) request and reply can set/return additional information about the file such as setting initial EAs or return the maximumm [SMB2/AccessMask](/SMB2/AccessMask) for the file. This is handled by the extrainfo blob passed at the end of [SMB2/Create](/SMB2/Create) requests and responses.

When opening pipes on the IPC$ share, the extrainfo blob is not used.

The extrainfo blob consists of a concatenated list of extrainfo entries. There can be several entries in each extrainfo blob.

## ExtraInfo Entry

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                         Chain Offset                          |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Tag Offset           |          Tag Length           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Tag Length(cont)     |          Data Offset          |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                         Data Length                           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    
    +-+-+-+-+...
    |   Tag
    +-+-+-+-+...
    
    +-+-+-+-+...
    |   Data
    +-+-+-+-+...

## Chain Offset

Offset to the next entry or 0 if no more entries follow.

The offset is relative to the current extrainfo entry and NOT relative to the start of the [SMB2](/SMB2) packet.

## Tag Offset

Offset into this extrainfo entry where the Tag is stored.

## Tag Length

The length in bytes of the Tag. This field is 4 bytes and not aligned.

## Data Offset

Offset into this extrainfo entry where the Data for this tag is stored.

## Data Length

The length in bytes of the data.

## Tag

This is a 4 character ASCII string that specifies the type of the entry and

what kind of information is set/requested.

The types of Tags that have been seen so far are

    ExtA :    Set the extended attributes
    MxAc :    Query the maximum access mask
    TWrp :    Open a specific shadow volume copy/reparse point

## Data

The data field structure depends on which Tag was used and whether it was a request or a response.in

### Data/ExtA

This structure can only be used in [SMB2/Create](/SMB2/Create) requests when a file is being created. It is used to set the Extended Attributes for a file at the same time the file is created. This field will not be returned in a response.

The structure of this field is identical to the get ea infolevel : See [SMB2/SMB2\_FILE\_INFO\_0f](/SMB2/SMB2_FILE_INFO_0f) for a description of this structure.

### Data/MxAc

This tag can be used to query the maximum allowed access mask for the file. The client indicates in the request it wants to know the maximum allowed access mask by attaching a [MxAc](/MxAc) tag to the extrainfo but with Data Length as 0 and no data.

The server then responds with a [SMB2/Create](/SMB2/Create) response that contains a [MxAc](/MxAc) tag and 8 bytes of data.

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                            unknown                            |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                          Access Mask                          |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

### Data/MxAc/AccessMask

See [SMB2/AccessMask](/SMB2/AccessMask)

### Data/TWrp

This tag is used in the Create request to specify that a specific shadow volume copy version is to be opened and not the normal/current version. This tag is not used in replies.

When used the client will first use the [SMB2/Ioctl/Function/FILE\_DEVICE\_NETWORK\_FILE\_SYSTEM/FSCTL\_GET\_SHADOW\_COPY\_DATA](/SMB2/Ioctl/Function/FILE_DEVICE_NETWORK_FILE_SYSTEM/FSCTL_GET_SHADOW_COPY_DATA) Ioctl to get a list of all volume shadow copy instances. This returns a list of all available shadow copies in the format @GMT-date-time. Once a specific shadow copy is selected date-time is converted to an 8 byte NTTIME value and passed to the server as TWrp extra info in the Create call. The Create call has the [OpenReparsePoint](/OpenReparsePoint) bit (0x00200000) bit set in the create flags. The filename specified in the create call is '@'.

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                  TimeStamp                    +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

# Discussion

I have only seen TWrp used to open older copies of the share itself so I dont know if '@' is still used to open old versions of normal files or directories. Maybe it can not be used? Maybe it is using some '@'+something form?

---

Imported from https://wiki.wireshark.org/SMB2/Create/ExtraInfo on 2020-08-11 23:24:56 UTC
