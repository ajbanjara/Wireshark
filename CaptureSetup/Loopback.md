# Loopback capture setup

The following will explain capturing on loopback interfaces a bit.

If you are trying to capture traffic from a machine to itself, that traffic will not be sent over a real network interface, even if it's being sent to an address on one of the machine's network adapters. This means that you will not see it if you are trying to capture on, for example, the interface device for the adapter to which the destination address is assigned. You will only see it if you capture on the "loopback interface", if there is such an interface and it is possible to capture on it; see the next section for information on the platforms on which you can capture on the "loopback interface".

## Supported Platforms

See [CaptureSetup/NetworkMedia](/CaptureSetup/NetworkMedia) for Wireshark capturing support on various platforms. Summary: you can capture on the loopback interface on Linux, on various BSDs including macOS, and on Digital/Tru64 UNIX, and you *might* be able to do it on Irix and AIX, but you definitely **cannot** do so on Solaris, HP-UX, or Windows.

## Windows

### Starting from Windows Vista: Npcap

[Npcap](https://nmap.org/npcap/) is an update of [WinPcap](/WinPcap) using NDIS 6 Light-Weight Filter (LWF), done by Yang Luo for Nmap project during Google Summer of Code 2013 and 2015. [Npcap](https://nmap.org/npcap/) has added many features compared to the legacy [WinPcap](/WinPcap).

    1) NDIS 6 Support
    2) "Admin-only Mode" Support
    3) "WinPcap Compatible Mode" Support
    4) Loopback Packets Capture and Send Support (either as fake Ethernet or Null/Loopback frames)
    5) Raw 802.11 packets Capture Support (in "monitor mode")

When installed on Windows Vista or later (including Win7, Win8 and Win10) with option "Support loopback traffic ("Npcap Loopback Adapter" will be created)" selected, it will create an *Npcap Loopback Adapter* that can be selected in Wireshark so as to capture IPv4/IPv6 loopback traffic.

When installed on Windows XP or earlier, it will install the legacy [WinPcap](/WinPcap) driver.

The current latest installer can be found here: <https://nmap.org/npcap/>, the source code can be found here: <https://github.com/nmap/npcap>

Starting from Wireshark 1.12.8 and 1.99.9, the Windows installer will detect Npcap presence (when installed in [WinPcap](/WinPcap) compatible mode) and will not try to install [WinPcap](/WinPcap) 4.1.3.

### IP 127.0.0.1

You can't capture on the local loopback address 127.0.0.1 with a Windows packet capture driver like [WinPcap](/WinPcap). The following page from "Windows network services internals" explains why: [The missing network loopback interface](https://web.archive.org/web/20171012161338/http://www.hsc.fr/ressources/articles/win_net_srv/missing_loopback.html).

