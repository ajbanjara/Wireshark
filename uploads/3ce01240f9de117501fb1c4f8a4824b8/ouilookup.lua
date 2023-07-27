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
    version = "1.4",
    author = "Christopher Maynard",
    description = "OUI Lookup Tool.",
}

set_plugin_info(ouilookup_info)

-----------------------------------------------------------------------------
if not gui_enabled() then
    return
end

local function ouilookup_window()

    local win = TextWindow.new("OUI Lookup")
    local lookups_ok = false
    local case_sensitive = false
    local comment_search = true
    local wsver = get_version()
    local manuf_file
    local f

    -------------------------------------------------------------------------
    local function write_manuf_file(file)
        local cmd

        --[[
            If we're running on Windows, quote the tshark command
            See: http://www.lua.org/manual/5.2/manual.html#pdf-package.config
        --]]
        if package.config:sub(1, 1) == "\\" then
            cmd = '"' .. Dir.global_config_path("tshark") .. '"'
        else
            cmd = Dir.global_config_path("tshark")
        end
        cmd = cmd .. " -G manuf > " .. file -- .. " 2> " .. Dir.personal_config_path("manuf_err")

        local result = os.execute(cmd)
        if result then
            lookups_ok = true
            return true
        else
            os.remove(file)
            return false
        end
    end -- write_manuf_file()

    -------------------------------------------------------------------------
    local function read_manuf_ver_file(file)
        local f
        local line

        f = io.open(file, "r")
        if f == nil then
            return nil
        end

        line = f:read("*line")
        f:close()

        if line then
            return line
        else
            return nil
        end
    end -- read_manuf_ver_file()

    -------------------------------------------------------------------------
    local function write_manuf_ver_file(file, wsver)
        local f

        f = io.open(file, "w")
        if f == nil then
            return false
        else
            f:write(wsver)
            f:close()
            return true
        end
    end -- write_manuf_ver_file()

    -------------------------------------------------------------------------
    local function show_help()
        win:set(
            "This OUI lookup tool provides an easy way to look up OUIs\n" ..
            "and other MAC address prefixes.  It uses the local file\n" ..
            Dir.global_config_path("manuf") .. " for lookups, or\n" ..
            "if that file isn't found, it attempts to use the generated\n" ..
            Dir.personal_config_path("manuf") .. " file instead.\n"
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
                "\nUnfortunately, neither file was found or could be\n" ..
                "generated, so no OUI lookups are currently possible.\n"
            )
            win:append("\nUse the online lookup tool instead: https://www.wireshark.org/tools/oui-lookup.html")
        end
    end -- show_help()

    -------------------------------------------------------------------------

    manuf_file = Dir.global_config_path("manuf")
    f = io.open(manuf_file, "r")
    if f == nil then
        --[[
            See if we can use or generate a personal "manuf" file,
            and make sure it's the latest one available.
        --]]
        manuf_file = Dir.personal_config_path("manuf")

        local manuf_ver_file = Dir.personal_config_path("manuf_ver")
        local manuf_ver = read_manuf_ver_file(manuf_ver_file)

        if manuf_ver == nil or manuf_ver < wsver then
            --[[
                The personal "manuf_ver" file wasn't found or it was out of
                 date, so create a new personal "manuf" and "manuf_ver" pair.
            --]]
            if write_manuf_file(manuf_file) and write_manuf_ver_file(manuf_ver_file, wsver) then
                lookups_ok = true
            end
        else
            --[[
                The "manuf_ver" file was found and it is up to date, so as
                long as we can open the actual personal "manuf" file, we
                should be OK.
            --]]
            f = io.open(manuf_file, "r")
            if f == nil then
                -- We couldn't open it, so just write a new one.
                if write_manuf_file(manuf_file) then
                    lookups_ok = true
                end
            else
                lookups_ok = true
                f:close()
                f = nil
            end
        end
    else
        --[[
            Use the global "manuf" file.  This is the default prior to
            Wireshark 4.2.
        --]]
        lookups_ok = true
        f:close()
        f = nil
    end

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

            local f = io.open(manuf_file, "r")
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
                win:set("Lookup failure: Could not open " .. manuf_file .. ".\n\n")
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
