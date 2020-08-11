# Network Interfaces

Which is the right network interface to capture from?

[[_TOC_]]

## "Capture/Interfaces" dialog

The "Capture/Interfaces" dialog provides a good overview about all available interfaces to capture from.

If you are unsure which interface to choose this dialog is a good starting point, as it also includes the number of packets currently rushing in.

## Interface preferences

In the Wireshark preferences (Edit/Preferences/Capture), you can:

  - add a descriptive name to an interface
  - even completely hide an interface from the capture dialogs

See [Preferences/Capture](/Preferences/Capture) for details.

## Interface names

There are some common interface names which are depending on the platform.

### Windows

The interfaces names are provided by the network card manufacturer, which can be helpful to identify an interface.

[WinPcap](/WinPcap) provides some special interface names:

  - "Generic dialup adapter": this the name of the dialup interface (usually a telephone modem), see [CaptureSetup/PPP](/CaptureSetup/PPP)

  - "Generic NdisWan adapter": old name of "Generic dialup adapter", please update Wireshark/WinPcap\!

Wireless interfaces can usually be detected with names containing: "Wireless", "WLAN", "Wi-Fi" or "802.11", see [CaptureSetup/WLAN](/CaptureSetup/WLAN) for capturing details.

### General UNIX/Linux

On most systems you can get a list of interfaces by running "ifconfig" or "ifconfig -a".

### {Free,Net,Open,Dragonfly}BSD

  - "lo0": virtual loopback interface, see [CaptureSetup/Loopback](/CaptureSetup/Loopback)

  - "ppp0", "ppp1", etc.: PPP interfaces, see [CaptureSetup/PPP](/CaptureSetup/PPP)

  - Other names: other types of interfaces, with names that depend on the type of hardware; see the appropriate page under [CaptureSetup](/CaptureSetup)

