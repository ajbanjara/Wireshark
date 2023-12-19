# Link Layer Discovery Protocol (LLDP, IEEE 802.1AB)

The Link Layer Discovery Protocol (LLDP) is a vendor neutral layer 2 protocol that can be used by a station attached to a specific LAN segment to advertise its identity and capabilities and to also receive same from a physically adjacent layer 2 peer.

## History

After several years of development LLDP was formally defined in May of 2005 as [IEEE Std 802.1AB-2005](https://standards.ieee.org/standard/802_1AB-2005.html).

LLDP was developed as an open and extendable standard. It was modeled on and borrowed concepts from the numerous vendor proprietary discovery protocols such as Cisco Discovery Protocol (CDP), Extreme Discovery Protocol (EDP) and others.

## Protocol dependencies

  - [Ethernet](/Ethernet): Typically, LLDP uses [Ethernet](/Ethernet) as its "transport" protocol. The Ethernet type for LLDP is 0x88cc.

  - Other IEEE 802 networks: LLDP can also use other 802 networks as a "transport" protocol, with a SNAP header with an Ethernet type of 0x88cc.

LLDP Data Units (LLDPDUs) are sent to the destination MAC address 01:80:c2:00:00:0e. This address is defined as the "LLDP\_Multicast" address. This address is defined within a range of addresses reserved by the IEEE for protocols that are to be constrained to an individual LAN. AN LLDPDU will not be forwarded by MAC bridges (e.g. switches) that conform to IEEE Std 802.1D-2004.

LLDPDUs can be directly encoded with an Ethertype value of 0x88cc or they may be encapsulated within an SNAP-encoded (Subnetwork Access Protocols - IEEE Std 802-201) LLC frame. If SNAP-encoded, a SNAP discriminator value of aa:aa:03:00:00:00 will be prepended to the LLDP Ethertype value of 0x88cc.

## Example traffic

Screenshot: [LLDP.png](uploads/__moin_import__/attachments/LinkLayerDiscoveryProtocol/LLDP.png)

<span class="comment" style="display:none">XXX - Add example traffic here (as plain text or Wireshark screenshot).</span>

## Wireshark

Support for LLDP (and the TIA's LLDP-MED extensions) is available since Wireshark 0.10.13 (SVN version 15800).

## Preference Settings

N/A

## Example capture file

Included below are two very small example LLDP trace files. The lldp.minimal.pcap file includes just a single lldp frame that contains the required minimum LLDP TLV entries. The lldp.detailed.pcap file includes just a single lldp frame that contains many of the optional LLDP TLV entries.

[SampleCaptures/lldp.minimal.pcap](uploads/__moin_import__/attachments/SampleCaptures/lldp.minimal.pcap) [SampleCaptures/lldp.detailed.pcap](uploads/__moin_import__/attachments/SampleCaptures/lldp.detailed.pcap)

Included below is an example LLDP-MED trace file. The lldpmed\_civicloc.pcap file incluces a single lldp-med frame that contains several of the LLDP-MED TLV entries, including civic address location ID, network policy and extended power-via-MDI.

[SampleCaptures/lldpmed\_civicloc.pcap](uploads/__moin_import__/attachments/SampleCaptures/lldpmed_civicloc.pcap)

## Display Filter

A complete list of LLDP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/l/lldp.html)

To display only the LLDP based traffic use:

    lldp

## Capture Filter

To capture only the LLDP based traffic use:

    ether proto 0x88cc

## External links

The formal LLDP specification is freely available for download at:

  - [IEEE Std 802.1AB-2016 (Revision of IEEE Std 802.1AB-2009) ''IEEE Standard for Local and metropolitan area networks -- Station and Media Access Control Connectivity Discovery''](https://standards.ieee.org/findstds/standard/802.1AB-2016.html) :white\_check\_mark: **Active Standard**

  - <span class="strike">[IEEE Std 802.1AB-2009 ''IEEE Standard for Local and Metropolitan Area Networks -- Station and Media Access Control Connectivity Discovery''](http://standards.ieee.org/getieee802/download/802.1AB-2009.pdf)</span> :x: **Superseded Standard**

  - <span class="strike">[IEEE Std 802.1AB-2005 ''IEEE Standard for Local and metropolitan area networks -- Station and Media Access Control Connectivity Discovery''](http://standards.ieee.org/getieee802/download/802.1AB-2005.pdf)</span> :x: **Superseded Standard**

Included below are some links with potentially useful information regarding LLDP and/or link layer discovery:

  - [What is LLDP?](http://www.webopedia.com/TERM/L/LLDP.html) from webopedia.com

  - [Tutorial on the Link Layer Discovery Protocol](http://www.commsdesign.com/design_corner/showArticle.jhtml?articleID=59200019) from commsdesign.com (by Manikantan Srinivasan)

  - [LLDP helps troubleshoot, map and more](http://www.networkworld.com/news/tech/2004/100404techupdate.html) from networkworld.com

  - [Layer 2 Layout: Layer 2 Discovery Digs Deep](http://www.nwc.com/showitem.jhtml?docid=1423ws1) from nwc.com

  - [Die Entdeckung der Netzwerk-Topologie](http://www.elektroniknet.de/topics/kommunikation/fachthemen/2006/0001/index.htm) (article in german)

For some perspective on how the LLDP came to be, see the following from ieee802.org:

  - [Link Layer Discovery Protocol and MIB - v1.0 (Paul Congdon - 5/20/02)](http://www.ieee802.org/1/files/public/docs2002/lldp-protocol-01.pdf)

  - [Link Layer Discovery Protocol and MIB - v0.0 (Paul Congdon - 3/7/02)](http://www.ieee802.org/1/files/public/docs2002/lldp-protocol-00.pdf)

It's interesting to note that unlike the LLDP drafts referenced above, the final LLDP standard abandoned the notion of an LLDP Header and instead simply mandated the presence of certain TLVs. In the various draft documents the LLDP Header was supposed to include a Version field. The current LLDP standard does not include any notion of a Version.

LLDP agent for Windows:

  - [haneWIN LLDP Service](https://hanewin.net/lldp-e.htm) - Windows 2000/XP (shareware)

  - [WinLLDPService](https://raspi.github.io/projects/winlldpservice/) - last release: February 2018 (opensource)

Open source LLDP projects:

  - [OpenLLDP](http://openlldp.sourceforge.net/index.html) - last release: 0.4alpha (June 2010)

  - [ladvd](https://github.com/sspans/ladvd/) - last release: 1.1.2 (March 2018)

  - [lldpd](https://lldpd.github.io/) - last release: 1.0.17 (May 2023)

  - [Open-LLDP](https://github.com/intel/openlldp) - last release: 1.1.0 (November 2020)

## Discussion

There are both mandatory and optional LLDP TLVs defined. All compliant LLDP Data Units (LLDPDUs) must contain at a minimum the following four mandated TLVs in the following order :

  - Chassis ID TLV (Type = 1)
  - Port ID TLV (Type = 2)
  - Time To Live TLV (Type = 3)
  - End of LLDPDU TLV (Type = 0)

If the LLDPDU includes optional TLVs they will be inserted between the Time To Live TLV and End of LLDPDU TLV.

Optional TLVs include the Basic set of TLVS and the Organizationally Specific TLVS.

Besides the four mandated TLVs listed above the Basic set of LLDP TLVs also includes:

  - Port Description TLV (Type = 4)
  - System Name TLV (Type = 5)
  - System Description TLV (Type = 6)
  - System Capabilities TLV (Type = 7)
  - Management Address TLV (Type = 8)

### Organizationally Specific TLVs

The LLDP specification allows for various organizations to define and encode their own TLVs. These are called Organizationally Specific TLVs. All Organizationally Specific TLVs start with an LLDP TLV Type value of 127.

  - Organizationally Specific TLV (Type = 127)

The length field of an Organizationally Specific TLV is followed by a 3 octet (24 bit) organizationally unique identifier (OUI) value which is then followed by a 1 octet organizationally defined subtype.

The following organizations have published Organizationally Specific TLVs:

  - 00-80-c2 - IEEE 802.1
  - 00-12-0F - IEEE 802.3
  - 00-12-BB - TIA TR-41 Committee - Media Endpoint Discovery (LLDP-MED, ANSI/TIA-1057)
  - 00-0E-CF - PROFIBUS International (PNO) Extension for PROFINET discovery information
  - 30-B2-16 - Hytec Geraetebau GmbH Extensions

LLDP specification defines the following set of IEEE 802.1 Organizationally Specific TLVs [reference(02-Dec-2011)](http://www.ieee802.org/1/files/public/802-1-organizationally-specific-tlvs/):

  - Port VLAN ID TLV (OUI = 00-80-c2, Subtype = 1)
  - Port And Protocol VLAN ID TLV (OUI = 00-80-c2, Subtype = 2)
  - VLAN Name TLV (OUI = 00-80-c2, Subtype = 3)
  - Protocol Identity (OUI = 00-80-c2, Subtype = 4)
  - VID Usage Digest (OUI = 00-80-c2, Subtype = 5)
  - Management VID (OUI = 00-80-c2, Subtype = 6)
  - Link Aggregation (OUI = 00-80-c2, Subtype = 7)
  - Congestion Notification (OUI = 00-80-c2, Subtype = 8)
  - ETS Configuration TLV (OUI = 00-80-c2, Subtype = 9)
  - ETS Recommendation TLV (OUI = 00-80-c2, Subtype = A)
  - Priority-based Flow Control Configuration TLV (OUI = 00-80-c2, Subtype = B )
  - Application Priority TLV (OUI = 00-80-c2, Subtype = C)
  - EVB TLV (OUI = 00-80-c2, Subtype = D)
  - CDCP TLV (OUI = 00-80-c2, Subtype = E)
  - Port extension TLV (OUI = 00-80-c2, Subtype = F)

Annex G of the LLDP specification defines the following set of IEEE 802.3 Organizationally Specific TLVs:

  - MAC/PHY Configuration/Status TLV (OUI = 00-12-0f, Subtype = 1)
  - Power Via MDI TLV (OUI = 00-12-0f, Subtype = 2)
  - Link Aggregation TLV (OUI = 00-12-0f, Subtype = 3)
  - Maximum Frame Size TLV (OUI = 00-12-0f, Subtype = 4)

The Telephone Industry Association specification ANSI/TIA-1057 (April 2006) defines the LLDP-MED specific TLVs. The formal LLDP-MED specification is freely available for download at:

  - [TIA Online](http://www.tiaonline.org/standards/committees/tr-41/index.cfm)

The LLDP-MED specification defines the following set of TIA Organizationally Specific TLVs:

  - LLDP-MED Capabilities TLV (OUI = 00-12-BB, Subtype = 1)
  - Network Policy TLV (OUI = 00-12-BB, Subtype = 2)
  - Location Identification TLV (OUI = 00-12-BB, Subtype = 3)
  - Extended Power-via-MDI TLV (OUI = 00-12-BB, Subtype = 4)
  - Inventory - Hardware Revision TLV (OUI = 00-12-BB, Subtype = 5)
  - Inventory - Firmware Revision TLV (OUI = 00-12-BB, Subtype = 6)
  - Inventory - Software Revision TLV (OUI = 00-12-BB, Subtype = 7)
  - Inventory - Serial Number TLV (OUI = 00-12-BB, Subtype = 8)
  - Inventory - Manufacturer Name TLV (OUI = 00-12-BB, Subtype = 9)
  - Inventory - Model Name TLV (OUI = 00-12-BB, Subtype = 10)
  - Inventory - Asset ID TLV (OUI = 00-12-BB, Subtype = 11)

The following links include some information regarding LLDP-MED.

  - [LLDP-MED simplifies VoIP deployments (from Network World)](https://www.networkworld.com/article/2326532/lldp-med-simplifies-voip-deployments.html)

  - [LLDP & LLDP-MED Standards (CIMA MS Power Point presentation)](http://www.state.co.us/cima/2005Spring/Presentations/ProCurve%20Networking%20LLDP%20&%20LLDP-MED%20Standards.ppt)

  - [VoWLAN and LLDP-MED (TIA Engineering Subcommittee TR-41 Contribution MS Word document)](http://ftp.tiaonline.org/tr-41/tr41.4/Public/2004-11-SanAntonio/TR41.4-04-11-015-LM-VoWLANAndLLDP-MED.doc)

XXX - Probably LLDP-MED section should be expanded and moved to seperate Wiki page.

The LLDP specification defines the following set of Hytec Organizationally Specific TLVs (Homepage: [www.hytec.de](http://www.hytec.de), protocol documentation: [HYTEC](/HYTEC)):

  - Transceiver TLV (OUI = 30-B2-16, Subtype = 1)
  - Trace TLV (OUI = 30-B2-16, Subtype = 2)

---

Imported from https://wiki.wireshark.org/LinkLayerDiscoveryProtocol on 2020-08-11 23:16:00 UTC
