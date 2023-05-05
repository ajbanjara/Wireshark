[[_TOC_]]

# Tutorial scripts

## A dissector tutorial script

Download this [dissector.lua](uploads/__moin_import__/attachments/Lua/Examples/dissector.lua) file for an example Lua script for a protocol dissector. The script is too long to embed in this page, and it's much better to view it in a text editor that supports Lua syntax highlighting, because there are a lot of comments in the script explaining things.

The purpose of this script is two-fold:

- To provide a reference tutorial for others writing Wireshark dissectors in Lua
- To test various functions being called in various ways, so this script can be used in the test-suites

If you wonder why some functions are called some way, or differently than previous invocations of the same function: the reason is its trying to to show both that it can be done numerous ways, but also trying to test those numerous ways.

This script creates an elementary dissector for DNS. It's neither comprehensive nor error-free with regards to the DNS protocol. That's OK. The goal isn't to fully dissect DNS properly - Wireshark already has a good DNS dissector built-in. We don't need another one. We also have other example Lua scripts, but the nice thing about this one is getting capture files to run it against is trivial.

**How to use this script:** Once the script is loaded, it creates a new protocol named "MyDNS" (or "MYDNS" in some places). If you have a capture file with DNS packets in it, simply select one in the Packet List pane, right-click on it, and select "Decode As ...", and then in the dialog box that shows up scroll down the list of protocols to one called "MYDNS", select that and click the "ok" or "apply" button. Voila\`, you're now decoding DNS packets using the simplistic dissector in this script. Another way is to download the [dns_port.pcap](uploads/__moin_import__/attachments/SampleCaptures/dns_port.pcap "dns_port.pcap") capture file made for this script, and open that - since the DNS packets in it use UDP port 65333 (instead of the default 53), and since the MyDNS protocol in this script has been set to automatically decode UDP port 65333, it will automagically do it without doing "Decode As ...".

## A dissector tutorial with TCP-reassembly

Download this [fpm.lua](uploads/__moin_import__/attachments/Lua/Examples/fpm.lua) file for an example Lua script for a TCP-based protocol dissector. The script is too long to embed in this page, and it's much better to view it in a text editor that supports Lua syntax highlighting, because there are a lot of comments in the script explaining things.

**How to use this script:** Once the script is loaded, it creates a new protocol named "FPM". To see it in action, download the [segmented_fpm.pcap](uploads/__moin_import__/attachments/SampleCaptures/segmented_fpm.pcap "segmented_fpm.pcap") capture file made for this script, and open that.

## A custom file reader & writer tutorial script

Download this [pcap_file.lua](uploads/__moin_import__/attachments/Lua/Examples/pcap_file.lua) file for an example Lua script for a custom file format reader and writer.

Like the dissector tutorial script above, this script is too long to embed in this page, and it's much better to view it in a text editor that supports Lua syntax highlighting, because there are a lot of comments in the script explaining things.

Also like dissector tutorial script above, the purpose of this script is to provide a reference tutorial as well as a test script.

This script creates an elementary file reader and writer for the legacy pcap file format. It's neither comprehensive nor error-free, and is not intended as a replacement for the built-in ability of Wireshark/Tshark to read pcap files. The goal isn't to do that. The reason this was written is getting "test" files to see how it works is trivial, since any pcap file will do (the old style pcap files, not pcapng).

**How to use this script:** Once the script is loaded, it actually inserts itself as a new file reader _before_ the built-in pcap file reader, so opening any pcap file means this new file reader is the one reading it. Like any Lua script, you can load it one of three ways:

- By putting it in the personal plugins directory.
- By loading it from `init.lua` using `dofile()`.
- By loading it from the command line using the '`-X lua_script:pcap_file.lua`' argument, for either Tshark or Wireshark.

The last method is the one recommended for this file reader, so that you don't inadvertently continue using this file reader when you don't intend to. (after all, the built-in pcap file format reader is much better than this example one)

## A pcap FileShark script

Download both this [fileshark_pcap.lua](uploads/__moin_import__/attachments/Lua/Examples/fileshark_pcap.lua) file and this [linktype.lua](uploads/__moin_import__/attachments/Lua/Examples/linktype.lua) file for an example Lua script for a pcap-format [FileShark](/FileShark) script. What does that mean? It means it reads a pcap file and displays the contents of the file _format_ itself, showing the file header, record headers, etc., and their fields. To do this it creates a "pcapfile" protocol dissector, with associated protocol fields of what pcap file formats have. This implements both a Lua-based dissector and custom file format reader.

Like the tutorial scripts above, this script is too long to embed in this page, and it's much better to view it in a text editor that supports Lua syntax highlighting, because there are a lot of comments in the script explaining things.

There are several preferences that can be set in Wireshark, under the "[PcapFile](/PcapFile)" protocol. (Edit->Preferences->Protocols->[PcapFile](/PcapFile))

**How to use this script:** The main script is `fileshark_pcap.lua`, and that's what needs to be loaded - the second script (`linktype.lua`) is invoked by the main one using the Lua `require` function.

Like any Lua script, you can load it one of three ways:

- By putting both scripts in the personal plugins directory.
- By loading `fileshark_pcap.lua` from `init.lua` using `dofile()`.
- By loading `fileshark_pcap.lua` from the command line using the '`-X lua_script:fileshark_pcap.lua`' argument, for either Tshark or Wireshark.

Once the script is loaded, to actually read pcap files as [FileShark](/FileShark), you need to tell Wireshark/Tshark to use the "Fileshark Pcap" format reader. There are two ways to accomplish that:

- In Wireshark, in the "Open Capture File" dialog that's shown when you do File->Open... (or ctrl-o), there's a drop-down box of file formats to use, at the bottom left. It usually displays "Automatic". Select the "Fileshark Pcap" from that drop-down list, and select the file you want to open, and it will display that file in [FileShark](/FileShark) mode.
- In Tshark or Wireshark, if reading a pcap capture from the command-line, then use the new "`-X 'read_format:<format>`" option.

