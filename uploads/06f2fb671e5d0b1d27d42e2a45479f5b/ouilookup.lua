--[[
    OUI Lookup Tool.
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

local ouilookup_info =
{
    version = "1.3",
    author = "Christopher Maynard",
    description = "OUI Lookup Tool.",
}

set_plugin_info(ouilookup_info)

-----------------------------------------------------------------------------
if not gui_enabled() then
    return
end

local manuf = Dir.global_config_path("manuf")

local function ouilookup_window()

    local win = TextWindow.new("OUI Lookup")
    local case_sensitive = false
    local comment_search = true
    local  lookups_ok
    local f = io.open(manuf, "r")

    if f == nil then
        lookups_ok = false
    else
        lookups_ok = true
        f:close()
        f = nil
    end

    local function show_help()
        win:set(
            "This OUI lookup tool provides an easy way to look up OUIs\n" ..
            "and other MAC address prefixes.  It uses the local file\n" ..
            manuf .. " for lookups.\n"
        )

        if lookups_ok then
            win:append(
                "\nOUIs and MAC address searches should be colon-separated, but\n" ..
                "searches can include arbitrary text as well as Lua patterns.\n" ..
                "\nExamples:\n" ..
                "\t^00:D0:EF\n" ..
                "\tMaple\n" ..
                "\t/28\n" ..
                "\t70:B3:D5:0E:.*/36\n" ..
                "\t^00.*GmbH$\n" ..
                "\tInc.?$\n\n" ..
                "For help with Lua patterns, refer to https://www.lua.org/manual/5.2/manual.html#6.4.1\n"
            )

            win:append("\nSearches are currently case-" .. (case_sensitive and "sensitive" or "insensitive") .. ".\n")
            win:append("Searches will " .. (comment_search and "include" or "exclude") .. " comments.\n\n")
            win:append("NOTE: An online lookup tool is also available at: https://www.wireshark.org/tools/oui-lookup.html")
        else
            win:append(
                "\nUnfortunately, this file was not found, " ..
                "so no lookups will be possible.\n"
            )
        end
    end -- show_help()

    show_help()
    if not lookups_ok then
        return
    end

    --[ BUTTONS ]vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    --[ Copy To Clipboard ]
    win:add_button("Copy To Clipboard", function()
        copy_to_clipboard(win:get_text())
    end)

     --[ OUI ]
    win:add_button("OUI Lookup", function()

        local function oui_lookup(inputstr)

            local f = io.open(manuf, "r")
            if f ~= nil then
                win:set("")
                local inputstrlower = string.lower(inputstr)
                local count = 0
                local line = f:read("*line")

                while line do
                    if string.sub(line, 1, 1) == "#" then goto continue end
                    if not comment_search then
                        local s = string.find(line, "#")
                        if s ~= nil then
                            line = string.sub(line, 1, s - 1)
                        end
                    end

                    if case_sensitive then
                        if string.find(line, inputstr) ~= nil then
                            count = count + 1
                            win:append(count .. ") " .. line .. "\n")
                        end
                    else
                        if string.find(string.lower(line), inputstrlower) ~= nil then
                            count = count + 1
                            win:append(count .. ") " .. line .. "\n")
                        end
                    end

                    ::continue::
                    line = f:read("*line")
                end
                f:close()
                win:prepend(count .. " result" .. (count == 1 and "" or "s") .. " for " .. "\"" .. inputstr .. "\"" .. ":\n\n")

            else
                win:set("Lookup failure: Could not open " .. manuf .. ".\n\n")
            end

        end -- oui_lookup()

        new_dialog("OUI Lookup", oui_lookup, "Enter OUI or Case-" .. (case_sensitive and "Sensitive" or "Insensitive") .. " Text")
    end)

     --[ Toggle Case-Sensitivity ]
     win:add_button("Toggle Case-Sensitivity", function()
        case_sensitive = not case_sensitive
        show_help()
        --win:set("Searches are now case-" .. (case_sensitive and "sensitive" or "insensitive") .. ".\n")
     end)

     --[ Toggle Comment Search ]
     win:add_button("Toggle Comment Search", function()
        comment_search = not comment_search
        show_help()
        --win:set("Searches will now " .. (comment_search and "include" or "exclude") .. " comments.\n")
     end)

     --[ Help ]
     win:add_button("Help", function()
        show_help()
     end)

    --[ BUTTONS ]^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    win:set_atclose(function()
        if f ~= nil then
            f:close()
        end
    end)

end -- ouilookup_window()

register_menu("OUI Lookup", ouilookup_window, MENU_TOOLS_UNSORTED)
