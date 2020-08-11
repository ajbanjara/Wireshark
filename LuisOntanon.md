# LEGO

<div>

<table>

<tbody>

<tr>

<td colspan="1" rowspan="2" style="text-align: center">

![lego.jpg](uploads/__moin_import__/attachments/LuisOntanon/lego.jpg "lego.jpg")

</div>

</td>

<td style="vertical-align: top">

I'm a troubleshooter on GSM/UMTS networks working as a contractor for a major telecommunications manufacturer. I'm also a developer of Wireshark, usually "seen" as LEGO (which is a four letter acronym of my entire name: Luis Enrique Garcia Ontañón). In the past I've been an electrician, a pre-press specialist, a system administrator of a (very) small ISP, even an Operations "Manager" for a Mobile Operator. (Please note that I managed only machines... besides those I can barely manage myself :wink: ).

</td>

</tr>

<tr>

<td style="vertical-align: bottom">

My e-mail is `<luis@ontanon.org>` . Please, do not contact me for issues regarding Wireshark development send your queries/suggestions to <wireshark-dev@wireshark.org> instead.

</td>

</tr>

</tbody>

</table>

</div>

-----

I been a Wireshark contributor since 2003. As a Wireshark developer My principal contributions are:

  - [SIGTRAN/UMTS/GSM](/GsmProtocolFamily) enhancements, my "normal" job
    
      - [H.248](/H248/MEGACO) package decoding
    
      - [H.248](/H248/MEGACO) context tracking
    
      - [SCCP](/SCCP) connection tracking
    
      - [ALCAP](/ALCAP) (Q.AAL2) filter enhancements, and call tracking
    
      - IuUP dissector
    
      - [SCTP](/SCTP) TSN tracking
    
      - added H.248, BSSAP and RANAP to the [VoIP Calls](/VoIP_calls) tap

  - [display filter](/DisplayFilters) flexibility, my personal obsession :smiley:
    
      - an [XML](/XML) dissector that uses DTDs to create filter fields for XML documents
    
      - [RADIUS](/RADIUS) dictionary support to create field filters for filtering the values of AVPS
    
      - [DIAMETER](/DIAMETER) dictionary support, twice like above :smiley:
    
      - [SNMP](/SNMP) SMI based filtering, that create field filters from MIBs for filtering the values of SNMP variables and indexes

  - User Enhancement additions,
    
      - [Lua](/Lua) bindings
    
      - [Mate](/Mate) Meta Analysis Tracing Engine
    
      - [Display Filter Macros](/DFilterMacro)

  - Other things
    
      - [tektronix](/tektronix) K12xx-K15 .rf5 and text file support
    
      - SNMPv3 decryption
    
      - [editcap](http://www.wireshark.org/docs/man-pages/editcap.html)'s -A and -B options to slice files from a time to another time

  - Things that only developers use
    
      - I followed [RonnieSahlberg](/RonnieSahlberg) when he created emem by writing the ep\_ and se\_ helpers (ep\_strdup, se\_strdup\_printf, ep\_memdup, etc.)
    
      - UATs user editable tables for user preferences

-----

lego's portrait by [Paolo Maddaleni](http://www.maddaleni.blogspot.com)

---

Imported from https://wiki.wireshark.org/LuisOntanon on 2020-08-11 23:16:21 UTC
