# Ethernet Hardware

## Cabling

### Single line

The first Ethernet topologies used a single cable line, to which all network nodes were attached. The main disadvantage is that a network breakdown at a single place can easily make the whole network unusable.

  - 10BASE5 - Thick Ethernet (Yellow Cable, 10MBits/s), outdated. The first commonly available Ethernet used a single "yellow cable", a double shielded coaxial cable with a thickness of up to an inch (therefore often called thick Ethernet). The yellow cable was a shared medium. To add a network node, a tap had to be attached to the cable, which put a thorn into the yellow cable. The cable had to be terminated on both ends using a resistor.
  - 10BASE2 - Thin Ethernet (RG58, 10MBits/s), outdated. As thick Ethernet was expensive and difficult to install, the thin Ethernet using a thin coaxial cable (RG-58) was often used for SOHO purposes. The cable still was a single length of cable (up to 100m/300ft maximum length), with individual workstations connected using BNC T-connectors. Both ends had to be terminated using a resistor. A network node could be attached by adding it at any place in the network, but this usually resulted in a small network breakdown, while the correct topology was (re-)assembled again.

Both the 10BASE5 and 10BASE2 had the same problem that a single point of failure (break in any of the connections) could severely degrade or bring down the whole network.

### Hubbed/Switched

When Ethernet hubs/switches were first available, they were quite expensive. As they become more common and therefore cheaper, more and more people replaced their existing network using hubs or even switches, which makes the network much more reliable. Today switches are very cheap, so single line Ethernets (using thin or thick cables) are only very rarely used.

  - 10BASE-T, 100BASE-T, 1000BASE-T - Twisted Pair (Various cable types, 10MBits/s - 1GBits/s). The most common Ethernet cabling alternative used today. The network cable connects the node to a hub/switch.
  - 10BASE-FL, 100BASE-FL, 1000BASE-FL, 10000BASE-FL - Fiber optics (Various "cable" types, 10MBits/s - 10GBits/s). The network cable simply connects the node to a hub/switch.

### Maximum cable length

The maximum cable (segment) length is depending on the cable and the transfer speed used.

| Technology      | Cabling                                             | Max Cable Length                  |
| --------------- | --------------------------------------------------- | --------------------------------- |
| 10BASE5         | Yellow cable                                        | 500m                              |
| 10BASE2         | RG58 coax                                           | 185m                              |
| 10BASE-T        | EIA/TIA Category 3 UTP                              | 100m                              |
| 10BASE-FP       | 62.5 or 125 micron MMF                              | 1km                               |
| 10BASE-FB       | 62.5 or 125 micron MMF                              | 2km                               |
| 10BASE-FL       | 62.5 or 125 micron MMF                              | 2km                               |
| 100BASE-TX      | EIA/TIA Category 5 unshielded twisted pair (2 pair) | 100m                              |
| 100BASE-T2      | Cat 3, 4, & 5 UTP (2 pair)                          | 100m                              |
| 100BASE-T4      | Cat 3, 4, & 5 UTP (4 pair)                          | 100m                              |
| 100BASE-FX      | 62.5 micron multimode fiber                         | 400m half duplex, 2km full duplex |
| 100BASE-FX      | Single mode fiber                                   | 10km                              |
| 1000BASE-CX     | Shielded twisted pair                               | 25m                               |
| 1000BASE-T      | Cat 5 UTP (4 pair, 100MHz)                          | 100m                              |
| 1000BASE-SX     | 62.5 micron MMF                                     | 275m                              |
| 1000BASE-SX     | 50 micron MMF                                       | 550m                              |
| 1000BASE-LX/LH  | 50 or 62.5 micron MMF                               | 550m                              |
| 1000BASE-LX/LH  | 9 micron SMF                                        | 10km                              |
| 1000BASE-ZX     | 9 micron SMF                                        | 70km                              |
| 1000BASE-ZX     | 8 micron SMF                                        | 100km                             |
| 10GBASE-SR/SW   | 62.5 micron MMF                                     | 33m                               |
| 10GBASE-SR/SW   | 50 micron MMF                                       | 66m or 300m (2GHZ)                |
| 10GBASE-LR/LW   | 9 micron SMF                                        | 10km                              |
| 10GBASE-ER/EW   | 9 micron SMF                                        | 40 km                             |
| 10GBASE-LX4/LW4 | 50 or 62.5 micron MMF                               | 300 m                             |
| 10GBASE-LX4/LW4 | 9 micron SMF                                        | 10 km                             |
| 10GBASE-CX4     | Special copper cable / connectors (8 pair)          | 15 m                              |
| 10GBASE-T       | CAT 6a (4 pair, 625MHz)                             | 100 m                             |
| 10GBASE-T       | CAT 6e (4 pair, 500MHz)                             | 55 m                              |

Using repeaters between segments can increase the maximum length.

## External Links

[An Introduction to Auto-Negotiation](http://www.scyld.com/NWay.html) provides an extensive overview of the autonegotiation process.

---

Imported from https://wiki.wireshark.org/EthernetHardware on 2020-08-11 23:13:53 UTC
