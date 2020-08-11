# Radio Access Network Application Protocol IuCS-UP User Plane (RANAP)

## History

RANAP is specified in [3GPP TS 25.413](http://www.3gpp.org/ftp/Specs/html-info/25413.htm)

## Protocol dependencies

  - [SCCP](/SCCP): Typically, RANAP uses [SCCP](/SCCP) Class-2 as its transport protocol. The SSN normaly used for RANAP is 142.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The RANAP dissector is fully functional.

## Preference Settings

The SCCP SSN used to carry RANAP is a preference in the RANAP dissector; this is useful if you have RANAP carried over an SSN other than the default of 142.

## Example capture file

  - [SampleCaptures/3gpp\_mc.cap](uploads/__moin_import__/attachments/SampleCaptures/3gpp_mc.cap) contains some RANAP packets

## Display Filter

A complete list of RANAP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/protofirstletter/proto.html)

Show only the RANAP based traffic:

``` 
 ranap 
```

## Capture Filter

You cannot directly filter RANAP packets while capturing.

## External links

  - [3GPP TS 25.413](http://www.3gpp.org/ftp/Specs/html-info/25413.htm) specifies RANAP

## Discussion

---

Imported from https://wiki.wireshark.org/RANAP on 2020-08-11 23:23:48 UTC
