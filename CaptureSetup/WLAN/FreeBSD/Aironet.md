# Monitor mode on FreeBSD for Cisco/Aironet cards

<span id="old_cisco_freebsd" class="anchor"></span> On FreeBSD, for Cisco/Aironet cards, you can only see 802.11 headers in monitor mode; they are always supplied in monitor mode. To capture in monitor mode, you should put the card into monitor mode with the command `ancontrol -i` *interface* `-M` *flag*, where *flag* should be the sum of:

1, to turn monitor mode on;  
2, if you want to capture traffic from any service set rather than just the service set with which the card is associated;  
4, if you want to see beacon packets (capturing beacon packets increases the CPU requirements of capturing).

Don't add 8 in to *flag*; Wireshark currently doesn't support the full Aironet header.

When the capture completes, turn off monitor mode with the command `ancontrol -i` *interface* `-M 0`.

---

Imported from https://wiki.wireshark.org/CaptureSetup/WLAN/FreeBSD/Aironet on 2020-08-11 23:12:08 UTC
