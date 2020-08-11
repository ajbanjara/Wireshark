## RTP H.263 Dump Script

[RTPH263DumpPayload.pl](uploads/__moin_import__/attachments/RtpH263DumpScript/RTPH263DumpPayload.pl)  
**Contributor**: Mike Brown  
**Description**:

There is a Perl module (Net::Pcap) that can decode pcap files; it makes it easy to grab the payload of [RTP](/RTP) packets.

This script uses Net::Pcap to do the heavy lifting. The IETF RFCs specify three modes for H.263 \[A,B,C\] encapsulation in [RTP](/RTP). There is a different size media header for each of these modes. This perl script drops a variable number of octets \[58,62,68\] of each packet ([Ethernet](/Ethernet) frame headers, [IP](/IP)v4 headers, [UDP](/UDP) headers and [RTP](/RTP) headers) and writes the rest to a target file.

This script is a modification of the [RtpDump](/RtpDump) script on this site. The modification makes this script specific to H.263 data extraction.

Get Net::Pcap from [cpan.org](http://www.cpan.org/) if it is not included in your distribution. (It is in FreeBSD's ports, gentoo's portage, probably others.)

If you are using Windows, the following link might help you installing Net::Pcap into your Perl.

<http://www.bribes.org/perl/wnetpcap.html>

To use this script:

1.  Use TShark first to isolate just the (unidirectional) RTP H.263 packets
2.  Save the data into a pcap file
3.  Run this script on the dump file

The resulting file is a raw dump of the H.263 data.

-----

Back to [Tools](/Tools)

---

Imported from https://wiki.wireshark.org/RtpH263DumpScript on 2020-08-11 23:24:13 UTC
