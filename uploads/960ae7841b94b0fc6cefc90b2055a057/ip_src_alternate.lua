-- ip_src_alternate.lua
-- https://ask.wireshark.org/question/22090/how-do-i-find-two-consecutive-frames-from-the-same-ip-source-address/
-- Check for two consecutive frames with equal ip.src

local ip_src_alternate_info =
{
    version = "1.0.0",
    author = "Chuck Craft",
    description = "Check for two consecutive frames with equal ip.src",
}

set_plugin_info(ip_src_alternate_info)

-- we create a "protocol" for our tree
local ip_src_alternate_p = Proto("ip_src_alternate","Consecutive frame with equal ip.src")

-- we create our fields
local ip_src_match_field = ProtoField.string("ip_src_alternate.match", "Consecutive frame match")

-- we add our fields to the protocol
ip_src_alternate_p.fields = { ip_src_match_field }

-- a field to grab ip.src from each frame
ip_src_field = Field.new("ip.src")

-- variables to persist across all packets
local pkt_data = {} -- indexed per packet

pkt_data.ip_src = {}

-- let's do it!
function ip_src_alternate_p.dissector(tvb,pinfo,root)
    local tree = nil

    finfo = ip_src_field()

    if not (finfo == nil) then
        -- add our proto if we haven't already
        if not tree then
            tree = root:add(ip_src_alternate_p)
        end

        pkt_data.ip_src[pinfo.number] = tostring(finfo.value)
        if (pkt_data.ip_src[pinfo.number-1] == pkt_data.ip_src[pinfo.number]) then
            tree:add(ip_src_match_field, "match")
        else
            tree:add(ip_src_match_field, "no match")
        end
    end
end

-- then we register arp_host_p as a postdissector
register_postdissector(ip_src_alternate_p)