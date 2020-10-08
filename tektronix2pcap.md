## tektronix2pcap Script

**File**: [tektronix2pcap.py](uploads/__moin_import__/attachments/tektronix2pcap/tektronix2pcap.py)  
**Contributor**: Susanne Edlund  
**Description**:

A Python script that enables you to view Tektronix .rf5 files in Wireshark. You still need access to the Tektronix hardware, but at least it is better than nothing... The script takes a text file created by Tektronix tool Rec2`  `Ascii, transforms it into a format that text2pcap understands, and applies text2pcap to create the output.

(Note that the current version of Wireshark 0.10.12 can now read at least some .rf5 files directly, so you might not need to use this tool to read them. If you have problems reading .rf5 files, report them to <wireshark-users@wireshark.org> .)

Get Python from <http://www.python.org> if it is not included in your distribution.

Input: A text file created by Tektronix tool Rec2`  `Ascii from a .rf5 file. Output: A pcap file.

To use this script:

1\. Open tektronix2pcap.py in a text editor and set TEXT2PCAP\_PATH to point to your text2pcap (usually the Wireshark top directory).

2\. Start C:\\K1297\\bin\\Rec2`  `Ascii.exe on the same computer as the Tektronix is connected to (the software is protected by Hardlock).

3\. Follow the instructions. Choose Hex view (and none of the other options) when asked about format.

4\. Open a command window or terminal and type

tektronix.py \<infile\> \<outfile\> where infile is created in step 2 above.

Example: tektronix.py infile.ascii outfile.pcap

***

:heavy_exclamation_mark: Wireshark now reads most rf5 files by itself. See [K12](/K12) for an explanation.

***

Back to [Scripts](/Scripts)

---

Imported from https://wiki.wireshark.org/tektronix2pcap on 2020-08-11 23:26:36 UTC
