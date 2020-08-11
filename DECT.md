# DECT

DECT \[Digital Enhanced Cordless Telecommunications\] is a standard which is primarily used for cordless telephones.

## History

The standard was originally called Digital European Cordless Telephony and became popular in the mid-1990s. The base standards for DECT are [ETSI](http://www.etsi.org/WebSite/Technologies/DECT.aspx) standards EN 300 175-1 through EN 300 175-8.

## Wireshark

No support for dissecting DECT is present in the main Wireshark repository. However, a set of patches for 1.0.5 to dissect DECT Medium Access Control layer artificially encapsulated in Ethernet has been produced by the [dedected.org](https://dedected.org) project and is [available](https://dedected.org/trac/browser/trunk/wireshark-dect). libpcap has no direct support for DECT hardware and the dedected.org project's tools running on Linux need to be used to capture packets. The only hardware which works with these tools is the Dosch & Amand Type II PCMCIA Com-On-Air cards. These are no longer manufactured.

---

Imported from https://wiki.wireshark.org/DECT on 2020-08-11 23:12:36 UTC
