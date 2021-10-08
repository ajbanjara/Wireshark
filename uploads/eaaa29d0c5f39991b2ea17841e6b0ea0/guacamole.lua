--[[
    Guacamole Protocol Dissector.
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
    Refs:
        https://guacamole.apache.org/doc/gug/guacamole-architecture.html
        https://guacamole.apache.org/doc/gug/guacamole-protocol.html
        https://guacamole.apache.org/doc/gug/protocol-reference.html

    Suggested coloring rule colors?:
        #9da27a is a shade of yellow-green.
        #98a77d is a shade of green.
        #54800b Avocado
--]]

-- Plugin info
local info =
{
    version = "1.3",
    author = "Christopher Maynard",
    description = "Guacamole Protocol"
}

set_plugin_info(info)

-- Protocol
local p_guacp = Proto("GUACP", "Guacamole Protocol")

-- Fields
local pf = {
    length = ProtoField.uint32("guacp.len", "Length", base.DEC,
        nil, 0, "The length of the message"),
    instructions = ProtoField.uint32("guacp.instructions", "Instructions",
        base.DEC, nil, 0, "The number of instructions"),
    instruction = ProtoField.bytes("guacp.instruction", "Instruction", base.NONE),
    opcode = ProtoField.bytes("guacp.opcode", "Opcode", base.NONE),
    opcode_len = ProtoField.uint32("guacp.opcode.len", "Length", base.DEC),
    opcode_value = ProtoField.string("guacp.opcode.value", "Value", base.UNICODE),

    args = ProtoField.bytes("guacp.args", "Arguments", base.NONE),
    arg = ProtoField.bytes("guacp.arg", "Argument", base.NONE),
    arg_len = ProtoField.uint32("guacp.arg.len", "Length", base.DEC),
    arg_value = ProtoField.string("guacp.arg.value", "Value", base.UNICODE)

    --[[
        TODO: Add instruction-specific dissection?
        1) Drawing instructions: arc, cfill, clip, close, copy, cstroke,
           cursor, curve, dispose, distort, identity, lfill, line, lstroke,
           move, pop, push, rect, reset, set, shade, size, start, transfer,
           transform.
        2) Streaming instructions: ack, argv, audio, blob, clipboard, end,
           file, img, nest, pipe, video.
        3) Object instructions: body, filesystem, get, put, undefine.
        4) Client handshake instructions: audio, connect, image, select, size,
           timezone, video.
        5) Server handshake instructions: args.
        6) Client control instructions: disconnect, nop, sync.
        7) Server control instructions: disconnect, error, log, mouse, nop,
           ready, sync.
        8) Client events: key, mouse, size.
    --]]
}

-- Register protocol fields
p_guacp.fields = pf

-- Default settings
local GUACP_TCP_PORT = 4822

-- Preferences
local guacp_settings = {
    info = true,
    reassembly_enabled = true,
    tcp_port = GUACP_TCP_PORT
}
p_guacp.prefs.info = Pref.bool("Write to Info column", guacp_settings.info,
    "Whether to write information to the Info column or not")
p_guacp.prefs.reassembly_enabled = Pref.bool("Reassembly enabled",
    guacp_settings.reassembly_enabled)
p_guacp.prefs.tcp_port = Pref.uint("TCP port", guacp_settings.tcp_port,
    "The Guacamole TCP port number (default=" .. GUACP_TCP_PORT .. ")")

-----------------------------------------------------------------------------
local function col_clear(col, allowed)

    if allowed then
        col:clear()
    end

end -- col_clear()

-----------------------------------------------------------------------------
local function col_append_sep_str(col, sep, str, allowed)

    if allowed then
        local colstr = tostring(col)

        if colstr:len() > 0 then
            col:append(sep)
        end
        col:append(str)
    end

end -- col_append_sep_str()

-------------------------------------------------------------------------
function p_guacp.prefs_changed()

    if guacp_settings.tcp_port ~= p_guacp.prefs.tcp_port then
        -- remove old one, if not 0
        if p_guacp.prefs.tcp_port ~= 0 then
            DissectorTable.get("tcp.port"):remove(guacp_settings.tcp_port, p_guacp)
        end

        -- set our new default
        guacp_settings.tcp_port = p_guacp.prefs.tcp_port

        -- add new one, if not 0
        if guacp_settings.tcp_port ~= 0 then
            DissectorTable.get("tcp.port"):add(guacp_settings.tcp_port, p_guacp)
        end
    end

