# Libpcap File Format

The [libpcap](/libpcap) file format is the main capture file format used in [TcpDump](https://www.tcpdump.org) / [WinDump](https://www.winpcap.org/windump/default.htm), snort, and many other networking tools. It is fully supported by Wireshark/TShark, but they now generate [pcapng](https://github.com/pcapng/pcapng) files by default.

[[_TOC_]]

## Overview

This file format is a very basic format to save captured network data. As the libpcap library became the "de facto" standard of network capturing on UN\*X, it became the "common denominator" for network capture files in the open source world (there seems to be no such thing as a "common denominator" in the commercial network capture world at all).

Libpcap, and the Windows port of libpcap, [WinPcap](/WinPcap), use the same file format.

Although it's sometimes assumed that this file format is suitable for [Ethernet](/Ethernet) networks only, it can serve many different network types, examples can be found at the Wireshark's [Supported Capture Media](/CaptureSetup/NetworkMedia) page; all listed types are handled by the libpcap file format.

The proposed file extension for libpcap based files is: *.pcap*

Wireshark handles all capture file I/O in the [wiretap](https://gitlab.com/wireshark/wireshark/-/tree/master/wiretap) library. You'll find further details about the libpcap file format in the wiretap/libpcap.c and .h files

## File Format

There are some [variants](#Variants) of the format "in the wild", the following will only describe the commonly used format in its current version 2.4. This format version hasn't changed for quite a while (at least since libpcap 0.4 in 1998), so it's not expected to change except for the PCAPng file format mentioned below.



The file has a global header containing some global information followed by zero or more records for each captured packet, looking like this:

* Global Header
* Packet Header
* Packet Data
* Packet Header
* Packet Data
* ...

A captured packet in a capture file does not necessarily contain all the data in the packet as it appeared on the network; the capture file might contain at most the first *N* bytes of each packet, for some value of *N*. The value of *N*, in such a capture, is called the "snapshot length" or "snaplen" of the capture. *N* might be a value larger than the largest possible packet, to ensure that no packet in the capture is "sliced" short; a value of 65535 will typically be used in this case.

### Global Header

This header starts the libpcap file and will be followed by the first packet header:

```c
    typedef struct pcap_hdr_s {
            guint32 magic_number;   /* magic number */
            guint16 version_major;  /* major version number */
            guint16 version_minor;  /* minor version number */
            gint32  thiszone;       /* GMT to local correction */
            guint32 sigfigs;        /* accuracy of timestamps */
            guint32 snaplen;        /* max length of captured packets, in octets */
            guint32 network;        /* data link type */
    } pcap_hdr_t;
```

  - magic\_number: used to detect the file format itself and the byte ordering. The writing application writes 0xa1b2c3d4 with it's native byte ordering format into this field. The reading application will read either 0xa1b2c3d4 (identical) or 0xd4c3b2a1 (swapped). If the reading application reads the swapped 0xd4c3b2a1 value, it knows that all the following fields will have to be swapped too.

  - version\_major, version\_minor: the version number of this file format (current version is 2.4)

  - thiszone: the correction time in seconds between GMT (UTC) and the local timezone of the following packet header timestamps. Examples: If the timestamps are in GMT (UTC), thiszone is simply 0. If the timestamps are in Central European time (Amsterdam, Berlin, ...) which is GMT + 1:00, thiszone must be -3600. In practice, time stamps are always in GMT, so thiszone is always 0.

  - sigfigs: in theory, the accuracy of time stamps in the capture; in practice, all tools set it to 0

  - snaplen: the "snapshot length" for the capture (typically 65535 or even more, but might be limited by the user), see: *incl\_len* vs. *orig\_len* below

  - network: link-layer header type, specifying the type of headers at the beginning of the packet (e.g. 1 for Ethernet, see [tcpdump.org's link-layer header types page](http://www.tcpdump.org/linktypes.html) for details); this can be various types such as 802.11, 802.11 with various radio information, PPP, Token Ring, FDDI, etc.

:warning: Note: if you need a new encapsulation type for libpcap files (the value for the network field), do **NOT** use **ANY** of the existing values\! I.e., do **NOT** add a new encapsulation type by changing an existing entry; leave the existing entries alone. Instead, send mail to <tcpdump-workers@lists.tcpdump.org> , asking for a new link-layer header type value, and specifying the purpose of the new value.

### Record (Packet) Header

Each captured packet starts with (any byte alignment possible):

```c
    typedef struct pcaprec_hdr_s {
            guint32 ts_sec;         /* timestamp seconds */
            guint32 ts_usec;        /* timestamp microseconds */
            guint32 incl_len;       /* number of octets of packet saved in file */
            guint32 orig_len;       /* actual length of packet */
    } pcaprec_hdr_t;
```

  - ts\_sec: the date and time when this packet was captured. This value is in seconds since January 1, 1970 00:00:00 GMT; this is also known as a UN\*X time\_t. You can use the ANSI C *time()* function from *time.h* to get this value, but you might use a more optimized way to get this timestamp value. If this timestamp isn't based on GMT (UTC), use *thiszone* from the global header for adjustments.

  - ts\_usec: in regular pcap files, the microseconds when this packet was captured, as an offset to *ts\_sec*. In nanosecond-resolution files, this is, instead, the nanoseconds when the packet was captured, as an offset to *ts\_sec* :warning: Beware: this value shouldn't reach 1 second (in regular pcap files 1 000 000; in nanosecond-resolution files, 1 000 000 000); in this case *ts\_sec* must be increased instead\!

  - incl\_len: the number of bytes of packet data actually captured and saved in the file. This value should never become larger than *orig\_len* or the *snaplen* value of the global header.

  - orig\_len: the length of the packet as it appeared on the network when it was captured. If *incl\_len* and *orig\_len* differ, the actually saved packet size was limited by *snaplen*.

:bulb: Fun fact: Before version 2.3 of the libpcap file format, the `orig_len` and `incl_len` fields were swapped. Some implementations continued the swap even when giving 2.3 as their file format version.

### Packet Data

The actual packet data will immediately follow the packet header as a data blob of *incl\_len* bytes without a specific byte alignment.

## Variants

Because of the [drawbacks](#Drawbacks) of the pcap file format, several developers and vendors have independently extended the format to meet their needs. Some developers were kind enough to change the magic bytes from the libpcap standard; for the others, Wireshark has had to include some heuristics.

### Nanosecond pcap

The one official variant of the pcap format is a version that supports nanosecond-precision time stamps. Libpcap 1.5.0 and later can read files in that format; older versions of libpcap, and all current versions of [WinPcap](/WinPcap), cannot read it. Older versions of Wireshark cannot read it; current versions can read it and can show the full nanosecond-resolution time stamps.

The magic bytes for this format are 0xa1b23c4d (note the final two bytes). There are no changes to the file or record headers from standard libpcap, apart from the timestamp resolution.

Authorship of this variant is credited to Ulf Lamping.

### "Modified" pcap

Alexey Kuznetsov created patches to libpcap to add some extra fields to the record header. (These patches were traditionally available at `http://ftp.sunet.se/pub/os/Linux/ip-routing/lbl-tools/` but are no longer available there.) Within the Wireshark source code, this format is known simply as "modified pcap."

The magic bytes for this format are 0xa1b2cd34 (note the fional two bytes). The file header is otherwise the same as the standard libpcap header.

The record header is extended in the following way (code taken from `wiretap/libpcap.h`):

```c
struct pcaprec_modified_hdr {
	struct pcaprec_hdr hdr;	/* the regular header */
	guint32 ifindex;	/* index, in *capturing* machine's list of
				   interfaces, of the interface on which this
				   packet came in. */
	guint16 protocol;	/* Ethernet packet type */
	guint8 pkt_type;	/* broadcast/multicast/etc. indication */
	guint8 pad;		/* pad to a 4-byte boundary */
};
```

In the ss990915 version of the patch (which shows up in SuSE Linux 6.3) the record header instead looks like this (code taken from `wiretap/libpcap.h`):

```c
/* "libpcap" record header for Alexey's patched version in its ss990915
   incarnation; this version shows up in SuSE Linux 6.3. */
struct pcaprec_ss990915_hdr {
	struct pcaprec_hdr hdr;	/* the regular header */
	guint32 ifindex;	/* index, in *capturing* machine's list of
				   interfaces, of the interface on which this
				   packet came in. */
	guint16 protocol;	/* Ethernet packet type */
	guint8 pkt_type;	/* broadcast/multicast/etc. indication */
	guint8 cpu1, cpu2;	/* SMP debugging gunk? */
	guint8 pad[3];		/* pad to a 4-byte boundary */
};
```

### Nokia pcap

Some Nokia boxes (firewalls?) emit a non-standard record format. It uses the standard file header, and the record headers incorporates the standard libpcap record headers, but also add 4 extra bytes of mysterious stuff. Wireshark preserves this data when saving, but otherwise ignores it.

### AIX

The libpcap library used on AIX wrote pcap files with stated version number 2.2, and used RFC 1573 "ifType" values in the header where all other variants use DLT_ values. It also has nanosecond-precision packet timestamps.

Wireshark includes some extra checks if the file version is 2.2 to determine if the file is an AIX pcap.

### IXIA

IXIA's lcap file format closely resembles libpcap, but adds a length field at the end of the file header, which gives the size of all records that follow. (Wireshark ignores this number.)

The magic bytes for this format are 0x1c0001ac (hardware-generated) and 0x01c0001ab (software-generated).

## Libraries

It shouldn't be too hard to implement functions to read/write a libpcap file from scratch as it's a really simple file format. However, if you want to use a library for this purpose, or if you need to actually capture packets from a live network, the following libraries are available to do just this:

  - [libpcap](http://www.tcpdump.org/): the origin of this file format (for UN\*X based systems)

  - [WinPcap](http://www.winpcap.org/): Windows based version of libpcap

There are wrappers for various programming languages available (but you must have one of the above libs installed):

  - [Net::Pcap](http://search.cpan.org/~kcarnut/Net-Pcap-0.05/Pcap.pm): Perl based libpcap wrapper

  - [Jpcap](http://netresearch.ics.uci.edu/kfujii/jpcap/doc/links.html): JAVA based libpcap wrapper

  - [python-libpcap](http://sourceforge.net/projects/pylibpcap/): Python based libpcap wrapper

  - [Ruby/Pcap](http://www.goto.info.waseda.ac.jp/~fukusima/ruby/pcap-e.html): Ruby based libpcap wrapper

  - ... you may add a libpcap wrapper for your favourite programming language or using Google if it's still missing here ...

Note that if you write your own code, it will fail to read any capture files in the "next generation libpcap" format mentioned below. If you use libpcap, however, it will, when linked (at build time or run time) with a version of libpcap/WinPcap that can read those files, be able to read "next generation libpcap" files that don't use features not supported by the current libpcap API (such as packets from multiple interfaces with different link-layer types) as well as reading the current libpcap format. As such, you should use libpcap/WinPcap if you can, rather than writing your own code to read those files.

## Drawbacks

The libpcap format is very simple, one of the reasons that it has gained such a wide usage. Unfortunately it misses a few things which would be helpful:

  - nanosecond time resolution
  - user comments: "shows connection breakdown starting at packet 1432"
  - interface information (like the network card manufacturer)
  - packet drop count (and probably other counts as well)
  - ...

## Today and the Future

It is widely accepted that the libpcap file format serves its purpose but lacks some useful features. There's a next generation pcap file format documented at the pcapng specification [Git repository](https://github.com/pcapng/pcapng). The new format supplies many of the capabilities listed in "Drawbacks" above.

Wireshark currently has the ability to read and write pcapng files, and does so by default, although doesn't support all of the capabilities of the files. Libpcap 1.1.0 and later have a limited ability to read them as well, although libpcap doesn't yet supporting writing them.

More details about the integrating of the pcapng file format into Wireshark at: [Development/PcapNg](/Development/PcapNg)

## Discussion

May be, it will be better, to use the word "data block" or "block" or some other instead of "packet"

---

Imported from https://wiki.wireshark.org/Development/LibpcapFileFormat on 2020-08-11 23:12:52 UTC
