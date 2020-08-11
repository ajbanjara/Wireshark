# CaptureSetup/InterferingSoftware

Software that's working together with the network protocol stack at a low level can cause problems together with [WinPcap](/WinPcap).

Some known problematic software includes:

  - SonicWALL Global VPN Client, Version 3.1.0.556: When installed together with [WinPcap](/WinPcap) 3.1, the network interfaces are no longer available (*ipconfig /all* doesn't show them)

  - Cisco VPN client: duplicates packets, even if not running (installation is enough to cause problems) - *Steve Masters*

  - Cisco VPN client: may hide all packets, even if not connected - disable the firewall in the Cisco VPN client or stop the "Cisco Systems, Inc. VPN Service" -- *Matthias Andree*

  - Citrix DNE Lightweight Driver: May hide outgoing packets - switching it off in the Network Connection properties may resolve the issue

  - F-Secure Anti-Virus Client Security - disable the firewall part of the suite and it works again. *Kim Tiedemann*

  - Sunbelt Kerio Personal Firewall: Internet connection stops working while capturing, can't browse or anything. Disabling the firewall is not enough. No known workaround at this time.

  - Check Point VPN1 [SecureClient](/SecureClient) (NGX R60 HFA1 Build 019): Tools\>Disable Security Policy

  - [Symantec Endpoint Protection](http://www.symantec.com/endpoint-protection): Refer to [this](http://ask.wireshark.org/questions/11560/unable-to-capture-or-display-incoming-tcpip-packets-with-port-8100) question on [ask](http://ask.wireshark.org) for details.

  - Microsoft Forefront TMG 2010's filter when running on an external network card appears to prevent outbound packets from being captured. <http://blogx.co.uk/Comments.asp?Entry=876> and <http://ask.wireshark.org/questions/11714/only-inbound-traffic>.

  - [McAfee](/McAfee) VPN client version [McAfee](/McAfee)-VPN-Client-5.9.1.2911.exe prevents outbound packet from being captured. The older version, Stonesoft-IPsec-VPN-Client-5.4.3.2428.exe (before Stonesoft was purchased by [McAfee](/McAfee)) also interferes with Wireshark.

  - \<please append other known problems here\>

If you have any such problems, you may contact the [WinPcap](/WinPcap) team directly as the Wireshark developers can't do anything against it.

## Discussion

Is this a Win32 only problem, or are other OS/software combinations also problematic?

I have had this issue on Win64 --*Matthew*

I had this happen to me using Windows XP Professional, Version 2002, SP2 and SonicWALL Global VPN Clinet, Version 3.1.0.556. This happens with both the 0.10.13 and 0.10.14 downloads of Wireshark. I would be willing to help debug a solution ( <wvpowell@indesign-llc.com> ).

We (the Wireshark developers) have outsourced Windows NDIS expertise to the [WinPcap](/WinPcap) developers; you should contact them to see if they can work with you on this. --*Guy Harris*

---

Imported from https://wiki.wireshark.org/CaptureSetup/InterferingSoftware on 2020-08-11 23:11:54 UTC
