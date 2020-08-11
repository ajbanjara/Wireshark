# How To Set Up a Capture

The experience capturing your first packets can range from "it simply works" to "very strange problems". To avoid annoyances, the following gives you a step-by-step guide through this process.

The steps in this guide depend on each other to avoid combinations of problems which are hard to track down as a whole.

For this reason it's a very good idea to **follow this guide literally step-by-step** (don't start to read in the middle)\!\!\!

[[_TOC_]]

## Step 1: Are you allowed to do this?

**In this step**: Make sure you're allowed to do what you're going to do\!

  - :warning: **Ensure that you are allowed to capture packets from the network you are working on\! For example, corporate policies or applicable law might prevent you from capturing on the network you're using\!**

  - :warning: **If you have to change network cabling to start a capture, ensure that you are allowed to do so\! Network administrators and other people are usually not amused with re-arrangements to "their" network.**

## Step 2: General Setup

*Make sure you've thought about step 1\!*

**In this step**: Setup the machine's configuration to be able and allowed to capture.

  - **[/CapturePrivileges](/CaptureSetup/CapturePrivileges)** - you must have sufficient privileges to capture packets, e.g. special privileges allowing capturing as a normal user (preferred) or root / Administrator privileges

  - **[/CaptureSupport](/CaptureSetup/CaptureSupport)** - your operating system must support packet capturing, e.g. capture support is enabled / a capture driver is installed

  - **[User's Guide about Time Zones](http://www.wireshark.org/docs/wsug_html_chunked/ChAdvTimezones.html)** your computer's time and time zone settings should be correct, so the time stamps captured are meaningful

## Step 3: Capture traffic "sent to" and "sent from" your local machine

*Make sure you've finished step 2\!*

**In this step**: Capturing "your own local traffic" is the easiest way to successfully capture your first traffic.

The traffic to and from your local machine is obviously available independent of your network topology, so you don't need to worry about the topology for now.

Choose the right interface to capture from (see [/NetworkInterfaces](/CaptureSetup/NetworkInterfaces)) and start a capture. To avoid any side effects, don't use any shiny features like capture filters or multiple files for now.

At least after stopping the capture you should see some network traffic now\!

Have a look at the captured packets and make sure you have captured both incoming **and** outgoing traffic before going to the next step\!

**Troubleshooting**:

  - **[/NetworkInterfaces](/CaptureSetup/NetworkInterfaces)** - make sure that you've selected the right interface

  - **[/NetworkMedia](/CaptureSetup/NetworkMedia)** - there might be network media ([/Ethernet](/CaptureSetup/Ethernet), [/PPP](/CaptureSetup/PPP), ...) specific limitations

  - **Promiscuous mode** - try both on or off, whatever works

  - **[/InterferingSoftware](/CaptureSetup/InterferingSoftware)** - low level networking software (e.g. VPN / (personal) firewall software) may cause trouble

  - **[/Offloading](/CaptureSetup/Offloading)** - how your NIC might skew your capture

  - **no traffic** - make sure you don't capture on a "silent" network with no traffic on it :wink: (if you really don't have any traffic: using an internet radio is a simple traffic generator)

  - **[Performance](/Performance)** - what you can do if packet drops occur

If you still experience a problem after checking the above you may try to figure out if it's a Wireshark or a driver problem. Try to capture using [TcpDump](/TcpDump) / [WinDump](/WinDump) - if that's working, it's a Wireshark problem - if not it's related to [libpcap](/libpcap) / [WinPcap](/WinPcap) or the network card driver.

## Step 4: Capture traffic destined for machines other than your own

*Make sure you've finished step 3 successfully\!*

**In this step**: Capture traffic that is not intended for your local machine.

Make sure you capture from a location in the network where all relevant traffic will pass through:

  - **[/NetworkTopology](/CaptureSetup/NetworkTopology)** - choose the right place in your network topology in order to get the required network traffic.

  - **[/NetworkMedia](/CaptureSetup/NetworkMedia)** - there might be network media ([/Ethernet](/CaptureSetup/Ethernet), [/PPP](/CaptureSetup/PPP), ...) specific limitations

  - **Promiscuous mode** - must be switched on (this may not work with some WLAN cards on Win32\!)

## Step 5: Capture traffic using a remote machine

*Make sure you've finished step 4 successfully\!*

**In this step**: Don't use your local machine to capture traffic as in the previous steps but use a remote machine to do so.

Remote Capturing is currently very limited:

  - **[/Pipes](/CaptureSetup/Pipes)** - using a UNIX pipe and use a different tool to capture from

  - **[/WinPcapRemote](/CaptureSetup/WinPcapRemote)** - using \[[WinPcap](/WinPcap)\]'s remote capturing feature (rpcapd)

  - **RMON** - use SNMP's RMON to capture - currently not supported (["Remote Packet Capture Using RMON"](http://docstore.mik.ua/orelly/networking_2ndEd/tshoot/ch08_05.htm) explains why it doesn't work well)

Of course, you can use Wireshark installed on a remote machine in combination with a remote control software (e.g. VNC, Windows Remote Desktop, ...).

XXX - explain special capture filter strings relevant to remote capturing\!

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

  - [Capturing IrDA Traffic](/CaptureSetup/IrDA)

  - [Capturing on Cisco HDLC Networks](/CaptureSetup/CiscoHDLC)

  - [Capturing SS7 Traffic](/CaptureSetup/SS7)

-----

---

Imported from https://wiki.wireshark.org/CaptureSetup on 2020-08-11 23:11:48 UTC
