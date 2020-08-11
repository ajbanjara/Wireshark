# Preferences/Protocols/SIMULCRYPT

### Simulcrypt TCP port:

This allows the [TCP](/TCP) port over which the Simulcrypt protocol applies. All [TCP](/TCP) packets over the set [TCP](/TCP) port will be decoded as Simulcrypt.

### MIKEY ECM CA\_system\_ID(in hex):

If the ECM datagram follows [MIKEY](/MIKEY) protocol, then setting the corresponding CA\_system\_ID here as a 2 byte hex value will automatically decode the ECM datagram as [MIKEY](/MIKEY). e.g. 0123 means for CA\_system\_ID 0x0123, ECM\_datagrams are decoded as [MIKEY](/MIKEY).

---

Imported from https://wiki.wireshark.org/SIMULCRYPT_Preferences on 2020-08-11 23:24:43 UTC
