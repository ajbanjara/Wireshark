# Monitor mode on Linux for cards that don't have mac80211 drivers

## Cisco/Aironet cards

On Linux with the driver in the 2.4.6 through 2.4.19 kernel, put the card into monitor mode with the command `echo "Mode: rfmon" >/proc/driver/aironet/`*interface*`/Config`. If you want to capture traffic for any service set rather than just the service set to which the card belongs, use `Mode: y` rather than `Mode: rfmon`. When the capture completes, turn off monitor mode with the command echo `Mode: ess >/proc/driver/aironet/`*interface*`/Config`. (XXX - different command in *ad hoc* mode?)

On Linux with the driver in the 2.4.20 or later kernel, or with the CVS drivers from the airo-linux SourceForge site, you will have to capture on the `wifi`*N* interface if your Aironet card is `eth`*N*, after running the commands listed above.

In all of those cases, Wireshark would have to be linked with libpcap 0.7.1 or later; this means that most Wireshark binary packages won't work unless they're statically linked with libpcap 0.7.1 or later, or they're dynamically linked with libpcap and your system has a libpcap 0.7.1 or later shared library installed (note that libpcap source package from tcpdump.org does not build shared libraries). Some binary packaging mechanisms might make it difficult to install Wireshark binary packages built to depend on older libpcap binary packages if you have a newer libpcap binary package installed; the installer programs for those packaging mechanisms might support disabling dependency checking so that they will install Wireshark even though a newer version of libpcap is installed.

## Adapters using the Prism II chip set

