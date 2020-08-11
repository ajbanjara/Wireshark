## RTP Dump Script

**File**: [rtp\_dump.pl](uploads/__moin_import__/attachments/RtpDumpScript/rtp_dump.pl)  
**Contributor**: James Cloos  
**Description**:

There is a Perl module (Net::Pcap) that can decode pcap files; it makes it easy to grab the payload of [RTP](/RTP) packets.

This script uses Net::Pcap to do the heavy lifting. It drops the first 54 octets of each packet ([Ethernet](/Ethernet) frame headers, [IP](/IP)v4 headers, [UDP](/UDP) headers and [RTP](/RTP) headers) and writes the rest to a target file.

This is just a quick and simple example. It needs a lot of work to be a generally useful application.

Get Net::Pcap from [cpan.org](http://www.cpan.org/) if it is not included in your distribution. (It is in FreeBSD's ports, gentoo's portage, probably others.)

To use this script:

1.  Use TShark first to isolate just the (unidirectional) RTP packets
2.  Save the data into a pcap file
3.  Run this script on the dump file

The resulting file is a raw dump of whatever codec the RTP was using. You can use eg sox(1) to encapsulate or convert that to something that your audio-playing apps understand.

If it is a codec sox(1) doesn't understand, you'll need to get the reference code for the codec to convert it to something sox(1) does grok. I.e., the ref code for G.729 from the ITU-T, the code in the iLBC draft/RFC, speexdec(1), etc.

-----

Back to [Scripts](/Scripts)

---

Imported from https://wiki.wireshark.org/RtpDumpScript on 2020-08-11 23:24:13 UTC
