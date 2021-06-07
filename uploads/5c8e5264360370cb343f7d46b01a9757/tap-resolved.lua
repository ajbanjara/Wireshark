--[[
    A tap that displays sorted resolved data in a GUI menu.
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

-- Ref: https://gitlab.com/wireshark/wireshark/-/issues/16419

local tap_resolved_info =
{
    version = "1.15",
    author = "Christopher Maynard",
    description = "A tap that displays sorted resolved data in a GUI menu",
}

set_plugin_info(tap_resolved_info)

if not gui_enabled() then
    return
end

if get_version() < "3.2.0" then
    print("Upgrade Wireshark to at least version 3.2.0!")

    function resolved_items_disabled_window()
        local tapwin = TextWindow.new("Resolved Items")
        tapwin:set(
            "tap-resolved.lua Error:\n\n" ..
            "Upgrade Wireshark to at least version 3.2.0 to use this feature."
        )
    end -- resolved_items_disabled_window()
    register_menu("Resolved Items", resolved_items_disabled_window, MENU_TOOLS_UNSORTED)
    return
end

--[[
    TODO?
    $ tshark -G fields | grep -i "resolved" | wc -l
    24

    $ tshark -G fields | grep -i "oui" | wc -l
    73
--]]
local eth_addr = Field.new("eth.addr")
local eth_addr_resolved = Field.new("eth.addr_resolved")
local eth_addr_oui_resolved = Field.new("eth.addr.oui_resolved")
local wlan_addr = Field.new("wlan.addr")
local wlan_addr_resolved = Field.new("wlan.addr_resolved")

local vlan_id = Field.new("vlan.id")
local vlan_id_name = Field.new("vlan.id_name")
local ipx_net = Field.new("ipx.net")
local snmp_name = Field.new("snmp.name")

local ip_addr = Field.new("ip.addr")
local ip_host = Field.new("ip.host")
local ipv6_addr = Field.new("ipv6.addr")
local ipv6_host = Field.new("ipv6.host")

local tcp_port = Field.new("tcp.port")
local udp_port = Field.new("udp.port")
local dccp_port = Field.new("dccp.port")
local sctp_port = Field.new("sctp.port")

-- Number of instances of the tap created so far
local instances = 0

function resolved_items_window()

    instances = instances + 1

    --[[
        The tap data, locally accessible by every function of the tap
        beware not to use a global for taps with multiple instances or you might
        find it been written by more instances of the tap, not what we want.
        each tap will have its own private instance of tapdata.
    --]]
    local tapdata = {
        mac_oui = {},
        mac_addr = {},
        ip = {},
        ipv6 = {},
        ports = {},
        vlan = {},
        ipxnet = {},
        snmp = {}
    }

    local taptext = {
        mac_oui = "",
        mac_addr = "",
        ip = "",
        ipv6 = "",
        ports = "",
        vlan = "",
        ipxnet = "",
        snmp = "",
        misc = "",
        all = ""
    }

    -- Declare the window we will use
    -- TODO: Too bad we can't add the capture file name to the title ... yet?
    local tapwin = TextWindow.new(
        "Resolved Items (Tap #" .. instances .. ": " .. os.date() .. ")"
    )
    tapwin:set("")

    --[ Text Builders ]vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    local function build_mac_oui_text()
        taptext.mac_oui = ""

        --Sort
        local a = {}
        for n in pairs(tapdata.mac_oui) do
            table.insert(a, n)
        end
        table.sort(a)

        --Build the text one line at a time
        for i, n in ipairs(a) do
            local line = string.format("%-39s\t%s\n",
                tapdata.mac_oui[n].oui, tapdata.mac_oui[n].resolved)
            taptext.mac_oui = taptext.mac_oui .. line
        end

        if string.len(taptext.mac_oui) > 0 then
            taptext.mac_oui = string.format("%-39s\tName\n", "OUI") .. taptext.mac_oui .. "\n"
        end
        return taptext.mac_oui
    end -- build_mac_oui_text()

    local function build_mac_addr_text()
        taptext.mac_addr = ""

        --Sort
        local a = {}
        for n in pairs(tapdata.mac_addr) do
            table.insert(a, n)
        end
        table.sort(a)

        --Build the text one line at a time
        for i, n in ipairs(a) do
            local line = string.format("%-39s\t%-20s\n", -- \t%s
                tapdata.mac_addr[n].address, tapdata.mac_addr[n].resolved)
                --, tapdata.mac_addr[n].mtype)
            taptext.mac_addr = taptext.mac_addr .. line
        end

        if string.len(taptext.mac_addr) > 0 then
            -- \tType
            taptext.mac_addr = string.format("%-39s\t%-20s\n", "MAC", "Name") .. taptext.mac_addr .. "\n"
        end
        return taptext.mac_addr
    end -- build_mac_addr_text()

    local function build_ip_text()
        taptext.ip = ""

        --Sort
        local a = {}
        for n in pairs(tapdata.ip) do
            table.insert(a, n)
        end
        table.sort(a)

        --Build the text one line at a time
        for i, n in ipairs(a) do
            local line = string.format("%-39s\t%s\n",
                tapdata.ip[n].address, tapdata.ip[n].resolved)
            taptext.ip = taptext.ip .. line
        end

        if string.len(taptext.ip) > 0 then
            taptext.ip = string.format("%-39s\tName\n", "IP Address") .. taptext.ip .. "\n"
        end
        return taptext.ip
    end -- build_ip_text()

    local function build_ipv6_text()
        taptext.ipv6 = ""

        --Sort
        local a = {}
        for n in pairs(tapdata.ipv6) do
            table.insert(a, n)
        end
        table.sort(a)

        --Build the text one line at a time
        for i, n in ipairs(a) do
            local line = string.format("%-39s\t%s\n",
                tapdata.ipv6[n].address, tapdata.ipv6[n].resolved)
            taptext.ipv6 = taptext.ipv6 .. line
        end

        if string.len(taptext.ipv6) > 0 then
            taptext.ipv6 = string.format("%-39s\tName\n", "IPv6 Address") .. taptext.ipv6 .. "\n"
        end
        return taptext.ipv6
    end -- build_ipv6_text()

    local function build_ports_text()
        taptext.ports = ""

        --Sort
        local a = {}
        for n in pairs(tapdata.ports) do
            table.insert(a, n)
        end
        table.sort(a)

        --Build the text one line at a time
        for i, n in ipairs(a) do
            local line = string.format("%-39s\t%-20s\t%s\n",
                n, tapdata.ports[n].name, tapdata.ports[n].ptype)
            taptext.ports = taptext.ports .. line
        end

        if string.len(taptext.ports) > 0 then
            taptext.ports = string.format("%-39s\t%-20s\tType\n", "Port", "Name") .. taptext.ports .. "\n"
        end
        return taptext.ports
    end -- build_ports_text()

    local function build_misc_text()

        local function build_vlan_text()
            taptext.vlan = ""

            --Sort
            local a = {}
            for n in pairs(tapdata.vlan) do
                table.insert(a, n)
            end
            table.sort(a)

            --Build the text one line at a time
            for i, n in ipairs(a) do
                local line = string.format("%-39s\t%s\n",
                    tapdata.vlan[n].vlan, tapdata.vlan[n].name)
                taptext.vlan = taptext.vlan .. line
            end

            if string.len(taptext.vlan) > 0 then
                taptext.vlan = string.format("%-39s\tName\n", "VLAN") .. taptext.vlan .. "\n"
            end
            return taptext.vlan
        end -- build_vlan_text()

        local function build_ipxnet_text()
            taptext.ipxnet = ""

            --Sort
            local a = {}
            for n in pairs(tapdata.ipxnet) do
                table.insert(a, n)
            end
            table.sort(a)

            --Build the text one line at a time
            for i, n in ipairs(a) do
                local line = string.format("%-39s\t%s\n",
                    tapdata.ipxnet[n].network, tapdata.ipxnet[n].name)
                taptext.ipxnet = taptext.ipxnet .. line
            end

            if string.len(taptext.ipxnet) > 0 then
                taptext.ipxnet = string.format("%-39s\tName\n", "IPX Network") .. taptext.ipxnet .. "\n"
            end
            return taptext.ipxnet
        end -- build_ipxnet_text()

        local function build_snmp_text()
            taptext.snmp = ""

            --Sort
            local a = {}
            for n in pairs(tapdata.snmp) do
                table.insert(a, n)
            end
            table.sort(a)

            --Build the text one line at a time
            for i, n in ipairs(a) do
                local line = string.format("%-39s\t%s\n",
                    tapdata.snmp[n].oid, tapdata.snmp[n].name)
                taptext.snmp = taptext.snmp .. line
            end

            if string.len(taptext.snmp) > 0 then
                taptext.snmp = string.format("%-39s\tName\n", "SNMP OID") .. taptext.snmp .. "\n"
            end
            return taptext.snmp
        end -- build_snmp_text()

        taptext.misc =
            build_vlan_text() ..
            build_ipxnet_text() ..
            build_snmp_text()

        return taptext.misc
    end -- build_misc_text()

    local function build_all_text()
        taptext.all = build_mac_oui_text() ..
            build_mac_addr_text() ..
            build_ip_text() ..
            build_ipv6_text() ..
            build_ports_text() ..
            build_misc_text() .. "\n"
        return taptext.all
    end -- build_all_text()
    --[ Text Builders ]^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    --[ BUTTONS ]vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    --[ ALL ] Show all resolved items
    tapwin:add_button("ALL", function()
        tapwin:set(taptext.all)
    end)

    --[ OUI ] Show all resolved MAC OUIs
    tapwin:add_button("OUI", function()
        tapwin:set(taptext.mac_oui)
    end)

    --[ MAC ] Show all resolved MAC Addresses
    tapwin:add_button("MAC", function()
        tapwin:set(taptext.mac_addr)
    end)

    --[ IP ] Show all resolved IP addresses
    tapwin:add_button("IP", function()
        tapwin:set(taptext.ip)
    end)

     --[ IPv6 ] Show all resolved IPv6 addresses
    tapwin:add_button("IPv6", function()
        tapwin:set(taptext.ipv6)
    end)

     --[ Ports ] Show all resolved ports
    tapwin:add_button("Ports", function()
        tapwin:set(taptext.ports)
    end)

     --[ Misc ] Show misc. resolved items (vlans, ipxnets, snmp OIDs, ss7pcs, ...)
    tapwin:add_button("Misc", function()
        tapwin:set(taptext.misc)
    end)

     --[ Copy ] Copy the current window text to the clipboard
    tapwin:add_button("Copy", function()
        copy_to_clipboard(tapwin:get_text())
    end)

     --[ Search ] Search for and display lines containing the given text
    tapwin:add_button("Search", function()

        local function do_search(inputstr)
            if inputstr == nil or string.len(inputstr) < 1 then
                -- No search string was entered - abandon ship
                return
            end

            local cur_text = tapwin:get_text()
            local new_text = "Search results:\n\n"
            local line

            for line in string.gmatch(cur_text, "[^\r\n]+") do
                if string.find(line, inputstr) then
                    new_text = new_text .. line .. "\n"
                end
            end
            tapwin:set(new_text)

        end -- do_search()

        new_dialog("Search", do_search, "Enter search string")
    end)
    --[ BUTTONS ]^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    -- Our taps: Add more as needed/desired
    local taps = {
        mac_addr = Listener.new("frame", "eth.addr or wlan.addr"),
        ip = Listener.new("frame", "ip.addr"),
        ipv6 = Listener.new("frame", "ipv6.addr"),

        ports = Listener.new("frame",
            -- The applicable port filters; add more as needed.
            "tcp.port or udp.port or sctp.port or dccp.port"
        ),
        misc = Listener.new("frame", "vlan.id or ipx.net or snmp.name")
    }

    -- Callback to remove the taps when the window closes
    local function remove_taps()
        taps.mac_addr:remove()
        taps.ip:remove()
        taps.ipv6:remove()
        taps.ports:remove()
        taps.misc:remove()
    end -- remove_taps()

    -- Make sure the taps don't hang around after the window was closed
    tapwin:set_atclose(remove_taps)

    --[[
        The taps.foo.packet() function will be called for every packet that
        matches the respective filter.
    --]]
    function taps.mac_addr.packet(pinfo, tvb)

        local function mac_add_tapdata(addr_ex, addr_resolved_ex, addr_oui_resolved_ex, mt)

            if addr_ex ~= nil then
                local i
                for i in pairs(addr_ex) do
                    local addr = addr_ex[i]
                    local addr_tvb = addr_ex[i].range
                    local addr_bytes_str = tostring(addr_tvb)
                    local name = addr_resolved_ex[i]
                    local addr_str = string.format("%02x:%02x:%02x:%02x:%02x:%02x",
                        addr_tvb(0, 1):uint(), addr_tvb(1, 1):uint(), addr_tvb(2, 1):uint(),
                        addr_tvb(3, 1):uint(), addr_tvb(4, 1):uint(), addr_tvb(5, 1):uint())

                    tapdata.mac_addr[addr_bytes_str] = {
                        address = addr_str,
                        resolved = name and tostring(name) or addr_str,
                        mtype = mt
                    }

                    if addr_oui_resolved_ex then
                        local oui_name = addr_oui_resolved_ex[i]
                        local oui_str = string.format("%02x:%02x:%02x",
                            addr_tvb(0, 1):uint(), addr_tvb(1, 1):uint(), addr_tvb(2, 1):uint())
                        tapdata.mac_oui[addr_tvb(0, 3):uint()] = {
                            oui = oui_str,
                            resolved = oui_name and tostring(oui_name) or oui_str
                        }
                    end
                end
            end
        end -- mac_add_tapdata()

        if eth_addr() ~= nil then
            mac_add_tapdata({eth_addr()}, {eth_addr_resolved()}, {eth_addr_oui_resolved()}, "eth")
        end

        if wlan_addr() ~= nil then
            mac_add_tapdata({wlan_addr()}, {wlan_addr_resolved()}, nil, "wlan")
        end

    end -- taps.mac_addr.packet()

    function taps.ip.packet(pinfo, tvb)
        local ip_addr_ex = {ip_addr()}
        local ip_host_ex = {ip_host()}
        local i

        for i in pairs(ip_addr_ex) do
            local addr = ip_addr_ex[i]
            local addr_val = ip_addr_ex[i].range:uint()
            local host = ip_host_ex[i]

            tapdata.ip[addr_val] = {
                address = tostring(addr),
                resolved = tostring(host)
            }
        end
    end -- taps.ip.packet()

    function taps.ipv6.packet(pinfo, tvb)
        local ipv6_addr_ex = {ipv6_addr()}
        local ipv6_host_ex = {ipv6_host()}
        local i

        for i in pairs(ipv6_addr_ex) do
            local addr = ipv6_addr_ex[i]
            local host = ipv6_host_ex[i]
            local addr_bytes_str = tostring(ipv6_addr_ex[i].range)

            tapdata.ipv6[addr_bytes_str] = {
                address = tostring(addr),
                resolved = tostring(host)
            }
        end
    end -- taps.ipv6.packet()

    function taps.ports.packet(pinfo, tvb)

        local function ports_add_tapdata(ex, pt)
            local i
            for i in pairs(ex) do
                local port = ex[i].value
                local port_name = {}
                local port_type

                -- Set the port type(s)
                if tapdata.ports[port] == nil then
                    port_type = pt
                else
                    port_type = tapdata.ports[port].ptype
                    if string.find(port_type, pt) == nil then
                        port_type = port_type .. "," .. pt
                    end
                end

                -- Extract the port name
                port_name[1] = ex[i].display:match("(.+)(%s)(.+)")
                tapdata.ports[port] = {
                    name = port_name[1],
                    ptype = port_type
                }
            end
        end -- ports_add_tapdata()

        if tcp_port() ~= nil then
            ports_add_tapdata({tcp_port()}, "tcp")
        end
        if udp_port() ~= nil then
            ports_add_tapdata({udp_port()}, "udp")
        end
        if dccp_port() ~= nil then
            ports_add_tapdata({dccp_port()}, "dccp")
        end
        if sctp_port() ~= nil then
            ports_add_tapdata({sctp_port()}, "sctp")
        end
    end -- taps.ports.packet()

    function taps.misc.packet(pinfo, tvb)

        if vlan_id() ~= nil then
            local vlan_id_ex = {vlan_id()}
            local vlan_id_name_ex = {vlan_id_name()}
            local i

            for i in pairs(vlan_id_ex) do
                tapdata.vlan[i] = {
                    vlan = vlan_id_ex[i].value,
                    name = tostring(vlan_id_name_ex[i])
                }
            end
        end

        if ipx_net() ~= nil then
            local ipx_net_ex = {ipx_net()}
            local i

            for i in pairs(ipx_net_ex) do
                local ipx_net_tvb = ipx_net_ex[i].range
                local ipx_net_str = string.format("%02x:%02x:%02x:%02x",
                    ipx_net_tvb(0, 1):uint(), ipx_net_tvb(1, 1):uint(),
                    ipx_net_tvb(2, 1):uint(), ipx_net_tvb(3, 1):uint())
                local ipx_net_val = ipx_net_ex[i].range:uint()
                local ipx_net_name = {}

                -- Extract the IPX network name
                ipx_net_name[1] = ipx_net_ex[i].display:match("(.+)(%s)(.+)")
                tapdata.ipxnet[ipx_net_val] = {
                    network = ipx_net_str,
                    name = ipx_net_name[1]
                }
            end
        end

        if snmp_name() ~= nil then
            local snmp_name_ex = {snmp_name()}
            local i

            for i in pairs(snmp_name_ex) do
                local oid_name = {}
                local oid_bytes_str = tostring(snmp_name_ex[i].range)

                -- Extract the OID name
                oid_name[1], oid_name[2], oid_name[3], oid_name[4] = snmp_name_ex[i].display:match("(.+)(%s+)(%()(.+)(%))")
                tapdata.snmp[oid_bytes_str] = {
                    oid = oid_name[1],
                    name = oid_name[4]
                }
            end
        end

    end -- taps.misc.packet()

    --[[
        The taps.foo.draw() function will be called once every few seconds to
        redraw the window, but since we're only building a static snapshot
        of resolved addresses once the window is first created, these
        functions do nothing.  If you want updated information, for example,
        during a live capture, then you'll need to open a new window for the
        information to be updated.
    --]]
    function taps.mac_addr.draw()
    end -- taps.mac_addr.draw()

    function taps.ip.draw()
    end -- taps.ip.draw()

    function taps.ipv6.draw()
    end -- taps.ipv6.draw()

    function taps.ports.draw()
    end -- taps.ports.draw()

    function taps.misc.draw()
    end -- taps.misc.draw()

    --[[
        The taps.foo.reset() function will be called whenever a reset is needed
        e.g. when reloading the capture file.  Except in this case, reloading
        the capture file is just going to cause the same data to be populated,
        and clearing the window also means we wouldn't be able to keep the
        old window data around when a new capture file is loaded, which could
        come in handy if we wanted to compare a set of resolved data from one
        capture file to the next.  Therefore, don't actually reset anything.
    --]]
    function taps.mac_addr.reset()
        --[[
            tapwin:clear()
            tapdata.mac_oui = {}
            tapdata.mac_addr = {}
            taptext.mac_oui = {}
            taptext.mac_addr = {}
        --]]
    end -- taps.mac_addr.reset()

    function taps.ip.reset()
        --[[
            tapwin:clear()
            tapdata.ip = {}
            taptext.ip = {}
        --]]
    end -- taps.ip.reset()

    function taps.ipv6.reset()
        --[[
            tapwin:clear()
            tapdata.ipv6 = {}
            taptext.ipv6 = {}
        --]]
    end -- taps.ipv6.reset()

    function taps.ports.reset()
        --[[
            tapwin:clear()
            tapdata.ports = {}
            taptext.ports = {}
        --]]
    end -- taps.ports.reset()

    function taps.misc.reset()
        --[[
            tapwin:clear()
            tapdata.vlan = {}
            taptext.vlan = {}
            tapdata.ipxnet = {}
            taptext.ipxnet = {}
            tapdata.snmp = {}
            taptext.snmp = {}
        --]]
    end -- taps.misc.reset()

    -- Ensure that all existing packets are processed.
    retap_packets()

    -- Build all the text strings, then display everything
    tapwin:set(build_all_text())

end -- resolved_items_window()

--[[
    Optional 3rd parameter to register_menu.
    See https://www.wireshark.org/docs/wsdg_html_chunked/lua_module_Gui.html#global_functions_Gui
    If omitted, defaults to MENU_STAT_GENERIC. Other options include:

    MENU_STAT_UNSORTED (Statistics),
    MENU_STAT_GENERIC (Statistics, first section),
    MENU_STAT_CONVERSATION (Statistics/Conversation List),
    MENU_STAT_ENDPOINT (Statistics/Endpoint List),
    MENU_STAT_RESPONSE (Statistics/Service Response Time),
    MENU_STAT_TELEPHONY (Telephony),
    MENU_STAT_TELEPHONY_ANSI (Telephony/ANSI),
    MENU_STAT_TELEPHONY_GSM (Telephony/GSM),
    MENU_STAT_TELEPHONY_LTE (Telephony/LTE),
    MENU_STAT_TELEPHONY_MTP3 (Telephony/MTP3),
    MENU_STAT_TELEPHONY_SCTP (Telephony/SCTP),
    MENU_ANALYZE (Analyze),
    MENU_ANALYZE_CONVERSATION (Analyze/Conversation Filter),
    MENU_TOOLS_UNSORTED (Tools). (number)

    The only one that seems to work is MENU_TOOLS_UNSORTED, so use that one.
--]]
register_menu("Resolved Items", resolved_items_window, MENU_TOOLS_UNSORTED)

--print("tap-resolved registered")
