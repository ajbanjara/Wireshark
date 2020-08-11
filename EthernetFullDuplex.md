# EthernetFullDuplex

Ethernet is used either half or full duplex. This means that either sending or receiving takes place, or both at the same time.

When [Ethernet](/Ethernet) was created it used a shared medium (coax cable, see [EthernetHardware](/EthernetHardware)). This meant only one station could send at a time, the others needed to listen. As we've seen before this is half duplex. With the advent of UTP cabling all Ethernet connections basically became point-to-point. Traffic both ways is carried on separate wires, hence sending and receiving can take place at the same time. As we've seen before this is full duplex.

## Hubs

Hubs break the UTP point-to-point model. The send and receive wires from the end stations are connected to the uplink receive and send wires, and among each other. This recreates the old model of a shared medium, which as we've seen above can only be used half duplex.

---

Imported from https://wiki.wireshark.org/EthernetFullDuplex on 2020-08-11 23:13:52 UTC
