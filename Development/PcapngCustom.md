[[_TOC_]]

# Overview

In order to write custom information in a pcapng file and not have it collide with other custom information, we use the Custom Block and Custom Options. We might also use this for our wiretap API.

# Type Numbers

The Wireshark PEN number is XXX. (an application for a PEN has been submitted)

The first field within any Wireshark-specific Custom Block or Custom Option, after the Wireshark PEN number, will be a uint32 Entry Type number: either a Block Entry Type for our Custom Block, or an Option Entry Type for our Custom Options. These numbers MUST be unique for all time, across all versions of Wireshark/tshark/editcap/reordercap/mergecap/etc.

We can stop using a particular entry format and thus type number, but we cannot reuse the number for something else.

That means we need a registry of all Block or Option Entry Type numbers we've ever used. That list will reside in wtap.h, but is shown here for discussion purposes. The list in wtap.h will be authoritative, not this list.

## Block Entry Types

| Number | Name             | Description                                                                              |
| ------ | ---------------- | ---------------------------------------------------------------------------------------- |
| 0      | Reserved         | Not used.                                                                                |
| 1      | File Preferences | Contains certain preferences for the whole file (not per SHB section), as defined later. |
| 2      | Decryption Key   | Contains decryption key info, to be used to decrypt packet content, as defined later.    |

## Option Entry Types

Note that these options, even when inside one of our Custom Blocks, are still encoded using a Custom Option and thus with our PEN number.

Since we have 4 billion numbers for Option Entry Types, there's no need to have a different number space per block type - instead, we can reserve a given Option Entry Type number across all of our Block Entry Types.

### 0: Reserved

Not used.

### 1: Display filter

A UTF-8 string of the display filter to apply, in Wireshark display filter syntax. Note that this is a display filter to be applied to limit the display, but that there might be other packets in the file which do no match this filter.

Example: `"http && tcp.port == 8080"`

### 2: Save filter

A UTF-8 string of the display filter that was used to limit the entries in the file, in Wireshark display filter syntax.

Example: `"http && tcp.port == 8080"`

### 3: Color filter

A UTF-8 string of a color filter rule to apply, in Wireshark color filter syntax. This option can be repeated multiple times, of course.

Example: `"@sip@sip@[11384,50442,58072][65535,65535,65535]"`

### 4: Decode-as preference

A UTF-8 string with a TBD format.

### 5: Decryption Key ID

This option is added to an EPB, and is a uint32 that identifies the Decryption Key Block this packet uses, in this SHB section. (i.e., similar to Interface ID for IDBs) Multiple of these options in the same EPB is possible, if one encryption occurs at a different layer than another (for example TLS over IPSEC).

Example: `'0'`

### 6: Decryption Key Value

A variably length sequence of bytes representing the actual decryption key this option is used in Decryption Key Block.

### 7: Decryption Key IV

A variable length sequence of bytes, representing the initialization vector, if necessary; this option is used in Decryption Key Block.

### 8: MAC Key
A variable length sequence of bytes, representing the message authentication key, if necessary; this option is used in Decryption Key Block.


# File Encoding Format

## Endianness

In order to work cross-platform without endian confusion, all fields in an Entry, including the Entry Type number field, are encoded in little-endian format.

Note that binary IPv4 addresses within the Entry-specific Data will be encoded as four separate bytes rather than as a uint32 (so one could consider this as network-order/big-endian), which is the way Wireshark internally stores IPv4 addresses generally anyway.

## Alignment

The internal fields in an Entry are not padded, and provide no particular alignment guarantee. Naturally the whole Entry in a Block or Option will be padded when encoded in a pcapng file, but this is performed transparently at a lower layer by the pcapng writer.

## Wireshark Custom Block

``` 
    0                   1                   2                   3
    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
   +---------------------------------------------------------------+
 0 |               Block Type = 0x00000BAD or 0x40000BAD           |
   +---------------------------------------------------------------+
 4 |                      Block Total Length                       |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 8 |           Wireshark Private Enterprise Number (PEN)           |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
12 |                       Block Entry Type                        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
16 |                      Block Entry Length                       |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
20 /                                                               /
   /                   Block Entry-specific Data                   /
   /              variable length, padded to 32 bits               /
   /                                                               /
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   /                                                               /
   /                      Options (variable)                       /
   /                                                               /
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                      Block Total Length                       |
   +---------------------------------------------------------------+
```

The Block Entry Length defines the length, in bytes, of the Block Entry-specific Data, not including padding. This field is necessary to determine what the number of padding bytes are, and whether there are Options or not.

### File Preferences Entry

The File Preferences Entry contains certain preferences for the whole file (not per SHB section). There can only be one of these per file; additional ones are ignored. This block should appear after the first SHB, before the first packet block (EPB/SPB). The mandatory fields in this block are: major, minor, and revision version numbers. Everything else is handled as an option.

For the "Block Entry-specific Data" portion of the Wireshark Custom Block, the File Preference Entry is formatted as follows:

``` 
 0                   1                   2                   3
 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|          Major Version        | Minor Version |   Revision    |
+---------------------------------------------------------------+
```

Major Version: a uint16 of the Wireshark major version number which created the preferences.

Minor Version: a uint8 of the Wireshark major version number which created the preferences.

Revision: a uint8 of the Wireshark revision version number which created the preferences.

### Decryption Key Entry

The Decryption Key Entry contains decryption key info, to be used to decrypt packet content identified by options in this block and in the respective EPB blocks. This Decryption Block can appear multiple times in each SHB section, each for a different decryption key. This block is scoped to its SHB section only, and thus uses the 0x40000BAD block type code meaning "do-not-copy if you don't understand me".

The mandatory fields in this block are: key type, packet layer type, and whatever options are necessary for the given key type and layer type. For example the key itself is in the Decryption Key Value option, the IV is in a Decryption Key IV option, etc.

Each EPB which uses this also adds the relevant Options, as defined in the Options section.

For the "Block Entry-specific Data" portion of the Wireshark Custom Block, the Decryption Key Entry is formatted as follows:

``` 
 0                   1                   2                   3
 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|      Decryption Key Type      |       Packet Layer Type       |
+---------------------------------------------------------------+
```

Decryption Key Type: A uint16 type number used to determine the algorithm to use for decryption and authentication. Current valid values are:

| Type | Meaning                           |
| ---- | --------------------------------- |
| 1    | AES 128-bit, CBC-mode, SHA-1 HMAC |
| 2    | AES 256-bit, CBC-mode, SHA-1 HMAC |
| x    | ... more here ...                 |

(should we split the HMAC from the encryption instead of combining them as above?)

Packet Layer Type: A uint16 type number to help determine what protocol layer in the packet uses this decryption info, as well as help troubleshoot problems.

| Type | Meaning           |
| ---- | ----------------- |
| 1    | SSLv3             |
| 2    | TLSv1             |
| 3    | TLSv1.1           |
| x    | ... more here ... |

## Wireshark Custom Option

``` 
 0                   1                   2                   3
 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|     Custom Option Code        |         Option Length         |
+---------------------------------------------------------------+
|            Wireshark Private Enterprise Number (PEN)          |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                       Option Entry Type                       |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
/                  Option Entry-specific Data                   /
/              variable length, padded to 32 bits               /
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

The Custom Option Code number is one of the numbers defined in pcapng for Custom Options, for either string or binary, and possibly with the do-not-copy bit set.

---

Imported from https://wiki.wireshark.org/Development/PcapngCustom on 2020-08-11 23:12:59 UTC
