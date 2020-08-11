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

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Technology</strong></p></td>
<td><p><strong>Cabling</strong></p></td>
<td><p><strong>Max Cable Length</strong></p></td>
</tr>
<tr class="even">
<td><p>10BASE5</p></td>
<td><p>Yellow cable</p></td>
<td><p>500m</p></td>
</tr>
<tr class="odd">
<td><p>10BASE2</p></td>
<td><p>RG58 coax</p></td>
<td><p>185m</p></td>
</tr>
<tr class="even">
<td><p>10BASE-T</p></td>
<td><p>EIA/TIA Category 3 UTP</p></td>
<td><p>100m</p></td>
</tr>
<tr class="odd">
<td><p>10BASE-FP</p></td>
<td><p>62.5 or 125 micron MMF</p></td>
<td><p>1km</p></td>
</tr>
<tr class="even">
<td><p>10BASE-FB</p></td>
<td><p>62.5 or 125 micron MMF</p></td>
<td><p>2km</p></td>
</tr>
<tr class="odd">
<td><p>10BASE-FL</p></td>
<td><p>62.5 or 125 micron MMF</p></td>
<td><p>2km</p></td>
</tr>
<tr class="even">
<td><p>100BASE-TX</p></td>
<td><p>EIA/TIA Category 5 unshielded twisted pair (2 pair)</p></td>
<td><p>100m</p></td>
</tr>
<tr class="odd">
<td><p>100BASE-T2</p></td>
<td><p>Cat 3, 4, &amp; 5 UTP (2 pair)</p></td>
<td><p>100m</p></td>
</tr>
<tr class="even">
<td><p>100BASE-T4</p></td>
<td><p>Cat 3, 4, &amp; 5 UTP (4 pair)</p></td>
<td><p>100m</p></td>
</tr>
<tr class="odd">
<td><p>100BASE-FX</p></td>
<td><p>62.5 micron multimode fiber</p></td>
<td><p>400m half duplex, 2km full duplex</p></td>
</tr>
<tr class="even">
<td><p>100BASE-FX</p></td>
<td><p>Single mode fiber</p></td>
<td><p>10km</p></td>
</tr>
<tr class="odd">
<td><p>1000BASE-CX</p></td>
<td><p>Shielded twisted pair</p></td>
<td><p>25m</p></td>
</tr>
<tr class="even">
<td><p>1000BASE-T</p></td>
<td><p>Cat 5 UTP (4 pair, 100MHz)</p></td>
<td><p>100m</p></td>
</tr>
<tr class="odd">
<td><p>1000BASE-SX</p></td>
<td><p>62.5 micron MMF</p></td>
<td><p>275m</p></td>
</tr>
<tr class="even">
<td><p>1000BASE-SX</p></td>
<td><p>50 micron MMF</p></td>
<td><p>550m</p></td>
</tr>
<tr class="odd">
<td><p>1000BASE-LX/LH</p></td>
<td><p>50 or 62.5 micron MMF</p></td>
<td><p>550m</p></td>
</tr>
<tr class="even">
<td><p>1000BASE-LX/LH</p></td>
<td><p>9 micron SMF</p></td>
<td><p>10km</p></td>
</tr>
<tr class="odd">
<td><p>1000BASE-ZX</p></td>
<td><p>9 micron SMF</p></td>
<td><p>70km</p></td>
</tr>
<tr class="even">
<td><p>1000BASE-ZX</p></td>
<td><p>8 micron SMF</p></td>
<td><p>100km</p></td>
</tr>
<tr class="odd">
<td><p>10GBASE-SR/SW</p></td>
<td><p>62.5 micron MMF</p></td>
<td><p>33m</p></td>
</tr>
<tr class="even">
<td><p>10GBASE-SR/SW</p></td>
<td><p>50 micron MMF</p></td>
<td><p>66m or 300m (2GHZ)</p></td>
</tr>
<tr class="odd">
<td><p>10GBASE-LR/LW</p></td>
<td><p>9 micron SMF</p></td>
<td><p>10km</p></td>
</tr>
<tr class="even">
<td><p>10GBASE-ER/EW</p></td>
<td><p>9 micron SMF</p></td>
<td><p>40 km</p></td>
</tr>
<tr class="odd">
<td><p>10GBASE-LX4/LW4</p></td>
<td><p>50 or 62.5 micron MMF</p></td>
<td><p>300 m</p></td>
</tr>
<tr class="even">
<td><p>10GBASE-LX4/LW4</p></td>
<td><p>9 micron SMF</p></td>
<td><p>10 km</p></td>
</tr>
<tr class="odd">
<td><p>10GBASE-CX4</p></td>
<td><p>Special copper cable / connectors (8 pair)</p></td>
<td><p>15 m</p></td>
</tr>
<tr class="even">
<td><p>10GBASE-T</p></td>
<td><p>CAT 6a (4 pair, 625MHz)</p></td>
<td><p>100 m</p></td>
</tr>
<tr class="odd">
<td><p>10GBASE-T</p></td>
<td><p>CAT 6e (4 pair, 500MHz)</p></td>
<td><p>55 m</p></td>
</tr>
</tbody>
</table>

</div>

Using repeaters between segments can increase the maximum length.

## External Links

[An Introduction to Auto-Negotiation](http://www.scyld.com/NWay.html) provides an extensive overview of the autonegotiation process.

---

Imported from https://wiki.wireshark.org/EthernetHardware on 2020-08-11 23:13:53 UTC
