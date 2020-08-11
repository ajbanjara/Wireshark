# Token Ring capture setup

The following will explain capturing on [TokenRing](/TokenRing) a bit.

## Table of contents

[[_TOC_]]

## Supported Platforms

See the [Supported Capture Media](/CaptureSetup/NetworkMedia) page for Wireshark capturing support on various platforms.

## Packet Types

The [TokenRing](/TokenRing) hardware on the network adapter filters all packets received, and delivers to the host

  - all [Unicast](/Unicast) packets that are being sent to one of the addresses for that adapter, i.e. packets sent to that host on that network;

  - all [Multicast](/Multicast) packets that are being sent to a [Multicast](/Multicast) address for that adapter, or all [Multicast](/Multicast) packets regardless of the address to which they're being sent (some network adapters can be configured to accept packets for specific [Multicast](/Multicast) addresses, others deliver all multicast packets to the host for it to filter);

  - all [Broadcast](/Broadcast) packets.

The driver for the adapter will also send copies of transmitted packets to the packet capture mechanism, so that they will be seen by a capture program as well.

## Promiscuous mode

In order to capture [TokenRing](/TokenRing) traffic other than [Unicast](/Unicast) traffic to and from the host on which you're running Wireshark, [Multicast](/Multicast) traffic, and [Broadcast](/Broadcast) traffic, the adapter will have to be put into promiscuous mode, so that the filter mentioned above is switched off and all packets received are delivered to the host.

The Windows driver for the Madge Presto PCI 2000 [TokenRing](/TokenRing) adapter requires you to enable promiscuous mode explicitly in order to do this, and the drivers for other Madge [TokenRing](/TokenRing) adapters allow promiscuous mode to be disabled, in which case promiscuous mode will have to be re-enabled; see Madge's [An Overview of Promiscuous Mode](http://www.madge.com/_assets/downloads/lsshelp8.0/LSSHelp/AdvFeat/Promisc/Promisc2.htm) for more information on this. Note that those drivers also support **permanently** disabling promiscuous mode; promiscuous mode can **never** be re-enabled on an adapter on which promiscuous mode has been permanently disabled.

[TokenRing](/TokenRing) adapter drivers on UN\*X probably always support promiscuous mode if the adapter is capable of it (they probably won't be able to support it on an adapter on which it's been permanently disabled).

## Shared Token Ring

Traditionally, [TokenRing](/TokenRing) networks were shared networks, meaning all packets passed through, and thus were received by, all nodes on that network. Therefore, if a [TokenRing](/TokenRing) adapter on such a network is put into promiscuous mode, all packets on the network will be seen by that adapter and thus can be captured with that adapter.

## Switched Token Ring

Now, a [TokenRing](/TokenRing) network can use switches to connect the nodes together. This can increase network performance a lot, but makes life much harder when capturing packets.

A [TokenRing](/TokenRing) switch will do a similar thing to the [TokenRing](/TokenRing) adapter hardware mentioned above, but inside the switch. It can infer, from traffic seen on a switch port, what [Unicast](/Unicast) address or addresses are used by the adapter connected to that port, and will forward to that port only [Unicast](/Unicast) traffic sent to that address or addresses, as well as all [Multicast](/Multicast) and [Broadcast](/Broadcast) packets on the network.

As [Unicast](/Unicast) packets not sent to that host will not be put on the switch port to which that host's adapter is connected, that adapter won't those packets, so putting the adapter into promiscuous mode can't cause it to deliver packets to that host, and you won't see those packets even if you capture in promiscuous mode.

The following will describe some methods to circumvent this problem.

### Capture on the machine you're interested in

If you only need the capture data from a specific host, try to capture on that machine.

  - Advantage: Easy to use
  - Disadvantage: Other traffic not available

### Capture using a monitor mode of the switch

Some [TokenRing](/TokenRing) switches, namely the more expensive manageable ones, have a monitor mode. This monitor mode can dedicate a port to connect your (Wireshark) capturing device. It's sometimes called 'SPAN' (Cisco). Using the switch management, you can select both the monitoring port and assign a specific port you wish to monitor. Actual procedures vary between switch models; you may need to use a terminal emulator, specialised SNMP client software or (more recently) a Web browser. Caution: the monitoring port must be at least as fast as the monitored port, or you will certainly lose packets.

Note that some switches might not support monitoring *all* traffic passing through the switch, only traffic on a particular port. On those switches, you might not be able to capture all traffic on the network, only traffic sent to or from some particular machine on the switch.

See [SwitchReference](/SwitchReference) for details about specific switch models.

Rumour has it that some switches can monitor the whole throughput of the switch. As a switch can transfer more traffic than a single line can transmit, you will be unlikely to see all traffic.

  - Advantage: Easy to use if such a switch available
  - Disadvantage: Expensive switch needed, capture packet loss at high traffic

## See Also

  - [Capturing on Ethernet Networks](/CaptureSetup/Ethernet)

  - [Capturing on 802.11 Wireless Networks](/CaptureSetup/WLAN)

  - [Capturing on VLAN Protected Networks](/CaptureSetup/VLAN)

  - [Capturing on PPP Networks](/CaptureSetup/PPP)

  - [Capturing on the Loopback Device](/CaptureSetup/Loopback)

  - [Capturing on Frame Relay Networks](/CaptureSetup/FrameRelay)

  - [Capturing DOCSIS Traffic](/CaptureSetup/DOCSIS)

  - [Capturing Bluetooth Traffic](/CaptureSetup/Bluetooth)

  - [Capturing on ATM Networks](/CaptureSetup/ATM)

  - [Capturing USB Traffic](/CaptureSetup/USB)

  - [Capturing IrDA Traffic](/CaptureSetup/IrDA)

  - [Capturing on Cisco HDLC Networks](/CaptureSetup/CiscoHDLC)

  - [Capturing SS7 Traffic](/CaptureSetup/SS7)

-----

---

Imported from https://wiki.wireshark.org/CaptureSetup/TokenRing on 2020-08-11 23:12:03 UTC
