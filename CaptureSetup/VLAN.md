# VLAN capture setup

## Table of contents

[[_TOC_]]

## VLAN tags

When capturing on a [VLAN](/VLAN), you won't necessarily see the VLAN tags in packets.

For example, in at least some operating systems, you might have more than one network interface device on which you can capture - a "raw interface" corresponding to the physical network adapter, and a "VLAN interface" the traffic on which has had the VLAN tags removed. The OS's networking stack would be connected to the VLAN interface, and that interface would appear to the networking stack to be an Ethernet interface with a smaller MTU than normal (to leave room for the VLAN tags). On those OSes, in order to see the raw Ethernet packets, rather than "de-VLANized" packets, you would have to capture not on the virtual interface for the VLAN, but on the interface corresponding to the physical network device, if possible.

Here are some details on capturing VLAN tags on various operating systems. If the OS or the network adapter driver won't allow the VLAN tags to be captured, set up port mirroring (or "port spanning", as Cisco calls it) on the VLAN switch and connect an independent system, such as a laptop, to the mirror port, and don't configure the interface attached to that port as a member of a VLAN.. You'll definitely see the VLAN tags, regardless of what OS the independent system is running or what type of network adapter you're using.

### Linux

To enable VLAN tagging, you need two things: the vlan rpm (e.g., vlan-1.8-23) and the 8021q kernel module. Once installed, the vconfig command can be used to create VLAN interfaces on an existing physical device. For more info, see the vconfig(8) man page.

After your VLAN interfaces are set up and traffic is flowing, you can run Wireshark and capture on the VLAN interface of your choice (e.g., eth0.100 for VLAN 100) or on the underlying physical interface (e.g., eth0). If you choose the former, you will only see frames destined for that VLAN; if you choose the latter, you may see **all** frames or you may see only untagged frames (if there are any). It depends on the NIC, the NIC firmware, the driver, and the alignment of the moon and planets. (A table enumerating the behaviors of various adapters, firmware versions, and drivers might be useful. -*Guy Harris*)

If you are capturing on the host system where the VLANs are configured, you will probably *not* see the VLAN tags in the captured frames -- even if you capture on the physical device. The driver is stripping the tags before the pcap library sees them. See the tech note from Intel mentioned in the Windows section below. (Do Linux drivers support getting VLAN tags, perhaps with a driver configuration option or other option, in the same way that the Intel Windows driver does? -*Guy Harris*) (e100 driver works great on 2.4.26 - *Jaap Keuter*)

### FreeBSD, NetBSD, OpenBSD, macOS

