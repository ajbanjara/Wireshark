# Hub Reference

Are there any Gigabit hubs?

## General

This page tells you which devices are hubs and which aren't.

As described in the [CaptureSetup](/CaptureSetup) section (especially the [CaptureSetup/Ethernet](/CaptureSetup/Ethernet) page), hubs can be useful for capturing. Unfortunately, many "hubs" are actually switches these days. Information about (managable) switches can be found at the [SwitchReference](/SwitchReference). Tap information can be found at [TapReference](/TapReference).

In general, if you find something with "full-duplex" in the device description, this is in fact a switch and not a hub. This is often the case with 100MBit Ethernet devices.

If you use a 10MBit hub, and it's stated to be a hub, it will be a hub.

## Dual-speed hub warning

**Note that "dual-speed" hubs that support both 10MBit and 100MBit ports might not send all unicast traffic between 10MBit and 100MBit ports; if so, you can only capture all traffic between hosts whose Ethernet interfaces are both running at the same speed as the Ethernet interface on the machine capturing traffic.**

This means that if you have two hosts communicating at 100MBit/s, you will only be able to capture the traffic between them if the Ethernet interface of the machine capturing traffic is configured for 100MBit/s. Similarly, if you have two hosts communicating at 10MBit/s, you will only be able to capture the traffic between them if the Ethernet interface of the machine capturing traffic is configured for 10MBit/s, which is probably not the default configuration.

Some dual-speed hubs don't connect the 10MBit and 100MBit ports at all; with those hubs, two hosts whose Ethernet interfaces are running at different speeds will not be able to communicate, so there's no traffic between hosts of different speeds, and thus no traffic between them to capture.

Other dual-speed hubs have an internal switch connecting the 10MBit and 100 Mbit ports, so that only broadcast and multicast traffic, and unicast traffic to the host on a particular port, will be sent to that port if the traffic comes from a port with a different speed; with those hubs, two hosts whose Ethernet interfaces are running at different speeds *will* be able to communicate.

If you have a dual-speed hub with an internal switch, it means that if you have a 10MBit host communicating with a 100MBit host and you will only be able to see one direction of that traffic; you will only see the traffic from the 10MBit host if the interface of the machine capturing traffic is configured for 10Mbit/s, and you will only see the traffic from the 100 Mbit host if the interface of the machine capturing traffic is configured for 100MBit/s.

### Workaround (Tested & Verified on Netgear Dual Speed HUB)

Configure capturing PC/Latop(windows) with an IP address in the Sub-Network of interested, then immediately you see traffic from the hosts in that Sub-Network inadditon to broadcast traffic. You can configure additional IP addresses on the interface if the HUB happen to connected with multiple networks (bad practice), so that you see the traffic from all the networks on the Hub. Could not find the reason behnd this ? hopefully somebody will provide the reason.

## Some simplified Ethernet history

As with early 10MBit, the "line-based topology" (thick/thin "coax" Ethernet) was state of the art. The invention of hubs made the "star-based topology" (twisted pair, RJ45) widely accepted. Later, nearly at the "same time", both 100MBit and switches hit the market, so you could get 10MBit Switches and 100MBit Hubs (and really expensive 100MBit Switches for quite a while). Every device after that period will certainly be a 10/100MBit (or 100MBit only) switch, probably with some exceptions.

I don't know if the above is true for other networks than Ethernet, but I suspect it is.

## REAL HUBS:

Devices that are real hubs; convenient for capturing. Side Note: This category could really be broken into hubs that are real hubs (i.e. repeaters) and hubs that are really switches with learning disabled. Most new hubs are in the latter category as it is a cost effective way for manufacturers to produce hubs using the same chips as their switches. The difference from a packet sniffing point of view is that the hub based on switch technology will only forward 'clean' packets whereas a genuine hub is an electrical repeater and has no knowledge of what a packet should look like. You could have a device on your network spitting out all kinds of malformed junk but if you're sniffing via a switch type hub, you won't see it. Neither is to be confused with a switch which operates as a switch (i.e. learns and maintains a MAC address table) but has been called a hub by well meaning but ultimately dumb people in marketing.

***Please add information to this list about models you know (including valuable info such as link speed and the like) ....***

