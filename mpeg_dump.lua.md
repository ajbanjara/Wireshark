Wireshark extension to dump MPEG2 transport stream packets to file, removing the network headers and leaving just an MPEG2 transport stream.

To use this script:

1.  Download the attachment [mpeg\_packets\_dump.lua](uploads/__moin_import__/attachments/mpeg_dump.lua/mpeg_packets_dump.lua)

2.  Save it in the Wireshark home directory e.g. c:\\Program Files\\Wireshark -- as "mpeg\_packets\_dump.lua"

3.  Edit init.lua in the Wireshark home directory and add the following line: dofile("mpeg\_packets\_dump.lua")

4.  Restart Wireshark to add the extension

5.  Capture some traffic which includes some MPEG transport packets, for example, it has been tested with MPEG transmitted via UDP multicast.

6.  Stop the capture, and select Tools -\> Dump MPEG TS Packets

7.  Enter the file where the mpeg stream should be saved.

8.  In order to select only one of many streams, enter a wireshark filter -- expression, or you can leave the filter blank.

9.  Press okay. Any MPEG packets in the current capture which were detected by the MPEG dissector and that match your filter will be dumped to your output file.

Tested with Wireshark 1.4.3. 2011-04-01. ryan dot gorsuch - echostar com Modified and tested with Wireshark 1.11.3. 2014-02-17. hadrielk at yahoo dot com

``` 
```

---

Imported from https://wiki.wireshark.org/mpeg_dump.lua on 2020-08-11 23:16:54 UTC
