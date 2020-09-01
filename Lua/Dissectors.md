[[_TOC_]]

# Dissectors

  - Dissectors are meant to analyze some part of a packet's data. They are similar to their older brothers written in C. Note that Heuristic Dissectors and Post-Dissectors operate differently, and are described separately. This section only refers to pure Dissectors.

  - They have to be registered to handle a type of payload of another protocol (or a raw wiretap type).

  - To be registered, the dissector function has to be assigned to a [Proto object](/LuaAPI/Proto#Proto). (see [examples](/Lua/Dissectors#examples) below)

  - When called by Wireshark, they are passed (1) a TVB buffer of the data (a [Tvb](/LuaAPI/Tvb#Tvb) object), (2) a packet information record ([Pinfo](/LuaAPI/Pinfo#Pinfo) object), and (3) a tree root ([TreeItem](/LuaAPI/TreeItem) object).

  - Dissectors only get called when the packet matches the [DissectorTable](/LuaAPI/Dissector#DissectorTable) the Proto is set to, or when the user forces it using "Decode As".
    
      - The user can only "force" it using "Decode As" if the [DissectorTable](/LuaAPI/Dissector#DissectorTable) you set your [Proto object](/LuaAPI/Proto#Proto) to is of the correct type; for example, if you set your [Proto object](/LuaAPI/Proto#Proto) to the udp [DissectorTable](/LuaAPI/Dissector#DissectorTable), a user cannot try to decode a link layer using your [Proto](/LuaAPI/Proto#Proto) dissector.

## TCP reassembly

You should not write a dissector for TCP payload if you cannot handle reassembly (i.e., don't add your [Proto object](/LuaAPI/Proto#Proto) to the [DissectorTable](/LuaAPI/Dissector#DissectorTable) for tcp). Like dissectors written in C, Lua dissectors can use Wireshark's ability to reassemble TCP streams:

  - You should make sure your dissector can handle the following conditions:
    
    1.  The TCP packet segment might only have the first portion of your message.
    2.  The TCP packet segment might contain multiple of your messages.
    3.  The TCP packet might be in the middle of your message, because a previous segment was not captured. For example, if the capture started in the middle of a TCP session, then the first TCP segment will be given to your dissector function, but it may well be a second/third/etc. segment of your protocol's whole message, so appear to be malformed. Wireshark will keep trying your dissector for each subsequent segment as well, so that eventually you can find the beginning of a message format you understand.
    4.  The TCP packet might be cut-off, because the user set Wireshark to limit the size of the packets being captured.
    5.  Any combination of the above.

  - For case (4), the simplest thing to do is just not dissect packets that are cut-off. Check the Tvb's len() vs. reported\_len(), and if they're different that means the packet was cut-off.

  - For case (3), your dissector should try to perform some sanity checking of an early field if possible. If the sanity check fails, then ignore this packet and wait for the next one. "Ignoring" the packet means returning the number 0 from your dissector.

  - For case (2), currently this requires you to write your own while-loop, dissecting your message within the while-loop, such that you can dissect multiple of your messages each time Wireshark invokes your Proto's dissector() function.

  - For case (1), you have to dissect your message enough to figure out what the full length will be - if you can figure that out, then set the Pinfo's desegment\_len to how many more bytes than are currently in the Tvb that you need in order to decode the full message; or if you don't know exactly how many more bytes you need, then set the Pinfo desegment\_len to the pre- defined value of "DESEGMENT\_ONE\_MORE\_SEGMENT". You also need to set the Pinfo's desegment\_offset to the offset in the tvbuff at which you want the dissector to continue processing when next invoked by Wireshark. The next time a TCP packet segment is received by Wireshark, it will invoke your Proto's dissector function with a Tvb buffer composed of the data bytes starting at the desegment\_offset of the previous Tvb buffer together with desegment\_len more bytes.

  - For the return value of your Proto's dissector() function, you should return one of the following:
    
    1.  If the packet does not belong to your dissector, return 0. You must
        
        **not** set the Pinfo.desegment\_len nor the desegment\_offset if you return 0.
    
    2.  If you need more bytes, set the Pinfo's desegment\_len/desegment\_offset as described earlier, and return either nothing, or return the length of the Tvb. Either way is fine.
    
    3.  If you don't need more bytes, return either nothing, or return the length of the Tvb. Either way is fine.

  - To request reassembly via the pinfo struct as described in README.developers, set `pinfo.desegment_len` and `pinfo.desegment_offset`, and return either nothing or return the length of the `Tvb`. Do **not** return the value 0 if you set the `desegment_len`/`desegment_offset`.
    
      - If you don't know the exact number of needed bytes, set `pinfo.desegment_offset` to the `DESEGMENT_ONE_MORE_SEGMENT` global "constant" (this is how new-style dissectors requests reassembly in Wireshark).
    
      - If you set pinfo.desegment\_len to a positive number, this number is set in stone - you cannot change it later. In other words, if you tell Wireshark this message is of length X, you can't change that length to be Y later for this same message. On the other hand, using DESEGMENT\_ONE\_MORE\_SEGMENT means you don't know how long it is.

## Examples

<div class="highlight lua">

<div class="codearea" dir="ltr" lang="en">

``` 
   1 -- trivial protocol example
   2 -- declare our protocol
   3 trivial_proto = Proto("trivial","Trivial Protocol")
   4 -- create a function to dissect it
   5 function trivial_proto.dissector(buffer,pinfo,tree)
   6     pinfo.cols.protocol = "TRIVIAL"
   7     local subtree = tree:add(trivial_proto,buffer(),"Trivial Protocol Data")
   8     subtree:add(buffer(0,2),"The first two bytes: " .. buffer(0,2):uint())
   9     subtree = subtree:add(buffer(2,2),"The next two bytes")
  10     subtree:add(buffer(2,1),"The 3rd byte: " .. buffer(2,1):uint())
  11     subtree:add(buffer(3,1),"The 4th byte: " .. buffer(3,1):uint())
  12 end
  13 -- load the udp.port table
  14 udp_table = DissectorTable.get("udp.port")
  15 -- register our protocol to handle udp port 7777
  16 udp_table:add(7777,trivial_proto)
```

</div>

</div>

# postdissectors

A postdissector is a dissector registered to be called after every other dissector has been called already. These are handy as all protocol fields are already there so they can be accessed and they can add items to the dissection tree.

<div class="highlight lua">

<div class="codearea" dir="ltr" lang="en">

``` 
   1 -- trivial postdissector example
   2 -- declare some Fields to be read
   3 ip_src_f = Field.new("ip.src")
   4 ip_dst_f = Field.new("ip.dst")
   5 tcp_src_f = Field.new("tcp.srcport")
   6 tcp_dst_f = Field.new("tcp.dstport")
   7 -- declare our (pseudo) protocol
   8 trivial_proto = Proto("trivial","Trivial Postdissector")
   9 -- create the fields for our "protocol"
  10 src_F = ProtoField.string("trivial.src","Source")
  11 dst_F = ProtoField.string("trivial.dst","Destination")
  12 conv_F = ProtoField.string("trivial.conv","Conversation","A Conversation")
  13 -- add the field to the protocol
  14 trivial_proto.fields = {src_F, dst_F, conv_F}
  15 -- create a function to "postdissect" each frame
  16 function trivial_proto.dissector(buffer,pinfo,tree)
  17     -- obtain the current values the protocol fields
  18     local tcp_src = tcp_src_f()
  19     local tcp_dst = tcp_dst_f()
  20     local ip_src = ip_src_f()
  21     local ip_dst = ip_dst_f()
  22     if tcp_src then
  23        local subtree = tree:add(trivial_proto,"Trivial Protocol Data")
  24        local src = tostring(ip_src) .. ":" .. tostring(tcp_src)
  25        local dst = tostring(ip_dst) .. ":" .. tostring(tcp_dst)
  26        local conv = src  .. "->" .. dst
  27        subtree:add(src_F,src)
  28        subtree:add(dst_F,dst)
  29        subtree:add(conv_F,conv)
  30     end
  31 end
  32 -- register our protocol as a postdissector
  33 register_postdissector(trivial_proto)
```

</div>

</div>

# chained dissectors

Chaining dissectors similarly allows you to have access to one dissector's data, but doesn't have to run against every packet.

<div class="highlight lua">

<div class="codearea" dir="ltr" lang="en">

``` 
   1 -- works as of Wireshark v0.99.7
   2 do
   3         local http_wrapper_proto = Proto("http_extra", "Extra analysis of the HTTP protocol");
   4         -- (to confirm this worked, check that this protocol appears at the bottom of the "Filter Expression" dialog)
   5         -- our new fields
   6         local F_newfield1 = ProtoField.uint16("http.newfield1", "Our new field, #1", base.DEC)
   7         local F_newfield2 = ProtoField.uint16("http.newfield2", "Our new field, #2", base.DEC)
   8         -- add the fields to the protocol
   9         -- (to confirm this worked, check that these fields appeared in the "Filter Expression" dialog)
  10         http_wrapper_proto.fields = {F_newfield1, F_newfield2}          -- NOT ProtoFieldArray, that stopped working a while ago
  11         -- declare the fields we need to read
  12         local f_set_cookie = Field.new("http.set_cookie")
  13         local f_referer    = Field.new("http.referer")
  14         local original_http_dissector
  15         function http_wrapper_proto.dissector(tvbuffer, pinfo, treeitem)
  16                 -- we've replaced the original http dissector in the dissector table,
  17                 -- but we still want the original to run, especially because we need to read its data
  18                 original_http_dissector:call(tvbuffer, pinfo, treeitem)
  19                 if f_set_cookie() then
  20                         -- this has two effects:
  21                         --      1. makes it so we can use "http_extra" as a display filter
  22                         --      2. displays a new header in the tree pane for our protocol
  23                         local subtreeitem = treeitem:add(http_wrapper_proto, tvbuffer)
  24                         field1_val = 42
  25                         subtreeitem:add(F_newfield1, tvbuffer(), field1_val)
  26                                    :set_text("Don't panic: " .. field1_val)
  27                         -- (now "http.newfield1 == 42" should work as a display filter)
  28                         field2_val = 616
  29                         subtreeitem:add(F_newfield2, tvbuffer(), field2_val)
  30                                    :set_text("The REAL number of the beast: " .. field2_val)
  31                 end
  32         end
  33         local tcp_dissector_table = DissectorTable.get("tcp.port")
  34         original_http_dissector = tcp_dissector_table:get_dissector(80) -- save the original dissector so we can still get to it
  35         tcp_dissector_table:add(80, http_wrapper_proto)                 -- and take its place in the dissector table
  36 end
```

</div>

</div>

---

Imported from https://wiki.wireshark.org/Lua/Dissectors on 2020-08-11 23:16:08 UTC