At least as I read the [FreeBSD 5.3 vlan(4) man page](http://www.freebsd.org/cgi/man.cgi?query=vlan&sektion=4&apropos=0&manpath=FreeBSD+5.3-RELEASE+and+Ports), VLANs have named network interface devices separate from the network interface device for the physical LAN adapter; to see frames with their VLAN tags you might have to capture on the device for the physical LAN adapter rather than the device for the VLAN. If this is not the case, or if there are more details, please update this section of this Wiki page. It might or might not be possible to capture traffic on the VLAN interface device.

There's also a [netgraph node for VLAN tag processing](http://www.freebsd.org/cgi/man.cgi?query=ng_vlan&sektion=4&apropos=0&manpath=FreeBSD+5.3-RELEASE+and+Ports); BPF taps into the drive for the network adapter, so if you capture on that adapter's device, you should see traffic with VLAN tags even if the netgraph node for VLAN tag processing is being used.

The [NetBSD 2.0 vlan(4) man page](http://www.freebsd.org/cgi/man.cgi?query=vlan&apropos=0&sektion=0&manpath=NetBSD+2.0&format=html) indicates that its VLAN mechanism is derived from the FreeBSD and OpenBSD ones, so it probably works similarly to FreeBSD's. [A netbsd-help mail message](http://mail-index.netbsd.org/netbsd-help/2005/01/22/0003.html) suggests that you can capture on a VLAN's network interface device as well as on the physical adapter's network interface device; this might apply to all of these BSDs.

The [OpenBSD 3.6 vlan(4) man page](http://www.freebsd.org/cgi/man.cgi?query=vlan&apropos=0&sektion=0&manpath=OpenBSD+3.6&format=html) suggests that its VLAN mechanism is derived from the FreeBSD one, so it probably works similarly to FreeBSD's. It also notes that, if the network adapter does hardware VLAN tagging, capturing on the physical adapter's network interface device will **not** show the packets with VLAN tags; I don't know whether it's possible to turn hardware VLAN tagging off. This might apply to the other BSDs as well.

The Mac OS X 10.3.8 ifconfig man page suggests that it also has VLAN pseudo-devices.

### DragonFly BSD

Does DragonFly BSD support VLANs and, if so, do they work the same way FreeBSD does? If so, please update the above section to say so, and rename it to "FreeBSD and DragonFly BSD"; if not, please remove this section if DragonFly BSD doesn't support VLANs or fill it in with the correct information if it does.

### Solaris

At least as I read [the Configuring VLANs section](http://docs.sun.com/app/docs/doc/816-1664-10/6m82lv9lt?a=view) of [the Solaris 9 Sun Hardware Platform Guide](http://docs.sun.com/app/docs/doc/816-1664-10), VLANs have named network interface devices separate from the network interface device for the physical LAN adapter; to see frames with their VLAN tags you might have to capture on the device for the physical LAN adapter rather than the device for the VLAN. If this is not the case, or if there are more details, please update this section of this Wiki page.

### HP-UX

At least as I interpret the [Using the lanadmin -V Command for Administering VLANs](http://docs.hp.com/en/T1453-90001/ch05s01.html) page the [Using HP-UX VLANs](http://docs.hp.com/en/T1453-90001/index.html) document, VLANs have named network interface devices separate from the network interface device for the physical LAN adapter, and, at least as I read the [Promiscuous Mode Characteristics](http://docs.hp.com/en/T1453-90001/ch02s07.html) page in the Using HP-UX VLANs document, if you capture in promiscuous mode on the device for the physical LAN adapter, you will see all packets with their VLAN tags. If this is not the case, or if there are more details, please update this section of this Wiki page.

### AIX

At least as I interpret the [Virtual Networking on AIX 5L](http://www-1.ibm.com/servers/aix/whitepapers/aix_vn.pdf) white paper, VLANs have named network interface devices separate from the network interface device for the physical LAN adapter; to see frames with their VLAN tags you might have to capture on the device for the physical LAN adapter rather than the device for the VLAN. If this is not the case, or if there are more details, please update this section of this Wiki page.

### Digital/Tru64 UNIX

At least as I read [the Tru64 UNIX 5.1B VLAN(7) man page](http://h30097.www3.hp.com/docs/base_doc/DOCUMENTATION/V51B_HTML/MAN/MAN7/0073____.HTM), VLANs have named network interface devices separate from the network interface device for the physical LAN adapter; to see frames with their VLAN tags you might have to capture on the device for the physical LAN adapter rather than the device for the VLAN. If this is not the case, or if there are more details, please update this section of this Wiki page.

### Other UN\*Xes

If any other UN\*Xes support VLANs, e.g. IRIX, please add sections for them to the Wiki.

### Windows

Windows has no built-in support mechanisms for VLANs. There aren't separate physical and VLAN interfaces you can capture from, unless a specialized driver that adds such support is present.

So whether you see VLAN tags in Wireshark or not will depend on the network adapter you have and on what it and its driver do with VLAN tags.

Most "simple" network adapters (e.g. widely used Realtek RTL 8139) and their drivers will simply pass VLAN tags to the upper layer to handle these. In that case, Wireshark will see VLAN tags and can handle and show them.

Some more sophisticated adapters will handle VLAN tags in the adapter and/or the driver. This includes some Intel adapters and, as far as i know, Broadcom gigabit chipsets (NetXtreme / 57XX based chips). Moreover, it is likely that cards that have specialized drivers will follow this path as well, to prevent interference from the "real" driver.

#### Special flag settings

For some of the more sophisticated adapters, a flag can be set to disable the stripping of VLAN tags.

##### Intel

Some Intel Ethernet adapters and their drivers will, by default, strip VLAN tags when processing packets or strip tagged packets completely. If you want to see the VLAN tags when capturing on one of those adapters in promiscuous mode on Windows, you will need to disable this feature. You may also need to upgrade your driver for that. This is unrelated to working with Intel's specialized driver that adds VLAN support (see below).

See [Intel's original support note on this](http://www.intel.com/support/network/sb/cs-005897.htm) for more details.

##### Broadcom

Some information from a message to the wireshark-users mailing list, with information from Broadcom:

BASP isn't supported on laptops (and other non-server machines?), but, at least for the BCM5751M NetXtreme Gigabit chips in IBM T43, HP, and Dell Latitude laptops, there is a registry key under HKEY\_LOCAL\_MACHINE\\SYSTEM\\CurrentControlSet that can be set to cause the driver and chip not to strip the 802.1Q headers. In order to set that key, you need to find the right instance of the driver in Registry Editor and set that key for it. You can do this by doing following:

1.  Run the Registry Editor (regedt32).

2.  Search for "TxCoalescingTicks" and ensure this is the only instance that you have.

3.  Right-click on the instance number (eg. 0008) and add a new string value.

4.  Enter "PreserveVlanInfoInRxPacket" and give it the value "1".

This should set you up to be able to sniff the VLAN tag information.

This last solution has also been tested on Dell Latitude D Series laptops, and it works.

If VLAN Tags do not appear you need to update firmware on the Broadcom NIC:

Fetch the user diagnostic application from Broadcom website and follow these instructions:

1.  Burn a CD using this ISO image
2.  Boot to Live CD
3.  Select install to Harddrive (does not really though)
4.  Change to the b57udiag directory and run "b57udaig -cmd"
5.  At the prompt enter "setasf -d @"

Specialized drivers

Intel, Broadcom, 3Com and SysKonnect provide specialized drivers which add support for several missing Ethernet features, notably VLANs but also link aggregation and fail over. It is quite likely that other vendors of server-grade network interfaces do so as well - check your vendor's site for more details.

##### 3com DynamicAccess

I personally have no experience capturing with DynamicAccess turned on. the software is quite outdated and does not support anything but very few specialized adapters, which I have no access to.

##### Broadcom Advanced Server Program (BASP)

For servers, Broadcom has a virtual miniport driver, the Broadcom Advanced Server Program (BASP), which splits VLAN enabled interfaces to virtual interfaces. It is possible to capture from these interfaces without any known problems. Capturing from an aggregated interface also works, but LACP packets are seemingly not captured.

##### Intel Advanced Networking Suite (iANS)

Intel has a virtual miniport driver that splits VLAN enabled interfaces to virtual interfaces. It is possible to capture from these interfaces without any known problems. capturing from an aggregated interface has not been tested but is presumed to work.

I have not tested SysKonnect's offering due to hardware not being available, but i am aware of its existance.

##### Marvell Yukon 88E8055 PCI-E Gigabit Ethernet Controller

You should add the DWORD [SkDisableVlanStrip](/SkDisableVlanStrip) with value of 1 and the DWORD \*PriorityVLANTag (including the star) with value of 0 under the registry key: "HKLM\\SYSTEM\\[CurrentControlSet](/CurrentControlSet)\\Control\\Class\\{4D36E972-E325-11CE-BFC1-08002bE10318}\\000" , where 000 is the number of the folder for the Marvel ethernet controller.

## Capture filters

Any capture filter that is to be applied to packets with 802.1q tags has to have `vlan and` at the beginning; otherwise, the filter will not correctly handle traffic with 802.1q tags, and will probably reject the traffic you're trying to capture, so that you won't capture that traffic.

The `vlan` capture filter operation can also be used to test for a particular VLAN; `vlan` *vlan\_id* will capture on the VLAN with the specified VLAN id.

To quote the Mac OS X 10.4.9 tcpdump man page (this isn't [WinPcap](/WinPcap)-specific - it's common to all libpcap/WinPcap implementations):

vlan \[vlan\_id\]

  - True if the packet is an IEEE 802.1Q VLAN packet. If \[vlan\_id\] is specified, only true is the packet has the specified vlan\_id. Note that the first vlan keyword encountered in expression changes the decoding offsets for the remainder of expression on the assumption that the packet is a VLAN packet.

As the second sentence says, "Note that the first vlan keyword encountered in expression changes the decoding offsets for the remainder of expression on the assumption that the packet is a VLAN packet." The "vlan" in "vlan and host x.x.x.x" causes the "host x.x.x.x" to check for VLAN-encapsulated packets with an IPv4 address of x.x.x.x.

To check for both VLAN-encapsulated and non-VLAN-encapsulated packets with that IPv4 address, try

host x.x.x.x or (vlan and host x.x.x.x)

## External Links

  - [802.1Q VLAN implementation for Linux](http://www.candelatech.com/~greear/vlan.html)

  - [Bypassing VLAN Security](http://www.askapache.com/security/bypassing-vlan.html)

## See Also

  - [VLAN](/VLAN) Virtual Bridged LAN Overview

  - [Capturing on Ethernet Networks](/CaptureSetup/Ethernet)

  - [Capturing on 802.11 Wireless Networks](/CaptureSetup/WLAN)

  - [Capturing on Token Ring Networks](/CaptureSetup/TokenRing)

  - [Capturing on PPP Networks](/CaptureSetup/PPP)

  - [Capturing on the Loopback Device](/CaptureSetup/Loopback)

  - [Capturing on Frame Relay Networks](/CaptureSetup/FrameRelay)

  - [Capturing DOCSIS Traffic](/CaptureSetup/DOCSIS)

  - [Capturing Bluetooth Traffic](/CaptureSetup/Bluetooth)

  - [Capturing on ATM Networks](/CaptureSetup/ATM)

  - [Capturing USB Traffic](/CaptureSetup/USB)

  - [Capturing IrDA Traffic](/CaptureSetup/IrDA)

  - [Capturing on Cisco HDLC Networks](/CaptureSetup/CiscoHDLC)

  - [Capturing SS7 Traffic](/CaptureSetup/SS7)

-----

---

Imported from https://wiki.wireshark.org/CaptureSetup/VLAN on 2020-08-11 23:12:04 UTC
