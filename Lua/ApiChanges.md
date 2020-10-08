[[_TOC_]]

# Changes in v1.10

The following changes to Lua were made in Wireshark as of v1.10.6, relative to v1.8.12:

  - Pre-compiled wireshark packages for download now compile with Lua 5.2, instead of 5.1.

### API Changes

| item                    | type            | description                                                 |
| ----------------------- | --------------- | ----------------------------------------------------------- |
| `typeof()`              | global function | gets a string of the class name of the given object         |
| `get_filter()`          | global function | gets the main filter text, from GUI only                    |
| `wtap_filetypes`        | global table    | a table of filetypes known to wireshark                     |
| `Column:fence()`        | class method    | sets the column text 'fence', preventing overwriting        |
| `TvbRange:uncompress()` | class method    | gets uncompressed TvbRange if Zlib is compiled in wireshark |

-----

# Changes in v1.11

The following changes to Lua were made in Wireshark v1.11.3, relative to v1.10.6:

  - Metatables of classes are now visible/retrievable in Lua.
  - The wtap\_encaps/wtap, wtap\_filetypes, and ftypes global tables have new entries for added types.

### API Changes

#### New functions/methods

| item                               | type            | description                                                                                           |
| ---------------------------------- | --------------- | ----------------------------------------------------------------------------------------------------- |
| `ByteArray:base64_decode()`        | class method    | gets a base64 decoded [ByteArray](/LuaApi/ByteArray)                                                  |
| `ByteArray:raw()`                  | class method    | gets a Lua binary string of the [ByteArray](/LuaApi/ByteArray) contents                               |
| `ByteArray:tohex()`                | class method    | gets a Lua hex-ascii string of the [ByteArray](/LuaApi/ByteArray) contents                            |
| `ByteArray.new()`                  | class function  | creates a new [ByteArray](/LuaApi/ByteArray), now with ability to create from a raw Lua binary string |
| `Column:clear_fence()`             | class method    | clears any previously set column 'fence'                                                              |
| `Dir.make()`                       | class function  | creates a directory                                                                                   |
| `Dir.exists()`                     | class function  | checks if a directory exists                                                                          |
| `Dir.remove()`                     | class function  | removes an empty directory                                                                            |
| `Dir.remove_all()`                 | class function  | removes a non-empty directory                                                                         |
| `Dir.personal_config_path()`       | class function  | gets the personal configuration directory path                                                        |
| `Dir.global_config_path()`         | class function  | gets the global configuration directory path                                                          |
| `Dir.personal_plugins_path()`      | class function  | gets the personal plugins directory path                                                              |
| `Dir.global_plugins_path()`        | class function  | gets the global plugins directory path                                                                |
| `Dissector.list()`                 | class function  | gets a Lua array table of all registered Dissector names                                              |
| `DissectorTable.heuristic_list()`  | class function  | gets a Lua array table of all heuristic list names                                                    |
| `DissectorTable.list()`            | class function  | gets a Lua array table of all [DissectorTable](/LuaApi/Dissector) names                               |
| `DissectorTable:remove_all()`      | class method    | removes all dissectors from a table                                                                   |
| `DissectorTable:set()`             | class method    | remove existing dissectors from a table and add a new or a range of new dissectors                    |
| `Field.list()`                     | class function  | gets a Lua array table of all registered field names                                                  |
| `Listener.list()`                  | class function  | gets a Lua array table of all registered tappble names                                                |
| `Proto:register_heuristic()`       | class method    | sets a heuristic dissector function                                                                   |
| `Proto.experts`                    | class attribute | a table of [ProtoExpert](/LuaApi/Dissector) objects for the protocol                                  |
| `ProtoField.rel_oid()`             | class function  | creates a [ProtoField](/LuaApi/Dissector) for an ASN relative OID                                     |
| `ProtoField.systemid()`            | class function  | creates a [ProtoField](/LuaApi/Dissector) for a system ID                                             |
| `TreeItem:prepend_text()`          | class method    | prepends text to the tree label                                                                       |
| `TreeItem:add_proto_expert_info()` | class method    | adds expert info to the packet                                                                        |
| `TreeItem:add_tvb_expert_info()`   | class method    | adds expert info to the packet associated with the Tvb                                                |
| `Tvb:raw()`                        | class method    | gets a Lua string of the binary bytes in a Tvb                                                        |
| `TvbRange:raw()`                   | class method    | gets a Lua string of the binary bytes in a [TvbRange](/TvbRange)                                      |
| `TvbRange:strsize()`               | class method    | gets the size of a zero terminated string from a [TvbRange](/TvbRange)                                |
| `file_exists()`                    | global function | checks if the given filename already exists                                                           |
| `register_filehandler()`           | global function | registers a [FileHandler](/FileHandler) object into Wireshark                                         |
| `deregister_filehandler()`         | global function | de-registers a [FileHandler](/FileHandler) object from Wireshark                                      |


