[[_TOC_]]

:warning: **WARNING: This wiki page is woefully out of date.**

# PcapNg

The *PCAP Next Generation Dump File Format* (or pcapng for short) is an attempt to overcome the limitations of the currently widely used (but limited) libpcap format.

The pcapng file format specification is still work in progress, see:

  - The pcapng [mailing list](https://www.winpcap.org/mailman/listinfo/pcap-ng-format) (and [archives](https://www.winpcap.org/pipermail/pcap-ng-format/))

  - Pcapng specification [Git repository](https://github.com/pcapng/pcapng)

  - [Some extensions to the pcapng format](https://github.com/HoneProject/Linux-Sensor/wiki/Augmented-PCAP-Next-Generation-Dump-File-Format) from the Linux-Sensor project.

# Example pcapng Capture Files

Included below are some example pcapng files. While the block headers for these files appears to be formatted correctly, the payloads contained within these may NOT necessarily be well-formed (this is especially true of the "http.bigendian.ntar" file). Examples of pcapng files are currently very scarce. A few of these files were found elsewhere on the net (most likely the at the winpcap.org site referenced above). The "http.littlendian.ntar" file was found as an attachment(under a different name) in an email regarding pcapng. The http.bigendian.ntar is a version of this same file that was edited by hand to illustrate how a big-endian and little-endian machine might write the same data.

Some more recent example files:

  - [dhcp.pcapng](uploads/__moin_import__/attachments/Development/PcapNg/dhcp.pcapng) (SHB, IDB, 4 \* EPB)

  - [dhcp\_little\_endian.pcapng](uploads/__moin_import__/attachments/Development/PcapNg/dhcp_little_endian.pcapng) (SHB, IDB, NRB, 4 \* EPB; encoded in little-endian format)

  - [dhcp\_big\_endian.pcapng](uploads/__moin_import__/attachments/Development/PcapNg/dhcp_big_endian.pcapng) (SHB, IDB, NRB, 4 \* EPB; encoded in big-endian format)

  - [many\_interfaces.pcapng](uploads/__moin_import__/attachments/Development/PcapNg/many_interfaces.pcapng) (SHB, 11 \* IDB, NRB, 11 \* ISB, 64 \* EPB)

:warning: **Please note: The recommended file name extension for pcapng files is *.pcapng***

Some **very** old example files:

  - [http.littleendian.ntar](uploads/__moin_import__/attachments/Development/PcapNg/http.littleendian.ntar) (SHB, IDB, 43 \* PB)

  - [test001.ntar](uploads/__moin_import__/attachments/Development/PcapNg/test001.ntar) (SHB)

  - [test002.ntar](uploads/__moin_import__/attachments/Development/PcapNg/test002.ntar) (SHB, IDB)

  - [test003.ntar](uploads/__moin_import__/attachments/Development/PcapNg/test003.ntar) (SHB, IDB)

  - [test004.ntar](uploads/__moin_import__/attachments/Development/PcapNg/test004.ntar) (SHB)

  - [test005.ntar](uploads/__moin_import__/attachments/Development/PcapNg/test005.ntar) (SHB, IDB)

  - [test006.ntar](uploads/__moin_import__/attachments/Development/PcapNg/test006.ntar) (SHB, IDB, 1 \* PB)

  - [test009.ntar](uploads/__moin_import__/attachments/Development/PcapNg/test009.ntar) (SHB, IDB)

  - [icmp2.ntar](uploads/__moin_import__/attachments/Development/PcapNg/icmp2.ntar) (SHB, IDB, 8 \* PB). This file contains 8 ICMP packets (a ping operation). Timestamps have nanosecond precision and the packets contain a valid FCS. The correct dissection of packets and timestamps (relative) is the screenshot ![icmp.jpg](uploads/__moin_import__/attachments/Development/PcapNg/icmp.jpg "icmp.jpg") .

## Test pcapng Files

There is a [github repository](https://github.com/hadrielk/pcapng-test-generator) of various test files to try a pcapng reader/parser on, in both little endian and big endian formats.

## Challenging pcapng Files

  - [test008.ntar](uploads/__moin_import__/attachments/Development/PcapNg/test008.ntar) (SHB, IDB, SHB, IDB) - contains two SHBs. Wireshark refuses to load this file since it contains multiple SHB's, which is not yet supported.

## Malformed pcapng Files

  - [http.bigendian.ntar](uploads/__moin_import__/attachments/Development/PcapNg/http.bigendian.ntar) - same as http.littleendian but buggy\! mixture of big and little endian byte swapping, beginning with a bad SHB major version value

  - [test007.ntar](uploads/__moin_import__/attachments/Development/PcapNg/test007.ntar) (SHB, IDB, 1 \* SPB) - there are two problems with this file: (1) the SPB Block Length is 139, which is not a multiple of 4, and (2) the SPB Packet Data contains more than the SHB's snaplen length allows (SHB's snaplen is 96, but the SPB contains 123 bytes of data).

  - [test010.ntar](uploads/__moin_import__/attachments/Development/PcapNg/test010.ntar) (SHB, IDB, 1 \* SPB) - same problem as test007.ntar above.

# ntartest - a simplistic standalone pcapng (ntar) file reader

Included below is the C source code to a very simplistic program to read and dump header information about a pcapng (a.k.a. ntar) file. This program has been successfully compiled using gcc and used on several different types of systems including Linux, cygwin and Solaris 9.

  - [ntartest.c](uploads/__moin_import__/attachments/Development/PcapNg/ntartest.c)

To compile this program use the command:

\# gcc -o ntartest ntartest.c

To use the program provide a pcapng file as the first argument to the program:

\# ntartest http.littleendian.pcapng

# File

File 5.08+ should be able to identify pcapng files ([ml thread](http://mx.gw.com/pipermail/file/2011/000815.html)).

# NTAR

The [Network Trace Archival and Retrieval](http://www.winpcap.org/ntar/) library is able to read and write pcapng files. Caveats: i) frozen since 2007, ii) no plugins for EPB, ISB, and NRB blocks. Mailing list [archives](https://www.winpcap.org/pipermail/ntar-workers/).

  - Upstream has a more recent version of the library that includes support for EPB blocks. Unfortunately this version is not available for download on the website.

  - (2012-07) NTAR library [anonymous subversion repository](https://anonsvn.winpcap.org/ntar/trunk) ([ml announcement](https://www.winpcap.org/pipermail/pcap-ng-format/2012-July/000043.html))

# Libpcap

As of the 1.1.0 release, libpcap adds limited support for reading pcapng files, see [CHANGES](http://github.com/mcr/libpcap/blob/9d6dc34d55f7315ff7526c03f68996eeb4313664/CHANGES).

# Wireshark

As of Wireshark 1.2.0, pcapng files can be read and written, and live captures can be done in pcapng format as well as pcap format. There were a number of bugs in 1.2.0's support that were fixed in 1.2.1.

The current limitations for pcapng format are:

  - Only a single section
  - Only blocks SHB, IDB, PB, EPB, SPB (others will be ignored)
  - Lots of Options not implemented
  - Writing files is mostly untested
  - When merging files, mergecap doesn't retain each IDB's snaplen
  - mergecap won't merge pcapng files with different encapsulations and intermixed timestamps

tshark 1.6 should be able to read and write NRB blocks (command line options: -W n and -H hosts\_file).

dumpcap 1.4/1.6/1.7 uses the libpcap\_write\_.\*\_block functions from pcapio.c to write the pcapng blocks. It currently writes SHB, IDB, EPB and ISB blocks.

  - \[v1.6.x\] dumpcap -i eth0 -n -w file.pcapng

  - \[v1.7.x\] dumpcap -i eth0 -w file.pcapng
    
      - Capture file will have the following blocks: SHB, IDB, EPB, EPB, ..., ISB.

  - \[v1.7.x\] dumpcap -i eth0 -i eth1 -i eth2 -w file.pcapng
    
      - Capture file will have the following pcapng blocks: SHB, IDB, IDB, IDB, EPB, EPB, ..., ISB, ISB, ISB.
    
      - You can also supply a different capture filter for each interface: dumpcap -i eth0 -f udp -i eth1 -i eth2 -f tcp -w file.pcapng
    
      - TODO: the "-i any" behavior needs to be specified (see [bug \#3096 comments 46+](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3096#c46))

  - \[v1.7.1 rev \>= 41137 and rev \< 41160\] dumpcap -i eth0 -i eth1 -i eth2 -w file.pcapng
    
      - Capture file will have the following pcapng blocks: SHB, IDB, ISB, IDB, ISB, IDB, ISB, EPB, EPB, ..., ISB, ISB, ISB.

  - \[v1.7.1 rev \>= 41160\] dumpcap -i eth0 -i eth1 -i eth2 -w file.pcapng
    
      - Stopped writing ISB blocks immediately after IDB blocks
      - Capture file will have the following pcapng blocks: SHB, IDB, IDB, IDB, EPB, EPB, ..., ISB, ISB, ISB.

  - \[1.8\] - Pcapng is now the default file format.

## Options working

These options are working:

  - opt\_endofopt
  - if\_tsresol (was if\_tsaccur) - only values 6 (microseconds - the default) and 9 (nanoseconds) currently supported
  - if\_fcslen

These options will only be displayed on the console (missing API from wiretap to Wireshark):

  - opt\_comment - work in progress: see ticket [3096](http://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3096)

  - shb\_hardware

  - shb\_os

  - shb\_userappl

  - if\_name

  - if\_description

  - if\_speed

  - pack\_flags

  - epb\_flags

Options status

| Block | Option                       | dumpcap pcapio.{c,h}                                    | Wiretap API                             | Wireshark GUI                                                           |
| ----- | ---------------------------- | ------------------------------------------------------- | --------------------------------------- | ----------------------------------------------------------------------- |
| All   |                              |                                                         |                                         |                                                                         |
|       | (0) `opt_endofopt`           | OK                                                      | OK                                      | \-                                                                      |
|       | (1) `opt_comment`            | SHB, IDB, ISB                                           | WIP: see bug #3096                      | see per block                                                           |
| SHB   | Section Header Block         |                                                         | WIP: see bug #3096                      |                                                                         |
|       | (1) `opt_comment`            | NULL (1.7.1 rev 41026)                                  | (1.7.1 rev 41032)                       | Menu Statistics/Summary                                                 |
|       | (2) `shb_hardware`           | NULL (1.7.1 rev 41026)                                  | (1.7.1 rev 41032)                       | Menu Statistics/Summary                                                 |
|       | (3) `shb_os`                 | OK (1.7.1 rev 41026)                                    | (1.7.1 rev 41032)                       | Menu Statistics/Summary                                                 |
|       | (4) `shb_userappl`           | OK                                                      | (1.7.1 rev 41032)                       | Menu Statistics/Summary                                                 |
| IDB   | Interface Description Block  |                                                         | WIP: see bug #3096; [rev 41082][R41082] |                                                                         |
|       | (1) `opt_comment`            | NULL (1.7.1 [rev 41108][R41108])                        |                                         |                                                                         |
|       | (2) `if_name`                | OK                                                      |                                         |                                                                         |
|       | (3) `if_description`         | NULL (1.7.1 [rev 41108][R41108])                        |                                         |                                                                         |
|       | (4) `if_IPv4addr`            |                                                         |                                         |                                                                         |
|       | (5) `if_IPv6addr`            |                                                         |                                         |                                                                         |
|       | (6) `if_MACaddr`             |                                                         |                                         |                                                                         |
|       | (7) `if_EUIaddr`             |                                                         |                                         |                                                                         |
|       | (8) `if_speed`               | 0 (1.7.1 [rev 41108][R41108])                           |                                         |                                                                         |
|       | (9) `if_tsresol`             | 6 or 9 (1.7.1 [rev 41108][R41108], [rev 41455][R41455]) |                                         |                                                                         |
|       | (10) `if_tzone`              |                                                         |                                         |                                                                         |
|       | (11) `if_filter`             | OK                                                      |                                         |                                                                         |
|       | (12) `if_os`                 | OK (1.7.1 [rev 41108][R41108])                          |                                         |                                                                         |
|       | (13) `if_fcslen`             |                                                         |                                         |                                                                         |
|       | (14) `if_tsoffset`           |                                                         |                                         |                                                                         |
| EPB   | Enhanced Packet Block        |                                                         |                                         |                                                                         |
|       | (1) `opt_comment`            | NULL                                                    |                                         | [EditMenu](/EditMenu) [ExpertInfo](/ExpertInfo) [StatusBar](/StatusBar) |
|       | (2) `epb_flags`              |                                                         |                                         |                                                                         |
|       | (3) `epb_hash`               |                                                         |                                         |                                                                         |
|       | (4) `epb_dropcount`          |                                                         |                                         |                                                                         |
| NRB   | Name Resolution Block        |                                                         |                                         |                                                                         |
|       | (2) `ns_dnsname`             |                                                         |                                         |                                                                         |
|       | (3) `ns_dnsIP4addr`          |                                                         |                                         |                                                                         |
|       | (4) `ns_dnsIP6addr`          |                                                         |                                         |                                                                         |
| ISB   | Interface Statistics Block   |                                                         | WIP (1.7.1 [rev 41137][R41137])         |                                                                         |
|       | (1) `opt_comment`            | OK (1.7.1 revs [41136][R41136] and [41160][R41160])     | OK                                      |                                                                         |
|       | (2) `isb_starttime`          | OK (1.7.1 revs [41136][R41136] and [41160][R41160])     | OK                                      |                                                                         |
|       | (3) `isb_endtime`            | OK (1.7.1 revs [41136][R41136] and [41160][R41160])     | OK                                      |                                                                         |
|       | (4) `isb_ifrecv`             | OK                                                      | OK                                      |                                                                         |
|       | (5) `isb_ifdrop`             | OK                                                      | OK                                      | Menu Statistics/Summary                                                 |
|       | (6) `isb_filteraccept`       |                                                         | OK                                      |                                                                         |
|       | (7) `isb_osdrop`             |                                                         | OK                                      |                                                                         |
|       | (8) `isb_usrdeliv`           |                                                         | OK                                      |                                                                         |

[R41136]: http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41136
[R41160]: http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41160
[R41137]: http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41137
[R41108]: http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41108
[R41455]: http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41455
[R41082]: http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41082

  - dumpcap 1.4/1.6/1.7 (rev \< 41026) only supports (writes) the following options:
    
      - SHB option 04 - shb\_userappl
      - IDB option 02 - if\_name
      - IDB option 11 - if\_filter (if capture filter specified on the command line)
      - ISB option 04 - isb\_ifrecv
      - ISB option 05 - isb\_ifdrop

  - dumpcap 1.7.1 [rev 41026](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41026) added support for the following three SHB options:
    
      - SHB option 01 - opt\_comment ( currently NULL as of rev 41046 )
      - SHB option 02 - shb\_hardware ( currently NULL as of rev 41046 )
      - SHB option 03 - shb\_os ( value from get\_runtime\_version\_info() )

  - Pcapng files created with dumpcap 1.7.1 [rev 41026+](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41026) can't be opened with previous versions of wireshark. The problem is that the Wiretap API code in previous versions can't handle SHB options longer than 100 bytes (and the current shb\_os is longer than that). A patch has already been committed for version 1.6.6 ([rev 41037](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41037)) and is queued to be backported for version 1.4.12. Additional information in [bug 6846](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6846).
    
      - [Rev 41086](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41086) - minimizes the exposure of bug \#6846 by using get\_os\_version\_info() instead of get\_runtime\_version\_info() to fill the value of shb\_os (and thus keeping its length below 100 bytes).

  - [Rev 41082](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41082) - Improved Wiretap support of IDB blocks and IDB options.
    
      - [Rev 41097](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41097) - IDB, EPB options longer than 100 bytes support in branch 1.6

  - [rev 41136](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41136), [rev 41137](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41137) - dumpcap: ISB options

  - [rev 41137](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41137) - wiretap: read all ISB options and write ISB blocks
    
      - It also started writing an ISB block immediately after each IDB block
    
      - The capture file created by 'dumpcap -i eth0 -i eth1 -w file.pcapng' will now have the following pcapng blocks: SHB, IDB, ISB, IDB, ISB, EPB, EPB, ..., ISB, ISB.
    
      - [rev 41160](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41160) - stopped writing ISB blocks immediately after IDB blocks

  - [rev 41143](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41143), [rev 41152](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41152) - wiretap: pcapng sanity checks

  - [rev 41153](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41153) - more backports to branch 1.6

  - [rev 41339](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41339), [rev 41341](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41341), [rev 41351](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41351), [rev 41352](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41352) - if\_filter: first byte specifies filter type (0 = libpcap filter string, 1 = libpcap filter bytecode, ...)

  - [rev 41455](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41455) - time resolution: if\_tsresol = 6 (usec) or 9 (nsec)

  - [rev 41682](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41682) - dumpcap's pcapio no longer writes nul-terminated strings (block options values)

  - [rev 41683](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41683) - Wiretap API: write ISB blocks

## Future

So after implementing the "skeleton" to read the pcapng file, there's a lot more to do:

  - enhance/change/exchange current wiretap API (in part or in whole?)
  - hierarchically store information in Wireshark
  - somehow display these additional infos in the Wireshark GUI

## Wishlist

List here things users would like Wireshark to support in pcapng (this was recorded at the Developer's Roundtable at Sharkfest '10).

Existing pcapng features:

  - packet dropped count

  - annotations (comments)

  - local IP address

  - interface & direction

  - hostname \<-\> IP address database

Existing, but insufficiently specified, pcapng features:

  - capture filter used
  - timezone

Features not yet in pcapng:

  - GPS location (of capturing computer) -- see Kismet

  - Wireless spectrum information / physical layer meta-data other than what's already carried in headers such as the radiotap header for 802.11; per-packet information of this sort may belong in those headers rather than in pcapng packet block options, as there's already code to handle that in programs that read pcap and pcapng files, there's already code in drivers to generate that information when capturing packets, and including it in the packet data means that it can be supported in pcap as well as pcapng.

  - Recording the original frame numbers of packets from the original packet capture file when saving packets to a new file in order to make cross-referencing them easier.

  - SSL session keys (when decrypting SSL with a private key, save the Master Secrets of the SSL sessions, so the tracefile can be shown decrypted without access to the private key) (<https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9616>)

-----

# FAQ

## File format conversion

### From .pcap to .pcapng

Using editcap or tshark:

  - editcap -F pcapng file.pcap file.pcapng
  - tshark -F pcapng -r file.pcap -w file.pcapng

### From .pcapng to .pcap

Using editcap:

  - editcap -F libpcap -T ether file.pcapng file.pcap

Note: you need to specify an encapsulation type (-T \<encapsulation type\>) ([1](http://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4636))

Using tcpdump/libpcap (4.1.0+/1.1.0+) ([1](http://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4636#c1),[2](http://www.wireshark.org/lists/wireshark-users/201004/msg00002.html)):

  - tcpdump -r file.pcapng -w file.pcap

## Merging pcapng files

Again, you need to manually specify an encapsulation type. For example:

  - mergecap -T ether -w new.pcapng file1.pcapng file2.pcapng ...

Note: This operation can't still be done via Wireshark's File/Merge ... (as of rev 40759).

## Create pcap files instead of pcapng files

You may use the dumpcap's -P command line option if you need to create capture files in the old libpcap format (instead of the new default pcapng):

  - dumpcap -P -i eth0 -w file.pcap

---

Imported from https://wiki.wireshark.org/Development/PcapNg on 2020-08-11 23:12:58 UTC
