:warning: Outdated discussion. Lua was originally just a plugin for Wireshark, but became integrated as of v0.99.4.

# Implementation Notes

## No Registration, just Handoff

Lua it's been added to wireshark as a plugin, its registration function doesn't do anything, it isn't until handoff that the given script is compiled and executed. The reasons for this are:

  - every wireshark dissector (those in C) has already been registered. Lua resolves naming conflicts without an assertion, it just returns an error if an user tries to register a protocol that already exists, if a lua protocol named XXX was added before the wireshark XXX dissector was added there would have been a critical error.
  - as all of the dissectors have already registered operations on dissector tables

## to plugin or not to plugin?

While I believe it's a good thing in general that Lua is an optional module for wireshark I see few problems with this.

  - It would be better that Lua's script was run \*after\* every other dissector has already handoff but \*before\* user preferences are setup. Currently wireshark loads plugins in a random order so some dissectors handoffs have not yet been called when Lua runs the script.

  - It is hard to specify which script to load. Right now Lua loads an script called `init.lua` located in the user's config directory. If the environment variable `WIRESHARK_LUA_INIT` is set it will look for a script located there. If Lua used a preference module for the script pathname then protocols written in Lua could not register their own preferences. The other way would be to add an -option to tell wireshark to tell lua where to look for, unfortunately we cannot use but the latin alphabet and it's too short for wireshark's options.

---

Imported from https://wiki.wireshark.org/Lua/ImplementationNotes on 2020-08-11 23:16:12 UTC
