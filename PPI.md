# PPI (Per-Packet Information)

The Per-Packet Information (PPI) header is "general and extensible meta-information header format
originally developed to provide 802.11n radio information, but can handle other information as well." It is defined in a 2007 document provided by CACE Technologies, Inc. which includes permission to reproduce and redistribute the document. ([Wayback Machine link](https://wayback.archive.org/web/20120525190041/https://www.cacetech.com/documents/PPI%20Header%20format%201.0.10.pdf), [local copy](uploads/b0aeb8299d0a43df6ea45b77e5bed151/PPI_Header_format_1.0.10.pdf))

## Header Format

Each PPI packet header is comprised of a fixed-length header followed by zero or more type-length-value (TLV) fields. The header must be padded to a 32-bit boundary.

Note that multi-byte fields in the packet header and field headers are **little-endian.**

The fixed header is as follows:

* `pph_version` (8 bits): MUST be 0
* `pph_flags` (8 bits): currently only the least-significant bit of this field has a specified meaning (1=32-bit aligned, 0=unaligned). Other bits MUST be zero.
* `pph_len` (16 bits): Length of the entire PPI header, including the fixed header and all TLVs. MUST be between 8 and 65,535.
* `pph_dlt` (32 bits): a valid data link type, from the [official tcpdump list](https://www.tcpdump.org/linktypes.html).

The TLV field structure is as follows:

* `pfh_type` (16 bits): Identifier for the type of this field
* `pfh_datalen` (16 bits): Length of data in this field; must be between 0 and 65,520

If a TLV field's total length is not a multiple of 32 bits, then consult the alignment bit from the fixed header. If that bit is 0, the next TLV entry will start in the following byte. If the alignment bit is 1, then there will be null padding added in order to align the next field on a 32-bit boundary.

`pfh_type`s between 0 and 29,999 are either specified in the document or are reserved to be specified in future. Types numbering between 30,000 and 65,535 are reserved for vendor-specific use, and each one is assigned to a specific ventor by the WinPcap development team.