You can, however, use a raw socket sniffer like [RawCap](http://www.netresec.com/?page=RawCap) to capture localhost network traffic in Windows. Read more here:

  - <http://www.netresec.com/?page=Blog&month=2011-04&post=RawCap-sniffer-for-Windows-released>

  - <https://www.netresec.com/?page=Blog&month=2020-01&post=RawCap-Redux>

### IP other

You can add a virtual network card called *Microsoft Loopback Adapter*, but in most cases that might not give results as expected either.

This adapter is available from Microsoft:

  - [Microsoft: How to install the Microsoft Loopback Adapter in Microsoft Windows Server 2003](http://support.microsoft.com/kb/842561)

  - [Microsoft: How to install the Microsoft Loopback adapter in Windows XP](http://support.microsoft.com/kb/839013)

  - [Microsoft: How To Install Microsoft Loopback Adapter in Windows 2000](http://support.microsoft.com/kb/236869)

... and is quite different than the ones available for various UN\*X systems. This adapter is a virtual network adapter you can *add*, but it will not work on the 127.0.0.1 IP addresses; it will take its own IP address. BTW: You can only add *one* Loopback Adapter to the system\!

:warning: Beware: Capturing from this Loopback Adapter requires the [WinPcap](/WinPcap) 3.1 release, 3.1 beta versions won't work\!

Let's suppose you have set the IP address of the loopback adapter to 10.0.0.10 and are capturing on that interface. If you ping to this 10.0.0.10 address the ping will get ping replies, but you won't see any of this traffic in Wireshark (much like the 127.0.0.1 problem). If you ping on 10.0.0.11, you won't get ping replies as there is obviously no remote host, but you will see the corresponding ARP requests in Wireshark.

The only benefit I can see so far is if you use it with colinux (and probably other PC virtualization software) to capture the traffic between Windows and the virtual machine. - *[UlfLamping](/UlfLamping)*

:smiley: Recipe (to capture traffic on ms loopback adapter / Windows XP): --- by ***mitra***

    1. go to MS Loopback adapter properties, set IP 10.0.0.10, MASK 255.255.255.0
    2. ipconfig /all and look at the MAC-ID for your new adapter.
    3. arp -s 10.0.0.10 <MAC-ID>
    4. route add 10.0.0.10 10.0.0.10 mask 255.255.255.255
    5. to test: "telnet 10.0.0.10"

:thumbsup: I am now using the loopback adapter to capture traffic that I source into a Dyanmips/Dynagen virtual router network. This is a potentially very useful tool/feature that I will be testing further in the weeks to come. As it stands, I can connect my loopback adapter to a virtual router interface and capture ping, arp, etc. In the near future, I hope to tie a server w/ a loopback adapter to a virtual router and then capture a full client/server type of exchange across a Dynamips/Dynagen emulated network. -- Scott Vermillion

NOTE: To get to the Microsoft Loopback Adapter Properties: Start -\> Settings -\> Control Panel -\> System -\> Device Manager -\> Network Adapters and right click Microsoft Loopback Adapter to select Properties. -- saran

## Commercial Alternatives

  - A commercial network sniffer called [CommView (from TamoSoft)](http://www.tamos.com/products/commview/) allows you to capture packets on the localhost network adapter but it dissects fewer protocols, so you can capture packets with CommView and save them into a file and open it with Wireshark.

  - [Local Network Monitor 3.2](http://www.ntkernel.com/w&p.php?id=24)

  - [Atelier Web Ports Traffic Analyzer](http://www.atelierweb.com/pta/index.htm)

## Other Alternatives

  - Add a route to your local machine going through the network gateway:

<!-- end list -->

    route add <your_IP> mask 255.255.255.255 <the_gateway> metric 1

with \<your\_IP\> being different from 127.0.0.1. It should (has to) be the result of *ipconfig* command (ip address field) \<the\_gateway\> has to be the default gateway field taken from *ipconfig /all* result.

Doing so, every network traffic from your machine to itself will use the physical network interface, it will then go to the gateway, back to you. Therefor, you will see each packet twice, but it can be filtered on the view.

Be careful, since your machine will use the actual network to talk to itself, it may overload the network. It may be wise to remove the new route once you are done with the tests:

    route delete <your_IP>

  - [Proxocket - A Winsock Proxy Sniffer](http://aluigi.altervista.org/mytoolz.htm#proxocket) Written by Luigi Auriemma, this great tool appears to be a [Layered Service Provider](http://en.wikipedia.org/wiki/Layered_Service_Provider) that can be used to capture calls between an application and the Winsock functions in Windows. By doing this, one is able to effectively capture loopback traffic on a per-process basis.

[My](/ChristopherMaynard) own experience with proxocket is as follows: After installing the ws2\_32.dll from proxocket into a directory containing 3 binaries that communicate with each other over the loopback interface and starting them all up, it generated 3 separate capture files, one for each process, which I was then able to merge together into a single capture file using [mergecap](http://www.wireshark.org/docs/man-pages/mergecap.html). After filtering out the duplicate packets in the file, which contained the source IP address of 0.0.0.0, I had a pretty good capture file containing loopback traffic on Windows. Some packets were clearly ordered incorrectly, but it was easy enough for me to spot them and tell what was going on.

While certainly not as good/easy as capturing loopback traffic on a \*NIX platform, prior to using [RawCap](http://www.netresec.com/?page=RawCap), this was the best way for me to obtain loopback traffic on Windows. Having said that, after using [RawCap](http://www.netresec.com/?page=RawCap), I don't see why anyone would want to use this.

## Setup localhost capturing from powershell

Recipes and explanation is [here](http://ig2600.blogspot.com/2011/03/powershell-script-to-enable-windows-to.html). (Note: Since the link no longer appears to work, [here](https://web.archive.org/web/20150726062624/http://ig2600.blogspot.com/2011/03/powershell-script-to-enable-windows-to.html) is an archived one.)

This is translated from French, based on the method described [here](http://ici.lemmy.free.fr/blog/index.php?2005/05/19/16-capturer-localhost-sous-windows-avec-ethereal).

## See Also

  - [Capturing on Ethernet Networks](/CaptureSetup/Ethernet)

  - [Capturing on 802.11 Wireless Networks](/CaptureSetup/WLAN)

  - [Capturing on Token Ring Networks](/CaptureSetup/TokenRing)

  - [Capturing on VLAN Protected Networks](/CaptureSetup/VLAN)

  - [Capturing on PPP Networks](/CaptureSetup/PPP)

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

Imported from https://wiki.wireshark.org/CaptureSetup/Loopback on 2020-08-11 23:11:56 UTC
