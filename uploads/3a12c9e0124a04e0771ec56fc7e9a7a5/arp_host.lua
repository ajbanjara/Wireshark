-- arp_host.lua
-- new field to display ARP target resolved name
-- modeled after "Extract field values" example on wiki

local arp_host_info =
{
    version = "1.0.0",
    author = "Chuck Craft",
    description = "Grab resolved host name from protocol tree for ARP target",
}

set_plugin_info(arp_host_info)

-- we create a "protocol" for our tree
local arp_host_p = Proto("arp_host","ARP target resolved name")

-- we create our fields
local arp_target_field = ProtoField.string("arp_host.target", "ARP target (resolved)")

-- we add our fields to the protocol
arp_host_p.fields = { arp_target_field }

-- a table to hold field extractors
local fields = {}

fields[1] = Field.new("arp.dst.proto_ipv4")

-- let's do it!
function arp_host_p.dissector(tvb,pinfo,root)
    local tree = nil

    for i, field in ipairs(fields) do
        -- extract the field into a table of FieldInfos
        finfos = { field() }

        if #finfos > 0 then
            -- add our proto if we haven't already
            if not tree then
                tree = root:add(arp_host_p)
            end

            for _, finfo in ipairs(finfos) do
               tree:add(arp_target_field, finfo.display)
            end
        end
    end
end

-- then we register arp_host_p as a postdissector
register_postdissector(arp_host_p)