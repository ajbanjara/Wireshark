--[[
    Base64 Encoder/Decoder
    Copyright (C) 2023 Christopher Maynard

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

local uncompress_info =
{
    version = "1.1",
    author = "Christopher Maynard",
    description = "Base64 Encoder/Decoder.",
}

set_plugin_info(uncompress_info)

-----------------------------------------------------------------------------
if not gui_enabled() then
    return
end

-----------------------------------------------------------------------------
local function base64()

    local win = TextWindow.new("Base64 Encoder/Decoder")
    win:set_editable(true)
    win:set("")

    -------------------------------------------------------------------------
    -- http://lua-users.org/wiki/BaseSixtyFour
    -- Base64 Encoding
    function base64_encode(data)
        local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
        return ((data:gsub('.', function(x)
            local r,b='',x:byte()
            for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
            return r;
        end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
            if (#x < 6) then return '' end
            local c=0
            for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
            return b:sub(c+1,c+1)
        end)..({ '', '==', '=' })[#data%3+1])
    end -- base64_encode()

    -------------------------------------------------------------------------
    -- Base64 Decoding
    function base64_decode(data)
        local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
        data = string.gsub(data, '[^'..b..'=]', '')
        return (data:gsub('.', function(x)
            if (x == '=') then return '' end
            local r,f='',(b:find(x)-1)
            for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
            return r;
        end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
            if (#x ~= 8) then return '' end
            local c=0
            for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
            return string.char(c)
        end))
    end -- base64_decode()

    --[ BUTTONS ]vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    --[ Copy To Clipboard ]
    win:add_button("Copy To Clipboard", function()
        copy_to_clipboard(win:get_text())
    end)

    --[ Base64 Encode ]
    win:add_button("Base64 Encode", function()
        win:set(base64_encode(win:get_text()))
    end)

    --[ Base64 Decode ]
    win:add_button("Base64 Decode", function()
        win:set(base64_decode(win:get_text()))
    end)
    --[ BUTTONS ]^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

end -- base64()

register_menu("Base64 Encoder Decoder", base64, MENU_TOOLS_UNSORTED)
