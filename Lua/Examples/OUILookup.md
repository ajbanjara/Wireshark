# An OUI lookup tool.

This Lua script adds a new GUI Menu to Wireshark that allows the user to lookup [OUI](https://en.wikipedia.org/wiki/Organizationally_unique_identifier)s and other MAC address prefixes.  It uses the locally installed `manuf` file for these lookups.  If you're looking for the online OUI Lookup Tool, visit: https://www.wireshark.org/tools/oui-lookup.html.

OUIs and MAC address searches should be colon-separated, but searches can include arbitrary text as well as Lua patterns.

**Installation** - place in plugins directory - see [Lua Support in Wireshark](https://www.wireshark.org/docs/wsdg_html_chunked/wsluarm.html)  

[ouilookup.lua](uploads/06f2fb671e5d0b1d27d42e2a45479f5b/ouilookup.lua)

**Examples:**
- ^00:D0:EF
- Maple
- /28
- 70:B3:D5:0E:.*/36
- ^00.*GmbH$
- Inc.?$

For help with Lua patterns, refer to https://www.lua.org/manual/5.2/manual.html#6.4.1

![ouilookup](uploads/573a77be178d52ea05f44828612b1a52/ouilookup.jpg)
