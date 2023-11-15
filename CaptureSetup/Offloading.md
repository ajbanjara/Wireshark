# Offloading

Most modern operating systems support some form of network offloading, where some network processing happens on the NIC instead of the CPU. Normally this is a great thing. It can free up resources on the rest of the system and let it handle more connections. If you're trying to capture traffic it can result in false errors and strange or even missing traffic.

[[_TOC_]]

# Checksum Offload

On systems that support checksum offloading, IP, TCP, and UDP checksums are calculated on the NIC just before they're transmitted on the wire. In Wireshark these show up as outgoing packets marked black with red Text and the note *\[incorrect, should be xxxx (maybe caused by "TCP checksum offload"?)\]*.

Wireshark captures packets before they are sent to the network adapter. It won't see the correct checksum because it has not been calculated yet. Even worse, most OSes don't bother initialize this data so you're probably seeing little chunks of memory that you shouldn't.

New installations of Wireshark 1.2 and above disable IP, TCP, and UDP checksum validation by default. You can disable checksum validation in each of those dissectors by hand if needed.

TCP and UDP checksums are calculated over both the payload and from selected elements from the IPv4 or IPv6 header, known as the pseudo header. Linux and Windows, when offloading checksums, will calculate the contribution from the pseudo header and place it in the checksum field. Wireshark 4.2 and above can detect this partial checksums and will mark them as such instead of marking them as invalid.

If you are experiencing network problems and while trying to figure it out with Wireshark you found these checksum errors, you may have a network card with TCP checksum offload enabled and for some reason the packet is not being fixed by the adapter (NAT, bridge or route redirection is sending the packet to another interface). In this case, you may want to check and disable checksum offload for the adapter, if possible.

## Linux

Checksum offloading can be enabled and disabled with the ethtool command.

To check:

    ethtool --show-offload  ethX

To disable:

    ethtool --offload  ethX  rx off  tx off

Or, with some 3Com cards (see [3c59x vortex docs](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=Documentation/networking/vortex.txt;h=6356d3faed365634bbbe85172b28abdf472c600b;hb=HEAD#l186)):

    rmmod 3c59x ; modprobe 3c59x hw_checksums=0

## Windows

In Windows, go to Control Panel-\>Network and Internet Connections-\>Network Connections, right click the connection to change and choose 'Properties'. Press the 'Configure...' button, choose the 'Advanced' tab to see or modify the "Offload Transmit TCP Checksum" and "Offload Receive TCP Checksum" values.

# Segmentation Offload

Some cards can reassemble traffic. This will manifest itself in Wireshark as packets that are larger than expected, such as a 2900-byte packet on a network with a 1500-byte MTU. You can check and change offloading behavior on Linux and Windows using the methods described in the previous section.

[This article](http://securityonion.blogspot.co.uk/2011/10/when-is-full-packet-capture-not-full.html) has a nice explanation on what to do.

# TCP Chimney

Chimney offloading lets the NIC handle processing for established TCP connections. On Windows offloaded connections bypass [WinPcap](/WinPcap), which means that you won't capture TCP conversations.

    netsh int ip set chimney disabled

# See also

  - [Checksums](http://www.wireshark.org/docs/wsug_html_chunked/ChAdvChecksums.html) in the Wireshark User's Guide

  - [TCP Offload Engine](http://en.wikipedia.org/wiki/TCP_Offload_Engine) article on Wikipedia

  - [KB 912222](http://support.microsoft.com/kb/912222), The Microsoft Windows Server 2003 Scalable Networking Pack Release

  - [KB 951037](http://support.microsoft.com/kb/951037), Information about the TCP Chimney Offload, Receive Side Scaling, and Network Direct Memory Access features in Windows Server 2008

