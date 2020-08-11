# ISO 10747 IDRP Interdomain Routing Protocol

The "Protocol for Exchange of Inter-domain Routeing Information" is a distance vector routing protocol designed to connect OSI routing domains.

At present the protocol implements the "mobile routing" in the Aeronautical Telecommunications Network (ATN, air ground datalink over VDL-Mode2) when an aircraft domain moves across several ground network domains along its flight path.

In addition it is used for the exchange of routing information between Boundary Intermediate System (BIS) level ATN-Routers between different routing domains.

The dissector allows to decode CLNP/IDRP on top of Ethernet/IP packets which becomes increasingly important as X.25 ground networks are slowly superseeded and replaced by IP based communication. The main reason for this is that 'native' X.25 may be not longer supported by major network providers and Air Navigation Service Providers.

Please note that CLNP/IDRP is currently unsupported when run over XoT which may be used as a intermediate technology when migrating from X.25 to IP.

Its closest relative in the IP protocol family is BGP.

## History

IDRP has been specified in ISO 10747 in 1993.

## Protocol dependencies

IDRP implements a CLNP subdissector. If PDU's the first octet of CLNP user data has the value 0x85 (FIXME: nlpid is still 0x81 in the samples, but should be 0x85)

the packet is considered as an IDRP PDU.

CLNP Network Selector (aka last octet of OSI network address, NSEL) is 0x00 (network user) instead of 0x01 (COTP/CLTP user ).

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

FIXME: the dissector is available in the current SVN version of wireshark (internal dissector).

## Preference Settings

The dissector works independently of CLNP settings - no IDRP settings tab present within preferences.

## Example capture file

The sample\[<https://bugs.wireshark.org/bugzilla/attachment.cgi?id=10550>\] shows a connection establishment with subsequent exchange of routing information.

## Display Filter

XXX - reference TBD. Prefix is "idrp".

## Capture Filter

XXX - TBD. capture filter "idrp" seems to work with files.

## External links

IDRP spec\[<https://bugs.wireshark.org/bugzilla/attachment.cgi?id=10642>\] Bugtracker\[<https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8562>\]

---

Imported from https://wiki.wireshark.org/IDRP on 2020-08-11 23:14:59 UTC
