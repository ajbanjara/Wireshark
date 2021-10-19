[Share Environment Vars between WSL and Windows](https://devblogs.microsoft.com/commandline/share-environment-vars-between-wsl-and-windows/)  
  
<pre>
RelWithDebInfo$ uname -a
Linux DESKTOP-JR96ILU 4.4.0-19041-Microsoft #1237-Microsoft Sat Sep 11 14:32:00 PST 2021 x86_64 x86_64 x86_64 GNU/Linux

RelWithDebInfo$ echo $WIRESHARK_LOG_LEVEL
"something"

RelWithDebInfo$ ./tshark.exe -G fields | head -5
P       Short Frame     _ws.short
P       Malformed Packet        _ws.malformed
P       Unreassembled Fragmented Packet _ws.unreassembled
F       Dissector bug   _ws.malformed.dissector_bug     FT_NONE _ws.malformed           0x0
F       Reassembly error        _ws.malformed.reassembly        FT_NONE _ws.malformed           0x0

RelWithDebInfo$ export WSLENV=WIRESHARK_LOG_LEVEL/p

RelWithDebInfo$ ./tshark.exe -G fields | head -5
tshark: Ignoring invalid environment value WIRESHARK_LOG_LEVEL="something"
P       Short Frame     _ws.short
P       Malformed Packet        _ws.malformed
P       Unreassembled Fragmented Packet _ws.unreassembled
F       Dissector bug   _ws.malformed.dissector_bug     FT_NONE _ws.malformed           0x0
F       Reassembly error        _ws.malformed.reassembly        FT_NONE _ws.malformed           0x0
</pre>