--[[
    Guacamole over HTTP PostDissector.
    Copyright (C) 2021 Christopher Maynard

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

--[[
    guacp-postdissector.lua
    Attempt to dissect HTTP payload data as Guacamole data.
--]]

local guacp_post_info =
{
    version = "1.3",
    author = "Christopher Maynard",
    description = "Guacamole Postdissector for HTTP payload",
}

set_plugin_info(guacp_post_info)

local guacp_post = Proto("GuacpPost", "Guacp Postdissector")

local guacp_port = Field.new("tcp.port")
local guacp_content_type = Field.new("http.content_type")
local guacp_data = Field.new("data.data")

local guacp_dissector = Dissector.get("guacp")

--[[
    Too bad we can't make this port configurable as a preference, but
    preferences aren't supported for post-dissectors, at least not yet.
    See: https://gitlab.com/wireshark/wireshark/-/issues/17452
--]]
local GUACDC_WEB_PORT = 65535

function guacp_post.dissector(tvbuf, pinfo, tree)

    local i, port = 0
    local guacp_port_ex = {guacp_port()}

    -- Checks if the HTTP payload *might* be GuacP data
    -- Port:
    if guacp_port_ex == nil then
        return
    end
    for i in pairs(guacp_port_ex) do
        if guacp_port_ex[i].value == GUACDC_WEB_PORT then
            port = GUACDC_WEB_PORT
        end
    end
    if port ~= GUACDC_WEB_PORT then
        return
    end

    -- HTTP Content Type:
    if guacp_content_type() == nil then
        return
    end
    if guacp_content_type().value ~= "application/octet-stream" then
        return
    end

    -- Data:
    if guacp_data() == nil then
        return
    end

    --[[
        Now comes the heuristics.  Does it look like guacp data?
        Tighten heuristics as necessary, but for now just check that the last
        byte is an instruction terminator, i.e., ';'.
    --]]
    local guacp_tvb = guacp_data().range
    if guacp_tvb(guacp_tvb:len() - 1, 1):uint() ~= string.byte(";") then
        return
    end

    --[[
        TODO: There's no real need for this, is there?

        local guacp_post_tree = tree:add(guacp_post, "Guacp Postdissector")
    --]]

    pinfo.cols.info:clear_fence()
    guacp_dissector:call(guacp_tvb:tvb(), pinfo, tree)

end

register_postdissector(guacp_post)


