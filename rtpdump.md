## RTPDump

The rtptools distribution consists of a number of small applications (including rtpdump/rtpplay) that can be used for processing RTP data.

<http://www.cs.columbia.edu/IRT/software/rtptools/>

Wireshark can write files in the same format as used by these tools.

### Saving an RTP stream in Wireshark for use with rtpdump/rtpplay

  - Statistics \> RTP \> Show all streams

  - Now select the stream you are interested in.

  - Save As

### Format

The rtpdump file format in Wireshark should (at least more or less) correspond to the binary file format used by the rtpdump/rtpplay program (rtptools). <http://www.cs.columbia.edu/IRT/software/rtptools/> You will also find a description of the file format on that page (but it may cause some confusion regarding padding/byte order)

The description/source code in the Wireshark source tree (the file to look at is tap-rtp-common.c) may be a better source of information: <https://code.wireshark.org/review/gitweb?p=wireshark.git;a=blob;f=ui/tap-rtp-common.c>

Actually, the original author(s) of the file format specification on the above mentioned site did not specify alignment/padding issues for the file format. However the binary packages as well as example dump files available for download on that site stick to a certain scheme, which the implementation of Wireshark also does. That is there are two padding bytes at the end of the RD\_hdr\_t, which brings the RD\_hdr\_t to a size of 8 octets instead of 6. The rest is as noted, without any additional padding.

The Ethernet/IP/UDP headers are not stored in the rtpdump file, but the RTP header and RTP payload are stored for each RTP packet in the stream (along with some other information). There is also a file header in the beginning of the file.

When making a program that wants to use the RTP payload data it is quite nice to not have to care about the various variants of protocols that can be used on lower layers (possible VLAN headers, IPv6 or IPv4, Ethernet II or ....).

If you want to store the complete packets including Ethernet/IP/UDP headers you can save the stream in e.g. libpcap format instead. One way of doing that is to select a stream in the "RTP Streams" dialog and press the "Set filter" button and the use the "Apply" button in the filter toolbar to do the filtering. After that you can use "File/Save As..." and save the "Displayed" packets.

---

Imported from https://wiki.wireshark.org/rtpdump on 2020-08-11 23:24:12 UTC