#### New classes

| item                                  | type     | description                                                                              |
| ------------------------------------- | -------- | -------------------------------------------------------------------------------------------- |
| [CaptureInfo](/CaptureInfo)           | class    | Custom file format reading/writing: capture file data and meta-data                          |
| [CaptureInfoConst](/CaptureInfoConst) | class    | Custom file format reading/writing: capture file data and meta-data                          |
| File                                  | class    | Custom file format reading/writing: a class similar to the Lua `io` library's `file` object  |
| [FileHandler](/FileHandler)           | class    | Custom file format reading/writing: lets you create a file-format reader, or writer, or both |
| [FrameInfo](/FrameInfo)               | class    | Custom file format reading/writing: represents frame data and meta-data                      |
| [FrameInfoConst](/FrameInfoConst)     | class    | Custom file format reading/writing: represents frame data and meta-data                      |
| GRegex                                | class    | a class for Glib/PCRE regular expressions                                                    |
| [ProtoExpert](/ProtoExpert)           | class    | protocol expert info field, to be used when adding items to the dissection tree              |
| Int64                                 | class    | this class existed before, but with almost no methods; now it has lots                       |
| UInt64                                | class    | this class existed before, but with almost no methods; now it has lots                       |
| Struct                                | class    | a set of class functions for binary Lua string handling                                      |

#### New global constants/variables

| item                       | type            | description                           |
| -------------------------- | --------------- | ------------------------------------- |
| `ENC_3GPP_TS_23_038_7BITS` | global constant | a number for a specific encoding type |
| `ENC_ISO_8859_1`           | global constant | a number for a specific encoding type |
| `ENC_ISO_8859_10`          | global constant | a number for a specific encoding type |
| `ENC_ISO_8859_11`          | global constant | a number for a specific encoding type |
| `ENC_ISO_8859_13`          | global constant | a number for a specific encoding type |
| `ENC_ISO_8859_14`          | global constant | a number for a specific encoding type |
| `ENC_ISO_8859_15`          | global constant | a number for a specific encoding type |
| `ENC_ISO_8859_16`          | global constant | a number for a specific encoding type |
| `ENC_ISO_8859_2`           | global constant | a number for a specific encoding type |
| `ENC_ISO_8859_3`           | global constant | a number for a specific encoding type |
| `ENC_ISO_8859_4`           | global constant | a number for a specific encoding type |
| `ENC_ISO_8859_5`           | global constant | a number for a specific encoding type |
| `ENC_ISO_8859_6`           | global constant | a number for a specific encoding type |
| `ENC_ISO_8859_7`           | global constant | a number for a specific encoding type |
| `ENC_ISO_8859_8`           | global constant | a number for a specific encoding type |
| `ENC_ISO_8859_9`           | global constant | a number for a specific encoding type |
| `ENC_TIME_TOD`             | global constant | a number for a specific encoding type |
| `ENC_UCS_4`                | global constant | a number for a specific encoding type |
| `ENC_WINDOWS_1250`         | global constant | a number for a specific encoding type |
| `MENU_STAT_TELEPHONY_GSM`  | global constant | a number for a GUI menu               |
| `MENU_STAT_TELEPHONY_LTE`  | global constant | a number for a GUI menu               |
| `MENU_STAT_TELEPHONY_SCTP` | global constant | a number for a GUI menu               |

---

Imported from https://wiki.wireshark.org/Lua/ApiChanges on 2020-08-11 23:16:07 UTC
