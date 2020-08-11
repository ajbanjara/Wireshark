# IrDA capture setup

In sufficiently recent versions of Linux (XXX - give kernel, or IrDA support, version number?), and with libpcap 0.9.1 or later, it should be possible to capture on IrDA devices. With the IrCOMM2k driver installed, and with the appropriate patches to [WinPcap](/WinPcap), it should be possible to capture on IrDA devices on Windows.

Snippet from the dissector source code:

    /* The plugin operates both offline with libpcap files and online on supported
    * platforms. Live dissection is currently available for Linux-IrDA
    * (irda.sourceforge.net) and for Windows if the Linux-IrDA port IrCOMM2k
    * (www.ircomm2k.de) is installed.
    */

(XXX - give more details, if necessary.)

## External links

  - <http://irda.sourceforge.net/> - the Linux IrDA project

  - <http://www.ircomm2k.de/> - serial port driver for IrDA for Windows 2000 and later

  - <http://sourceforge.net/projects/ircomm2k> - IrCOMM2k SourceForge page

  - <http://www.stud.uni-hannover.de/~kiszka/IrCOMM2k/English/download.html> - includes the patches to [WinPcap](/WinPcap)

## See Also

  - [Capturing on Ethernet Networks](/CaptureSetup/Ethernet)

  - [Capturing on 802.11 Wireless Networks](/CaptureSetup/WLAN)

  - [Capturing on Token Ring Networks](/CaptureSetup/TokenRing)

  - [Capturing on VLAN Protected Networks](/CaptureSetup/VLAN)

  - [Capturing on PPP Networks](/CaptureSetup/PPP)

  - [Capturing on the Loopback Device](/CaptureSetup/Loopback)

  - [Capturing on Frame Relay Networks](/CaptureSetup/FrameRelay)

  - [Capturing DOCSIS Traffic](/CaptureSetup/DOCSIS)

  - [Capturing Bluetooth Traffic](/CaptureSetup/Bluetooth)

  - [Capturing on ATM Networks](/CaptureSetup/ATM)

  - [Capturing USB Traffic](/CaptureSetup/USB)

  - [Capturing on Cisco HDLC Networks](/CaptureSetup/CiscoHDLC)

  - [Capturing SS7 Traffic](/CaptureSetup/SS7)

-----

---

Imported from https://wiki.wireshark.org/CaptureSetup/IrDA on 2020-08-11 23:11:55 UTC
