--[[
    Subnet Calculator Tool
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
    Subnet Calculator, inspired from these and other resources:
    -> The old PMG Toolkit: https://web.archive.org/web/20040404085425/http:/pmg.com:80/ref_home.htm#toolkit
    -> The ipcalc Tool: https://linux.die.net/man/1/ipcalc
                        https://github.com/kjokjo/ipcalc/blob/master/ipcalc
--]]

local subnetcalc_info =
{
    version = "1.1",
    author = "Christopher Maynard",
    description = "Subnet Calculator.",
}

set_plugin_info(subnetcalc_info)

if not gui_enabled() then
    return
end

local data = {
    mask  = {255, 255, 255,   0},
    host  = {192,   0,   2,   1}
}

-----------------------------------------------------------------------------
local function is_valid_netmaskvalue(value)

    local tmp = bit32.bnot(value)

    if bit32.band(bit32.band(tmp, tmp + 1), 0xffffffff) == 0 then
        return true
    else
        return false
    end

end -- is_valid_netmaskvalue()

-----------------------------------------------------------------------------
local function subnetcalc_window()

    -- Declare the window we will use
    local win = TextWindow.new("Subnet Calculator")

    -------------------------------------------------------------------------
    local function usage(inputstr)

        local usage_and_examples = "Usage: \n" ..
            "\t1) Address\n" ..
            "\t2) Address/Maskbits\n" ..
            "\t3) Address/Netmask\n\n" ..
            --"Notes:\n" ..
            "\t-> Address must be a valid IP address in dotted-decimal notation.\n" ..
            "\t-> Maskbits must be an integer between 0 and 32 (inclusive).\n" ..
            "\t-> Netmask must be a valid netmask in dotted-decimal notation.\n" ..
            "\n" ..
            "Examples:\n\n" ..
            "\t1) 192.168.1.1\n" ..
            "\t2) 192.168.1.1/24\n" ..
            "\t3) 192.168.1.1/255.255.255.0"

        if inputstr then
            return "Invalid input: " .. inputstr .. "\n\n" .. usage_and_examples
        else
            return usage_and_examples
        end

    end -- usage()

    -------------------------------------------------------------------------
    local function display_results(win)

        local function format_octets(name, t, bits_of_mask)

            local bom = bits_of_mask
            local val = 16777216 * t[1] + 65536 * t[2] + 256 * t[3] + t[4]
            local text
            local i, j

            text = string.format("%s%3d.%3d.%3d.%3d    ", name, t[1], t[2], t[3], t[4])
            for i = 1, 4, 1 do
                local mask = 0x80
                for j = 1, 8, 1 do
                    text = text .. (bit32.btest(t[i], mask) and 1 or 0)
                    if j == 8 and i ~= 4 then
                        text = text .. "."
                    end
                    bom = bom - 1
                    if bom == 0 then
                        text = text .. " "
                    end
                    mask = bit32.rshift(mask, 1)
                end
            end
            if bits_of_mask == 0 then
                text = text .. " "
            end

            return text .. string.format("    %10u    %08X\n", val, val)

        end -- format_octets()

        ---------------------------------------------------------------------
        local function format_address_bitmap(bits_of_mask, subnet_bits, class)
            local text = ""
            local start = 1
            local netchar = "n"

            if class == "A" then
                if bits_of_mask < 8 then
                    netchar = "N"
                else
                    text = "0"
                    start = 2
                end
            elseif class == "B" then
                if bits_of_mask < 16 then
                    netchar = "N"
                else
                    text = "10"
                    start = 3
                end
            elseif class == "C" then
                if bits_of_mask < 24 then
                    netchar = "N"
                else
                    text = "110"
                    start = 4
                end
            end

            for i = start, bits_of_mask - subnet_bits, 1 do
                text = text .. netchar
                if i % 8 == 0 and i ~=32 then
                    text = text .. "."
                end
            end

            for i = bits_of_mask - subnet_bits + 1, bits_of_mask, 1 do
                text = text .. "s"
                if i % 8 == 0 and i ~=32 then
                    text = text .. "."
                end
            end

            if bits_of_mask > 0 then
                text = text .. " "
            end
            for i = bits_of_mask + 1, 32, 1 do
                text = text .. "h"
                if i % 8 == 0 and i ~=32 then
                    text = text .. "."
                end
            end

            return text .. "\n"

        end -- format_address_bitmap()

        ---------------------------------------------------------------------
        local function compute_class_and_scope(h, bom)
            local class
            local scope = ""
            local host = 16777216 * h[1] + 65536 * h[2] + 256 * h[3] + h[4]

            if not bit32.btest(h[1], 0x80) then
                class = "A"
                if h[1] == 0 and bom >= 8 then
                    scope = ", This host on this network (RFCs 6890, 1122)"
                elseif h[1] == 10 and bom >= 8 then
                    scope = ", Private-Use Network (RFCs 6890, 1918)"
                elseif (h[1] == 100 and bit32.band(h[2], 0xc0) == 64) and (bom >= 10) then
                    scope = ", Shared Address Space (RFCs 6890, 6598)"
                elseif h[1] == 127 and bom >= 8 then
                    scope = ", Loopback (RFCs 6890, 1122)"
                end
            elseif not bit32.btest(h[1], 0x40) then
                class = "B"
                if (h[1] == 169 and h[2] == 254) and (bom >= 8) then
                    scope = ", Link local/APIPA (RFCs 6890, 3927)"
                elseif h[1] == 172 and bit32.band(h[2], 0xf0) == 16 then
                    scope = ", Private-Use Network (RFCs 6890, 1918)"
                end
            elseif not bit32.btest(h[1], 0x20) then
                class = "C"
                if (h[1] == 192 and h[2] == 0 and h[3] == 0 and bit32.band(h[4], 0xf8) == 0) and (bom >= 29) then
                    scope = ", DS-Lite (RFCs 6890, 6333)"
                elseif (h[1] == 192 and h[2] == 0 and h[3] == 0) and (bom >= 24) then
                    scope = ", IETF Protocol Assignments (RFC 6890)"
                elseif (h[1] == 192 and h[2] == 0 and h[3] == 2) and (bom >= 24) then
                    scope = ", Documentation - TEST-NET-1 (RFCs 6890, 5737)"
                elseif (h[1] == 192 and h[2] == 88 and h[3] == 99) and (bom >= 24) then
                    scope = ", Reserved, formerly used for 6to4 Relay Anycast (RFCs 6890, 3068)"
                elseif (h[1] == 192 and h[2] == 168) and (bom >= 16) then
                    scope = ", Private-Use Network (RFCs 6890, 1918)"
                elseif (h[1] == 198 and h[2] == 18) and (bom >= 15) then
                    scope = ", Benchmarking (RFCs 6890, 2544)"
                elseif (h[1] == 192 and h[2] == 51 and h[3] == 100) and (bom >= 24) then
                    scope = ", Documentation - TEST-NET-2 (RFCs 6890, 5737)"
                elseif (h[1] == 203 and h[2] == 0 and h[3] == 113) and (bom >= 24) then
                    scope = ", Documentation - TEST-NET-3 (RFCs 6890, 5737)"
                end
            elseif not bit32.btest(h[1], 0x10) then
                class = "D, Multicast"
            elseif host == 0xffffffff and bom == 32 then
                class = "N/A, Limited broadcast (RFCs 6890, 0919)"
            else
                class = "E, Reserved (RFCs 6890, 1112)"
            end

            return class, scope

        end -- compute_class_and_scope()

        ---------------------------------------------------------------------
        local function compute_bits_of_mask(t)

            local bits_of_mask = 0

            for i = 1, 4, 1 do
                bits_of_mask = bits_of_mask +
                    (bit32.btest(t[i], 0x80) and 1 or 0) +
                    (bit32.btest(t[i], 0x40) and 1 or 0) +
                    (bit32.btest(t[i], 0x20) and 1 or 0) +
                    (bit32.btest(t[i], 0x10) and 1 or 0) +
                    (bit32.btest(t[i], 0x08) and 1 or 0) +
                    (bit32.btest(t[i], 0x04) and 1 or 0) +
                    (bit32.btest(t[i], 0x02) and 1 or 0) +
                    (bit32.btest(t[i], 0x01) and 1 or 0)
            end

            return bits_of_mask

        end -- compute_bits_of_mask()

        ---------------------------------------------------------------------
        local function compute_subnet_bits(class, bits_of_mask)

            local subnet_bits
            if class == "A" then
                if bits_of_mask >= 8 then
                    subnet_bits = bits_of_mask - 8
                else
                    subnet_bits = 0 -- "Supernet"
                end
            elseif class == "B" then
                if bits_of_mask >= 16 then
                    subnet_bits = bits_of_mask - 16
                else
                    subnet_bits = 0 -- "Supernet"
                end
            elseif class == "C" then
                if bits_of_mask >= 24 then
                    subnet_bits = bits_of_mask - 24
                else
                    subnet_bits = 0 -- "Supernet"
                end
            else
                -- Class D or E
                subnet_bits = 0 -- "N/A"
            end

            return subnet_bits

        end -- compute_subnet_bits()

        ---------------------------------------------------------------------
        -- Compute stuff
        local net = {}
        net[1] = bit32.band(data.mask[1], data.host[1])
        net[2] = bit32.band(data.mask[2], data.host[2])
        net[3] = bit32.band(data.mask[3], data.host[3])
        net[4] = bit32.band(data.mask[4], data.host[4])

        local bcast = {}
        bcast[1] = bit32.bor(data.host[1], bit32.band(bit32.bnot(data.mask[1]), 0xff))
        bcast[2] = bit32.bor(data.host[2], bit32.band(bit32.bnot(data.mask[2]), 0xff))
        bcast[3] = bit32.bor(data.host[3], bit32.band(bit32.bnot(data.mask[3]), 0xff))
        bcast[4] = bit32.bor(data.host[4], bit32.band(bit32.bnot(data.mask[4]), 0xff))

        local wildcard = {}
        wildcard[1] = bit32.band(bit32.bnot(data.mask[1]), 0xff)
        wildcard[2] = bit32.band(bit32.bnot(data.mask[2]), 0xff)
        wildcard[3] = bit32.band(bit32.bnot(data.mask[3]), 0xff)
        wildcard[4] = bit32.band(bit32.bnot(data.mask[4]), 0xff)

        local host_min = {net[1], net[2], net[3], net[4] + 1}
        local host_max = {bcast[1], bcast[2], bcast[3], bcast[4] - 1}
        local bits_of_mask = compute_bits_of_mask(data.mask)
        local class, scope = compute_class_and_scope(data.host, bits_of_mask)
        local subnet_bits = compute_subnet_bits(class, bits_of_mask)
        local usable_subnets = 2^subnet_bits
        local usable_hosts = bits_of_mask < 31 and 2^(32 - bits_of_mask) - 2 or 33 - bits_of_mask

        -- Display stuff
        win:set("                     Dotted Quad        Binary                                  Decimal       Hexadecimal\n")
        win:append("                     ---------------    ------------------------------------    ----------    -----------\n")
        win:append(format_octets("Host Address:        ", data.host, bits_of_mask))
        win:append(format_octets("Subnet Mask:         ", data.mask, bits_of_mask))
        win:append(format_octets("Wildcard:            ", wildcard, bits_of_mask))
        if bits_of_mask ~= 32 then
            win:append(format_octets("IP Network:          ", net, bits_of_mask))
            win:append(format_octets("Min Host Address:    ", host_min, bits_of_mask))
            win:append(format_octets("Max Host Address:    ", host_max, bits_of_mask))
            win:append(format_octets("Broadcast Address:   ", bcast, bits_of_mask))
        end

        win:append("Address Bitmap:                         " ..
            format_address_bitmap(bits_of_mask, subnet_bits, class))

        win:append("\nSubnet Information:\n")
        win:append("Address Class:       " .. class .. scope .. "\n")
        win:append("Bits of Mask:        " .. bits_of_mask .. "\n")
        win:append("Subnet Bits:         " .. subnet_bits .. "\n")
        win:append("Usable Subnets:      " .. usable_subnets .. "\n")
        win:append("Usable Hosts/Subnet: " .. usable_hosts .. "\n")

    end -- display_results()

    --display_results(win)
    win:set(usage(nil))

    --[ BUTTONS ]vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    --[ Copy To Clipboard ]
    win:add_button("Copy To Clipboard", function()
        copy_to_clipboard(win:get_text())
    end)

     --[ Host Address/NetMask ]
    win:add_button("Address/Netmask", function()

        local function get_host_netmask(inputstr)

            if not inputstr or #inputstr == 0 then
                win:set(usage(nil))
                return
            end
            -- Handle the IP address first
            local ip = string.match(inputstr, "(%d+%.%d+%.%d+%.%d+)")
            if not ip then
                win:set(usage(inputstr))
                return
            end

            local ipOctets = {ip:match("(%d+)%.(%d+)%.(%d+)%.(%d+)")}
            if #ipOctets ~= 4 then
                win:set(usage(inputstr))
                return
            end
            for _, octet in ipairs(ipOctets) do
                if tonumber(octet) < 0 or tonumber(octet) > 255 then
                    win:set(usage(inputstr))
                    return
                end
            end

            -- Handle the optional netmask next
            local netmaskOctets = {}
            local netmask = string.match(inputstr, ip .. "/(%d+%.%d+%.%d+%.%d+)")
            if netmask then

                -- Validate and parse the netmask
                netmaskOctets = {netmask:match("(%d+)%.(%d+)%.(%d+)%.(%d+)")}

                if #netmaskOctets ~= 4 then
                    win:set(usage(inputstr))
                    return
                end

                local netmaskValue = 0
                for _, octet in ipairs(netmaskOctets) do
                    if tonumber(octet) < 0 or tonumber(octet) > 255 then
                        win:set(usage(inputstr))
                        return
                    end
                    netmaskValue = netmaskValue * 256 + tonumber(octet)
                end
                if not is_valid_netmaskvalue(netmaskValue) then
                    win:set(usage(inputstr))
                    return
                end
            else
                netmask = string.match(inputstr, ip .. "/(%d+)")
                if netmask then
                    local netmaskBit = tonumber(netmask)

                    if not netmaskBit then
                        win:set(usage(inputstr))
                        return
                    end
                    if netmaskBit < 0 or netmaskBit > 32 then
                        win:set(usage(inputstr))
                        return
                    end

                    local netmaskValue = bit32.lshift(0xffffffff, 32 - netmaskBit)
                    for i = 4, 1, -1 do
                        netmaskOctets[i] = bit32.band(netmaskValue, 0xff)
                        netmaskValue = bit32.rshift(netmaskValue, 8)
                    end
                    netmask = table.concat(netmaskOctets, ".")
                else
                    -- Calculate default netmask based on IP class
                    local firstOctet = tonumber(ipOctets[1])

                    if firstOctet >= 0 and firstOctet <= 127 then
                        netmask = "255.0.0.0"
                    elseif firstOctet >= 128 and firstOctet <= 191 then
                        netmask = "255.255.0.0"
                    elseif firstOctet >= 192 and firstOctet <= 223 then
                        netmask = "255.255.255.0"
                    else
                        netmask = "255.255.255.255"
                    end
                    netmaskOctets = {netmask:match("(%d+)%.(%d+)%.(%d+)%.(%d+)")}
                end
            end

            -- Both IP and netmask are valid, so save them.
            for i = 1, 4, 1 do
                data.host[i] = tonumber(ipOctets[i])
                data.mask[i] = tonumber(netmaskOctets[i])
            end

            display_results(win)

        end -- get_host_netmask()

        new_dialog("Address/Netmask", get_host_netmask, "Enter Address[[/]]Netmask]:")
    end)
    --[ BUTTONS ]^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

end -- subnetcalc_window()

register_menu("Subnet Calculator", subnetcalc_window, MENU_TOOLS_UNSORTED)
