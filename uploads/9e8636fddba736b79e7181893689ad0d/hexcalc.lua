-- hexcalc.lua
-- What is 2147483648 in hex or 0x05c0 in decimal?
-- Wireshark gui doesn't always provide the base wanted.
-------------------------------------------------------
-- Mon Sep 26 22:02:17 CDT 2022 - Initial release


-- Step 1 - document as you go. See header above and set_plugin_info().
local hexcalc_info =
{
    version = "1.0.0",
    author = "Chuck Craft",
    description = "Simple hex/decimal base conversion",
    repository = "Floppy in top drawer"
}

set_plugin_info(hexcalc_info)

if not gui_enabled() then return end

-- convert text number string to Uint64 value
local function text2uint64(textin)
    local dataout = UInt64.new(0)

    if textin:find("-") ~= nil then
    -- maybe process negative numbers in the future

    -- if it starts with 0x, 0X, or contains a letter "a-f", assume it's hex.
    elseif (string.find(textin, "^0[x|X]") or string.find(textin, "[a-f|A-F]")) ~= nil then
        dataout = UInt64.fromhex(textin)
    else
        dataout = UInt64.new(textin)
    end

    return dataout
end

-- Main function: open window, read text, output value.
local function hexcalc()
    local win = TextWindow.new("HexCalc")
    win:set_editable(true)

    -- add button to change text to Hex
    win:add_button("Hex", function()
        local data = UInt64.new()
        local text = win:get_text()

        if text ~= "" then
            data = text2uint64(text)
            text = data:tohex()
            -- strip off leading zeros; add one back below is needed
            text = string.gsub(text, "^0*", "")

            -- "0x" not a valid hex number. Make it at least "0x00".
            if string.len(text) == 0 then
                text = "00"
            end

            -- Even number of digits in result.
            if string.len(text) % 2 == 1 then
                text = "0" .. text
            end

            win:set("0x" .. text)
        end
    end)

    -- add button to change text to Decimal
    win:add_button("Decimal", function()
        local data = UInt64.new()
        local text = win:get_text()

        if text ~= "" then
            data = text2uint64(text)

            win:set(tostring(data))
        end
    end)

    -- add button to clear text window
    -- win:add_button("Clear", function() win:clear() end)

    win:add_button("Help", function()
        local splash = TextWindow.new("HexCalc Reference");
        splash:set('Input starting with "0x", "0X" or containing characters "a-fA-F"')
        splash:append(' is assumed to be hex input.\n')
        splash:append('Negative numbers or calculations not currently supported.\n')

    end)

end

-- Create the menu entry
register_menu("Hex Calculator",hexcalc,MENU_TOOLS_UNSORTED)