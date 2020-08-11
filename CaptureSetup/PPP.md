# PPP capture setup

Many types of network connections often use [PPP](/PPP) - dial-up lines, ISDN connections, PPPoE connections as are often used with ADSL, and T1/E1 or other high-speed serial lines usually use PPP.

## Table of contents

[[_TOC_]]

## Capturing on a link to which the machine running Wireshark is connected

On many platforms, Wireshark supports capturing on a PPP link to which the machine running Wireshark is connected, so that it can capture PPP traffic that the machine in question sends and receives.

### UN\*X

On most UN\*X platforms, it should be possible to capture on a PPP link with little difficulty. You won't necessarily be able to capture control protocol traffic, however. (Items giving specific information about the BSDs, Solaris, etc. should be added below this one; this entry is a "wildcard" entry for UN\*Xes not listed below.)

### Linux

On Linux, you won't be able to capture PPP control protocol traffic in the usual manner (via libpcap) as that traffic is not supplied to the networking stack. You will be able to capture IP traffic, for example, but you won't be able to see the PPP headers, as the PPP code doesn't supply them to the networking stack.

The PPP control protocol traffic **can** be captured by configuring the ppp daemon to 'record' to a capture file all the data the daemon sends and receives. Wireshark can then be used to display the created capture file.

On Fedora Core 6 the pppd capture file is created if 'record filename-of-your-choice' is added as a line in /etc/ppp/options (YMMV: see 'man pppd').

Note that all traffic on the PPP port is captured to the file so this option, if left on, may cause a large capture file to be generated.

### macOS

On macOS, you won't be able to capture on a PPP interface until it's set up, so you won't be able to see initial control protocol traffic.

### Windows

On Windows, capturing on a PPP link is more difficult. There's [an item in the WinPcap FAQ](http://www.winpcap.org/misc/faq.htm#Q-5) that discusses some of the problems.

:warning: **The installed [WinPcap](/WinPcap) version is critical for PPP capturing; we strongly recommend that you install the 3.1 release, see the [WinPcap](/WinPcap) page for details.**

If you're having problems, and aren't running [WinPcap](/WinPcap) 3.1 (i.e., you're running a beta release of 3.1, or are running a release before 3.1), un-install whatever you have and install 3.1\!

  - Windows 95, Windows 98, and Windows Me: the device on which you capture will **probably** have a name with "NDISWAN" in it. (If a Windows 95/98/Me user finds that's not the case, they should update this item to give the correct information.) The [WinPcap](/WinPcap) FAQ item notes that, on Windows 95, due to a Windows bug, [WinPcap](/WinPcap) can sometimes reset the connection, and that this bug appears to be fixed in Windows 98 and Windows Me.

  - Windows 2000, Windows XP, and Windows Server 2003: you should be able to capture on the "GenericDialupAdapter" with [WinPcap](/WinPcap) 3.1.

  - Windows NT 4.0 and Windows Vista Beta 1: capturing on PPP interfaces isn't supported on these Windows versions

The [WinPcap](/WinPcap) 3.1 support for PPP links on Windows 2000/Windows XP/Windows Server 2003 works only if you have "Power Users" or "Administrators" privileges on Windows 2000 and XP, and "Power Users + Network Configuration Operations" or "Administrators" privileges on Windows Server 2003.

Other software installed on your machine might also cause problems; for example, it has been reported that a driver for TamoSoft's CommView can make it impossible to capture on PPP interfaces with [WinPcap](/WinPcap), and various VPN software packages might also cause problems for [WinPcap](/WinPcap).

With the [WinPcap](/WinPcap) 3.1 support for capturing on PPP links, if you try to start the capture before the PPP link has been set up (for example, before the machine has dialed up, for dial-up or ISDN connections), the only PPP interface offered for capture will be called "GenericDialupAdapter". This interface doesn't have any IP address assigned to it; the IP address for a PPP link is typically assigned only when the link is set up. Capturing on that interface will allow you to start the capture before the link has been set up.

Once the link has been set up, both the "GenericDialupAdapter" and an interface referring to the link that was set up, called "WAN (PPP/SLIP) Interface", will be available for capture; the interface referring to the link that was set up will have an IP address assigned to it.

## Capturing on a link between two "other" machines

It might be possible, on some operating systems, to attach a machine running Wireshark to a PPP link between two other machines, using a DAG card from [Endace Measurement Systems](http://www.endace.com/). You would need a version of libpcap or [WinPcap](/WinPcap) that supports the DAG API, and would also have to have Endace's software for the DAG card providing that API installed. For libpcap, you'd probably have to install the DAG software and then download the libpcap source from [the tcpdump.org Web site](http://www.tcpdump.org/), configure, build, and install that software. The DAG cards are supported with libpcap only on Linux and FreeBSD. For further help on this you should contact Endace.

## Discussion

PPPoE is mentioned above, but isn't this simply an Ethernet interface with some "special protocol" on top of it, so it shouldn't be included here? - *[UlfLamping](/UlfLamping)* On Windows, that depends on whether Windows (or the third-party PPPoE implementations - I don't know whether any version of Windows has it built in) work by connecting to the Ethernet driver via NDIS on the "bottom end" and to NDISWAN at the "top end"; if they do that, then PPPoE will have the same problems as other PPP implementations. On other OSes, they might provide a separate PPP interface for the PPPoE connection; that interface would have its own IPv4 and/or IPv6 and/or ... addresses assigned to it, and capturing on it would probably supply traffic that looks like PPP. - *Guy Harris*

As of Windows XP (Starting from non-SP1/2), a PPPoE solution is implemented in the shape of the connect over PPPoE option in the New Network Connections screen. I have successfully managed to capture PPPoE packets on Windows XP, and it is just standard broadcast Ethernet with PPPoE Session packets layered over the IP Protocol. Layered over IP? That's not standard PPPoE - PPPoE would be over Ethernet (that being what the "oE" abbreviates). Are you capturing on the Ethernet adapter itself (in which case I'd expect you to see all the traffic going to and from the Ethernet, including, but not limited to, the PPPoE traffic, and I'd expect the PPPoE traffic to be directly atop Ethernet, with IP *on top of* PPP, not atop IP), or are you capturing on some PPP/WAN adapter that Windows adds (in which case it'd probably look like Ethernet traffic, if it works the same way dial-up PPP works, with NDISWAN)? -*Guy Harris*

## See Also

  - [Capturing on Ethernet Networks](/CaptureSetup/Ethernet)

  - [Capturing on 802.11 Wireless Networks](/CaptureSetup/WLAN)

  - [Capturing on Token Ring Networks](/CaptureSetup/TokenRing)

  - [Capturing on VLAN Protected Networks](/CaptureSetup/VLAN)

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

Imported from https://wiki.wireshark.org/CaptureSetup/PPP on 2020-08-11 23:12:01 UTC
