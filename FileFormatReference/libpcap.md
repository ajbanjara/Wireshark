# libpcap file format (.pcap)

The libpcap file format is used by a wide range of open (and closed) source programs.

## History

The current libpcap file format version 2.4 is available for quite a long time now.

## Programs supporting this file type

  - Wireshark, TShark, ...

  - [TcpDump](/TcpDump), [WinDump](/WinDump)

  - [snort](http://www.snort.org/)

  - [Analyzer](http://analyzer.polito.it/)

  - [Packetyzer](http://www.networkchemistry.com/products/packetyzer.php)

  - ... and a lot more

## Timestamps

The common timestamp resolution is 1 µs. A special libpcap format is available (supported by Wireshark only), providing 1 ns timestamp resolution.

## Wireshark

The libpcap support is fully functional. Wireshark supports reading and writing of this format.

Wireshark handles all capture file I/O in the [wiretap](http://anonsvn.wireshark.org/viewvc/index.py/trunk/wiretap/) library. You'll find further details about the libpcap file format in the source code files wiretap/libpcap.c and .h :smiley:

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/FILE.pcap](uploads/__moin_import__/attachments/SampleCaptures/FILE.pcap "Upload new attachment \"FILE.pcap\"")

## External links

  - [Development/LibpcapFileFormat](/Development/LibpcapFileFormat) libpcap file format details

## Discussion

---

Imported from https://wiki.wireshark.org/FileFormatReference/libpcap on 2020-08-11 23:14:05 UTC
