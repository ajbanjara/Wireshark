# Bluetooth capture setup

You can capture Bluetooth traffic to or from your machine on Linux in Wireshark with libpcap 0.9.6 and later, if the kernel includes the [BlueZ](http://www.bluez.org/) Bluetooth stack; starting with the 2.4.6 kernel, the BlueZ stack was incorporated into the mainline kernel.

Note that Debian and Debian-derived derivatives call the libpcap package "libpcap-0.8"; this does \*\*\*NOT\*\*\* mean that all such systems use libpcap 0.8. Debian and its derivatives continue to use the name "libpcap-0.8", even though newer versions' libpcap packages use newer versions of libpcap; for example, Wheezy's libpcap-0.8 package uses libpcap 1.3.0.

If it's supported, and if you have sufficient privileges to capture, there will be interfaces named bluetooth*N* for various values of *N* starting with 0.

To passively capture Bluetooth traffic between other machines, you can use the [Ubertooth](http://greatscottgadgets.com/ubertoothone/) USB device. To capture BLE with Ubertooth please check its [wiki](https://github.com/greatscottgadgets/ubertooth/wiki/Capturing-BLE-in-Wireshark). Also there is a plugin for [Kismet](http://www.kismetwireless.net) - look for "Kismet" on [the "Getting Started" Ubertooth page](http://ubertooth.sourceforge.net/usage/start/) - and it produces capture files that can be dissected with [a Wireshark plugin](https://github.com/greatscottgadgets/libbtbb/tree/master/wireshark/plugins) (not needed for latest Wireshark).

## See Also

  - [Capturing on Ethernet Networks](/CaptureSetup/Ethernet)

  - [Capturing on 802.11 Wireless Networks](/CaptureSetup/WLAN)

  - [Capturing on Token Ring Networks](/CaptureSetup/TokenRing)

  - [Capturing on VLAN Protected Networks](/CaptureSetup/VLAN)

  - [Capturing on PPP Networks](/CaptureSetup/PPP)

  - [Capturing on the Loopback Device](/CaptureSetup/Loopback)

  - [Capturing on Frame Relay Networks](/CaptureSetup/FrameRelay)

  - [Capturing DOCSIS Traffic](/CaptureSetup/DOCSIS)

  - [Capturing on ATM Networks](/CaptureSetup/ATM)

  - [Capturing USB Traffic](/CaptureSetup/USB)

  - [Capturing IrDA Traffic](/CaptureSetup/IrDA)

  - [Capturing on Cisco HDLC Networks](/CaptureSetup/CiscoHDLC)

  - [Capturing SS7 Traffic](/CaptureSetup/SS7)

-----

---

Imported from https://wiki.wireshark.org/CaptureSetup/Bluetooth on 2020-08-11 23:11:49 UTC