You can capture raw 802.11 packets with Prism II adapters on Linux systems with the 0.1.14-pre6 or later version of the linux-wlan-ng drivers (see [the linux-wlan page](http://www.linux-wlan.org/index.html), and [the linux-wlan-ng tarball directory](ftp://ftp.linux-wlan.org/pub/linux-wlan-ng/)), or with [the hostap driver for Prism II/2.5/3](http://hostap.epitest.fi/).

Those require either Solomon Peachy's patch to libpcap 0.7.1 (see his `libpcap-0.7.1-prism.diff` file, or his RPMs of that version of libpcap), or libpcap 0.8.1 or later. If your distribution comes with an 0.8.1 or later release of libpcap, Wireshark binary packages should work, as should compiling Wireshark from source. Otherwise, if you apply Solomon Peachy's patches to libpcap 0.7.1 and rebuild and install libpcap, or if you build and install an 0.8.1 or later version of libpcap, you would have to rebuild Wireshark from source, linking it with that new version of libpcap; an Wireshark binary package would not work. Wireshark binary packages might work if you install the `libpcap-0.7.1-1prism.i386.rpm` RPM, as it might install a libpcap shared library in place of the one on your system.

With the linux-wlan-ng driver, put the card into monitor mode with the command `wlanctl-ng` *interface* `lnxreq_wlansniff enable=true`. You should request 802.11 headers by adding to that command the option prismheader=true or, if supported, wlanheader=true; the latter might require libpcap 0.8.1 or later. You can also set the channel to monitor by adding the argument `channel=`*channel\_number* to that command. When the capture completes, turn off monitor mode with the command `wlanctl-ng` *interface* `enable=false`. You might also have to turn 802.11 headers off with `prismheader=false` or `wlanheader=false`. See [the wlan-ng FAQ](ftp://ftp.linux-wlan.org/pub/linux-wlan-ng/FAQ) for additional information, although note that it does not appear to be up-to-date.

With the hostap driver, you should put the card into monitor mode with the command `iwpriv` *interface* `monitor` *mode*, where *mode* is 2 or 3 (mode 3 would require libpcap 0.8.1 or later). When the capture completes, turn off monitor mode with the command `iwpriv` *interface* `monitor 0`. (Does `iwconfig` *interface* `mode monitor`, followed by `iwconfig` *interface* `channel` *channel* to select a channel, also work? If so, do you get 802.11 headers? Can you also get radio headers?)

## Orinoco Silver and Gold cards

The current version of [the SourceForge orinoco\_cs driver](http://www.nongnu.org/orinoco/) should support monitor mode. There also exist patches to earlier versions of the Orinoco driver, on [the Orinoco Monitor Mode Patch Page](http://airsnort.shmoo.com/orinocoinfo.html), to add support for monitor mode. You will have to determine which version of the driver you have, and select the appropriate patch, if one is necessary.

Note that the page indicates that not all versions of the Orinoco firmware support this patch. It says, for some versions of the patch, "This patch should allow monitor mode with v8.10 firmware (untested w/ 8.42);" if you have version 8.10 or later firmware on your Orinoco cards, you might have to use those patches, with the corresponding versions of the Orinoco driver, in order to run in monitor mode.

That patch is written for the drivers included with the pcmcia-cs drivers, but works equally well for the Orinoco drivers provided with Linux kernels up to 2.4.20. To apply a patch to your kernel drivers, simply copy the `orinoco-09b-patch.diff` file to the `/usr/src/linux/drivers/net` directory and patch according to the directions on the Orinoco Monitor Mode Patch Page. You can double- check the version of the Orinoco drivers that shipped with your kernel by examining the first few lines of the `orinoco.c` file.

The Orinoco patches and SourceForge driver require either Solomon Peachy's patch to libpcap 0.7.1 (see his `libpcap-0.7.1-prism.diff` file, or his RPMs of that version of libpcap), or libpcap 0.8.1 or later. If your distribution comes with an 0.8.1 or later release of libpcap, Wireshark binary packages should work, as should compiling Wireshark from source. Otherwise, if you apply Solomon Peachy's patches to libpcap 0.7.1 and rebuild and install libpcap, or if you build and install an 0.8.1 or later version of libpcap, you would have to rebuild Wireshark from source, linking it with that new version of libpcap; an Wireshark binary package would not work. Wireshark binary packages might work if you install the `libpcap-0.7.1-1prism.i386.rpm` RPM, as it might install a libpcap shared library in place of the one on your system.

With a driver that supports monitor mode, you should put the card into monitor mode with the command `iwpriv` *interface* `monitor` *mode* *channel\_number*, where *mode* is 1 or 2, and *channel\_number* is the number of the channel to monitor. When the capture completes, turn off monitor mode with the command `iwpriv` *interface* `monitor 0`. (Does `iwconfig` *interface* `mode monitor`, followed by `iwconfig` *interface* `channel` *channel* to select a channel, also work? If so, do you get 802.11 headers? Can you also get radio headers?)

## Cards with the Texas Instruments ACX100/ACX111 chipset

You can capture raw 802.11 packets with ACX100/ACX111 cards on Linux systems with the ACX100 OSS drivers available from [the ACX100 wireless network driver project SourceForge site](http://acx100.sourceforge.net/).

With that driver, put the card into monitor mode with the command `iwpriv` *interface* `monitor 2` *channel\_number*, where *channel\_number* is the number of the channel to monitor. When using an ACX111 card `iwpriv` *interface* `monitor 1` *channel\_number* works. When the capture completes, turn off monitor mode with the command `iwpriv` *interface* `monitor 0`. (Does `iwconfig` *interface* `mode monitor`, followed by `iwconfig` *interface* `channel` *channel* to select a channel, also work? If so, do you get 802.11 headers? Can you also get radio headers?)

## Cards with Atheros Communications chipsets

See [the Atheros customer products page](http://customerproducts.atheros.com/customerproducts/) to find products that use Atheros chipsets.

You can capture raw 802.11 packets with AR5K cards on Linux systems with the v5\_ar5k or madwifi drivers. For the v5ar5k driver you will need the Linux wireless-tools version 25 or higher to put the card into monitor mode. If you're using the madwifi driver, you can put the card into monitor mode using `iwconfig` *interface* `mode monitor`, followed by `iwconfig` *interface* `channel` *channel* to select a channel (if needed). THis works only on the old version of the madwifi driver. If you are using the new version, also known as madwifi-ng, you must create a monitor vap with the command `wlanconfig` *ath* `create wlandev` *wifiX* `wlanmode` *mon*. For further information read the madwifi documentation, included with versions 0.9.0 and up.

## Cards with Ralink Technologies chipsets

[The Linux RT2400/RT2500 driver](http://rt2x00.serialmonkey.com/) supports monitor mode. Put the card into monitor mode using `iwconfig` *interface* `mode monitor`, followed by `iwconfig` *interface* `channel` *channel* to select a channel (if needed). (Does this give 802.11 headers, or 802.11 headers plus radio headers?)

## Intel Centrino adapters

The open source Intel(R) Pro Wireless [2100](http://ipw2100.sourceforge.net/),[2200/2915](http://ipw2200.sourceforge.net/) and [3945](http://ipw3945.sourceforge.net/) Drivers for Linux support monitor mode. You can put the card into monitor mode using `iwconfig` *interface* `mode monitor`, followed by `iwconfig` *interface* `channel` *channel* to select a channel (if needed). Optional (compile time) support for additional radiotap headers is provided in all drivers and starts with the following versions: ipw3945 version 0.0.71, ipw2200 version 1.0.7 and ipw2100 drivers version 1.2.1. The ipw2200 and ipw3945 drivers have another feature that allows to use the wireless interface normally and at the same time capture the raw traffic passing through it: The rtapX interface. You'll need to add the following line to your /etc/modprobe.d/ipw3945 file: "options ipw3945 rtap\_iface=1". After that, do an "ifconfig rtap0 up" and start capturing on that interface. For ipw2200 replace 3945 by 2200.

## Cards using the Zyxel ZyDAS 1211

The ZyDAS 1211 chipset supports monitor mode with the open-source drivers available from the [zd1211 project](http://zd1211.ath.cx/). This chipset is exclusive to USB dongles, and quite common. The quickest way to put it into monitor mode is to issue `iwconfig` *interface* `mode monitor`. The driver is built into the kernel starting with 2.6.18, but can be built out-of-tree on any 2.6 kernel.

## Other cards

It might be possible to capture in monitor mode on other cards. If so, please update the Wiki with information on how to do so.

---

Imported from https://wiki.wireshark.org/CaptureSetup/WLAN/Linux_non_mac80211 on 2020-08-11 23:12:08 UTC
