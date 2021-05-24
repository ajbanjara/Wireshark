--[[
    IPv6 postdissector that fully expands all IPv6 addresses.
    Copyright (C) 2020 Christopher Maynard

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
--]]
-------------------------------------------------------------------------

local ipv6_post_info =
{
    version = "1.2",
    author = "Christopher Maynard",
    description = "IPv6 Postdissector that fully expands all IPv6 addresses",
}

set_plugin_info(ipv6_post_info)

local ipv6_post = Proto("IPv6Post", "IPv6 Postdissector")

local pf = {
    ipv6_src_expanded = ProtoField.string("ipv6_post.src_expanded", "Source Address (Expanded)"),
    ipv6_dst_expanded = ProtoField.string("ipv6_post.dst_expanded", "Destination Address (Expanded)"),
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


