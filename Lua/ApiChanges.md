[[_TOC_]]

# Changes to Lua

  - [Changes in v1.10](/Lua/ApiChanges#changes-in-v110)

  - [Changes in v1.11](/Lua/ApiChanges#changes-in-v111)

-----

# Changes in v1.10

The following changes to Lua were made in Wireshark as of v1.10.6, relative to v1.8.12:

  - Pre-compiled wireshark packages for download now compile with Lua 5.2, instead of 5.1.

### API Changes

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>item</strong></p></td>
<td><p><strong>type</strong></p></td>
<td><p><strong>description</strong></p></td>
</tr>
<tr class="even">
<td><p>typeof()</p></td>
<td><p>global function</p></td>
<td><p>gets a string of the class name of the given object</p></td>
</tr>
<tr class="odd">
<td><p>get_filter()</p></td>
<td><p>global function</p></td>
<td><p>gets the main filter text, from GUI only</p></td>
</tr>
<tr class="even">
<td><p>wtap_filetypes</p></td>
<td><p>global table</p></td>
<td><p>a table of filetypes known to wireshark</p></td>
</tr>
<tr class="odd">
<td><p>Column:fence()</p></td>
<td><p>class method</p></td>
<td><p>sets the column text 'fence', preventing overwriting</p></td>
</tr>
<tr class="even">
<td><p>TvbRange:uncompress()</p></td>
<td><p>class method</p></td>
<td><p>gets uncompressed <a href="/TvbRange" class="nonexistent">TvbRange</a> if Zlib is compiled in wireshark</p></td>
</tr>
</tbody>
</table>

</div>

-----

# Changes in v1.11

The following changes to Lua were made in Wireshark v1.11.3, relative to v1.10.6:

  - Metatables of classes are now visible/retrievable in Lua.
  - The wtap\_encaps/wtap, wtap\_filetypes, and ftypes global tables have new entries for added types.

### API Changes

#### New functions/methods

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>item</strong></p></td>
<td><p><strong>type</strong></p></td>
<td><p><strong>description</strong></p></td>
</tr>
<tr class="even">
<td><p>ByteArray:base64_decode()</p></td>
<td><p>class method</p></td>
<td><p>gets a base64 decoded <a href="/LuaApi/ByteArray" class="nonexistent">ByteArray</a></p></td>
</tr>
<tr class="odd">
<td><p>ByteArray:raw()</p></td>
<td><p>class method</p></td>
<td><p>gets a Lua binary string of the <a href="/LuaApi/ByteArray" class="nonexistent">ByteArray</a> contents</p></td>
</tr>
<tr class="even">
<td><p>ByteArray:tohex()</p></td>
<td><p>class method</p></td>
<td><p>gets a Lua hex-ascii string of the <a href="/LuaApi/ByteArray" class="nonexistent">ByteArray</a> contents</p></td>
</tr>
<tr class="odd">
<td><p><a href="/LuaApi/ByteArray" class="nonexistent">ByteArray</a>.new()</p></td>
<td><p>class function</p></td>
<td><p>creates a new <a href="/LuaApi/ByteArray" class="nonexistent">ByteArray</a>, now with ability to create from a raw Lua binary string</p></td>
</tr>
<tr class="even">
<td><p>Column:clear_fence()</p></td>
<td><p>class method</p></td>
<td><p>clears any previously set column 'fence'</p></td>
</tr>
<tr class="odd">
<td><p>Dir.make()</p></td>
<td><p>class function</p></td>
<td><p>creates a directory</p></td>
</tr>
<tr class="even">
<td><p>Dir.exists()</p></td>
<td><p>class function</p></td>
<td><p>checks if a directory exists</p></td>
</tr>
<tr class="odd">
<td><p>Dir.remove()</p></td>
<td><p>class function</p></td>
<td><p>removes an empty directory</p></td>
</tr>
<tr class="even">
<td><p>Dir.remove_all()</p></td>
<td><p>class function</p></td>
<td><p>removes a non-empty directory</p></td>
</tr>
<tr class="odd">
<td><p>Dir.personal_config_path()</p></td>
<td><p>class function</p></td>
<td><p>gets the personal configuration directory path</p></td>
</tr>
<tr class="even">
<td><p>Dir.global_config_path()</p></td>
<td><p>class function</p></td>
<td><p>gets the global configuration directory path</p></td>
</tr>
<tr class="odd">
<td><p>Dir.personal_plugins_path()</p></td>
<td><p>class function</p></td>
<td><p>gets the personal plugins directory path</p></td>
</tr>
<tr class="even">
<td><p>Dir.global_plugins_path()</p></td>
<td><p>class function</p></td>
<td><p>gets the global plugins directory path</p></td>
</tr>
<tr class="odd">
<td><p>Dissector.list()</p></td>
<td><p>class function</p></td>
<td><p>gets a Lua array table of all registered Dissector names</p></td>
</tr>
<tr class="even">
<td><p><a href="/LuaApi/Dissector" class="nonexistent">DissectorTable</a>.heuristic_list()</p></td>
<td><p>class function</p></td>
<td><p>gets a Lua array table of all heuristic list names</p></td>
</tr>
<tr class="odd">
<td><p><a href="/LuaApi/Dissector" class="nonexistent">DissectorTable</a>.list()</p></td>
<td><p>class function</p></td>
<td><p>gets a Lua array table of all <a href="/LuaApi/Dissector" class="nonexistent">DissectorTable</a> names</p></td>
</tr>
<tr class="even">
<td><p>DissectorTable:remove_all()</p></td>
<td><p>class method</p></td>
<td><p>removes all dissectors from a table</p></td>
</tr>
<tr class="odd">
<td><p>DissectorTable:set()</p></td>
<td><p>class method</p></td>
<td><p>remove existing dissectors from a table and add a new or a range of new dissectors</p></td>
</tr>
<tr class="even">
<td><p>Field.list()</p></td>
<td><p>class function</p></td>
<td><p>gets a Lua array table of all registered field names</p></td>
</tr>
<tr class="odd">
<td><p>Listener.list()</p></td>
<td><p>class function</p></td>
<td><p>gets a Lua array table of all registered tappable names</p></td>
</tr>
<tr class="even">
<td><p>Proto:register_heuristic()</p></td>
<td><p>class method</p></td>
<td><p>sets a heuristic dissector function</p></td>
</tr>
<tr class="odd">
<td><p>Proto.experts</p></td>
<td><p>class attribute</p></td>
<td><p>a table of <a href="/LuaApi/Dissector" class="nonexistent">ProtoExpert</a> objects for the protocol</p></td>
</tr>
<tr class="even">
<td><p><a href="/LuaApi/Dissector" class="nonexistent">ProtoField</a>.rel_oid()</p></td>
<td><p>class function</p></td>
<td><p>creates a <a href="/LuaApi/Dissector" class="nonexistent">ProtoField</a> for an ASN relative OID</p></td>
</tr>
<tr class="odd">
<td><p><a href="/LuaApi/Dissector" class="nonexistent">ProtoField</a>.systemid()</p></td>
<td><p>class function</p></td>
<td><p>creates a <a href="/LuaApi/Dissector" class="nonexistent">ProtoField</a> for a system ID</p></td>
</tr>
<tr class="even">
<td><p>TreeItem:prepend_text()</p></td>
<td><p>class method</p></td>
<td><p>prepends text to the tree label</p></td>
</tr>
<tr class="odd">
<td><p>TreeItem:add_proto_expert_info()</p></td>
<td><p>class method</p></td>
<td><p>adds expert info to the packet</p></td>
</tr>
<tr class="even">
<td><p>TreeItem:add_tvb_expert_info()</p></td>
<td><p>class method</p></td>
<td><p>adds expert info to the packet associated with the Tvb</p></td>
</tr>
<tr class="odd">
<td><p>Tvb:raw()</p></td>
<td><p>class method</p></td>
<td><p>gets a Lua string of the binary bytes in a Tvb</p></td>
</tr>
<tr class="even">
<td><p>TvbRange:raw()</p></td>
<td><p>class method</p></td>
<td><p>gets a Lua string of the binary bytes in a <a href="/TvbRange" class="nonexistent">TvbRange</a></p></td>
</tr>
<tr class="odd">
<td><p>TvbRange:strsize()</p></td>
<td><p>class method</p></td>
<td><p>gets the size of a zero terminated string from a <a href="/TvbRange" class="nonexistent">TvbRange</a></p></td>
</tr>
<tr class="even">
<td><p>file_exists()</p></td>
<td><p>global function</p></td>
<td><p>checks if the given filename already exists</p></td>
</tr>
<tr class="odd">
<td><p>register_filehandler()</p></td>
<td><p>global function</p></td>
<td><p>registers a <a href="/FileHandler" class="nonexistent">FileHandler</a> object into Wireshark</p></td>
</tr>
<tr class="even">
<td><p>deregister_filehandler()</p></td>
<td><p>global function</p></td>
<td><p>de-registers a <a href="/FileHandler" class="nonexistent">FileHandler</a> object from Wireshark</p></td>
</tr>
</tbody>
</table>

</div>

#### New classes

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>item</strong></p></td>
<td><p><strong>type</strong></p></td>
<td><p><strong>description</strong></p></td>
</tr>
<tr class="even">
<td><p><a href="/CaptureInfo" class="nonexistent">CaptureInfo</a></p></td>
<td><p>class</p></td>
<td><p>Custom file format reading/writing: capture file data and meta-data</p></td>
</tr>
<tr class="odd">
<td><p><a href="/CaptureInfoConst" class="nonexistent">CaptureInfoConst</a></p></td>
<td><p>class</p></td>
<td><p>Custom file format reading/writing: capture file data and meta-data</p></td>
</tr>
<tr class="even">
<td><p>File</p></td>
<td><p>class</p></td>
<td><p>Custom file format reading/writing: a class similar to the Lua <code class="backtick">io</code> library's <code class="backtick">file</code> object</p></td>
</tr>
<tr class="odd">
<td><p><a href="/FileHandler" class="nonexistent">FileHandler</a></p></td>
<td><p>class</p></td>
<td><p>Custom file format reading/writing: lets you create a file-format reader, or writer, or both</p></td>
</tr>
<tr class="even">
<td><p><a href="/FrameInfo" class="nonexistent">FrameInfo</a></p></td>
<td><p>class</p></td>
<td><p>Custom file format reading/writing: represents frame data and meta-data</p></td>
</tr>
<tr class="odd">
<td><p><a href="/FrameInfoConst" class="nonexistent">FrameInfoConst</a></p></td>
<td><p>class</p></td>
<td><p>Custom file format reading/writing: represents frame data and meta-data</p></td>
</tr>
<tr class="even">
<td><p>GRegex</p></td>
<td><p>class</p></td>
<td><p>a class for Glib/PCRE regular expressions</p></td>
</tr>
<tr class="odd">
<td><p><a href="/ProtoExpert" class="nonexistent">ProtoExpert</a></p></td>
<td><p>class</p></td>
<td><p>protocol expert info field, to be used when adding items to the dissection tree</p></td>
</tr>
<tr class="even">
<td><p>Int64</p></td>
<td><p>class</p></td>
<td><p>this class existed before, but with almost no methods; now it has lots</p></td>
</tr>
<tr class="odd">
<td><p>UInt64</p></td>
<td><p>class</p></td>
<td><p>this class existed before, but with almost no methods; now it has lots</p></td>
</tr>
<tr class="even">
<td><p>Struct</p></td>
<td><p>class</p></td>
<td><p>a set of class functions for binary Lua string handling</p></td>
</tr>
</tbody>
</table>

</div>

#### New global constants/variables

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>item</strong></p></td>
<td><p><strong>type</strong></p></td>
<td><p><strong>description</strong></p></td>
</tr>
<tr class="even">
<td><p>ENC_3GPP_TS_23_038_7BITS</p></td>
<td><p>global constant</p></td>
<td><p>a number for a specific encoding type</p></td>
</tr>
<tr class="odd">
<td><p>ENC_ISO_8859_1</p></td>
<td><p>global constant</p></td>
<td><p>a number for a specific encoding type</p></td>
</tr>
<tr class="even">
<td><p>ENC_ISO_8859_10</p></td>
<td><p>global constant</p></td>
<td><p>a number for a specific encoding type</p></td>
</tr>
<tr class="odd">
<td><p>ENC_ISO_8859_11</p></td>
<td><p>global constant</p></td>
<td><p>a number for a specific encoding type</p></td>
</tr>
<tr class="even">
<td><p>ENC_ISO_8859_13</p></td>
<td><p>global constant</p></td>
<td><p>a number for a specific encoding type</p></td>
</tr>
<tr class="odd">
<td><p>ENC_ISO_8859_14</p></td>
<td><p>global constant</p></td>
<td><p>a number for a specific encoding type</p></td>
</tr>
<tr class="even">
<td><p>ENC_ISO_8859_15</p></td>
<td><p>global constant</p></td>
<td><p>a number for a specific encoding type</p></td>
</tr>
<tr class="odd">
<td><p>ENC_ISO_8859_16</p></td>
<td><p>global constant</p></td>
<td><p>a number for a specific encoding type</p></td>
</tr>
<tr class="even">
<td><p>ENC_ISO_8859_2</p></td>
<td><p>global constant</p></td>
<td><p>a number for a specific encoding type</p></td>
</tr>
<tr class="odd">
<td><p>ENC_ISO_8859_3</p></td>
<td><p>global constant</p></td>
<td><p>a number for a specific encoding type</p></td>
</tr>
<tr class="even">
<td><p>ENC_ISO_8859_4</p></td>
<td><p>global constant</p></td>
<td><p>a number for a specific encoding type</p></td>
</tr>
<tr class="odd">
<td><p>ENC_ISO_8859_5</p></td>
<td><p>global constant</p></td>
<td><p>a number for a specific encoding type</p></td>
</tr>
<tr class="even">
<td><p>ENC_ISO_8859_6</p></td>
<td><p>global constant</p></td>
<td><p>a number for a specific encoding type</p></td>
</tr>
<tr class="odd">
<td><p>ENC_ISO_8859_7</p></td>
<td><p>global constant</p></td>
<td><p>a number for a specific encoding type</p></td>
</tr>
<tr class="even">
<td><p>ENC_ISO_8859_8</p></td>
<td><p>global constant</p></td>
<td><p>a number for a specific encoding type</p></td>
</tr>
<tr class="odd">
<td><p>ENC_ISO_8859_9</p></td>
<td><p>global constant</p></td>
<td><p>a number for a specific encoding type</p></td>
</tr>
<tr class="even">
<td><p>ENC_TIME_TOD</p></td>
<td><p>global constant</p></td>
<td><p>a number for a specific encoding type</p></td>
</tr>
<tr class="odd">
<td><p>ENC_UCS_4</p></td>
<td><p>global constant</p></td>
<td><p>a number for a specific encoding type</p></td>
</tr>
<tr class="even">
<td><p>ENC_WINDOWS_1250</p></td>
<td><p>global constant</p></td>
<td><p>a number for a specific encoding type</p></td>
</tr>
<tr class="odd">
<td><p>MENU_STAT_TELEPHONY_GSM</p></td>
<td><p>global constant</p></td>
<td><p>a number for a GUI menu</p></td>
</tr>
<tr class="even">
<td><p>MENU_STAT_TELEPHONY_LTE</p></td>
<td><p>global constant</p></td>
<td><p>a number for a GUI menu</p></td>
</tr>
<tr class="odd">
<td><p>MENU_STAT_TELEPHONY_SCTP</p></td>
<td><p>global constant</p></td>
<td><p>a number for a GUI menu</p></td>
</tr>
</tbody>
</table>

</div>

---

Imported from https://wiki.wireshark.org/Lua/ApiChanges on 2020-08-11 23:16:07 UTC