For example, this reads in a file named "`test.pcap`" as a Fileshark: `tshark -r test.pcap -X lua_script:fileshark_pcap.lua -X 'read_format:Fileshark Pcap'`

Notice that the last "`read_format:Fileshark Pcap`" argument is encased in single-quotes, because "Fileshark Pcap" has a space in it.

# Simple Examples

## Using Lua to register protocols to more ports

<div>

<div>

```
   1 -- register http to handle ports 4888-4891
   2 do
   3         local tcp_port_table = DissectorTable.get("tcp.port")
   4         local http_dissector = tcp_port_table:get_dissector(80)
   5         for i,port in ipairs{4888,4889,4890,4891} do
   6                 tcp_port_table:add(port,http_dissector)
   7         end
   8 end
```

Can also be done with an integer range:  
([What is the syntax for an "Integer range" for the dissectortable:add(pattern, dissector) function?](https://ask.wireshark.org/question/31445/what-is-the-syntax-for-an-integer-range-for-the-dissectortableaddpattern-dissector-function/))
```
local tcp_port_table = DissectorTable.get("tcp.port")
local http_dissector = tcp_port_table:get_dissector(80)
tcp_port_table:add("4888-4891",http_dissector)
```

</div>
</div>

## dumping to multiple files

<div>

<div>

```
   1 -- Create a file named by_ip/''ip_addess''.cap with all ip traffic of each ip host. (tshark only?)
   2 -- Dump files are created for both source and destination hosts
   3 function createDir (dirname)
   4     -- this will print out an error if the directory already exists, but that's fine
   5     os.execute("mkdir " .. dirname)
   6 end
   7
   8 local dir = "by_ip"
   9 createDir(dir)
  10
  11 -- create a table to hold the dumper objects/file handles
  12 local dumpers = {}
  13
  14 -- create a listener tap.  By default it creates one for "frame", but we're tapping IP layer.
  15 -- Valid values can be any protocol with tapping support, but to get something useful in the
  16 -- "extractor" argument of the tap's 'packet' function callback (the third argument passed by
  17 -- wireshark into it), it has to be one of the following currently:
  18 -- "actrace", "ansi_a", "ansi_map", "bacapp", "eth", "h225", "http", "ip", "ldap",
  19 -- "smb", "smb2", "tcp", "udp", "wlan", and "frame"
  20 local tap = Listener.new("ip")
  21
  22
  23 -- we will be called once for every IP Header.
  24 -- If there's more than one IP header in a given packet we'll dump the packet once per every header
  25 function tap.packet(pinfo,tvb,ip)
  26     --print("packet called")
  27     local ip_src, ip_dst = tostring(ip.ip_src), tostring(ip.ip_dst)
  28     local src_dmp, dst_dmp
  29
  30     -- get the dumper file handle for this ip addr
  31     src_dmp = dumpers[ip_src]
  32     if not src_dmp then
  33         -- doesn't exist, make a new one, of the same encapsulation type as current file
  34         src_dmp = Dumper.new_for_current( dir .. "/" .. ip_src .. ".pcap" )
  35         dumpers[ip_src] = src_dmp
  36     end
  37
  38     -- dump the current packet as it is (same encap format and content)
  39     src_dmp:dump_current()
  40     src_dmp:flush()
  41
  42     -- now do the same for dest addr
  43     dst_dmp = dumpers[ip_dst]
  44     if not dst_dmp then
  45         dst_dmp = Dumper.new_for_current( dir .. "/" .. ip_dst .. ".pcap" )
  46         dumpers[ip_dst] = dst_dmp
  47     end
  48
  49     dst_dmp:dump_current()
  50     dst_dmp:flush()
  51
  52 end
  53
  54 -- a listener tap's draw function is called every few seconds in the GUI
  55 -- and at end of file (once) in tshark
  56 function tap.draw()
  57     --print("draw called")
  58     for ip_addr,dumper in pairs(dumpers) do
  59              dumper:flush()
  60     end
  61 end
  62
  63 -- a listener tap's reset function is called at the end of a live capture run,
  64 -- when a file is opened, or closed.  Tshark never appears to call it.
  65 function tap.reset()
  66     --print("reset called")
  67     for ip_addr,dumper in pairs(dumpers) do
  68              dumper:close()
  69     end
  70     dumpers = {}
  71 end
```

</div>
</div>

## editing columns

<div>

<div>

```
   1 -- Append "<dst> -> <src>" to the Info column with a post-dissector.
   2 -- (Taps are not guaranteed to be run at a point when they can set the
   3 -- column text, so they can't be used for this.)
   4
   5 -- create a new protocol so we can register a post-dissector
   6 local myproto = Proto("swapper","Dummy proto to edit info column")
   7
   8 -- the dissector function callback
   9 function myproto.dissector(tvb,pinfo,tree)
  10     pinfo.cols.info:append(" " .. tostring(pinfo.dst).." -> "..tostring(pinfo.src))
  11 end
  12 -- register our new dummy protocol for post-dissection
  13 register_postdissector(myproto)
```

</div>
</div>

## dialogs and TextWindows

<div>

<div>

```
   1 -- This Example will add a menu "Lua Dialog Test" under the Tools menu,
   2 -- which when selected will pop a dialog prompting the user for input
   3 -- that when accepted will pop a window with a result.
   4
   5 if gui_enabled() then
   6    local splash = TextWindow.new("Hello!");
   7    splash:set("This time wireshark has been enhanced with a useless feature.\n")
   8    splash:append("Go to 'Tools->Lua Dialog Test' and check it out!")
   9 end
  10 local function dialog_menu()
  11     local function dialog_func(person,eyes,hair)
  12         local win = TextWindow.new("The Person");
  13         win:set(person)
  14         win:append(" with " .. eyes .." eyes and")
  15         win:append(" " .. hair .. " hair.");
  16     end
  17
  18     new_dialog("Dialog Test",dialog_func,"A Person","Eyes","Hair")
  19 end
  20
  21 -- optional 3rd parameter to register_menu.
  22 -- See http://www.wireshark.org/docs/wsug_html_chunked/wsluarm_modules.html
  23 -- If omitted, defaults to MENU_STAT_GENERIC. Other options include:
  24 -- MENU_STAT_UNSORTED (Statistics),
  25 -- MENU_STAT_GENERIC (Statistics, first section),
  26 -- MENU_STAT_CONVERSATION (Statistics/Conversation List),
  27 -- MENU_STAT_ENDPOINT (Statistics/Endpoint List),
  28 -- MENU_STAT_RESPONSE (Statistics/Service Response Time),
  29 -- MENU_STAT_TELEPHONY (Telephony),
  30 -- MENU_ANALYZE_UNSORTED (Analyze),
  31 -- MENU_ANALYZE_CONVERSATION (Analyze/Conversation Filter),
  32 -- MENU_TOOLS_UNSORTED (Tools)
  33
  34 register_menu("Lua Dialog Test",dialog_menu,MENU_TOOLS_UNSORTED)
```

</div>
</div>

## Packet counter

<div>

<div>

```
   1 do
   2     packets = 0;
   3     local function init_listener()
   4         local tap = Listener.new("frame","ip.addr == 10.0.0.0/8")
   5         function tap.reset()
   6             packets = 0;
   7         end
   8         function tap.packet(pinfo,tvb,ip)
   9             packets = packets + 1
  10         end
  11         function tap.draw()
  12             print("Packets to/from 10.0.0./8",packets)
  13         end
  14     end
  15     init_listener()
  16 end
```

</div>
</div>

## View Packet Tree of Fields/FieldInfo

<div>

<div>

```
   1 -- This example iterates through the field tree of the packets, and prints out the tree field information in a text window.
   2 -- It shows the current tree for the selected packet, but this does not mean it always shows the full tree,
   3 -- because wireshark performs multiple dissection passes of a packet, with the initial pass only being high-level and not
   4 -- dissecting fully (for performance reasons).  You can see this behavior better by changing line 30 of this example
   5 -- to this, so it concatenates output instead of clearing it every time:
   6 -- output = output .. "\nTree fields for packet #".. pinfo.number .. ":\n"
   7
   8 -- this only works in wireshark
   9 if not gui_enabled() then return end
  10
  11 local output = ""    -- for the output we'll show in the text window
  12 local tw = nil       -- the text window
  13 -- function to refresh the text window
  14 local function updateWindow()
  15     if tw then tw:set(output) end
  16 end
  17
  18 -- calling tostring() on random FieldInfo's can cause an error, so this func handles it
  19 local function getstring(finfo)
  20     local ok, val = pcall(tostring, finfo)
  21     if not ok then val = "(unknown)" end
  22     return val
  23 end
  24
  25 -- create a new protocol so we can register a post-dissector
  26 local myproto = Proto("tree_view","Dummy proto to view tree")
  27
  28 -- the dissector function callback
  29 function myproto.dissector(tvb,pinfo,tree)
  30     output = output.. "\nTree fields for packet #".. pinfo.number .. ":\n"
  31     -- get a table of all FieldInfo objects
  32     local fields = { all_field_infos() }
  33     for ix, finfo in ipairs(fields) do
  34         output = output .. "\t[" .. ix .. "] " .. finfo.name .. " = " .. getstring(finfo) .. "\n"
  35     end
  36     updateWindow()
  37 end
  38 -- register our new dummy protocol for post-dissection
  39 register_postdissector(myproto)
  40
  41
  42 -- now we create the menu function for this, which creates a text window to display this stuff
  43 local function menu_view_tree()
  44     tw = TextWindow.new("Tree View")
  45     tw:set_atclose(function() tw = nil end)
  46     updateWindow()
  47 end
  48
  49 -- add this to the Tools->Lua submenu
  50 register_menu("Lua/Tree View", menu_view_tree, MENU_TOOLS_UNSORTED)
```

</div>
</div>

## Extract field values

<div>

<div>

```
   1 -- This script is meant to be used with tshark/wireshark, with command-line
   2 -- arguments, using the '-X lua_script[N]:argN' option.
   3 -- Each argument identifies a field we will extract into two new
   4 -- fields called "extract.string" and "extract.hex"
   5 -- Those new fields can then be printed by tshark.
   6 --
   7 -- For example, if this script is saved as "extract.lua", then the following:
   8 --   tshark -r myfile -X lua_script:extract.lua -X lua_script1:data-text-lines -T fields -e extract.string
   9 -- will read the file called "myfile", extract each "data-text-lines" field, and
  10 -- print its string value out to the console.
  11 -- The following:
  12 --   wireshark -r myfile -X lua_script:extract.lua -X lua_script1:data-text-lines
  13 -- will do something similar in the GUI, showing the extracted values in the tree.
  14
  15 local args = { ... }
  16
  17 -- exit if no arguments were passed in
  18 if #args == 0 then
  19     return
  20 end
  21
  22 -- verify tshark/wireshark version is new enough - needs to be 1.12+
  23 local major, minor, micro = 0, 0, 0
  24 if get_version then
  25     major, minor, micro = get_version():match("(%d+)%.(%d+)%.(%d+)")
  26     if not major then
  27         major, minor, micro = 0, 0, 0
  28     end
  29 end
  30 if (tonumber(major) == 0) or ((tonumber(major) <= 1) and (tonumber(minor) < 12)) then
  31     error("Sorry, but your Wireshark/Tshark version is too old for this script!\n"..
  32           "This script needs Wireshark/Tshark version 1.12 or higher.\n" )
  33 end
  34
  35 -- a table to hold field extractors
  36 local fields = {}
  37
  38 -- create field extractor(s) for the passed-in argument(s)
  39 for i, arg in ipairs(args) do
  40     fields[i] = Field.new(arg)
  41 end
  42
  43 -- our fake protocol
  44 local exproto = Proto.new("extract", "Data Extractor")
  45
  46 -- the new fields that contain the extracted data (one in string form, one in hex)
  47 local exfield_string = ProtoField.new("Extracted String Value", "extract.string", ftypes.STRING)
  48 local exfield_hex    = ProtoField.new("Extracted Hex Value", "extract.hex", ftypes.STRING)
  49
  50 -- register the new fields into our fake protocol
  51 exproto.fields = { exfield_string, exfield_hex }
  52
  53 function exproto.dissector(tvbuf,pktinfo,root)
  54     local tree = nil
  55
  56     for i, field in ipairs(fields) do
  57         -- extract the field into a table of FieldInfos
  58         finfos = { field() }
  59
  60         if #finfos > 0 then
  61             -- add our proto if we haven't already
  62             if not tree then
  63                 tree = root:add(exproto)
  64             end
  65
  66             for _, finfo in ipairs(finfos) do
  67                 -- get a TvbRange of the FieldInfo (fieldinfo.range in WSDG)
  68                 local ftvbr = finfo.tvb
  69                 tree:add(exfield_string, ftvbr:string(ENC_UTF_8))
  70                 tree:add(exfield_hex,tostring(ftvbr:bytes()))
  71             end
  72         end
  73     end
  74
  75 end
  76
  77 -- register it as a postdissector, and force all fields to be generated
  78 register_postdissector(exproto, true)
```

</div>
</div>

## Dump VoIP calls into separate files

<div>

<div>

```
   1 -- voip.lua
   2 -- Written by: Jason Garland <jgarland@jasongarland.com>
   3
   4 print("Starting voip.lua script.")
   5
   6
   7 rex = require "rex_pcre"
   8
   9 --MySQL database connection
  10 require "luasql.mysql"
  11 env = assert (luasql.mysql())
  12 con = assert (env:connect("voiper","voiper","password"))
  13
  14
  15 do
  16         local voiperdir = os.getenv("voiperdir")
  17         local capturesdir = os.getenv("voiperdir") .. "/captures"
  18         dumpers = {}
  19         local frames = {}
  20         local rtp = {}
  21         last_packet = {}
  22         timeout = 300
  23         inin_callid = {}
  24         closed = {}
  25         files = {}
  26         files_path = {}
  27         --local tcp_src_f = Field.new("tcp.srcport")
  28         --local tcp_dst_f = Field.new("tcp.dstport")
  29         local udp_src_f = Field.new("udp.srcport")
  30         local udp_dst_f = Field.new("udp.dstport")
  31         local rtp_ssrc_f = Field.new("rtp.ssrc")
  32         local rtp_setup_frame_f = Field.new("rtp.setup-frame")
  33         local t38_setup_frame_f = Field.new("t38.setup-frame")
  34         local rtcp_setup_frame_f = Field.new("rtcp.setup-frame")
  35         local rtcp_ssrc_jitter_f = Field.new("rtcp.ssrc.jitter")
  36         local rtcp_ssrc_fraction_f = Field.new("rtcp.ssrc.fraction")
  37         local rtcp_ssrc_identifier_f = Field.new("rtcp.ssrc.identifier")
  38         local sip_callid_f = Field.new("sip.Call-ID")
  39         local sip_cseq_method_f = Field.new("sip.CSeq.method")
  40         local sip_status_code_f = Field.new("sip.Status-Code")
  41
  42         local sip_contact_addr_f = Field.new("sip.contact.addr")
  43         local sip_request_line_f = Field.new("sip.Request-Line")
  44         local sip_from_addr_f = Field.new("sip.from.addr")
  45
  46         local sdp_connection_info_address_f = Field.new("sdp.connection_info.address")
  47         local raw_sip_line_f = Field.new("raw_sip.line")
  48         local function init_listener()
  49                 local tap = Listener.new("ip", "(rtp or rtcp or t38) or (sip and ((sip.CSeq.method != REGISTER) and (sip.CSeq.method != OPTIONS))) ")
  50                 -- we will be called once for every IP Header.
  51                 -- If there's more than one IP header in a given packet we'll dump the packet once per every header
  52                 function tap.packet(pinfo,tvb,ip)
  53                         local ip_src, ip_dst = tostring(ip.ip_src), tostring(ip.ip_dst)
  54                         --local rtp_ssrc, rtp_setup_frame = rtp_ssrc_f(), rtp_setup_frame_f()
  55                         local rtp_setup_frame,rtp_ssrc = rtp_setup_frame_f(), rtp_ssrc_f()
  56                         local t38_setup_frame = t38_setup_frame_f()
  57                         local sip_cseq_method, sip_status_code, sip_callid, sdp_connection_info_address, raw_sip_line = sip_cseq_method_f(), sip_status_code_f(), sip_callid_f(), sdp_connection_info_address_f(), raw_sip_line_f()
  58                         local sip_contact_addr, sip_request_line, sip_from_addr = sip_contact_addr_f(), sip_request_line_f(), sip_from_addr_f()
  59                         local rtcp_setup_frame, rtcp_ssrc_jitter, rtcp_ssrc_fraction, rtcp_ssrc_identifier = rtcp_setup_frame_f(), rtcp_ssrc_jitter_f(), rtcp_ssrc_fraction_f(), rtcp_ssrc_identifier_f()
  60                         local frame = tostring(pinfo.number)
  61                         local src_dmp, dst_dmp, rtp_dmp, sip_dmp
  62
  63                         if sdp_connection_info_address then
  64                                 --print("Frame: " .. frame .. " = " .. tostring(sip_callid))
  65                                 frames[frame] = tostring(sip_callid)
  66                         end
  67
  68                         if rtcp_setup_frame then
  69                                 if not (frames[tostring(rtcp_setup_frame)] == nil) then
  70                                         sip_callid = frames[tostring(rtcp_setup_frame)]
  71                                 end
  72                         end
  73
  74                         if t38_setup_frame then
  75                                 if not (frames[tostring(t38_setup_frame)] == nil) then
  76                                         sip_callid = frames[tostring(t38_setup_frame)]
  77                                 end
  78                         end
  79
  80                         --if rtp_setup_frame then
  81                                 if not (frames[tostring(rtp_setup_frame)] == nil) then
  82                                         sip_callid = frames[tostring(rtp_setup_frame)]
  83                                         rtp[tostring(rtp_ssrc)] = sip_callid
  84                                 -- else
  85                                         -- rtp_dmp = dumpers[tostring(rtp_ssrc)]
  86                                         -- if not rtp_dmp then
  87                                         --         rtp_dmp = Dumper.new_for_current( capturesdir .. "/rtp/" .. tostring(rtp_ssrc) .. ".pcap" )
  88                                         --         dumpers[tostring(rtp_ssrc)] = rtp_dmp
  89                                         -- end
  90                                         -- rtp_dmp:dump_current()
  91                                         -- rtp_dmp:flush()
  92                                 end
  93                         --end
  94
  95                         if (sip_callid == nil) then
  96                                 if (rtp_ssrc) then
  97                                         sip_callid = rtp[tostring(rtp_ssrc)]
  98                                         --if not (sip_callid == nil) then print("SSRC: " .. tostring(rtp_ssrc) .. " = " .. sip_callid) end
  99                                 end
 100                         end
 101
 102                         if sip_callid then
 103                                 if not ((closed[tostring(sip_callid)] == true)) then
 104                                         --check_age()
 105                                         if (files[tostring(sip_callid)] == nil) then
 106                                                 files_path[tostring(sip_callid)] = os.date("%Y", pinfo.abs_ts) .. "/" .. os.date("%m", pinfo.abs_ts) .. "/" .. os.date("%d", pinfo.abs_ts) .. "/" .. os.date("%H", pinfo.abs_ts) .. "/"
 107                                         os.execute("mkdir -p " .. capturesdir .. "/" .. files_path[tostring(sip_callid)])
 108                                         files[tostring(sip_callid)] = os.date("%Y%m%d%H%M%S", pinfo.abs_ts) .. "-" .. tostring(sip_callid) .. ".pcap"
 109                                         -- print("Creating: " .. files_path[tostring(sip_callid)] .. files[tostring(sip_callid)])
 110                                         res = assert (con:execute(string.format([[
 111                                         INSERT INTO calls
 112                                                 (filepath, filename, callid, state)
 113                                                 VALUES ('%s', '%s', '%s', '%s')
 114                                                 ]], files_path[tostring(sip_callid)], files[tostring(sip_callid)], tostring(sip_callid), "open")
 115                                                                                                                                 ))
 116
 117                                 end
 118
 119                                 -- print(tostring(sip_callid))
 120                                 sip_dmp = dumpers[tostring(sip_callid)]
 121                                 if not sip_dmp then
 122                                         print("Opening: " .. files_path[tostring(sip_callid)] .. files[tostring(sip_callid)])
 123                                         sip_dmp = Dumper.new_for_current( capturesdir .. "/" .. files_path[tostring(sip_callid)] .. files[tostring(sip_callid)] )
 124                                         dumpers[tostring(sip_callid)] = sip_dmp
 125                                 end
 126                                 sip_dmp:dump_current()
 127                                 sip_dmp:flush()
 128                                 last_packet[tostring(sip_callid)] = os.clock()
 129                                 if (tostring(sip_cseq_method) == "BYE" and tostring(sip_status_code) == "200") then
 130                                         sip_dmp:close()
 131                                         sip_dmp = nil
 132                                         mark_closed(sip_callid)
 133                                 end
 134                                 if (tostring(sip_cseq_method) == "INVITE" and tostring(sip_status_code) == "487") then
 135                                         sip_dmp:close()
 136                                         sip_dmp = nil
 137                                         mark_closed(sip_callid)
 138                                 end
 139                                 else
 140                                         print("Ignoring packet after " .. tostring(sip_callid) .. " was closed.")
 141                                 end
 142                         end
 143
 144
 145                         if raw_sip_line_f() then
 146                                 local line = {raw_sip_line_f()}
 147                                 for i=1,#line do
 148                                         line[i] = tostring(line[i])
 149                                         local inin_callid_start, inin_callid_stop, inin_callid_header, inin_callid_value = rex.find(line[i], '^(ININCrn|x-inin-crn): ([0-9]*)\\\\r\\\\n$')
 150                                         if inin_callid_value then
 151                                                 if not inin_callid[tostring(sip_callid)] then
 152                                                         inin_callid[tostring(sip_callid)] = inin_callid_value
 153                                                         -- print(inin_callid_header .. ": " .. inin_callid_value)
 154                                                         res = assert (con:execute(string.format([[
 155                                                                 UPDATE calls
 156                                                                 SET `inin_callid` = '%s' WHERE `callid` = '%s']], inin_callid[tostring(sip_callid)], tostring(sip_callid))
 157                                                                 ))
 158                                                 end
 159                                                 break
 160                                         end
 161                                 end
 162                         end
 163                 end
 164
 165
 166                 function check_age()
 167                         for item in pairs(last_packet) do
 168                                 local age = os.difftime(os.clock(), last_packet[tostring(item)])
 169                                 if ( age >= timeout ) then
 170                                         print("Timeout: " .. item .. " because age is " .. age .. " seconds.")
 171                                         --return true
 172                                         mark_closed(item)
 173                                         --dumper = dumpers[tostring(item)]
 174                                         --print("Dumper: " .. tostring(dumper))
 175                                         --dumper:flush()
 176                                         --dumper:close()
 177                                         --dumpers[tostring(item)] = nil
 178
 179                                         --dumpers[tostring(item)]:close()
 180                                         --dumpers[tostring(item)] = nil
 181                                 end
 182                         end
 183                 end
 184
 185                 function mark_closed(sip_callid)
 186                         print("Closing: " .. files_path[tostring(sip_callid)] .. files[tostring(sip_callid)])
 187                         res = assert (con:execute(string.format([[
 188                                 UPDATE calls
 189                                 SET `state` = 'closed' WHERE `callid` = '%s' AND `filepath` = '%s' AND `filename` = '%s']], tostring(sip_callid), files_path[tostring(sip_callid)], files[tostring(sip_callid)])
 190                                 ))
 191                         closed[tostring(sip_callid)] = true
 192                         inin_callid[tostring(sip_callid)] = nil
 193                         last_packet[tostring(sip_callid)] = nil
 194                         files[tostring(sip_callid)] = nil
 195                         files_path[tostring(sip_callid)] = nil
 196                 end
 197
 198                 function tap.draw()
 199                         -- The show is over. Close the database connection and flush the buffers.
 200                         for item in pairs(closed) do
 201                                 print("cleaning up: " .. item)
 202                                 dumpers[tostring(item)] = nil
 203                         end
 204
 205                         for item,dumper in pairs(dumpers) do
 206                                 print("Flushing: " .. files_path[tostring(item)] .. files[tostring(item)])
 207                                 dumper:flush()
 208                                 mark_closed(item)
 209                         end
 210
 211                         -- Close the database connection
 212                         con:close()
 213                         env:close()
 214                 end
 215
 216                 function tap.reset()
 217                         for item,dumper in pairs(dumpers) do
 218                                 mark_closed(item)
 219                                 dumper:close()
 220                                 print("Tap reset")
 221                         end
 222                         dumpers = {}
 223                 end
 224         end
 225         init_listener()
 226 end
```

</div>
</div>

## Create new data (tvb) with ByteArray and Struct

> ["I made a Lua script to test different float and double values without a capture file."](https://gitlab.com/wireshark/wireshark/-/issues/16483#note_1045283360)

![220730_stig_float_anno](uploads/2beca69e8ee169ebecf2a2cdb8e94edb/220730_stig_float_anno.png)

---

Imported from https://wiki.wireshark.org/Lua/Examples on 2020-08-11 23:16:09 UTC