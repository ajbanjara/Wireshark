# A post-dissector to allow filtering on Protocol and Info columns  

Enhancement: filter for info column in Wireshark [Issue #13491](https://gitlab.com/wireshark/wireshark/-/issues/13491)

**Installation** - place in plugins directory - see [Lua Support in Wireshark](https://www.wireshark.org/docs/wsdg_html_chunked/wsluarm.html)

[filtcols.lua](uploads/fb84a4ce39814feae21c736951a5646c/filtcols.lua)

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
    version = "1.0.0",
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
    local pkt_proto = pkt_data.protocol[pinfo.number]

    if  cols_protocol ~= "(protocol)" then
        pkt_data.protocol[pinfo.number] = cols_protocol
    end

    if  pkt_proto ~= NULL then
        tree:add(col_protocol_field, pkt_proto)
    end

    
    local cols_info = tostring(pinfo.cols.info)
    local pkt_info = pkt_data.info[pinfo.number]

    if cols_info ~= "(info)" then
        pkt_data.info[pinfo.number] = cols_info
    end

    if pkt_info ~= NULL then
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