### Linux

  - "any" : virtual interface, captures from all available (even hidden\!) interfaces at once

  - "lo": virtual loopback interface, see [CaptureSetup/Loopback](/CaptureSetup/Loopback)

  - "eth0", "eth1", ...: Ethernet interfaces, see [CaptureSetup/Ethernet](/CaptureSetup/Ethernet)

  - "ppp0", "ppp1", ...: PPP interfaces, see [CaptureSetup/PPP](/CaptureSetup/PPP)

  - "wlan0", "wlan1", ...: Wireless LAN, see [CaptureSetup/WLAN](/CaptureSetup/WLAN)

  - "team0", "bond0": Combined interfaces (i.e. NIC teaming or bonding)

  - "br0", "br1", ...: Bridged Ethernet, see [Ethernet Bridge + netfilter Howto](http://www.think-future.de/DOCUMENTATION/Ethernet-Bridge-netfilter-HOWTO/Ethernet-Bridge-netfilter-HOWTO.html)

  - "tunl0", "tunl1": IP in IP tunneling, see <http://www.linuxguruz.com/iptables/howto/2.4routing-5.html>

  - "gre0", "gre1": GRE tunneling (Cisco), see <http://www.linuxguruz.com/iptables/howto/2.4routing-5.html>

  - "ipsec0", "ipsec1": IPsec (VPN)

  - "nas0", "nas1": ATM bridging as in RFC 2684 (used e.g. for xDSL connections), see <http://home.regit.org/?page_id=8>

  - "usb0", "usb1", ...: USB interfaces, see [CaptureSetup/USB](/CaptureSetup/USB)

### macOS

  - "lo0": virtual loopback interface, see [CaptureSetup/Loopback](/CaptureSetup/Loopback)

  - "ppp0", "ppp1", etc.: PPP interfaces, see [CaptureSetup/PPP](/CaptureSetup/PPP)

  - "en0", "en1", ...: Ethernet or AirPort interfaces, see [CaptureSetup/Ethernet](/CaptureSetup/Ethernet) for Ethernet and [CaptureSetup/WLAN](/CaptureSetup/WLAN) for AirPort

  - "fw0", "fw1", ...: IP-over-[FireWire](/FireWire) interfaces

### Solaris

The lists of Ethernet, FDDI, and Token Ring interfaces are not necessarily complete; please add any interfaces not listed here. Also, list other interfaces supported.

  - be*N*, bge*N*, ce*N*, dmfe*N*, dnet*N*, e1000g*N*, eepro*N*, elxl*N*, eri*N*, ge*N*, hme*N*, iee*N*, ieef*N*, iprb*N*, ixgb*N*, le*N*, nee*N*, nei*N*, nfe*N*, pcelx*N*, pcn*N*, pe*N*, qe*N*, qfe*N*, rtls*N*, sk98sol*N*, smc*N*, smce*N*, smceu*N*, smcf*N*, spwr*N*, xge*N*: Ethernet interfaces, see [CaptureSetup/Ethernet](/CaptureSetup/Ethernet)

  - sxp*N*: FDDI interfaces

  - tr*N*: Token Ring interfaces, see [CaptureSetup/TokenRing](/CaptureSetup/TokenRing)

  - fcip*N*: IP-over-Fibre Channel interfaces

  - ibd*N*: IP-over-Infiniband interfaces (not currently supported by libpcap, hence not currently supported by Wireshark)

  - idn*N*: inter-domain virtual interfaces

  - ba*N*: raw ATM interfaces

### HP-UX

  - lan*N*: Ethernet, FDDI, or Token Ring interfaces, see [CaptureSetup/Ethernet](/CaptureSetup/Ethernet) for Ethernet and see [CaptureSetup/TokenRing](/CaptureSetup/TokenRing) for Token Ring

### AIX

  - lo0: virtual loopback interface, see [CaptureSetup/Loopback](/CaptureSetup/Loopback)

  - en*N*, et*N*: Ethernet interfaces, see [CaptureSetup/Ethernet](/CaptureSetup/Ethernet)

  - fi*N*: FDDI interfaces

  - tr*N*: Token Ring interfaces, see [CaptureSetup/TokenRing](/CaptureSetup/TokenRing)

### Digital/Tru64 UNIX

The list of Ethernet interfaces is not necessarily complete; please add any interfaces not listed here. Also, list other interfaces supported.

  - lo0: virtual loopback interface, see [CaptureSetup/Loopback](/CaptureSetup/Loopback)

  - ppp*N*: PPP interfaces, see [CaptureSetup/PPP](/CaptureSetup/PPP)

  - tu*N*: Ethernet interfaces, see [CaptureSetup/Ethernet](/CaptureSetup/Ethernet)

### IRIX

The lists of Ethernet, FDDI, and Token Ring interfaces are not necessarily complete; please add any interfaces not listed here. Also, list other interfaces supported.

  - lo0: virtual loopback interface, see [CaptureSetup/Loopback](/CaptureSetup/Loopback)

  - ppp*N*: PPP interfaces, see [CaptureSetup/PPP](/CaptureSetup/PPP)

  - ec*N*, ef*N*, eg*N*, ep*N*, et*N*, fxp*N*, gfe*N*, vfe*N*, tg*N*, xg*N*: Ethernet interfaces, see [CaptureSetup/Ethernet](/CaptureSetup/Ethernet)

  - el*N*: ATM LANE emulated Ethernet interfaces

  - qaa*N*: ATM "classical IP" interfaces

  - fa*N*: FORE ATM interfaces

  - cip*N*: ???

  - ipg*N*, rns*N*, xpi*N*: FDDI interfaces

  - mtr*N*: Token Ring interfaces, see [CaptureSetup/TokenRing](/CaptureSetup/TokenRing)

  - qfa*N*: IP-over-Fibre Channel interfaces

## Troubleshooting

Having trouble selecting the right interface?

### Required interface not listed (or no interfaces listed at all)

Problem: The network interface you want to capture from isn't in the list of interfaces (or this list is completely empty).

There are several possible causes:

  - Prerequisites: check the [CaptureSetup/CaptureSupport](/CaptureSetup/CaptureSupport) and [CaptureSetup/CapturePrivileges](/CaptureSetup/CapturePrivileges) pages

  - [WinPcap](/WinPcap) (Windows only): check the [WinPcap](/WinPcap) page for known limitations and the recommended [WinPcap](/WinPcap) version (esp. for 64bit and Vista)

  - Interface hidden: did you simply hide the interface in question in the Edit/Preferences/Capture dialog?

### Which interface to choose?

Problem: The capture dialog shows up several network interfaces and you're unsure which one to choose.

You could:

  - use the Capture/Interfaces dialog, which shows the number of packets rushing in and may show the IP addresses for the interfaces
  - try all interfaces one by one until you see the packets required
  - Win32: simply have a look at the interface names and guess

If you're trying to capture traffic between your machine and some other machine, and your machine has multiple network interfaces, at least for IP traffic you can determine the interface to use if you know the IP addresses for the interfaces and the IP address for the first hop of the route between your machine and that other machine.

To determine the IP address for the first hop of the route, use traceroute, if available, on UN\*X systems, and tracert on Windows systems.

---

Imported from https://wiki.wireshark.org/CaptureSetup/NetworkInterfaces on 2020-08-11 23:11:57 UTC