**3Com**

  - OfficeConnect Dual Speed Hub 16 (3C16751B) -- *[GeraldCombs](/GeraldCombs)*

  - OfficeConnect Dual Speed Hub 8 (3C16750B) -- *T. Eric Hong*

  - See above: From the 3com site: "The [OfficeConnect](/OfficeConnect) Dual Speed Hub 8 features eight 10/100 Mbps Ethernet hub ports that automatically sense and match the speed of an attached network device to optimize performance. An internal built-in switch seamlessly connects users." -- *Tim Casey*

  - OfficeConnect Dual Speed Hub 8 (3C16753) -- N.B. Cannot sniff this variant -- *Malcolm Doody*

  - From the 3com site: "Designed specifically for the small company or home office, this flexible, reliable, plug-and-play hub offers a smooth way to migrate to higher Fast Ethernet performance yet still support Ethernet PCs and network devices. Eight autosensing 10/100 Mbps ports match the speed of any attached device to optimize throughput. A built-in switch seamlessly connects 10/100 Mbps users." -- *Tim Casey*

  - OfficeConnect 10 Mpbs Hub 4 (3C16704A) -- *Phil Gorsuch*

  - OfficeConnect Fast Ethernet 100BASE-TX Hub 4 (3C16723) This hub only does 100Mbps. -- *[KyleRogers](/KyleRogers)*

  - Superstack II Entry Hub - 3C16441 - 10/100 - Not smart-sensing (true hub behavior), 24 port rackmount. Works great with Wireshark, loads available on E-bay for \<30$ -- *Andre Bonin, Sandwave Technologies*

**Asante**

  - FriendlyNET FH305 5-port 10/100 Hub - 10 Mbit/s traffic is seen on ports linked at 10 Mbit/s and on ports linked at 100 Mbit/s. 100 Mbit/s traffic is seen on ports linked at 100 Mbit/s. Only broadcast and unlearned packets from ports linked at 100 Mbit/s are seen on ports linked at 10 Mbit/s. -- *Ricardo Muggli*

**D-Link**

  - DE-805TP 5 Port 10 Mbps Hub -- *Rendra*

**Dynex**  
Seemingly manufactured for Best Buy (from looking at the box), these are currently available in B\&M Best Buys (as of August, 2006). (still found as of Apr 2008)

  - DX-EHB4 - 4 Port 10 Mbps HUB -- *Byzantium*

