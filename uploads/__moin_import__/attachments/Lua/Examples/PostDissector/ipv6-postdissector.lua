--[[
    iv6-postdissector.lua
    Fully expand all IPv6 addresses.
--]]

local ipv6_post_info =
{
    version = "1.0.0",
    author = "Christopher Maynard",
    description = "IPv6 Postdissector that fully expands all IPv6 addresses",
}

set_plugin_info(ipv6_post_info)

local ipv6_post = Proto("IPv6Post", "IPv6 Postdissector")

local pf = {
    ipv6_src_expanded = ProtoField.string("ipv6_post.src_expanded", "Source (Expanded)"),
    ipv6_dst_expanded = ProtoField.string("ipv6_post.dst_expanded", "Destination (Expanded)"),
    ipv6_addr_expanded = ProtoField.string("ipv6_post.addr_expanded", "Source or Destination Address (Expanded)"),
}

-- Register protocol fields
ipv6_post.fields = pf

local ipv6_src = Field.new("ipv6.src")
local ipv6_dst = Field.new("ipv6.dst")
local ipv6_addr = Field.new("ipv6.addr")

function ipv6_post.dissector(tvbuf, pinfo, tree)

    local ipv6_src_ex = {ipv6_src()}
    local ipv6_dst_ex = {ipv6_dst()}
    local ipv6_addr_ex = {ipv6_addr()}

    if ipv6_src_ex ~= nil then

        local ipv6_post_tree = tree:add(ipv6_post, "IPv6 Postdissector")
        local ipv6_expanded
        local i

        for i in pairs(ipv6_src_ex) do
            ipv6_tvb = ipv6_src_ex[i].range()
            ipv6_expanded = string.format("%04x:%04x:%04x:%04x:%04x:%04x:%04x:%04x",
                ipv6_tvb(0, 2):uint(), ipv6_tvb(2, 2):uint(),
                ipv6_tvb(4, 2):uint(), ipv6_tvb(6, 2):uint(),
                ipv6_tvb(8, 2):uint(), ipv6_tvb(10, 2):uint(),
                ipv6_tvb(12, 2):uint(), ipv6_tvb(14, 2):uint())
            ipv6_post_tree:add(pf.ipv6_src_expanded, ipv6_expanded)
        end

        for i in pairs(ipv6_dst_ex) do
            ipv6_tvb = ipv6_dst_ex[i].range()
            ipv6_expanded = string.format("%04x:%04x:%04x:%04x:%04x:%04x:%04x:%04x",
                ipv6_tvb(0, 2):uint(), ipv6_tvb(2, 2):uint(),
                ipv6_tvb(4, 2):uint(), ipv6_tvb(6, 2):uint(),
                ipv6_tvb(8, 2):uint(), ipv6_tvb(10, 2):uint(),
                ipv6_tvb(12, 2):uint(), ipv6_tvb(14, 2):uint())
            ipv6_post_tree:add(pf.ipv6_dst_expanded, ipv6_expanded)
        end

        for i in pairs(ipv6_addr_ex) do
            ipv6_tvb = ipv6_addr_ex[i].range()
            ipv6_expanded = string.format("%04x:%04x:%04x:%04x:%04x:%04x:%04x:%04x",
                ipv6_tvb(0, 2):uint(), ipv6_tvb(2, 2):uint(),
                ipv6_tvb(4, 2):uint(), ipv6_tvb(6, 2):uint(),
                ipv6_tvb(8, 2):uint(), ipv6_tvb(10, 2):uint(),
                ipv6_tvb(12, 2):uint(), ipv6_tvb(14, 2):uint())
            ipv6_post_tree:add(pf.ipv6_addr_expanded, ipv6_expanded)
        end

    end

end

register_postdissector(ipv6_post)


