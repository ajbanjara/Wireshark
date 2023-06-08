--[[
    Displays ASCII Table in various formats.
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

local ascii_info =
{
    version = "1.4",
    author = "Christopher Maynard",
    description = "Displays ASCII Table in various formats.",
}

set_plugin_info(ascii_info)

local ascii_table = {
    [0] = "NUL",  [1] = "SOH",  [2] = "STX",  [3] = "ETX",  [4] = "EOT",  [5] = "ENQ",  [6] = "ACK",  [7] = "BEL",
    [8] = "BS",   [9] = "HT",   [10] = "LF",  [11] = "VT",  [12] = "FF",  [13] = "CR",  [14] = "SO",  [15] = "SI",
    [16] = "DLE", [17] = "DC1", [18] = "DC1", [19] = "DC1", [20] = "DC1", [21] = "NAK", [22] = "SYN", [23] = "ETB",
    [24] = "CAN", [25] = "EM",  [26] = "SUB", [27] = "ESC", [28] = "FS",  [29] = "GS",  [30] = "RS",  [31] = "US",

    [32] = " ",   [33] = "!",   [34] = "\"",  [35] = "#",   [36] = "$",   [37] = "%",   [38] = "&",   [39] = "'",
    [40] = "(",   [41] = ")",   [42] = "*",   [43] = "+",   [44] = ",",   [45] = "-",   [46] = ".",   [47] = "/",
    [48] = "0",   [49] = "1",   [50] = "2",   [51] = "3",   [52] = "4",   [53] = "5",   [54] = "6",   [55] = "7",
    [56] = "8",   [57] = "9",   [58] = ":",   [59] = ";",   [60] = "<",   [61] = "=",   [62] = ">",   [63] = "?",

    [64] = "@",   [65] = "A",   [66] = "B",   [67] = "C",   [68] = "D",   [69] = "E",   [70] = "F",   [71] = "G",
    [72] = "H",   [73] = "I",   [74] = "J",   [75] = "K",   [76] = "L",   [77] = "M",   [78] = "N",   [79] = "O",
    [80] = "P",   [81] = "Q",   [82] = "R",   [83] = "S",   [84] = "T",   [85] = "U",   [86] = "V",   [87] = "W",
    [88] = "X",   [89] = "Y",   [90] = "Z",   [91] = "[",   [92] = "\\",  [93] = "]",   [94] = "^",   [95] = "_",

    [96] = "`",   [97] = "a",   [98] = "b",   [99] = "c",   [100] = "d",  [101] = "e",  [102] = "f",  [103] = "g",
    [104] = "h",  [105] = "i",  [106] = "j",  [107] = "k",  [108] = "l",  [109] = "m",  [110] = "n",  [111] = "o",
    [112] = "p",  [113] = "q",  [114] = "r",  [115] = "s",  [116] = "t",  [117] = "u",  [118] = "v",  [119] = "w",
    [120] = "x",  [121] = "y",  [122] = "z",  [123] = "{",  [124] = "|",  [125] = "}",  [126] = "~",  [127] = "⌂",

    -- Extended ASCII - Code Page 437:
    [128] = "Ç",  [129] = "ü",  [130] = "é",  [131] = "â",  [132] = "ä",  [133] = "à",  [134] = "å",  [135] = "ç",
    [136] = "ê",  [137] = "ë",  [138] = "è",  [139] = "ï",  [140] = "î",  [141] = "ì",  [142] = "Ä",  [143] = "Å",
    [144] = "É",  [145] = "æ",  [146] = "Æ",  [147] = "ô",  [148] = "ö",  [149] = "ò",  [150] = "û",  [151] = "ù",
    [152] = "ÿ",  [153] = "Ö",  [154] = "Ü",  [155] = "¢",  [156] = "£",  [157] = "¥",  [158] = "₧ ", [159] = "ƒ",

    [160] = "á",  [161] = "í",  [162] = "ó",  [163] = "ú",  [164] = "ñ",  [165] = "Ñ",  [166] = "ª",  [167] = "º",
    [168] = "¿",  [169] = "⌐ ", [170] = "¬",  [171] = "½",  [172] = "¼",  [173] = "¡",  [174] = "«",  [175] = "»",
    [176] = "░",  [177] = "▒",  [178] = "▓",  [179] = "│",  [180] = "┤",  [181] = "╡",  [182] = "╢",  [183] = "╖",
    [184] = "╕",  [185] = "╣",  [186] = "║",  [187] = "╗",  [188] = "╝",  [189] = "╜",  [190] = "╛",  [191] = "┐",

    [192] = "└",  [193] = "┴",  [194] = "┬",  [195] = "├",  [196] = "─",  [197] = "┼",  [198] = "╞",  [199] = "╟",
    [200] = "╚",  [201] = "╔",  [202] = "╩",  [203] = "╦",  [204] = "╠",  [205] = "═",  [206] = "╬",  [207] = "╧",
    [208] = "╨",  [209] = "╤",  [210] = "╥",  [211] = "╙",  [212] = "╘",  [213] = "╒",  [214] = "╓",  [215] = "╫",
    [216] = "╪",  [217] = "┘",  [218] = "┌",  [219] = "█",  [220] = "▄",  [221] = "▌",  [222] = "▐",  [223] = "▀",

    [224] = "α",  [225] = "ß",  [226] = "Γ",  [227] = "π",  [228] = "Σ",  [229] = "σ",  [230] = "µ",  [231] = "τ",
    [232] = "Φ",  [233] = "Θ",  [234] = "Ω",  [235] = "δ",  [236] = "∞ ", [237] = "φ",  [238] = "ε",  [239] = "∩ ",
    [240] = "≡",  [241] = "±",  [242] = "≥",  [243] = "≤",  [244] = "⌠",  [245] = "⌡",  [246] = "÷",  [247] = "≈",
    [248] = "°",  [249] = "∙",  [250] = "·",  [251] = "√",  [252] = "ⁿ",  [253] = "²",  [254] = "■",  [255] = "NBSP"
}

local extended_ascii = true
local mode = "Both"

-----------------------------------------------------------------------------
local function build_ascii_table_dec_hex()
    local text = "Dec Hex    Dec Hex    Dec Hex    Dec Hex    Dec Hex    Dec Hex    Dec Hex    Dec Hex\n"
    local i

    for i = 0, 15, 1 do
        text = text .. string.format("%3d %02X %-3s %3d %02X %-3s %3d %02X %-3s %3d %02X %-3s %3d %02X %-3s %3d %02X %-3s %3d %02X %-3s %3d %02X %-3s\n",
            i,      i,      ascii_table[i],      i + 16,  i + 16,  ascii_table[i + 16],
            i + 32, i + 32, ascii_table[i + 32], i + 48,  i + 48,  ascii_table[i + 48],
            i + 64, i + 64, ascii_table[i + 64], i + 80,  i + 80,  ascii_table[i + 80],
            i + 96, i + 96, ascii_table[i + 96], i + 112, i + 112, ascii_table[i + 112])
    end

    if extended_ascii then
        text = text .. "\nExtended ASCII:\n"
        text = text .. "Dec Hex    Dec Hex    Dec Hex    Dec Hex    Dec Hex    Dec Hex    Dec Hex    Dec Hex\n"
        for i = 128, 143, 1 do
            text = text .. string.format("%3d %02X %-3s  %3d %02X %-3s  %3d %02X %-3s  %3d %02X %-3s   %3d %02X %-3s   %3d %02X %-3s   %3d %02X %-3s  %3d %02X %-3s\n",
                i,      i,      ascii_table[i],      i + 16,  i + 16,  ascii_table[i + 16],
                i + 32, i + 32, ascii_table[i + 32], i + 48,  i + 48,  ascii_table[i + 48],
                i + 64, i + 64, ascii_table[i + 64], i + 80,  i + 80,  ascii_table[i + 80],
                i + 96, i + 96, ascii_table[i + 96], i + 112, i + 112, ascii_table[i + 112])
        end
    end

    return text
end -- build_ascii_table_dec_hex()

-----------------------------------------------------------------------------
local function build_ascii_table_hex()
    local text = "  Hex       Hex       Hex       Hex       Hex       Hex       Hex       Hex\n"
    local i

    for i = 0, 15, 1 do
        text = text .. string.format("   %02X %-3s    %02X %-3s    %02X %-3s    %02X %-3s    %02X %-3s    %02X %-3s    %02X %-3s    %02X %-3s\n",
            i,      ascii_table[i],      i + 16,  ascii_table[i + 16],
            i + 32, ascii_table[i + 32], i + 48,  ascii_table[i + 48],
            i + 64, ascii_table[i + 64], i + 80,  ascii_table[i + 80],
            i + 96, ascii_table[i + 96], i + 112, ascii_table[i + 112])
    end

    if extended_ascii then
        text = text .. "\nExtended ASCII:\n"
        text = text .. "  Hex       Hex       Hex       Hex       Hex       Hex       Hex       Hex\n"
        for i = 128, 143, 1 do
            text = text .. string.format("   %02X %-3s     %02X %-3s     %02X %-3s     %02X %-3s      %02X %-3s      %02X %-3s      %02X %-3s     %02X %-3s\n",
                i,      ascii_table[i],      i + 16,  ascii_table[i + 16],
                i + 32, ascii_table[i + 32], i + 48,  ascii_table[i + 48],
                i + 64, ascii_table[i + 64], i + 80,  ascii_table[i + 80],
                i + 96, ascii_table[i + 96], i + 112, ascii_table[i + 112])
        end
    end

    return text
end -- build_ascii_table_hex()

-----------------------------------------------------------------------------
local function build_ascii_table_dec()
    local text = "  Dec       Dec       Dec       Dec       Dec       Dec       Dec       Dec\n"
    local i

    for i = 0, 15, 1 do
        text = text .. string.format("%5d %-3s %5d %-3s %5d %-3s %5d %-3s %5d %-3s %5d %-3s %5d %-3s %5d %-3s\n",
            i,      ascii_table[i],      i + 16,  ascii_table[i + 16],
            i + 32, ascii_table[i + 32], i + 48,  ascii_table[i + 48],
            i + 64, ascii_table[i + 64], i + 80,  ascii_table[i + 80],
            i + 96, ascii_table[i + 96], i + 112, ascii_table[i + 112])
    end

    if extended_ascii then
        text = text .. "\nExtended ASCII:\n"
        text = text .. "  Dec       Dec       Dec       Dec       Dec       Dec       Dec       Dec\n"
        for i = 128, 143, 1 do
            text = text .. string.format("%5d %-3s  %5d %-3s  %5d %-3s  %5d %-3s   %5d %-3s   %5d %-3s   %5d %-3s  %5d %-3s\n",
                i,      ascii_table[i],      i + 16,  ascii_table[i + 16],
                i + 32, ascii_table[i + 32], i + 48,  ascii_table[i + 48],
                i + 64, ascii_table[i + 64], i + 80,  ascii_table[i + 80],
                i + 96, ascii_table[i + 96], i + 112, ascii_table[i + 112])
        end
    end

    return text
end -- build_ascii_table_dec()

-----------------------------------------------------------------------------
local function build_ascii_table_oct()
    local text = "  Oct       Oct       Oct       Oct       Oct       Oct       Oct       Oct\n"
    local i

    for i = 0, 15, 1 do
        text = text .. string.format("%5o %-3s %5o %-3s %5o %-3s %5o %-3s %5o %-3s %5o %-3s %5o %-3s %5o %-3s\n",
            i,      ascii_table[i],      i + 16,  ascii_table[i + 16],
            i + 32, ascii_table[i + 32], i + 48,  ascii_table[i + 48],
            i + 64, ascii_table[i + 64], i + 80,  ascii_table[i + 80],
            i + 96, ascii_table[i + 96], i + 112, ascii_table[i + 112])
    end

    if extended_ascii then
        text = text .. "\nExtended ASCII:\n"
        text = text .. "  Oct       Oct       Oct       Oct       Oct       Oct       Oct       Oct\n"
        for i = 128, 143, 1 do
            text = text .. string.format("%5o %-3s  %5o %-3s  %5o %-3s  %5o %-3s   %5o %-3s   %5o %-3s   %5o %-3s  %5o %-3s\n",
                i,      ascii_table[i],      i + 16,  ascii_table[i + 16],
                i + 32, ascii_table[i + 32], i + 48,  ascii_table[i + 48],
                i + 64, ascii_table[i + 64], i + 80,  ascii_table[i + 80],
                i + 96, ascii_table[i + 96], i + 112, ascii_table[i + 112])
        end
    end

    return text
end -- build_ascii_table_oct()

-----------------------------------------------------------------------------
local function build_ascii_table_bin()
    local text = "   Binary          Binary          Binary          Binary           Binary          Binary          Binary          Binary\n"
    local i

    for i = 0, 15, 1 do
        text = text .. string.format("   %u%u%u%u%u%u%u%u %-3s    %u%u%u%u%u%u%u%u %-3s    %u%u%u%u%u%u%u%u %-3s    %u%u%u%u%u%u%u%u %-3s     %u%u%u%u%u%u%u%u %-3s    %u%u%u%u%u%u%u%u %-3s    %u%u%u%u%u%u%u%u %-3s    %u%u%u%u%u%u%u%u %-3s\n",
            bit32.btest(i,      0x80) and 1 or 0, bit32.btest(i, 0x40) and 1 or 0, bit32.btest(i, 0x20) and 1 or 0, bit32.btest(i, 0x10) and 1 or 0,
            bit32.btest(i,      0x08) and 1 or 0, bit32.btest(i, 0x04) and 1 or 0, bit32.btest(i, 0x02) and 1 or 0, bit32.btest(i, 0x01) and 1 or 0, ascii_table[i],
            bit32.btest(i + 16, 0x80) and 1 or 0, bit32.btest(i + 16, 0x40) and 1 or 0, bit32.btest(i + 16, 0x20) and 1 or 0, bit32.btest(i + 16, 0x10) and 1 or 0,
            bit32.btest(i + 16, 0x08) and 1 or 0, bit32.btest(i + 16, 0x04) and 1 or 0, bit32.btest(i + 16, 0x02) and 1 or 0, bit32.btest(i + 16, 0x01) and 1 or 0, ascii_table[i + 16],
            bit32.btest(i + 32, 0x80) and 1 or 0, bit32.btest(i + 32, 0x40) and 1 or 0, bit32.btest(i + 32, 0x20) and 1 or 0, bit32.btest(i + 32, 0x10) and 1 or 0,
            bit32.btest(i + 32, 0x08) and 1 or 0, bit32.btest(i + 32, 0x04) and 1 or 0, bit32.btest(i + 32, 0x02) and 1 or 0, bit32.btest(i + 32, 0x01) and 1 or 0, ascii_table[i + 32],
            bit32.btest(i + 48, 0x80) and 1 or 0, bit32.btest(i + 48, 0x40) and 1 or 0, bit32.btest(i + 48, 0x20) and 1 or 0, bit32.btest(i + 48, 0x10) and 1 or 0,
            bit32.btest(i + 48, 0x08) and 1 or 0, bit32.btest(i + 48, 0x04) and 1 or 0, bit32.btest(i + 48, 0x02) and 1 or 0, bit32.btest(i + 48, 0x01) and 1 or 0, ascii_table[i + 48],
            bit32.btest(i + 64, 0x80) and 1 or 0, bit32.btest(i + 64, 0x40) and 1 or 0, bit32.btest(i + 64, 0x20) and 1 or 0, bit32.btest(i + 64, 0x10) and 1 or 0,
            bit32.btest(i + 64, 0x08) and 1 or 0, bit32.btest(i + 64, 0x04) and 1 or 0, bit32.btest(i + 64, 0x02) and 1 or 0, bit32.btest(i + 64, 0x01) and 1 or 0, ascii_table[i + 64],
            bit32.btest(i + 80, 0x80) and 1 or 0, bit32.btest(i + 80, 0x40) and 1 or 0, bit32.btest(i + 80, 0x20) and 1 or 0, bit32.btest(i + 80, 0x10) and 1 or 0,
            bit32.btest(i + 80, 0x08) and 1 or 0, bit32.btest(i + 80, 0x04) and 1 or 0, bit32.btest(i + 80, 0x02) and 1 or 0, bit32.btest(i + 80, 0x01) and 1 or 0, ascii_table[i + 80],
            bit32.btest(i + 96, 0x80) and 1 or 0, bit32.btest(i + 96, 0x40) and 1 or 0, bit32.btest(i + 96, 0x20) and 1 or 0, bit32.btest(i + 96, 0x10) and 1 or 0,
            bit32.btest(i + 96, 0x08) and 1 or 0, bit32.btest(i + 96, 0x04) and 1 or 0, bit32.btest(i + 96, 0x02) and 1 or 0, bit32.btest(i + 96, 0x01) and 1 or 0, ascii_table[i + 96],
            bit32.btest(i + 112, 0x80) and 1 or 0, bit32.btest(i + 112, 0x40) and 1 or 0, bit32.btest(i + 112, 0x20) and 1 or 0, bit32.btest(i + 112, 0x10) and 1 or 0,
            bit32.btest(i + 112, 0x08) and 1 or 0, bit32.btest(i + 112, 0x04) and 1 or 0, bit32.btest(i + 112, 0x02) and 1 or 0, bit32.btest(i + 112, 0x01) and 1 or 0, ascii_table[i + 112])
    end

    if extended_ascii then
        text = text .. "\nExtended ASCII:\n"
        text = text .. "   Binary          Binary          Binary          Binary           Binary          Binary          Binary          Binary\n"
        for i = 128, 143, 1 do
            text = text .. string.format("   %u%u%u%u%u%u%u%u %-3s     %u%u%u%u%u%u%u%u %-3s     %u%u%u%u%u%u%u%u %-3s     %u%u%u%u%u%u%u%u %-3s       %u%u%u%u%u%u%u%u %-3s      %u%u%u%u%u%u%u%u %-3s      %u%u%u%u%u%u%u%u %-3s     %u%u%u%u%u%u%u%u %-3s\n",
                bit32.btest(i,      0x80) and 1 or 0, bit32.btest(i, 0x40) and 1 or 0, bit32.btest(i, 0x20) and 1 or 0, bit32.btest(i, 0x10) and 1 or 0,
                bit32.btest(i,      0x08) and 1 or 0, bit32.btest(i, 0x04) and 1 or 0, bit32.btest(i, 0x02) and 1 or 0, bit32.btest(i, 0x01) and 1 or 0, ascii_table[i],
                bit32.btest(i + 16, 0x80) and 1 or 0, bit32.btest(i + 16, 0x40) and 1 or 0, bit32.btest(i + 16, 0x20) and 1 or 0, bit32.btest(i + 16, 0x10) and 1 or 0,
                bit32.btest(i + 16, 0x08) and 1 or 0, bit32.btest(i + 16, 0x04) and 1 or 0, bit32.btest(i + 16, 0x02) and 1 or 0, bit32.btest(i + 16, 0x01) and 1 or 0, ascii_table[i + 16],
                bit32.btest(i + 32, 0x80) and 1 or 0, bit32.btest(i + 32, 0x40) and 1 or 0, bit32.btest(i + 32, 0x20) and 1 or 0, bit32.btest(i + 32, 0x10) and 1 or 0,
                bit32.btest(i + 32, 0x08) and 1 or 0, bit32.btest(i + 32, 0x04) and 1 or 0, bit32.btest(i + 32, 0x02) and 1 or 0, bit32.btest(i + 32, 0x01) and 1 or 0, ascii_table[i + 32],
                bit32.btest(i + 48, 0x80) and 1 or 0, bit32.btest(i + 48, 0x40) and 1 or 0, bit32.btest(i + 48, 0x20) and 1 or 0, bit32.btest(i + 48, 0x10) and 1 or 0,
                bit32.btest(i + 48, 0x08) and 1 or 0, bit32.btest(i + 48, 0x04) and 1 or 0, bit32.btest(i + 48, 0x02) and 1 or 0, bit32.btest(i + 48, 0x01) and 1 or 0, ascii_table[i + 48],
                bit32.btest(i + 64, 0x80) and 1 or 0, bit32.btest(i + 64, 0x40) and 1 or 0, bit32.btest(i + 64, 0x20) and 1 or 0, bit32.btest(i + 64, 0x10) and 1 or 0,
                bit32.btest(i + 64, 0x08) and 1 or 0, bit32.btest(i + 64, 0x04) and 1 or 0, bit32.btest(i + 64, 0x02) and 1 or 0, bit32.btest(i + 64, 0x01) and 1 or 0, ascii_table[i + 64],
                bit32.btest(i + 80, 0x80) and 1 or 0, bit32.btest(i + 80, 0x40) and 1 or 0, bit32.btest(i + 80, 0x20) and 1 or 0, bit32.btest(i + 80, 0x10) and 1 or 0,
                bit32.btest(i + 80, 0x08) and 1 or 0, bit32.btest(i + 80, 0x04) and 1 or 0, bit32.btest(i + 80, 0x02) and 1 or 0, bit32.btest(i + 80, 0x01) and 1 or 0, ascii_table[i + 80],
                bit32.btest(i + 96, 0x80) and 1 or 0, bit32.btest(i + 96, 0x40) and 1 or 0, bit32.btest(i + 96, 0x20) and 1 or 0, bit32.btest(i + 96, 0x10) and 1 or 0,
                bit32.btest(i + 96, 0x08) and 1 or 0, bit32.btest(i + 96, 0x04) and 1 or 0, bit32.btest(i + 96, 0x02) and 1 or 0, bit32.btest(i + 96, 0x01) and 1 or 0, ascii_table[i + 96],
                bit32.btest(i + 112, 0x80) and 1 or 0, bit32.btest(i + 112, 0x40) and 1 or 0, bit32.btest(i + 112, 0x20) and 1 or 0, bit32.btest(i + 112, 0x10) and 1 or 0,
                bit32.btest(i + 112, 0x08) and 1 or 0, bit32.btest(i + 112, 0x04) and 1 or 0, bit32.btest(i + 112, 0x02) and 1 or 0, bit32.btest(i + 112, 0x01) and 1 or 0, ascii_table[i + 112])
        end
    end

    return text
end -- build_ascii_table_bin()

-----------------------------------------------------------------------------
if not gui_enabled() then
    local print_ascii = os.getenv("PRINT_ASCII")

    if print_ascii == "HEX" then
        print(build_ascii_table_hex())
    elseif print_ascii == "DEC" then
        print(build_ascii_table_dec())
    elseif print_ascii == "OCT" then
        print(build_ascii_table_oct())
    elseif print_ascii == "BIN" then
        print(build_ascii_table_bin())
    elseif print_ascii ~= nil then
        print(build_ascii_table_dec_hex())
    end
    return
end

-----------------------------------------------------------------------------
local function ascii_window()

    -- Declare the window we will use
    local asciiwin = TextWindow.new(
        "ASCII Table"
    )
    asciiwin:set(build_ascii_table_dec_hex())

    --[ BUTTONS ]vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    --[ Copy To Clipboard ]
    asciiwin:add_button("Copy To Clipboard", function()
        copy_to_clipboard(asciiwin:get_text())
    end)

    --[ Toggle Extended ASCII ]
    asciiwin:add_button("Toggle Extended ASCII", function()
        extended_ascii = not extended_ascii
        if mode == "Hex" then
            asciiwin:set(build_ascii_table_hex())
        elseif mode == "Dec" then
            asciiwin:set(build_ascii_table_dec())
        elseif mode == "Oct" then
            asciiwin:set(build_ascii_table_oct())
        elseif mode == "Bin" then
            asciiwin:set(build_ascii_table_bin())
        else
            asciiwin:set(build_ascii_table_dec_hex())
        end
    end)

    --[ Hex + Dec ] Display both Hexadecimal and Decimal values.
    asciiwin:add_button("Hex + Dec", function()
        asciiwin:set(build_ascii_table_dec_hex())
        mode = "Both"
    end)

    --[ Hexadecimal ] Display Hexacimal values.
    asciiwin:add_button("Hexadecimal", function()
        asciiwin:set(build_ascii_table_hex())
        mode = "Hex"
    end)

    --[ Decimal ] Display Decimal values.
    asciiwin:add_button("Decimal", function()
        asciiwin:set(build_ascii_table_dec())
        mode = "Dec"
    end)

    --[ Octal ] Display Octal values.
    asciiwin:add_button("Octal", function()
        asciiwin:set(build_ascii_table_oct())
        mode = "Oct"
    end)

    --[ Binary ] Display Binary values.
    asciiwin:add_button("Binary", function()
        asciiwin:set(build_ascii_table_bin())
        mode = "Bin"
    end)
    --[ BUTTONS ]^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

end -- ascii_window()

register_menu("ASCII Table", ascii_window, MENU_TOOLS_UNSORTED)