**Edimax**  
Edimax still has a number of hubs available according to [their "Fast Ethernet Switches / Hub" list](http://www.edimax.nl/html/english/products/list-switches.htm):

  - ER-5398S
  - ER-5397P
  - ER-5390P is known to be working.
  - ER-5395P

*Andreas Sikkema*

**Garrett Communications**

  - [Magnum H50](http://www.garrettcom.com/h_series_ind.htm) -- *Kedar*

**Hawking**

  - 10Base-T 4-Port Hub (PN400TP) -- *Jamie Rybarczyk*

**Hewlett-Packard**

  - ProCurve 10Base-T Hub 8 (HP J4090A) -- *Petr Vacha*

**Intel**

  - [InBusiness](/InBusiness) 8-Port 10/100 Fast Hub (SH101TX8) - 100 Mbps tested -- *[YuriTri](/YuriTri)*

**Level One**

  - FHU-0400TXDS 4port 10/100Mbps (Note: no internal bridge between 10 and 100 Mbps\!) -- *[UlfLamping](/UlfLamping)*

**Linksys**

  - EFAH05W (Grey Case) - *[DonMcLane](/DonMcLane)*

  - EFAH08W version 2.0 - [EtherFast](/EtherFast) 10/100 8-Port Workgroup Hub - 10 Mbit/s traffic is seen on ports linked at 10 Mbit/s and on ports linked at 100 Mbit/s. 100 Mbit/s traffic is seen on ports linked at 100 Mbit/s. Only broadcast and unlearned packets from ports linked at 100 Mbit/s are seen on ports linked at 10 Mbit/s. -- *Ricardo Muggli*

  - EFAH24 24 Port 10/100 Old (no date), has 1 fan and 2 exp slots (Didn't test across speeds, but with everything at 100 Snort is up.)

  - EFAH16W, V2 - [EtherFast](/EtherFast) 10/100 16-Port Workgroup Hub - 10 Mbit/s traffic is seen on ports linked at 10 Mbit/s and on ports linked at 100 Mbit/s. 100 Mbit/s traffic is seen on ports linked at 100 Mbit/s. Only broadcast and unlearned packets from ports linked at 100 Mbit/s are seen on ports linked at 10 Mbit/s. This model is also listed below as a fake hub. The one I tested is most definitely a hub. It has "145000015 ADHG TA" on the barcode. On the printed circuit board it has: A/N: PCB-ADHG-TA4, P/N: ADHG Rev.TA, START: 2000/8/25. I would assume/guess earlier models are hubs and later models are switches. -- *Ricardo Muggli*

**NETGEAR**

  - DS104 Dual Speed HUB -- *Jens Link*

  - DS106 Dual Speed HUB also works

  - DS108 Dual Speed HUB -- *Jens Link*

  - DS116 Dual Speed HUB -- *Amy Phillips*

  - DS524 24-port 10/100 (bridging between 10 and 100 Mbps filters packets\!) -- reported by *Simon Bradley*

  - DS508 8-port 10/100 - part of the same family as the DS524, so it probably behaves like the DS524 -- *Guy Harris*

  - DS516 16-port 10/100 - part of the same family as the DS524, so it probably behaves like the DS524 -- *Guy Harris*

  - EN104 10Base-T Hub 4port -- *Andy Dansby*

**NDC**

  - SOHOware NDH305 5-port 10/100 Hub - 10 Mbit/s traffic is seen on ports linked at 10 Mbit/s and on ports linked at 100 Mbit/s. 100 Mbit/s traffic is seen on ports linked at 100 Mbit/s. Only broadcast and unlearned packets from ports linked at 100 Mbit/s are seen on ports linked at 10 Mbit/s. -- *Ricardo Muggli*

**Phoenix Contact**

  - FL HUB 8TX-ZF - DIN Mount 8 Port Hub - 10Mbit OR 100Mbit selectable via DIP switch -- *Guitarzan*

  - FL HUB 16TX-ZF - DIN Mount 16 Port Hub - 10Mbit OR 100Mbit selectable via DIP switch -- *Guitarzan*

**Planet**

  - EH-500 5-port 10Base-2/T -- *Lubos Zisko*

**SMC**

  - 5208TX EX Hub 10/100 8 port -- *Ric Nepil*

**W-linx**

  - SS-F05CM Mini 5 port Fast Ethernet HUB (can be powered from USB-port\!\!\!) -- *[SakeBlok](/SakeBlok)*

## FAKE HUBS:

Devices that claim to be hubs, but in fact are switches.

***Please add information to this list about models you know (including valuable info such as link speed and the like) ....***

**3Com**

[OfficeConnect](/OfficeConnect) Dual Speed Hubs From the 3com site: "The [OfficeConnect](/OfficeConnect) Dual Speed Hub 8 features eight 10/100 Mbps Ethernet hub ports that automatically sense and match the speed of an attached network device to optimize performance. An internal built-in switch seamlessly connects users."

**Asante**

  - FriendlyNET FH405 5-port 10/100 Hub - P/N 53-10266-01 - 61-20706-00 Rev. A - Tested 10 Mbit/s to 10 Mbit/s, 100 Mbit/s to 100 Mbit/s, and 10 Mbit/s to 100 Mbit/s. All results indicate this is a switch, not a hub. -- *Ricardo Muggli*

**Linksys**

  - EFAH05W -- *Erkan Altan*
    
      - Brutally-Forced Wiretap -- *David Savinkoff*
        
          - Connect Fake-Hub Uplink RJ-45 connector to network
          - Connect Fake-Hub 5th RJ-45 connector to crossover cable
          - Connect other end of crossover cable to Sniffing computer
          - Connect other side of network to Fake-Hub connectors 1...4

  - EFAH05W v2
    
      - Uses Micrel KS8995 5-Port Integrated Switch IC

  - EFAH08W -- *Erkan Altan*
    
      - Version 3.0 ONLY. Steven Posnack noted the [differences](https://web.archive.org/web/20090731214643/http://sewpsc.sewp.nasa.gov/notes.shtml).

  - EFAH16W (10/100 5-Port and 16-Port Workgroup Hubs including V2) -- *Erkan Altan*

  - EF2H24 (10/100 24 Port Hub) -- *Joe Nardone*
    
      - Version 2.0 ONLY.

  - NH1005 V2 -- *Charles Dunkirk*
    
      - I was not able to get a new hub matching this version to work for passive sniffing. -- *Ryan Sommers*
    
      - I cannot sniff this 'hub' either. After googling around, I am fairly sure this is a rebadged switch. This hub used to be under 'REAL HUBS' so I moved it down here and kept the comments and attributions -- *Rick Hull*
    
      - This is not a hub, the internals are made by a company called Kendin, the IC product number is KS8995, a 10/100 switch -- *Trey Keifer*

**Allied Telesyn**

  - AT-FH708E (Unmanaged Fast Ethernet Hub)

**SMC**

  - EZ5808DS (Unmanaged Fast Ethernet Hub) -- *Todd Parker*

**ZIO**

  - ESB550SW (10/100 5-port Switching Hub)

**Intel**

  - [InBusiness](/InBusiness) 8-Port Hub (SH10T8)

**Genius KYE SYSTEM CORP**

  - GS4080 Mini (10/100 8-port Hub)

  - Claims to be a HUB, but has an RTL8309SB chip inside, which is a single-Chip 9-Port 10/100 Mbps **SWITCH** Controller

**Versa-stack 16-port dual speed hub** - appears to be a switch not a hub *(Dave W)*

## FURTHER COMMENTS

If you know how to make a simple hub from off-the-shelf components, please let us know. Something like a "T-connector" with 3 RJ-45 connectors would be great.

Hub, or network tap? If it's a network tap, see <http://www.snort.org/docs/tap/>, linked to from [CaptureSetup/Ethernet](/CaptureSetup/Ethernet) -- *Guy Harris*

---

Imported from https://wiki.wireshark.org/HubReference on 2020-08-11 23:14:50 UTC