end -- p_guacp.prefs_changed()

-------------------------------------------------------------------------
local function get_length(tvbuf, off, max_off)

    local length = 0

    while off < max_off do
        length = length * 10 + (tvbuf(off, 1):uint() - string.byte("0"))
        off = off + 1
    end

    return length

end -- get_length()

-------------------------------------------------------------------------
local function find_dot(tvbuf, offset)

    local dot_off = 0

    while offset < tvbuf():len() and dot_off == 0 do
        if tvbuf(offset, 1):uint() == string.byte(".") then
            dot_off = offset
        end
        offset = offset + 1
    end

    return dot_off

end -- find_dot()

-------------------------------------------------------------------------
local function find_instruction_terminator(tvbuf, offset)

    local length
    local dot_off
    local delim_off

    -- Find the terminating ';'
    while offset < tvbuf():len() do
        dot_off = find_dot(tvbuf, offset)
        if dot_off == 0 then
            return tvbuf():len()
        end

        length = get_length(tvbuf, offset, dot_off)
        delim_off = dot_off + 1 + length
        if tvbuf(delim_off, 1):uint() == string.byte(";") then
            return delim_off
        else
            offset = delim_off + 1
        end
    end

    return offset

end -- find_instruction_terminator()

-------------------------------------------------------------------------
local function find_opcode_delimiters(tvbuf, offset)

    -- Find the '.'
    local dot_off = find_dot(tvbuf, offset)
    if dot_off == 0 then
        return 0, 0, 0
    end

    -- Now find the 1st ',' or ';'
    local delim_off = dot_off + 1
    while delim_off < tvbuf():len() do
        if tvbuf(delim_off, 1):uint() == string.byte(",") then
            return dot_off, delim_off, string.byte(",")
        elseif tvbuf(delim_off, 1):uint() == string.byte(";") then
            return dot_off, delim_off, string.byte(";")
        else
            delim_off = delim_off + 1
        end
    end

    -- A deliminator wasn't found.
    return dot_off, delim_off, 0

end -- find_opcode_delimiters()

-------------------------------------------------------------------------
local function dissect_opcode(tvbuf, pinfo, tree, offset)

    local opcode_tree
    local dot_off, delim_off, delim = find_opcode_delimiters(tvbuf, offset)

    if delim == 0 then
        return delim_off, delim
    end

    opcode_tree = tree:add(pf.opcode, tvbuf(offset, (delim_off + 1) - offset))

    local opcode_len = get_length(tvbuf, offset, dot_off)
    opcode_tree:add(pf.opcode_len, tvbuf(offset, (dot_off - offset)), opcode_len)

    local opcode_value = tvbuf(dot_off + 1, opcode_len):string(ENC_UNICODE)
    opcode_tree:add(pf.opcode_value, tvbuf(dot_off + 1, opcode_len), opcode_value)
    opcode_tree:set_text("Opcode: " .. opcode_value)
    tree:append_text(opcode_value)
    col_append_sep_str(pinfo.cols.info, "; ", opcode_value, p_guacp.prefs.info)

    return delim_off, delim

end -- dissect_opcode()

-------------------------------------------------------------------------
local function dissect_arg(tvbuf, pinfo, tree, offset, count)

    local arg_tree
    local dot_off = find_dot(tvbuf, offset)

    if dot_off == 0 then
        return tvbuf:len(), 0
    end

    local arg_len = get_length(tvbuf, offset, dot_off)
    local delim_off = dot_off + arg_len + 1
    local delim = tvbuf(delim_off, 1):uint()

    arg_tree = tree:add(pf.arg, tvbuf(offset, ((dot_off + 1) - offset) + arg_len + 1)) :
        set_text("Argument " .. count .. ": ")

    if delim ~= string.byte(",") and delim ~= string.byte(";") then
        return delim_off, 0
    end

    arg_tree:add(pf.arg_len, tvbuf(offset, (dot_off - offset)), arg_len)

    local arg_value = tvbuf(dot_off + 1, arg_len):string(ENC_UNICODE)
    arg_tree:add(pf.arg_value, tvbuf(dot_off + 1, arg_len), arg_value)
    arg_tree:append_text(arg_value)
    tree:append_text(arg_value .. " ")

    return delim_off, delim

end -- dissect_arg()

