Dynamic Trunking Protocol (herein referred to as “DTP”), is a proprietary protocol developed by Cisco Systems for the purpose of negotiating trunking on a link between two switches participating in a VLAN, and for negotiating the type of trunking encapsulation (802.1Q) to be used. It exists on layer 2 of the OSI model.

Time Saving On large networks, where many Cisco switches are used, manual configuration of each switch with the correct VLAN information on a switch-by-switch basis is time-consuming and may be risky. Should you set, say, VLAN \#128 as the VLAN used by Human Resources on one switch, and that same VLAN (\#128) as the one used by your Finance Dept. on another, you may create confusion when you need to troubleshoot further down the line, and also even render your VLAN security plan useless.

With DTP (and VTP), you can create or delete a VLAN on just one “Master” switch, and have the switch pass that information to any or all of your other switches under the same administrative control. This group of switches is referred to a “VTP domain”.

Network engineers working with DTP and VTP need to be especially careful when adding a new VLAN-enabled switch to their existing infrastructure - if the new switch is configured as the VTP/DTP “Master”, it will distribute its' (possibly blank or incorrect) VLAN configuration, irretrievably overwriting those of all the other switches\!

SOURCE : <http://en.wikipedia.org/wiki/Dynamic_Trunking_Protocol>

[DTP.pcapng](uploads/__moin_import__/attachments/Protocols/dtp/DTP.pcapng "Upload new attachment \"DTP.pcapng\"") DTP frames from a Cisco switch.

---

Imported from https://wiki.wireshark.org/Protocols/dtp on 2020-08-11 23:19:36 UTC
