# USB capture setup

This page is about capturing raw USB traffic, e.g. the packets a USB mouse will generate on the Universal Serial Bus.

## Table of contents

[[_TOC_]]

## USB attached network interfaces

A special case are network interfaces connected to a host computer through an USB cable. The operating system "converts" the raw USB packets into the network traffic (e.g. Ethernet packets) and provides a network interface that looks like an ordinary network interface. So you can capture from:

  - the USB device for raw USB traffic (if supported)
  - the network device for "normal" network packets

The USB bus will add additional overhead, so the raw USB traffic will have higher volume than the network traffic, even if the only active USB devices on the system are network adapters. (If there are other active USB devices, the raw USB traffic will include traffic to and from those devices, so it will obviously have higher volume than Ethernet traffic.)

## Linux

Capturing USB traffic on Linux is possible since Wireshark 1.2.0, libpcap 1.0.0, and Linux 2.6.11, using the Linux usbmon interface.

First, check if you belong to the `wireshark` group with:

`groups $USER`

To add yourself to the `wireshark` group, run the below command, then logout and login.

`sudo adduser $USER wireshark`

Then ensure that non-superusers are allowed to capture packets in wireshark. Select `<Yes>` in the below prompt:

`sudo dpkg-reconfigure wireshark-common`

The next two commands may need to be re-run after every reboot:

