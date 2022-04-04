--[[
    Common column functions
    Copyright (C) 2018-2022 Christopher Maynard

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

local info =
{
    version = "1.3",
    author = "Christopher Maynard",
    description = "Common column functions"
}

set_plugin_info(info)

-----------------------------------------------------------------------------
function col_clear(col, allowed)

    if allowed then
        col:clear()
    end

end -- col_clear()

-----------------------------------------------------------------------------
function col_set(col, str, allowed)

    if allowed then
        col:set(str)
    end

end -- col_set()

-----------------------------------------------------------------------------
function col_append(col, str, allowed)

    if allowed then
        col:append(str)
    end

end -- col_append()

-----------------------------------------------------------------------------
function col_append_sep_str(col, sep, str, allowed)

    if allowed then
        local colstr = tostring(col)

        if colstr:len() > 0 then
            col:append(sep)
        end
        col:append(str)
    end

end -- col_append_sep_str()

-----------------------------------------------------------------------------
function col_fence(col, allowed)

    if allowed then
        col:fence()
    end

end -- col_fence()
