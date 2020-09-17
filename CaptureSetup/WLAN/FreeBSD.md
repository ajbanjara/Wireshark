# Monitor mode support on FreeBSD

NOTE: the information on this page is probably very out-of-date. If you have more up-to-date information, please update it.

Adapters that support monitor mode on FreeBSD using the standard net80211 mechanism:

  - some 802.11 interfaces supported by the wi driver (Prism II and Orinoco, but not Spectrum24) - FreeBSD 5.2 and later;

  - 802.11 interfaces supported by the ath driver (Atheros - see ~~the Atheros customer products page~~ to find products that use Atheros chipsets) - FreeBSD 5.2 and later.  (Atheros now [Qualcomm](https://www.qualcomm.com/) )

Drivers for the Intel Centrino adapters were committed to the FreeBSD CVS source tree on April 18, 2005; it appears that the driver for the Intel(R) Pro Wireless 2100 will support monitor mode and raw 802.11 headers, so some future release will probably support that. The driver for the Intel(R) Pro Wireless 2200BG/2225BG/2915ABG doesn't appear to support monitor mode. Drivers were also committed then for the [Ralink Technology](https://web.archive.org/web/20040805125714/http://www.ralinktech.com/prod-2.htm) RT2500 chipset, which appears to support monitor mode. (What about the [driver for the Texas Instruments ACX100 chip set](https://lists.freebsd.org/pipermail/freebsd-questions/2004-October/062586.html)?)  (Ralink now [Mediatek](https://www.eetimes.com/mediatek-buys-ralink/#) )

On FreeBSD 4.6 and later, if Wireshark is linked with libpcap 0.7.1 or later, you should be able to capture in monitor mode on Cisco/Aironet cards, but not on other adapters; the \*BSD instructions above don't work, so see [CaptureSetup/WLAN/FreeBSD/Aironet](/CaptureSetup/WLAN/FreeBSD/Aironet) for information on this.

In FreeBSD 4.5 and earlier, you will not be able to capture in monitor mode on 802.11 adapters (no drivers supported it prior to 4.5, and in 4.5 the Aironet driver had bugs that caused packets not to be captured correctly).

Note that some adapters might be supported, in recent versions of FreeBSD, using the "ndisulator" or "Project Evil" mechanism. Unfortunately, if you use the ndisulator, you have [the same limitations as Windows](/CaptureSetup/WLAN#windows) for 802.11 capture, which usually means "no monitor mode and no 802.11 headers".

---

Imported from https://wiki.wireshark.org/CaptureSetup/WLAN/FreeBSD on 2020-08-11 23:12:07 UTC