To dump USB traffic on Linux, you need the [usbmon](https://www.kernel.org/doc/Documentation/usb/usbmon.txt) kernel module. If it is not loaded yet, run this command as root:

`modprobe usbmon`

To give regular users privileges, make the usbmonX device(s) readable:

`sudo setfacl -m u:$USER:r /dev/usbmon*`

On some Linux distributions (Arch Linux, Debian, Ubuntu, possibly others), the above command may not be necessary if you already belong to the `wireshark` group. See [CaptureSetup/CapturePrivileges: Most UNIXes.](/CaptureSetup/CapturePrivileges#most-unixes)

With Linux kernels prior to 2.6.23, you will also need to run this command as root:

`mount -t debugfs none /sys/kernel/debug`

and, with those kernels, the usbmon mechanism's protocol limits the total amount of data captured for each raw USB block to about 30 bytes. With a 2.6.23 or later kernel, and libpcap 1.1.0 and later, that size limitation is removed. Use `uname -r` to check your kernel version.

In libpcap 1.1.0 and later, the devices on which you can capture are named `usbmonX`, where `X` is the USB bus number. On Linux 2.6.22 and later, the special "usbmon0" interface receives a combined stream of events from all USB buses. In libpcap 1.0.x, the devices were named `usbX`.

### Simple MITM hardware with Linux

If the USB host is a black-box device such as a game console and you cannot capture USB traffic on the host's operating system, here are two DIY-projects that help you build a simple MITM device to intercept and relay USB messages on the USB cable.

  - [SerialUSB](https://github.com/matlo/serialusb)
    
    is designed to intercept USB HID traffic. Originally made for the GIMX project (which lets you connect PC game controllers to the PS4 by converting the HID protocol messages). You will need a Linux computer to capture the HID messages and an [Arduino-based USB dongle](https://gimx.fr/wiki/index.php?title=DIY_USB_adapter_for_dummies). Parts are cheap. If you don't like soldering, you can buy ready-made "GIMX USB adapters" [from the developer](https://blog.gimx.fr/product/gimx-adapter/) and from enthusiasts on eBay and elsewhere.

  - [USBProxy](https://github.com/dominicgs/USBProxy)
    
    intercepts USB traffic with a standalone Beaglebone Black, which is reconfigured to act as a USB gadget emulating the device connected to the 2nd USB port. Unlike SerialUSB, this solution works with higher-speed non-HID USB traffic as well (within the hardware limitations of the Beaglebone device).

## macOS

Capturing USB traffic on macOS is possible since Wireshark 2.4.0, libpcap 1.9.0, and macOS High Sierra, using the XHC20 interface.

In order to capture on that interface, you will first have to run the command

`ifconfig XHC20 up`

as root, for example by running

`sudo ifconfig XHC20 up`

[In macOS Catalina, you apparently have to disable System Integrity Protection to capture USB traffic](https://forums.developer.apple.com/thread/124875).

## Windows

You can capture raw USB traffic on Windows with [USBPcap](http://desowin.org/usbpcap/). The [Tools](/Tools) page lists some other options for Windows USB capture.

-----

### A word of warning about USBPcap

There have been problems with using USBPcap in the past, and while these problems ***should*** be resolved now, you may wish to familiarize yourself with these earlier problems, in the event you are still affected by it.

  - [Wireshark Bug 11766](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=11766) - USBPcap prevents mouse and keyboard from working

  - [USBPcap Issue \#3](https://github.com/desowin/usbpcap/issues/3) - Windows 7 - USB bus not recognized after restart after USBPcap installation

  - [Microsoft Security Advisory 3033929](https://docs.microsoft.com/en-us/security-updates/SecurityAdvisories/2015/3033929) - Availability of SHA-2 Code Signing Support for Windows 7 and Windows Server 2008 R2

-----

You can also capture and debug USB traffic on a virtual Windows machine under VirtualBox. In some ways this is more convenient than working with a separate Windows box.

In this example, an embedded Linux device running g\_ether (RNDIS ethernet gadget) connects to Windows. e.g. an NSLU2 with a USB slave modification <http://www.nslu2-linux.org/wiki/HowTo/AddDeviceSideUSBPort> but it should work for almost any USB device.

With this method, Linux recognises the USB device (i.e. \>lsusb will still show them), but VirtualBox hooks it into Windows but Wireshark on linux still gets to snoop on all the packets.

Steps:

1\. Install a VirtualBox Windows guest on your Linux host. Start up the virtual Windows session.

2\. Plug-in the embedded slave device via a USB cable, which itself should be either a device Windows already knows about (or in this case it was running a valid g\_ether gadget stack and needed a .inf file)

3\. Run \>lsusb and take a note of which bus the device connects.

  - e.g
  - "Bus 003 Device 003: ID 0525:a4a2 Netchip Technology, Inc. Linux-USB Ethernet/RNDIS Gadget"

4\. On linux side,run \>ifconfig usb0 down - this prevents both the linux system and the windows system from fighting over the device

5\. On the Windows virtual machine, on VirtualBox menus click the checkbox

  - \[Devices\]-\>Usb devices\>\[x\]Your device

  - to let windows see the USB device.

6\. Now Windows should recognise the device and proceed with the "plug-and-pray" session for driver initialisation.

I worked from the instructions on <http://docwiki.gumstix.org/index.php/Windows_XP_usbnet> to install the driver.

7\. In this example, I had to set up the networking options for IP address, Gateway etc on Windows to match the IP network on the gadget but for other USB device types there will be no extra setup. In any case this is just normal Windows behavior.

8\. On Linux, startup Wireshark and using the Bus number given earlier from \>lsusb command to sniff for packets.

Hints for developing something like a Windows native "USBPcap": a [kernel mode filter device driver](http://msdn2.microsoft.com/en-us/library/aa490241.aspx) has to be written. An older [Driver Development Kit (DDK)](http://www.microsoft.com/whdc/devtools/ddk/default.mspx) is available which at least can compile kernel mode binaries. The most important functions to install the filter driver are [CreateService()](http://msdn2.microsoft.com/en-us/library/ms682450.aspx) and [SetupDiSetDeviceRegistryProperty()](http://msdn2.microsoft.com/en-us/library/ms792978.aspx) function with SPDRP\_LOWERFILTERS parameter.

## Discussion

Why was the note about inaccurate time stamps removed?\!? - *[UlfLamping](/UlfLamping)*

The timestamps should be ok now since libpcap works around the issue by explicitly calling gettimeofday()- ronnie

Well, the inaccuracies I had in mind was about the "delta" involved between the data is received from the USB device and actually timestamped from the kernel. This delta will be substantially lower for e.g. PCI based nic's than for USB ones - and should be mentioned. Or am I just wrong on this topic and this can be ignored - which should be mentioned then too? - *[UlfLamping](/UlfLamping)*

There's "capturing on USB-attached networking interfaces" and there's "capturing USB traffic"; this page is for the latter, but it sounds as if the time stamp delta is an issue for the former. - *Guy Harris*

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

  - [Capturing IrDA Traffic](/CaptureSetup/IrDA)

  - [Capturing on Cisco HDLC Networks](/CaptureSetup/CiscoHDLC)

  - [Capturing SS7 Traffic](/CaptureSetup/SS7)

---

Imported from https://wiki.wireshark.org/CaptureSetup/USB on 2020-08-11 23:12:03 UTC
