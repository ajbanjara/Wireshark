# Linksys

## SRW2016/SRW2024

See "Switch Conf. (Configuration) Tab Port Mirroring" on page 26 of [16- or 24-Port 10/100/1000 Gigabit Switch with WebView User Guide](ftp://ftp.linksys.com/pdf/SRW2016_SRW2024_ug_rev_C_web.pdf).

Notes:

Unable to disable RTSP. Serial Console operates at 38400bps 8N1, no flow-control using a "Straight Through" serial cable (documentation states 19200bps, which is incorrect).

Note: Huge bug in switch firmware v1.0.0.86 (no upgrade available 20060918). The host to which data is mirrored loses all other network connectivity. I.e. to other hosts, Internet, etc. Confirmed by Linksys/Cisco in tech. support session.

## RVS4000

Supports port mirroring from any combination of source ports to a single destination port. Mirror works as expected even when the three links in question (source, dest, and monitor) are all operating at different speeds.

On the router configuration page, go to the "L2 Switch" tab and select "Port Mirroring". Firmware bug mentioned for above model is not seen in this product.

## WRT-XXX WLAN Router/Switch section

Possibly the switch section might be used to monitor traffic:

<http://www6.nohold.net/Cisco2/ukp.aspx?pid=80&login=1&app=search&vw=1&articleid=15751>

<http://pc.de/hardware/twisted-pair-sniffer-wlan-router-747>

<http://www.wireless-forum.ch/forum/viewtopic.php?t=17387>

<http://www.dd-wrt.com/wiki/index.php/Wl_command#monitor>

---

Imported from https://wiki.wireshark.org/SwitchReference/Linksys on 2020-08-11 23:26:10 UTC
