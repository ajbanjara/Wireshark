# Greg Morris

**Location:** Currently located in Rotterdam, The Netherlands. Previously worked from Provo, Utah.

**Activities:** Started developing for Ethereal in late 2000. Expanded Gilbert Ramirez's initial dissector for Novell's [NetWare](/NetWare) Core Protocol (NCP). The dissector was expanded to include a majority of publicly documented NCP functions. After many years and much learning I was granted core team membership in early 2006 (At the same time that Gerald moved companies :wink: ).

My primary focus is on the Novell related protocols and current dissectors including.

-----

  - [NetWare](/NetWare) Core Protocol - NCP

Extensions to the NCP dissector add additional Novell protocols:

  - Novell Directory Services - NDS (NCP Functions 104,x)
  - Novell Modular Authentication Services - NMAS (NCP Functions 94,x)
  - Novell Secret Store Services - SSS (NCP Functions 92,x)

Advanced feature set of the NCP dissector:

  - Packet Signature
  - NDS Fragment Reply Packet Reassembly
  - NDS Entry ID to Name Lookups

Expert options added to track specific conditions: (Enable/disable in NCP protocol preferences)

  - Error/Return Codes
  - True NCP conversation tracking by task ID
  - NDS Entry ID to Name table
  - Server Information
  - File open/close/lock activity

-----

The following is a listing of other Novell specific dissector work:

  - Novell Distributed Print Services - NDPS
  - Novell Cluster Services - NCS

-----

In addition to the work done on Novell specific dissectors a number of other dissectors have been modified to handle Novell specific conditions... This work includes

  - BOOTP/ DHCP
  - SRVLOC/SLP
  - IPX/SPX
  - Etc

-----

Finally, my work has not been limited to just dissection of protocol data. I have also submitted a number of GUI enhancements.

  - Composite Expert Information
  - Find by (hex or string)
  - Copy to system paste buffer

---

Imported from https://wiki.wireshark.org/GregMorris on 2020-08-11 23:14:21 UTC
