# Alcatel-Lucent OmniSwitch 6850 series

For online documentation, see

<http://enterprise.alcatel-lucent.com/?product=OmniSwitch6850&page=documents>

The command to enable port mirroring is:

    port mirroring source destination

Defines a port to mirror and the port that is to receive data from the mirrored port, and enables or disables port mirroring status.

**Syntax:**

    port mirroring port_mirror_sessionid [no] source slot/port[-port2] [slot/port[-port2]...] destination slot/port [bidirectional |inport |outport] [unblocked vlan_id] [enable | disable]

It is activated on the fly after executing the command.

It can also be activated through the web interface.

Several ports may be used as source, but only one may be used as destination for any given session.

To show the status of port mirroring, use show port mirroring status

**Examples:**

    port mirroring 1 destination 1/23 unblocked 1 enable
    port mirroring 1 source 1/19 enable
    port mirroring 1 source 1/10 disable
    show port mirroring status

---

Imported from https://wiki.wireshark.org/SwitchReference/AlcatelLucent on 2020-08-11 23:26:03 UTC
