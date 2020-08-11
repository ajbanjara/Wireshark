# HP

## Advancestack

See [question 25 in the Advancestack FAQ](http://www.hp.com/rnd/support/faqs/sw_208_224.htm#question25).

## ProCurve

### 1600M, 2424M, 4000M, and 8000M

See the "Network Monitoring Port Features" section of chapter 6 of the [HP ProCurve Switches 1600M, 2424M, 4000M, and 8000M Management and Configuration Guide](ftp://ftp.hp.com/pub/networking/software/59692320.pdf).

### 2512, 2524

See the "Port Monitoring Features" section of chapter 10 of the [HP ProCurve series 2500 switches management and configuration guide](ftp://ftp.hp.com/pub/networking/software/59692354.pdf).

### 1700-8

Mirroring is enabled using the "Ports / port mirroring" page of the web interface, and seems to work perfectly. At the time of writing (Oct 2007) this seems to be a particularly good value switch for this purpose, costing much less than many of the alternatives.

### 1810G-8

New [ProCurve](/ProCurve) switch (introduced in 2009?) that is gigabit on all ports and supports port mirror. This switch is somewhat similar to the 1700-8 and is also relatively low cost. Unlike on the 1700-8, the mirror destination port will not function as a normal port; this may necessitate a second Ethernet connection to the computer running Wireshark. There is also an older version, the 1800-8G, that this switch replaces.

### GbE Switches 6400, 5300, and 3400

See the "Interface Monitoring Features" section starting on B-23 (page 477) of the [HP ProCurve Switches 6400, 5300, and 3400 Management and Configuration Guide](ftp://ftp.hp.com/pub/networking/software/6400-5300-3400-MgmtCfg-Oct2005-59906050.pdf).

### H3C

See [Port Mirroring Configuration Examples](http://www.h3c.com/portal/Products___Solutions/Technology/LAN/Configuration_Example/200805/605777_57_0.htm).

---

Imported from https://wiki.wireshark.org/SwitchReference/HewlettPackard on 2020-08-11 23:26:09 UTC
