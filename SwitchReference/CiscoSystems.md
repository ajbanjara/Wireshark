# Cisco Switch Reference

Cisco calls their port analyzer/monitor feature SPAN (*Switched Port ANalyzer*). The document [Configuring the Catalyst Switched Port Analyzer (SPAN) Feature](http://www.cisco.com/en/US/products/hw/switches/ps708/products_tech_note09186a008015c612.shtml) describes which models support SPAN, its configuration, and performance impact. Also included is a [FAQ](http://www.cisco.com/en/US/products/hw/switches/ps708/products_tech_note09186a008015c612.shtml#topic8). If you are planning on buying one of these switches, make sure that the product that you are buying supports 100Mbits, because some of the products listed below (e.g. Cisco Catalyst 1900) supports only 10BaseT on their switch ports.

For additional information, check [Port Monitoring](http://www.cisco.com/en/US/tech/tk389/tk816/tsd_technology_support_protocol_home.html) on Cisco's web site.

A company named [NetFort](/NetFort) offers [SPAN Port Configurator](http://www.netfort.com/downloads/free-software), a free SPAN port configuration tool for Windows SPAN, that gives you an easy way to configure SPAN ports on Cisco switches quickly and remotely using a point-and-click interface.

**Model:** 1900 and 2820 series  
**Monitor:** Yes - no VLANs, no trunks. [Catalyst 1900 and Catalyst 2820 Series command reference guide](http://www.cisco.com/en/US/products/hw/switches/ps574/products_command_reference_chapter09186a008007d21d.html#37065)  
**Performance:** Unknown

**Model:** 2900XL and 3500XL series  
**Monitor:** Ports, VLANs. No trunks. [SPAN on the Catalyst 2900XL/3500XL Switches](http://www.cisco.com/en/US/products/hw/switches/ps708/products_tech_note09186a008015c612.shtml#topic1)  
**Performance:** All packets are forwarded to the monitoring port. Slowdown may occur. [Catalyst 2900XL/3500XL Series](http://www.cisco.com/en/US/products/hw/switches/ps708/products_tech_note09186a008015c612.shtml#topic7-1)

[Catalyst 2900 XL and Catalyst 3500 XL Software Configuration Guide, 12.0(5)WC4 and 12.0(5)WC5, "Configuring SPAN"](http://www.cisco.com/en/US/products/hw/switches/ps637/products_configuration_guide_chapter09186a00800d9d3d.html#xtocid25)

**Model:** 2948G-L3, 4908G-L3  
**Monitor:** Nothing. SPAN isn't supported. These are routers in disguise. [SPAN on the Catalyst 2948G-L3 and 4908G-L3](http://www.cisco.com/en/US/products/hw/switches/ps708/products_tech_note09186a008015c612.shtml#topic2) (which says "SPAN isn't supported")  
**Performance:** Unknown

**Model:** 2940, 2950, 2955, 2970, 3550, 3560 and 3750  
**Monitor:** Ports, VLANs, remote ports (2950+). [SPAN on the Catalyst 2940, 2950, 2955, 2970, 3550, 3560 and 3750 Series Switches](http://www.cisco.com/en/US/products/hw/switches/ps708/products_tech_note09186a008015c612.shtml#topic5)  
**Performance:** Unknown

[Configuring SPAN and RSPAN on Catalyst 2950](http://www.cisco.com/en/US/products/hw/switches/ps628/products_configuration_guide_chapter09186a00800c6f14.html)  
[Configuring SPAN and RSPAN on Catalyst 3550](http://www.cisco.com/en/US/products/hw/switches/ps646/products_configuration_guide_chapter09186a00803fb0ce.html)  

**Model:** 3900, 3920 ([TokenRing](/TokenRing))  
**Monitor:** Ports. [Monitoring Port Traffic (3900)](http://www.cisco.com/univercd/cc/td/doc/product/lan/cat3900/3900ug4/config.htm#31872), [Monitoring Port Traffic (3920)](http://www.cisco.com/univercd/cc/td/doc/product/lan/cat3920/3920ug4/config.htm#31872)  
**Performance:** Unknown

**Model:** 4x00, 5x00, 6x00  
**Monitor:** Ports, VLANs, trunks, remote ports. [SPAN on the Catalyst 4500/4000, 5500/5000, and 6500/6000 Series Switches Running CatOS](http://www.cisco.com/en/US/products/hw/switches/ps708/products_tech_note09186a008015c612.shtml#topic4), [SPAN on the Catalyst 4500/4000 and Catalyst 6500/6000 Series Switches Running Cisco IOS System Software](http://www.cisco.com/en/US/products/hw/switches/ps708/products_tech_note09186a008015c612.shtml#topic6)  
**Performance:** Monitored packets are dropped during congestion. [Catalyst 4500/4000 Series](http://www.cisco.com/en/US/products/hw/switches/ps700/products_tech_note09186a008015c612.shtml#topic7-2), [Catalyst 5500/5000 and 6500/6000 Series](http://www.cisco.com/en/US/products/hw/switches/ps700/products_tech_note09186a008015c612.shtml#topic7-3)

[Configuring SPAN on Catalyst 4000 Running Integrated Cisco IOS](http://www.cisco.com/en/US/products/hw/switches/ps663/products_configuration_guide_chapter09186a00800e47ed.html), [Configuring SPAN and RSPAN on Catalyst 4000 Running Hybrid Mode](http://www.cisco.com/en/US/products/hw/switches/ps663/products_configuration_guide_chapter09186a00800d81c0.html)  
[Configuring SPAN on Catalyst 5000](http://www.cisco.com/en/US/products/hw/switches/ps679/products_configuration_guide_chapter09186a008007f7b3.html)  
[Configuring SPAN and RSPAN on Catalyst 6000 Running Hybrid Mode](http://www.cisco.com/en/US/products/hw/switches/ps708/products_configuration_guide_chapter09186a008007f9a8.html)  

**Model:** 8500  
**Monitor:** Very limited SPAN capabilities. [SPAN on the Catalyst 8500](http://www.cisco.com/en/US/products/hw/switches/ps708/products_tech_note09186a008015c612.shtml#topic3)  
**Performance:** Unknown

**Model:** Routers running Cisco IOS v12.3(4)T or later, 12.2(25)S or later (additional restrictions apply)  
**Monitor:** The [IP Traffic Export](http://www.cisco.com/en/US/products/sw/iosswrel/ps5207/products_feature_guide09186a00801d1cab.html) feature allows users to configure their router to export IP packets that are received on multiple, simultaneous WAN or LAN interfaces. The unaltered IP packets are exported on a single LAN or VLAN interface, thereby, easing deployment of protocol analyzers and monitoring devices.  
**Performance:** When IP traffic export is enabled, a delay is incurred on the outbound interface when packets are captured and transmitted across the interface. Performance delays increase with the increased number of interfaces that are monitored and the increased number of destination hosts.

---

Imported from https://wiki.wireshark.org/SwitchReference/CiscoSystems on 2020-08-11 23:26:05 UTC
