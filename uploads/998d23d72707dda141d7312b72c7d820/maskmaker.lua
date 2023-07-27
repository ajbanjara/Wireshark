--[[
    Mask Maker Tool
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
-----------------------------------------------------------------------------
--[[
    Mask Maker Tool, inspired from these and other resources:
    -> The old PMG Toolkit: https://web.archive.org/web/20040404085425/http:/pmg.com:80/ref_home.htm#toolkit
    -> The online IP Subnet Calculator at: https://www.subnet-calculator.com/
--]]

local maskmaker_info =
{
    version = "1.1",
    author = "Christopher Maynard",
    description = "Mask Maker Tool.",
}

set_plugin_info(maskmaker_info)

if not gui_enabled() then
    return
end

-----------------------------------------------------------------------------
local function maskmaker_window()

    local class_a_defaults = {
        class = "A",
        max_hosts_per_subnet = 2^24 - 2,
        max_subnets = 2^22,
        mask = {255, 0, 0, 0},
        mask_bits = 8,
        host_bits = 24
    }
    local class_b_defaults = {
        class = "B",
        max_hosts_per_subnet = 2^16 - 2,
        max_subnets = 2^14,
        mask = {255, 255, 0, 0},
        mask_bits = 16,
        host_bits = 16
    }
    local class_c_defaults = {
        class = "C",
        max_hosts_per_subnet = 2^8 - 2,
        max_subnets = 2^6,
        mask = {255, 255, 255, 0},
        mask_bits = 24,
        host_bits = 8
    }
    local class_defaults = {
        ["A"] = class_a_defaults,
        ["B"] = class_b_defaults,
        ["C"] = class_c_defaults
    }

    local data = {mask = {}}

    -------------------------------------------------------------------------
    local function format_address_bitmap(bits_of_mask, subnet_bits, class)

        local text = ""
        local start = 1
        local netchar = "n"

        if class == "A" then
            text = "0"
            start = 2
        elseif class == "B" then
            text = "10"
            start = 3
        elseif class == "C" then
            text = "110"
            start = 4
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

        for i = bits_of_mask + 1, 32, 1 do
            text = text .. "h"
            if i % 8 == 0 and i ~=32 then
                text = text .. "."
            end
        end

        return text .. "\n"

    end -- format_address_bitmap()

    -------------------------------------------------------------------------
    local function display_results(win)

        win:set(
            "Class:                  " .. data.class .. "\n" ..
            "Number of Hosts/Subnet: " .. data.hosts_per_subnet .. "\n" ..
            "Number of Subnets:      " .. data.subnets .. "\n" ..
            "Subnet Bits:            " .. data.subnet_bits .. "\n" ..
            "Network Mask:           " ..
                string.format("%d.%d.%d.%d (/%d)\n",
                    data.mask[1], data.mask[2], data.mask[3], data.mask[4], data.mask_bits) ..
            "Wildcard Mask:          " ..
                string.format("%d.%d.%d.%d\n",
                    bit32.band(bit32.bnot(data.mask[1]), 0xff),
                    bit32.band(bit32.bnot(data.mask[2]), 0xff),
                    bit32.band(bit32.bnot(data.mask[3]), 0xff),
                    bit32.band(bit32.bnot(data.mask[4]), 0xff)) ..
            "Address Bitmap:         " ..
                format_address_bitmap(data.mask_bits, data.subnet_bits, data.class)
        )

    end -- display_results()

    -------------------------------------------------------------------------
    local function set_class(c)

        if c ~= "A" and c ~= "B" and c ~= "C" then
            return false
        end

        data.class = class_defaults[c].class
        data.max_hosts_per_subnet = class_defaults[c].max_hosts_per_subnet
        data.hosts_per_subnet = data.max_hosts_per_subnet
        data.subnets = 1
        data.max_subnets = class_defaults[c].max_subnets
        data.mask[1] = class_defaults[c].mask[1]
        data.mask[2] = class_defaults[c].mask[2]
        data.mask[3] = class_defaults[c].mask[3]
        data.mask[4] = class_defaults[c].mask[4]
        data.mask_bits = class_defaults[c].mask_bits
        data.host_bits = class_defaults[c].host_bits
        data.subnet_bits = 0

        return true

    end -- set_class()

    -------------------------------------------------------------------------
    local win = TextWindow.new("Mask Maker")

    set_class("C")
    display_results(win)

    --[ BUTTONS ]vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    --[ Copy To Clipboard ]
    win:add_button("Copy To Clipboard", function()
        copy_to_clipboard(win:get_text())
    end)

     --[ Class ]
    win:add_button("Class", function()

        local function get_class(inputstr)

            if #inputstr ~= 1 then return end

            local class = string.match(inputstr, "%a")
            if class ~= nil then
                if set_class(string.upper(class)) then
                    display_results(win)
                end
            end
        end -- get_class()

        new_dialog("Class", get_class, "Class (A, B or C)")
    end)

    --[ Hosts/Subnet ]
    win:add_button("Number of Hosts/Subnet", function()

        local function get_hosts_per_subnet(inputstr)

            local hosts_per_subnet = tonumber(inputstr)
            if hosts_per_subnet == nil then return end
            if hosts_per_subnet < 1 then return end
            if hosts_per_subnet > data.max_hosts_per_subnet then return end

            local host_bits = 2
            while 2^host_bits <= hosts_per_subnet do
                host_bits = host_bits + 1
            end

            if data.class == "A" then
                data.subnet_bits = 24 - host_bits
                data.subnets = 2^data.subnet_bits

                local tmp = bit32.band(bit32.lshift(0xffffff, 24 - data.subnet_bits), 0xffffff)
                data.mask[2] = bit32.rshift(tmp, 16)
                data.mask[3] = bit32.band(bit32.rshift(tmp, 8), 0xff)
                data.mask[4] = bit32.band(tmp, 0xff)
            elseif data.class == "B" then
                data.subnet_bits = 16 - host_bits
                data.subnets = 2^data.subnet_bits

                local tmp = bit32.band(bit32.lshift(0xffff, 16 - data.subnet_bits), 0xffff)
                data.mask[3] = bit32.rshift(tmp, 8)
                data.mask[4] = bit32.band(tmp, 0xff)
            elseif data.class == "C" then
                data.subnet_bits = 8 - host_bits
                data.subnets = 2^data.subnet_bits
                data.mask[4] = bit32.band(bit32.lshift(0xff, 8 - data.subnet_bits), 0xff)
            end

            data.hosts_per_subnet = 2^host_bits - 2
            data.host_bits = host_bits
            data.mask_bits = 32 - host_bits
            display_results(win)

        end -- get_hosts_per_subnet()

        new_dialog("Number of Hosts/Subnet", get_hosts_per_subnet, "Number of Hosts/Subnet (1-" .. data.max_hosts_per_subnet .. ")")
    end)

    --[ Number of Subnets ]
    win:add_button("Number of Subnets", function()

        local function get_subnets(inputstr)

            local subnets = tonumber(inputstr)
            if subnets == nil then return end
            if subnets < 1 then return end
            if subnets > data.max_subnets then return end

            local subnet_bits = 0
            while 2^subnet_bits < subnets do
                subnet_bits = subnet_bits + 1
            end

            data.subnets = 2^subnet_bits
            if data.class == "A" then
                local tmp = bit32.band(bit32.lshift(0xffffff, 24 - subnet_bits), 0xffffff)
                data.mask[2] = bit32.rshift(tmp, 16)
                data.mask[3] = bit32.band(bit32.rshift(tmp, 8), 0xff)
                data.mask[4] = bit32.band(tmp, 0xff)
                data.hosts_per_subnet = (2^(24 - subnet_bits)) - 2
                data.host_bits = 24 - subnet_bits
            elseif data.class == "B" then
                local tmp = bit32.band(bit32.lshift(0xffff, 16 - subnet_bits), 0xffff)
                data.mask[3] = bit32.rshift(tmp, 8)
                data.mask[4] = bit32.band(tmp, 0xff)
                data.hosts_per_subnet = (2^(16 - subnet_bits)) - 2
                data.host_bits = 16 - subnet_bits
            elseif data.class == "C" then
                data.mask[4] = bit32.band(bit32.lshift(0xff, 8 - subnet_bits), 0xff)
                data.hosts_per_subnet = (2^(8 - subnet_bits)) - 2
                data.host_bits = 8 - subnet_bits
            end

            data.mask_bits = 32 - data.host_bits
            data.subnet_bits = subnet_bits
            display_results(win)

        end -- get_subnets()

        new_dialog("Number of Subnets", get_subnets, "Number of Subnets (1-" .. data.max_subnets .. ")")
    end)
    --[ BUTTONS ]^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    win:set_atclose(function()
    end)

end -- maskmaker_window()

register_menu("Mask Maker", maskmaker_window, MENU_TOOLS_UNSORTED)
