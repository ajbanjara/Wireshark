# Mobile Telephony family protocols

Protocols used for signaling between Mobile telephony nodes, etc.

## Protocols

  - [GsmProtocolFamily](/GsmProtocolFamily): The GSM family of protocols.

  - (Should UMTS get its own protocol family page?)

  - [DampsProtocolFamily](/DampsProtocolFamily): The D-AMPS (IS-54 and IS-136) families of protocols.

  - [Is95ProtocolFamily](/Is95ProtocolFamily): The IS-95 (cdmaOne) family of protocols.

  - [Cdma2000ProtocolFamily](/Cdma2000ProtocolFamily): The CDMA2000 family of protocols. (Does this have enough in common with IS-95 to be combined with it?)

  - [UMA](/UMA): Unlicensed Mobile Access "R1.0.2 (2004-11-05)" <http://www.umatechnology.org/> ([3GPP TS 44.318](http://www.3gpp.org/ftp/Specs/html-info/44318.htm))

  - [WAP](/WAP): The Wireless Application Protocol, see also [WapProtocolFamily](/WapProtocolFamily).

  - [LTEProtocolFamily](/LTEProtocolFamily): Long Term Evolution Protocols

## Discussion

The 3GPP collection of specifications now covers GSM and UMTS and so any descriptions should be based on these. [http://wiki.wireshark.org/3GPP](/3GPP)

Would it be a better idea to give an overview of all the protocols (and families) at a [TelephonyProtocolFamily](/TelephonyProtocolFamily) (or [TelephonyProtocolFamilies](/TelephonyProtocolFamilies)) page? I would love to see a starting page for this topic, as I don't know telephony protocols well and would welcome an overview which is currently not existing :frowning: - *Ulf Lamping* I.e., put wired telephony protocols (ISDN, SS7, VoIP-specific, etc.) here as well? (I think wired and wireless telephony might share some protocols, or, at least, mobile telephony might have protocols derived from wired telephony protocols.) We already have two levels of hierarchy for telephony protocols (GSM is under MobileTelephonyProtocolFamily); would we want two levels (with any future ISDN, SS7, etc. family pages put under the [TelephonyProtocolFamilies](/TelephonyProtocolFamilies) page), or three levels, with MobileTelephonyProtocolFamily being under [TelephonyProtocolFamilies](/TelephonyProtocolFamilies)? - *Guy Harris*) Hmm I guess there is an overlap in protocols in all directions SS7/SCCP/TCAP/INAP/ISUP/Q.931 + others used in Wireline the same protocols exept Q.931(?) used in [MobileTelephony](/MobileTelephony) + a lot of Mobile specific protocols and in VoIP you get SIGTRAN + others. Perhaps it makes sence to have a [TelephonyProtocolFamily](/TelephonyProtocolFamily) page and on that page make a list of Mobile specific protocols under that heading? - *Anders Broman*)

Hey Anders, actually even Q.931 overlaps into [MobileTelephony](/MobileTelephony); the DTAP protocol use to set up calls between a GSM BSC and MSC is essentially Q.931... Regards, Micah Lax

We will never be able to avoid overlap in the type of protocols we are handling. Instead, I'd favor a "view" approach, where you could limit the view to protocols only relevant in a given view, like Mobile Telephony. -- *Olivier Biot*

Folks, I just added [WAP](/WAP) and [WapProtocolFamily](/WapProtocolFamily) to the list, as I think this makes sense... - *Olivier Biot*

---

Imported from https://wiki.wireshark.org/MobileTelephonyProtocolFamily on 2020-08-11 23:16:50 UTC
