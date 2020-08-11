Describe Protocols/mp2t here.

# Cable Labs Tag Packet Content Protection

Cable Labs Describes a content encryption scheme using mp2t packets inserted into the stream.

This is described in Annex I of OC-SP-DRI. There is no unique way to identify these packets but at 16 bytes off the TS packet 47 you can find the 16 byte UUID of the drm system used.

There are two known UUIDs

  - Windows Media "uuid:B0AA4966-3B39-400A-AC35-44F41B46C96B"
  - Real Network Helix "uuid:EFD84861-F0BD-4913-B6AD-551D34D24E73"

---

Imported from https://wiki.wireshark.org/Protocols/mp2t on 2020-08-11 23:21:09 UTC
