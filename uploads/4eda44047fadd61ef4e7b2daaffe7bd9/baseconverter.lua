--[[
    Base Converter Tool
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
--[[
    32-bit Decimal/Hexadecimal/Octal/Binary Base Converter
--]]

local baseconverter_info =
{
    version = "1.3",
    author = "Christopher Maynard",
    description = "Base Converter.",
}

set_plugin_info(baseconverter_info)

if not gui_enabled() then
    return
end

-----------------------------------------------------------------------------
local function baseconverter_window()

    -- By default, don't display results in any arbitrary base
    local base = 0
    local saved_number = UInt64.new(0)
    local lower_case = true
    local displaying_help = false

    -- Declare the window we will use
    local win = TextWindow.new("Base Converter")

    -------------------------------------------------------------------------
    local function display_help()
        displaying_help = true

        win:set("This tool displays numbers in various bases.\n\n" ..
            "It supports entering numbers in the following formats:\n\n" ..

            "Hexadecimal: Any 64-bit hexadecimal number is supported.\n" ..
            "             Range: 0x0 to 0xffffffffffffffff\n" ..
            "             Note: Precede the number with 0x or omit 0x and use at\n" ..
            "                   least one colon (:) character as a digit separator.\n\n" ..

            "Decimal:     Both positive and negative 64-bit numbers are supported.\n" ..
            "             Range: -9,223,372,036,854,775,808 to 18,446,744,073,709,551,615\n" ..
            "             Note: Commas are allowed but not required.\n\n" ..

            "Octal:       Any 64-bit octal number preceded with a 0.\n" ..
            "             Range: 0 to 01 777 777 777 777 777 777 777\n" ..
            "             Note: Spaces are allowed but not required.\n\n" ..

            "Binary:      Any 64-bit binary number appended with b or B.\n" ..
            "             Range: 0b to 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111b\n" ..
            "             Note: Spaces are allowed but not required.\n\n" ..

            "Base 2-36:   Displays an unsigned number in any base 2-36.\n" ..
            "             Note: Use 0 to avoid displaying this value.\n\n" ..

            "IP Address:  Any valid IPv4 address in dotted-decimal format.\n"
        )
    end -- display_help()

    -------------------------------------------------------------------------
    local function display_results(win, number)

        displaying_help = false
        saved_number = UInt64.new(number)

        ---------------------------------------------------------------------
        -- Hexadecimal: Display in groups of 4
        local function display_hex_result(number)
            local text
            local str = number:tohex()

            text = ""
            str = string.gsub(str, "^0*", "")
            if #str < 16 then
                local rem = #str % 4

                if rem > 0 then rem = 4 - rem end
                while rem > 0 do
                    str = "0" .. str
                    rem = rem - 1
                end
            end
            text = str:sub(1, 4)
            for i = 5, #str, 4 do
                text = text .. " " .. str:sub(i, i + 3)
            end
            if text == "" then
                text = "0000"
            end
            if lower_case == false then
                text = string.upper(text)
            end
            text = "Hexadecimal:  " .. text .. "\n"
            return text
        end -- display_hex_result()

        ---------------------------------------------------------------------
        -- Decimal: Display with thousands separator
        local function display_dec_result(number)
            local text = ""
            local str = tostring(number)
            local rem = #str % 3
            local start

            if rem > 0 then
                text = str:sub(1, rem)
                start = 1 + rem
            else
                text = str:sub(1, 3)
                start = 4
            end
            for i = start, #str, 3 do
                text = text .. "," .. str:sub(i, i + 2)
            end
            text = "Decimal:      " .. text .. "\n"
            return text
        end -- display_dec_result()

        ---------------------------------------------------------------------
        -- Octal: Display in groups of 3
        local function display_oct_result(number)
            local text

            if number:higher() == 0 and number:lower() == 0 then
                text = "0"
            else
                text = ""
                if number < 0 then
                    number = UInt64.new(number)
                end

                repeat
                    for i = 1, 3, 1 do
                        text = tostring(bit32.band(number:lower(), 7)) .. text
                        number = number:rshift(3)
                    end
                    text = " " .. text
                until number:tonumber() == 0
                text = string.gsub(text, "^ 0*", "")
            end
            text = "Octal:        " .. text .. "\n"
            return text
        end -- display_oct_result()

        ---------------------------------------------------------------------
        -- Binary: Group in nibbles
        local function display_bin_result(number)
            local text = ""

            repeat
                for i = 1, 4, 1 do
                    text = tostring(bit32.band(number:lower(), 1)) .. text
                    number = number:rshift(1)
                end
                text = " " .. text
                for i = 1, 4, 1 do
                    text = tostring(bit32.band(number:lower(), 1)) .. text
                    number = number:rshift(1)
                end
                text = " " .. text
            until number:tonumber() == 0
            text = string.gsub(text, "^ ", "")

            text = "Binary:       " .. text .. "\n"
            return text
        end -- display_bin_result()

        ---------------------------------------------------------------------
        --[[
            This code was modified from the function supplied at:
            https://stackoverflow.com/questions/3554315/lua-base-converter
        --]]
        local function basen(n, b)
            local digits = "0123456789abcdefghijklmnopqrstuvwxyz"
            local t = ""
            local sign = ""
            if n < 0 then
                sign = "-"
                n = -n
            end

            repeat
                local d = (n % b) + 1
                n = n / b
                t = digits:sub(d:lower(), d:lower()) .. t
            until n:higher() == 0 and n:lower() == 0

            return sign .. t
        end -- basen()

        ---------------------------------------------------------------------
        -- Base N (2-36): Display raw result
        local function display_baseN_result(number)

            local text

            if base > 0 then
                text = basen(number, base)
                if lower_case == false then
                    text = string.upper(text)
                end
                text = "Base " .. base .. ":      " .. (base < 10 and " " or "") .. text .. "\n"
            else
                text = ""
            end

            return text
        end -- display_baseN_result()

        ---------------------------------------------------------------------
        -- IP Address: Display as dotted-Decimal
        local function display_ipv4_result(number)
            local text = ""

            if number < 0 then
                number = UInt64.new(number)
            end

            text =
                bit32.rshift(number:lower(), 24) .. "." ..
                bit32.band(bit32.rshift(number:lower(), 16), 0xff) .. "." ..
                bit32.band(bit32.rshift(number:lower(), 8), 0xff) .. "." ..
                bit32.band(number:lower(), 0xff) .. "\n"

            if number:higher() ~= 0 then
                text = "IP Addresses: " ..
                    bit32.rshift(number:higher(), 24) .. "." ..
                    bit32.band(bit32.rshift(number:higher(), 16), 0xff) .. "." ..
                    bit32.band(bit32.rshift(number:higher(), 8), 0xff) .. "." ..
                    bit32.band(number:higher(), 0xff) .. ", " .. text
            else
                text = "IP Address:   " .. text
            end
            return text
        end -- display_ipv4_result()
        ---------------------------------------------------------------------

        win:set(display_hex_result(number))
        win:append(display_dec_result(number))

        -- Display both signed and unsigned decimal numbers, if applicable.
        if number < 0 then
            number = UInt64.new(number)
            win:append(display_dec_result(number))
        elseif number > 0 and bit32.band(number:higher(), 0x80000000) == 0x80000000 then
            number = Int64.new(number)
            win:append(display_dec_result(number))
        end

        win:append(display_oct_result(number))
        win:append(display_bin_result(number))
        if number < 0 then
            number = UInt64.new(number)
        end
        win:append(display_baseN_result(number))
        win:append(display_ipv4_result(number))

    end -- display_results()

    display_help()

    --[ BUTTONS ]vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    --[ Copy To Clipboard ]
    win:add_button("Copy To Clipboard", function()
        copy_to_clipboard(win:get_text())
    end)

    display_help()

     --[ Enter number: Hex (0x...), Oct (0...), Bin (...b), Dec,IP ]
    win:add_button("Enter Number", function()

        local function get_number(inputstr)

            if not inputstr or #inputstr == 0 then
                return
            end

            local str = string.lower(inputstr)
            local numberstr
            local number

            -- Hexadecimal?
            numberstr = string.match(str, "^0x(%x+)$")
            if numberstr then
                number = UInt64.fromhex(numberstr)
                if not number then
                    win:set("Invalid hexadecimal number entered: " .. inputstr)
                    return
                end
            else
                -- Try 2nd hexadecimal format
                local hexstr
                local count

                hexstr, count = str:gsub(":", "")
                numberstr = string.match(hexstr, "^(%x+)$")

                if numberstr and count >= 1 then
                    number = UInt64.fromhex(numberstr)
                    if not number then
                        win:set("Invalid hexadecimal number entered: " .. inputstr)
                        return
                    end
                else
                    -- Octal?
                    numberstr = string.match(str, "^(0[0-7 ]*)$")
                    if numberstr then
                        numberstr = str:gsub(" ", "")
                        number = UInt64.new(0)
                        for i = 1, #numberstr, 1 do
                            number = number * 8 + tonumber(numberstr:sub(i, i))
                        end
                    else
                        -- Binary?
                        local binstr = str:gsub(" ", "")

                        numberstr = string.match(binstr, "^([0-1][0-1 ]*)b$")
                        if numberstr then
                            number = UInt64.new(0)
                            for i = 1, #numberstr, 1 do
                                number = number * 2 + tonumber(numberstr:sub(i, i))
                            end
                        else
                            -- Decimal?
                            local decstr
                            local count

                            decstr, count = str:gsub(",", "")
                            numberstr = string.match(decstr, "^([+-]?[1-9]%d*)$")
                            if numberstr then
                                if string.sub(inputstr, 1, 1) == '-' then
                                    number = Int64.new(numberstr)
                                    --number = UInt64.new(number)
                                else
                                    number = UInt64.new(numberstr)
                                end
                                if not number then
                                    win:set("Invalid decimal number entered: " .. inputstr)
                                    return
                                end
                            else
                                -- IPv4 address?
                                local ipstr = string.match(inputstr, "(%d+%.%d+%.%d+%.%d+)")
                                if not ipstr then
                                    win:set("Invalid number entered: " .. inputstr)
                                    return
                                end

                                local ipOctets = {ipstr:match("(%d+)%.(%d+)%.(%d+)%.(%d+)")}
                                if #ipOctets ~= 4 then
                                    win:set("Invalid IPv4 address entered: " .. inputstr)
                                    return
                                end
                                number = UInt64.new(0)
                                for _, octet in ipairs(ipOctets) do
                                    if tonumber(octet) < 0 or tonumber(octet) > 255 then
                                        win:set("Invalid IPv4 address entered: " .. inputstr)
                                        return
                                    end
                                    number = number * 256 + tonumber(octet)
                                end
                            end
                        end
                    end
                end
            end

            display_results(win, number)

        end -- get_number()

        new_dialog("Enter Number", get_number, "Enter Number: Hex (0x...), Oct (0...), Bin (...b), Dec, IP")
    end)

     --[ Base 2-36 (or 0 = Don't display base N number) ]
     win:add_button("Enter Base", function()

        local function get_base(inputbasestr, inputnumberstr)

            -----------------------------------------------------------------
            local function get_base_number(inputnumberstr)

                if not inputnumberstr or #inputnumberstr == 0 then
                    display_results(win, saved_number)
                    return
                end

                local str = string.lower(inputnumberstr)
                local digits = "0123456789abcdefghijklmnopqrstuvwxyz"
                local pattern = "^([" .. digits:sub(1, base) .. "]+)$"
                local numberstr = string.match(str, pattern)

                if not numberstr then
                    win:set("Invalid base " .. base .. " number entered: " .. inputnumberstr)
                    return
                end

                local number = UInt64(0)
                for i = 1, #numberstr, 1 do
                    local n = string.find(digits, string.sub(numberstr, i, i)) - 1
                    number = number * base + n
                end

                display_results(win, number)
            end -- get_base_number()
            -----------------------------------------------------------------

            if not inputbasestr or #inputbasestr == 0 then
                return
            end

            local basestr = string.match(inputbasestr, "^%d%d?$")
            if inputbasestr then
                local userbase = tonumber(basestr)
                if userbase == 0 or (userbase >= 2 and userbase <= 36) then
                    base = userbase
                    if base >= 2 then
                        get_base_number(inputnumberstr)
                    elseif not displaying_help then
                        display_results(win, saved_number)
                    end
                else
                    win:set("Invalid base entered: " .. inputbasestr)
                end
            else
                win:set("Invalid base entered: " .. inputbasestr)
            end
        end -- get_base()

        new_dialog("Enter Base", get_base, "Enter Base (2-36 or 0):", "Enter Number")
     end)

    --[ Rotate Left ]
     win:add_button("Rotate Left", function()
        if not displaying_help then
            display_results(win, saved_number:rol(1))
        end
     end)

    --[ Rotate Right ]
     win:add_button("Rotate Right", function()
        if not displaying_help then
            display_results(win, saved_number:ror(1))
        end
     end)

    --[ Not ]
     win:add_button("Not", function()
        if not displaying_help then
            display_results(win, saved_number:bnot())
        end
     end)

    --[ Toggle Case ]
     win:add_button("Toggle Case", function()
        lower_case = not lower_case
        if not displaying_help then
            display_results(win, saved_number)
        end
     end)

    --[ Help ]
     win:add_button("Help", function()
        display_help()
     end)

    --[ BUTTONS ]^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

end -- baseconverter_window()

register_menu("Base Converter", baseconverter_window, MENU_TOOLS_UNSORTED)
