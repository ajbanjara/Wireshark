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