-------------------------------------------------------------------------
local function dissect_instruction(tvbuf, pinfo, tree, offset, count)

    local off = find_instruction_terminator(tvbuf, offset)
    local instr_tree
    local delim_off, delim
    local arg_count = 0
    local args_tree

    local dot_off = find_dot(tvbuf, offset)
    if dot_off == 0 then
        return tvbuf():len()
    end

    -- Dissect the opcode
    instr_tree = tree:add(pf.instruction, tvbuf(offset, (off + 1) - offset)):
        set_text("Instruction " .. count .. ": ")
    delim_off, delim = dissect_opcode(tvbuf, pinfo, instr_tree, offset)

    -- Dissect all args
    if delim == string.byte(",") then
        delim_off = delim_off + 1
        args_tree = instr_tree:add(pf.args, tvbuf(delim_off, (off + 1) - delim_off)):
            set_text("")
        while delim == string.byte(",") and delim_off <= off do
            arg_count = arg_count + 1
            delim_off, delim = dissect_arg(tvbuf, pinfo, args_tree, delim_off, arg_count)
            delim_off = delim_off + 1
        end
        args_tree:prepend_text("Arguments (" .. arg_count .. "): ")
    end

    return off + 1

end -- dissect_instruction()

-------------------------------------------------------------------------
local function dissect_message(tvbuf, pinfo, tree)

    local offset = 0
    local count = 0

    -- Dissect each instruction
    while offset < tvbuf():len() do
        count = count + 1
        offset = dissect_instruction(tvbuf, pinfo, tree, offset, count)
    end

    return count

end -- dissect_message()

-------------------------------------------------------------------------
-- Check for the instruction termination character, ';'.
local function checkTerminator(tvbuf)

    local msglen = tvbuf:len()

    if msglen <= 0 then
        return 0
    end

    if p_guacp.prefs.reassembly_enabled == false then
        return msglen
    end

    -- Check if capture was only capturing partial packet size
    if msglen ~= tvbuf:reported_length_remaining(0) then
        --[[
            Captured packets are being sliced/cut-off, so don't try to
            desegment/reassemble.
        --]]
        return msglen
    end

    --[[
        Check if the instruction termination character ';' is the last
        character in the buffer or not.  If it isn't, we'll need at least
        one more segment.  If it is, then assume this is the end of an
        instruction even though it's possible it's a character in one of the
        arguments to an opcode.  Hopefully that's never the case because it
        will almost certainly mean incorrect dissection will result.  I
        don't have any other good ideas as to how to mitigate this though.
    --]]
    if tvbuf(msglen - 1, 1):uint() ~= string.byte(";") then
        return -DESEGMENT_ONE_MORE_SEGMENT
    else
        return msglen
    end

end -- checkTerminator()

-------------------------------------------------------------------------
-- Main Dissection
function p_guacp.dissector(tvbuf, pinfo, tree)

    local result = checkTerminator(tvbuf)
    local count

    if result == 0 then
        --[[
            If the result is 0, then it means we hit an error of some
            kind, so return 0, which tells Wireshark this packet is not
            for us.  Wireshark will then try heuristic dissectors or the
            plain "data" dissector.
        --]]
        return 0
    elseif result < 0 then
        --[[
            We need more bytes, so set the desegment_offset to what we
            already consumed, and the desegment_len to how many more
            are needed
        --]]
        pinfo.desegment_offset = 0

        -- Invert the negative result so it's a positive number
        result = -result

        pinfo.desegment_len = result

        --[[
            Even though we need more bytes, this packet is for us, so we
            tell wireshark all of its bytes are for us by returning the
            number of Tvb bytes we "successfully processed", namely the
            length of the Tvb
        --]]
        return tvbuf:len()
    end

    -- Set the protocol column to show our protocol name
    pinfo.cols.protocol = "GUACP"
    col_clear(pinfo.cols.info, p_guacp.prefs.info)

    -- We start by adding our protocol to the dissection display tree.
    local guacp_tree = tree:add(p_guacp, tvbuf:range(0))
    guacp_tree:append_text(", " .. result .. " bytes")
    guacp_tree:add(pf.length, tvbuf(0, 0), result):set_generated()

    count = dissect_message(tvbuf, pinfo, guacp_tree)
    guacp_tree:append_text(", " .. count .. " instruction" .. ((count == 1) and "" or "s") )
    guacp_tree:add(pf.instructions, tvbuf(0, 0), count):set_generated()

    return tvbuf:len()

end -- p_guacp.dissector()

-------------------------------------------------------------------------
-- Registration
local tcp_port_table = DissectorTable.get("tcp.port")
tcp_port_table:add(guacp_settings.tcp_port, p_guacp)
