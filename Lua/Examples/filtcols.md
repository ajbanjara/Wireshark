# A post-dissector to allow filtering on Protocol and Info columns  

Enhancement: filter for info column in Wireshark [Issue #13491](https://gitlab.com/wireshark/wireshark/-/issues/13491)

**Installation** - place in plugins directory - see [Lua Support in Wireshark](https://www.wireshark.org/docs/wsdg_html_chunked/wsluarm.html)

[filtcols.lua](uploads/b0c83564e69cf9a573849525bddfd830/filtcols.lua)

**Example** - [Analyze filter smb2.cmd == 9 && smb2.filename contains "fname" shows no results](https://ask.wireshark.org/question/18603/analyze-filter-smb2cmd-9-smb2filename-contains-fname-shows-no-results/)  
**Filter** `filtcols.info contains "file87.txt"`  
[Sample capture](https://gitlab.com/wireshark/wireshark/-/wikis/uploads/__moin_import__/attachments/SMB2/smb2-peter.pcap) from [SMB2](https://gitlab.com/wireshark/wireshark/-/wikis/SMB2#example-capture-files) page.  


![201002_filtcols_info](uploads/44d5e2b2d7950e1f2f05831a79262fb8/201002_filtcols_info.png)

**Example** - [Filter TLS 1.3 traffic in Wireshark](https://ask.wireshark.org/question/19163/filter-tls-13-traffic-in-wireshark/)  
**Filter** `filtcols.protocol == "TLSv1.3"`  
[Sample capture](https://gitlab.com/wireshark/wireshark/uploads/949fb96ffbd3ec794f2da225d63778fd/tls13.pcapng) from [Issue #12779](https://gitlab.com/wireshark/wireshark/-/issues/12779) Add TLS 1.3 support  


![201002_filtcols_protocol](uploads/4c961247f46cbb30150164c2913f00da/201002_filtcols_protocol.png)

**References**  
[Post-dissector examples](/Lua/Examples/PostDissector)  
[gaddman/wireshark-tcpextend](https://github.com/gaddman/wireshark-tcpextend/blob/master/TCPextend-post_dissector.lua) (Also on the [Contrib page](/Contrib) and [LUA dissector: update treeitem in earlier packet](https://osqa-ask.wireshark.org/questions/59240/lua-dissector-update-treeitem-in-earlier-packet) )  
[Creating a Wireshark USB dissector in Lua - part 1 (mouse)](https://mika-s.github.io/wireshark/lua/dissector/usb/2019/07/23/creating-a-wireshark-usb-dissector-in-lua-1.html)  
[Creating a Wireshark dissector in Lua - part 1 (the basics)](https://mika-s.github.io/wireshark/lua/dissector/2017/11/04/creating-a-wireshark-dissector-in-lua-1.html)


```
-- filtcols.lua
-- similar to _ws.col.protocol in tshark

local filtcols_info =
{
    version = "1.0.2",
    author = "Chuck Craft",
    description = "Support filtering on Protocol and Info columns",
}

set_plugin_info(filtcols_info)

-- we create a "protocol" for our tree
local filtcols_p = Proto("filtcols","Filterable Protocol/Info columns")

-- we create our fields
local col_protocol_field = ProtoField.string("filtcols.protocol", "Protocol column")
local col_info_field = ProtoField.string("filtcols.info", "Info column")

-- we add our fields to the protocol
filtcols_p.fields = { col_protocol_field, col_info_field }

-- variables to persist across all packets
local pkt_data = {} -- indexed per packet

pkt_data.protocol = {}
pkt_data.info = {}

-- let's do it!
function filtcols_p.dissector(tvb,pinfo,tree)

    local cols_protocol = tostring(pinfo.cols.protocol)

    if  cols_protocol ~= "(protocol)" then
        pkt_data.protocol[pinfo.number] = cols_protocol
    end


    local pkt_proto = pkt_data.protocol[pinfo.number]

    if  pkt_proto ~= nil then
        tree:add(col_protocol_field, pkt_proto)
    end


    
    local cols_info = tostring(pinfo.cols.info)

    if cols_info ~= "(info)" then
        pkt_data.info[pinfo.number] = cols_info
    end


    local pkt_info = pkt_data.info[pinfo.number]

    if pkt_info ~= nil then
         tree:add(col_info_field, pkt_info)
    end
end

-- then we register filtcols_p as a postdissector
register_postdissector(filtcols_p)
```

**mi·nu·ti·ae**  
In the SMB2 example there was not a good field(s) to use as a filter but Wireshark had placed enough data in the Info column.  

The search for TLSv1.3 was difficult - no version field but could see that Wireshark was decoding by version.  
[packet-tls-util.c](https://gitlab.com/wireshark/wireshark/-/blob/master/epan/dissectors/packet-tls-utils.c)  

```
/* Lookup tables {{{ */
const value_string ssl_version_short_names[] = {
    { SSLV2_VERSION,        "SSLv2" },
    { SSLV3_VERSION,        "SSLv3" },
    { TLSV1_VERSION,        "TLSv1" },
    { TLSV1DOT1_VERSION,    "TLSv1.1" },
    { TLSV1DOT2_VERSION,    "TLSv1.2" },
    { TLSV1DOT3_VERSION,    "TLSv1.3" },
    { DTLSV1DOT0_VERSION,   "DTLSv1.0" },
    { DTLSV1DOT2_VERSION,   "DTLSv1.2" },
    { DTLSV1DOT0_OPENSSL_VERSION, "DTLS 1.0 (OpenSSL pre 0.9.8f)" },
    { 0x00, NULL }
};

    col_set_str(pinfo->cinfo, COL_PROTOCOL,
                val_to_str_const(session->version, ssl_version_short_names, "SSL"));
```

There is `session->version` but it's not available to use in a display filter.  
  
## Notes
  
**Pinfo and pinfo.cols - where do they come from?**

The [Wireshark Lua API Reference](https://www.wireshark.org/docs/wsdg_html_chunked/wsluarm_modules.html) is [`auto-generated`](https://gitlab.com/wireshark/wireshark/-/blob/master/doc/README.wslua) from files in [epan/wslua](https://gitlab.com/wireshark/wireshark/-/tree/master/epan/wslua) and included 
 in the [Wireshark Developer’s Guide](https://www.wireshark.org/docs/wsdg_html_chunked/). 
All the information is there but it's sometimes quicker to look at the source.  
  
As used in `filtcols`:  
  
`pinfo.number`, `pinfo.cols`:  
[Pinfo](https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Pinfo.html#lua_class_Pinfo) source is [epan/wslua/wslua_pinfo.c](https://gitlab.com/wireshark/wireshark/-/blob/master/epan/wslua/wslua_pinfo.c) which combines [epan/packet_info.h](https://gitlab.com/wireshark/wireshark/-/blob/master/epan/packet_info.h), [epan/frame_data.h](https://gitlab.com/wireshark/wireshark/-/blob/master/epan/frame_data.h) and maybe others?  
  
`pinfo.cols.protocol`, `pinfo.cols.info`:  
[Columns](https://www.wireshark.org/docs/wsdg_html/#lua_class_Columns) source in [epan/wslua/wslua_column.c](https://gitlab.com/wireshark/wireshark/-/blob/master/epan/wslua/wslua_column.c) which aligns with [epan/column-utils.h](https://gitlab.com/wireshark/wireshark/-/blob/master/epan/column-utils.h).
  
**Why is pinfo.cols returning an empty value?**  
  
[tshark](https://www.wireshark.org/docs/man-pages/tshark.html) has special magical incantations for whether or not it populates the `cinfo` that Lua pulls pinfo.cols data from. There is an open merge request ([2473: tshark: add --columns option](https://gitlab.com/wireshark/wireshark/-/merge_requests/2473)) to add an option to explicitly create the column data.  

[tshark.c](https://gitlab.com/wireshark/wireshark/-/blob/master/tshark.c)  
<pre>
    /* We only need the columns if either
         1) some tap needs the columns
       or
         2) we're printing packet info but we're *not* verbose; in verbose
            mode, we print the protocol tree, not the protocol summary.
       or
         3) there is a column mapped as an individual field */
    if ((tap_flags & TL_REQUIRES_COLUMNS) || (print_packet_info && print_summary) || output_fields_has_cols(output_fields))
      cinfo = &cf->cinfo;
    else
      cinfo = NULL;
</pre>

`-T fields` will create the data but at that point you may as well add `-e _ws.col.info` and `-e _ws.col.protocol` to the command and skip Lua.  
Until then try `-V` as mentioned in [11.7.1. TreeItem](https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Tree.html#lua_class_TreeItem) or `-P` ([tshark man page: DESCRIPTION](https://www.wireshark.org/docs/man-pages/tshark.html) but be aware `-T` options will foobar things.

<pre>
      } else if (strcmp(optarg, "pdml") == 0) {
        output_action = WRITE_XML;
        print_details = TRUE;   /* Need details */
        print_summary = FALSE;  /* Don't allow summary */
      } else if (strcmp(optarg, "psml") == 0) {
        output_action = WRITE_XML;
        print_details = FALSE;  /* Don't allow details */
        print_summary = TRUE;   /* Need summary */
      } else if (strcmp(optarg, "fields") == 0) {
        output_action = WRITE_FIELDS;
        print_details = TRUE;   /* Need full tree info */
        print_summary = FALSE;  /* Don't allow summary */
      } else if (strcmp(optarg, "json") == 0) {
        output_action = WRITE_JSON;
        print_details = TRUE;   /* Need details */
        print_summary = FALSE;  /* Don't allow summary */
      } else if (strcmp(optarg, "ek") == 0) {
        output_action = WRITE_EK;
        if (!print_summary)
          print_details = TRUE;
      } else if (strcmp(optarg, "jsonraw") == 0) {
        output_action = WRITE_JSON_RAW;
        print_details = TRUE;   /* Need details */
        print_summary = FALSE;  /* Don't allow summary */
      }
</pre>

**Nil vs Null**  
[Lua: What's the difference between null and nil?](https://stackoverflow.com/questions/31323443/lua-whats-the-difference-between-null-and-nil)  
[Lua Reference Manual](https://www.lua.org/pil/2.1.html): "Nil is a type with a single value, nil, whose main property is to be different from any other value."  
  
The 1.0.0 version of `filtcols` did comparisons against `NULL` (oops) and happened to work in Wireshark but not tshark. [@cjmaynard](https://gitlab.com/cjmaynard) fixed it in this Wireshark Q&A question: [Tshark LUA Script](https://ask.wireshark.org/question/21374/tshark-lua-script/)  
  
`FIXME` - update script here on Wiki page.[filtcols.lua](uploads/b0c83564e69cf9a573849525bddfd830/filtcols.lua)