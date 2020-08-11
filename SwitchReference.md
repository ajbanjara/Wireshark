# Switch Reference

The following pages show which analysis features are present on different managed switches. See also: [HubReference](/HubReference), [TapReference](/TapReference), [CaptureSetup](/CaptureSetup).

As noted in the [Wireshark FAQ](http://www.wireshark.org/faq.html#promiscsniff), capturing in a switched network environment can prove to be challenging. An individual switch port will receive broadcast, multicast, and unicast traffic destined for that particular port. In most cases it won't receive unicast traffic for other ports, which is what you're probably trying to capture.

Most midrange and high-end switches have port analysis or port monitoring features that will let you *mirror* the traffic from one port to another.

  - [3Com](/SwitchReference/3Com)

  - [Alcatel-Lucent](/SwitchReference/AlcatelLucent)

  - [Allied Telesyn](/SwitchReference/ATsyn)

  - [Adtran](/SwitchReference/Adtran)

  - [Arista Networks](/AristaNetworks)

  - [Avaya](/SwitchReference/Avaya)

  - [Cisco Systems](/SwitchReference/CiscoSystems)

  - [Dell](/SwitchReference/Dell)

  - [D-Link](/SwitchReference/DLink)

  - [Extreme Networks](/SwitchReference/ExtremeNetworks)

  - [Foundry Networks](/SwitchReference/FoundryNetworks)

  - H3C - see [HP](/SwitchReference/HewlettPackard)

  - [HP](/SwitchReference/HewlettPackard)

  - [Linksys](/SwitchReference/Linksys)

  - [Juniper Networks](/SwitchReference/JuniperNetworks)

  - [NETGEAR](/SwitchReference/NetGear)

  - [Nortel Networks](/SwitchReference/NortelNetworks)

  - [OvisLink](/SwitchReference/OvisLink)

  - [Riverstone](/SwitchReference/Riverstone)

  - [Ruggedcom](/SwitchReference/Ruggedcom)

  - [Siemens](/SwitchReference/Siemens)

  - [SMC](/SwitchReference/SMC)

  - [Xterasys](/SwitchReference/Xterasys)

[The EffeTech HTTP Sniffer FAQ](http://www.effetech.com/sniffer/faq.htm) gives some information on switch manufacturers and switch models that support port mirroring. They don't give details, however.

[Dualcomm Technology](http://www.dual-comm.com/products.htm) has a series of low cost mirroring Ethernet switches.

[midBit Technologies, LLC](http://www.midbittech.com) has a low cost, dedicated 10/100 switch pre-configured as a tap. Available through Amazon: \[<http://www.amazon.com/gp/product/B00DY77HHK>\]

[Review of Dualcomm 5-Port Pass-Through Port Mirroring Switch](http://www.lovemytool.com/blog/2010/04/review-of-dualcomm-5-port-pass-through-port-mirroring-switch-by-betty-dubois.html) (by Betty [DuBois](/DuBois)), posted on April 29, 2010

Do we have any information on ASUS Giga X Series (2048 and 2024) Switches?

<http://www.ccontrols.com/enews/0311story3.htm> Contemporary Controls has released a 'Diagnostic Switch' which is configurated for port mirroring and supports 100MBits, auto mdx The price is about 100 Euro (shipment and VAT included). It's based on the RTL8306SD Switch controller and a configuration EEPROM. Possibly there exist other switches (the Dualcomm?) that uses the same chipset and might be put into port mirror mode just by adding a configuration eeprom? This then should be added to the 'Ethernet TAP DIY' section .... news from the RTL8306SD front: It looks as if some of the Linksys WLAN router have this chip in the switch section - and therefore might be used as monitor switch(see [Linksys](/SwitchReference/Linksys) )

---

Imported from https://wiki.wireshark.org/SwitchReference on 2020-08-11 23:26:01 UTC
