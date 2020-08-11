[[_TOC_]]

# Introduction

In order to fully support the pcapng format, I'm planning to significantly change the wiretap API (i.e., libwiretap). The general model will be to make wiretap internally be more like a pcapng file format in terms of the data structures it maintains, and to appear more like a pcapng file format externally in its API.

The rationale for this is I believe pcapng is essentially a super-set of all file formats we support, and if a file format supports something pcapng doesn't, I have a plan for that too. (discussed later)

Currently, wiretap has the following issues:

  - only supports a single SHB section per file
  - does not report non-packet info being read in the middle of the file, such as new IDBs, NRBs, etc.
  - does not provide a way to write non-packet info to a dump file, other than when it's opened
  - does not provide a way to copy over proprietary or unknown data from an input to an output file

The above issues cause problems for our various programs/tools. For example, a pcapng file with an IDB appearing in the middle cannot be saved by tshark, even in 2-pass mode. Another example is capinfos and mergecap will screw up if an IDB appears in the middle.

To handle these types of things, I'm planning to perform the changes outlined on this page.

# Changes to the internals of wiretap

1\. Change the internal wtap structure to closely follow a pcapng file format model. For example, the following changes:

  - make the SHB info an array
  - move the IDBs to be inside of each SHB, and give them an shb\_id
  - make the NRB info an array (I'm tempted to also move this inside SHB, but not sure)
  - add an array for "unknown blocks", possibly also inside SHB

The "unknown blocks" would be an array of pcapng block types we don't know about. (See later for details)

2\. Change the internal wtap\_dumper structure, in the same way as the wtap structure, but also with the following:

  - add a last\_recorded\_shb\_id integer member, which identifies the highest indexed SHB written into the file thus far

3\. Change the wtap\_pkthdr to more closely model an EPB, with the following changes:

  - make the comments an array
  - add an array of unknown pcapng options
  - add an shb\_id, which identifies the SHB this packet's interface\_id is in (and the packet itself)

The "unknown pcapng options" would be an array of options we don't know about and don't have discrete members for; each option entry is structured and formatted as per the pcapng spec. In other words, this would hold any option for a packet other than comments, drop count, and flags.

4\. For a record type which has no pcapng equivalent, such as that from some new file format that has some record type that pcapng doesn't, it would return a pcapng record\_type 0x40000BAD, which is the pcapng block type for Custom Block with do-not-copy behavior; and it would use its own PEN number. We could also provide a way to use the Wireshark PEN number, but we'd have to think about the internal structure for that carefully.

Likewise for packet "options" - if the file format has some per-packet info it wants to expose, it can add that to the "unknown pcapng options" array using a option type of 0x4BAD, which is the pcapng option type for Custom Option with do-not-copy behavior; and it would use its own PEN number.

For a block/option type in a pcapng file that wiretap doesn't explicitly know about, it would just use the same block/option code number it uses in the pcapng file.

# Changes to the public reading-side API for wiretap

1\. Create a new wtap\_read\_record() public function, which reads the next "record" from the file. The returned info (if it succeeds) will be a record\_type and a void pointer to a struct based on that record\_type. The record\_type numbers will be REC\_TYPE\_ values from wiretap/wtap.h. If there's a record type that makes sense for multiple file formats, so that it can be defined so that records in particular file formats can be losslessly mapped to a common structure, and that structure can be written out, possibly with loss of information not supported in that file format, in all those formats, a new REC\_TYPE\_ should be assigned; otherwise, REC\_TYPE\_FT\_SPECIFIC\_EVENT or REC\_TYPE\_FT\_SPECIFIC\_REPORT should be used (for all file formats, including pcapng).

If the record\_type is for a packet, e.g. an EPB, SPB, or PB in pcapng, then REC\_TYPE\_PACKET would be used, and wtap\_read\_record() would set the phdr info as before (plus the changes noted earlier), and that would be used by the reader as the "record" passed back, instead of the void pointer.

If the record type is for an SHB or, if any other file format has a pcapng-style notion of sections (as far as I know, none does), a record like an SHB, then REC\_TYPE\_SECTION\_HEADER (a new type we'd add to wiretap) would be used, and the returned structure would be the current wtapng\_section\_t. For file formats that don't have a pcapng-style notion of sections, and thus have no record like an SHB, a REC\_TYPE\_SECTION\_HEADER would be synthesized and provided as the first record.

If the record describes an interface or interfaces, such as an IDB in pcapng or a "Netmon Network Info Ex" "packet" in Microsoft Network Monitor files, then REC\_TYPE\_INTERFACE\_DESCRIPTIONS (a new type we'd add to wiretap) would be used, and a count of interfaces followed by an \*array\* of wtapng\_if\_descr\_t structures would be used ("Netmon Network Info Ex" has a list of all the interfaces in the capture, rather than just a single interface, and, that way, we could make that record show up in the packet list for [NetMon](/NetMon) files as a single record, so as to keep [NetMon](/NetMon) packet numbers when read by Wireshark the same as when read by [NetMon](/NetMon) - I think there's a bug filed about that).

If the record contains interface statistics, such as an ISB in pcapng, then REC\_TYPE\_INTERFACE\_STATISTICS (a new type we'd add to wiretap) would be used, and a wtapng\_if\_stats\_t structure would be returned. If some file format supplies information for multiple interfaces in one record, we could supply multiple such records or could supply a single record with multiple statistics, as for REC\_TYPE\_INTERFACE\_DESCRIPTIONS.

If the record contains name resolution information, then REC\_TYPE\_NAME\_RESOLUTION (a new type we'd add to wiretap) would be used, and a wtapng\_name\_res\_t structure would be returned.

For other record types, we'd define new REC\_TYPE\_ values if we think they're of use for multiple file types, or just use REC\_TYPE\_FT\_SPECIFIC\_EVENT or REC\_TYPE\_FT\_SPECIFIC\_REPORT for them.

The wtap\_read\_record() function would also add the passed-back block struct to the internal wtap structure as appropriate. For example, for REC\_TYPE\_INTERFACE\_DESCRIPTIONS, a new IDB or IDBs would automatically get appended to the most recent SHB's array of IDBs internally. This has implications when writing things to a dump file, as noted later.

2\. Create a new wtap\_seek\_read\_record(), with a similar model as (3), except this one never adds blocks to wtap's internal structure. This is under the presumption that wtap\_read\_record() would have been invoked previously, and thus already added the block to wtap.

3\. Change the current wtap\_read() public function to internally invoke this wtap\_read\_record(), and keep doing it until it hits a REC\_TYPE\_PACKET. (i.e., to a user of wtap\_read() there would be no big change from previous behavior) The current wtap\_seek\_read() would only be used to access a packet record, and does not need to change.

4\. Change wtap\_open\_offline() to not generate a fake IDB for the legacy PCAP file reader - make the PCAP file reader, and all \*other\* file readers for formats where there are no interface description records in the file, synthesize a REC\_TYPE\_INTERFACE\_DESCRIPTIONS record, and supply it after the synthesized REC\_TYPE\_SECTION\_HEADER, if they have enough information in the file header to do so. For iptrace, where each packet has an interface \*name\* associated with it, its reader would keep track of interface names and synthesize a REC\_TYPE\_INTERFACE\_DESCRIPTIONS each time it sees an interface name it hasn't already seen; some other file formats might do something similar.

5\. Change wtap\_file\_encap() to perform a peek at the initial IDBs in a file and return the encap, which could be WTAP\_ENCAP\_UNKNOWN if there are no; but not the whole file - unless a boolean says to peek at the whole file. By "peek" I mean have it read the IDBs in the file, but not save them into wtap.

# Changes to the write-side API for wiretap

1\. Change wtap\_dump\_open\_ng()/wtap\_dump\_fdopen\_ng() routines to only write information for the first SHB and the IDBs currently associated with it when opening the file, but still make internal copies of all the passed-in SHBs/IDBs/NRBs into wtap\_dumper. Since each wtap\_pkthdr passed-in later will identify its respective SHB (and IDB), any additional SHBs can be used as described later.

2\. Create a new wtap\_dump\_record() public function that can be used to write any REC\_TYPE\_ value, including all packet types, the newly-added types, and REC\_TYPE\_FT\_SPECIFIC\_EVENT and REC\_TYPE\_FT\_SPECIFIC\_REPORT. If a packet record is passed in for an SHB that is already in the internal wtap\_dumper structure's array but not yet written into the file (using the last\_recorded\_shb\_id value), then it will write the SHB+IDBs into the file before writing the packet, as well as all IDBs for that SHB. (not sure if NRBs should be held off until close)

If wtap\_dump\_record() is invoked with a REC\_TYPE\_SECTION\_HEADER, REC\_TYPE\_INTERFACE\_DESCRIPTIONS, etc., then it will write them into the file as well as save them to the wtap\_dumper structure.

This way an application can perform one-pass reading and writing, like tshark/editcap/mergecap do, wherein new REC\_TYPE\_SECTION\_HEADERs, REC\_TYPE\_INTERFACE\_DESCRIPTIONSs, etc. show up in the middle of reading+writing. It also allows apps to insert blocks wherever+whenever they wish.

For file formats that cannot handle multiple SHBs (which would be all of them other than pcapng I think), they will fail during dumping if wtap\_dump\_record() is invoked with a new SHB record to write, or a packet that identifies it belongs to an SHB other than the first one. Mergecap or editcap needs to be enhanced to be able to coalesce multiple SHB sections into one.

3\. Make wtap\_dump() invoke wtap\_dump\_record() internally, for packets only.

# Open questions:

1\. Should we remove the add\_new\_ipv4/ipv6 callbacks from wtap, and make the application do that from a passed-back NRB block?

2\. Should we just get rid of wtap\_read()/wtap\_seek\_read()?

  - Yes, we should convert all uses in Wireshark to the new API, and then drop the old APIs. -guy

3\. Should we just get rid of wtap\_dump()?

  - Yes, we should convert all uses in Wireshark to the new API, and then drop the old APIs. -guy

4\. Should we add an API that will allow dissectors (or libwireshark) to register capture file specific preferences (like decryption keys, desegmentation, name resolution, columns, decode as etc)?

  - The challenge with doing something like that is that pcapng files need to be usable/readable forever - by future software versions of tools like wireshark, and also by older version of wireshark. So imagine we add a pcapng block or option to indicate the "decode as" protocol "foo" for a given TCP port. We'd have to never change the protocol name for "foo" from then on, or else it would break the decode-as setting. And if we add some protocol "bar" in a future wireshark version, then a file saved with a "decade-as bar" setting in that future wireshark, would have to be handled some way in the older version of wireshark that understood the "decode-as" but not the "bar" part. So we'd have to make this settings stuff a best-effort thing wireshark would try to apply but would have a lot of protection around failing in various ways. -hadriel

  - For decryption keys, yes I'd assumed we would create a Custom Block to hold session keys (not private keys) and algorithm meta-data stuff, and a custom option in EPBs to indicate which Custom Block the packet was encrypted with. -hadriel

  - See the strawman [proposal for Wireshark Custom Blocks/Options](/Development/PcapngCustom) for a beginning idea.

---

Imported from https://wiki.wireshark.org/WiretapPcapng on 2020-08-11 23:27:37 UTC
