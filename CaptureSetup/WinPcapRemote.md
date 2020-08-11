# WinPcapRemote

:warning: **The remote capture feature of [WinPcap](/WinPcap) 3.1 is currently not working together with Wireshark\!\!\!** :warning:

This page is to collect information experienced while trying to bring this feature to life. This feature will not work with [WinPcap](/WinPcap) 3.1; it has been tested with with Ethereal 0.10.13 + [WinPcap](/WinPcap) 4.0 alpha 1 using a Cisco MDS 9216 switch's fcanalyzer as the the remote capture device, and does work. It should also work with the current version of Wireshark and [WinPcap](/WinPcap) 4.x.

If you really need it, you may try [analyzer](http://gd.tuwien.ac.at/.vhost/analyzer.polito.it/default.htm) to do the remote capture. This analyzer has the same origins as [WinPcap](/WinPcap) itself, so it might work better than Wireshark for this feature (for now). Then you can take the capture files and use Wireshark to analyze them ...

You'll find additional info at the related [WinPcap](/WinPcap) page: <http://www.winpcap.org/docs/docs_40_2/html/group__remote.html> or the link at the bottom of this page.

The following would be the easiest setup to bring Wireshark to work remotely.

## Daemon (remote) Setup

The daemon is available for both Win32 and Linux. I'll only explain the Win32 one, the Linux one should work similar.

First install [WinPcap](/WinPcap) on the remote machine. After that, the daemon can be found at:

C:\\Program Files\\WinPcap\\rpcapd.exe

The easiest is to start the deamon from the command line now:

rpcapd -n

The -n will turn off authentication, as Wireshark can't use it and the daemon won't work together with Wireshark otherwise.

There is an option to run the daemon as a Windows service, but I didn't try that.

## Client (Wireshark) Setup

The client part will only work on Win32\!

Inside Wireshark you would simply type something like the following into the *Interface* field of the *Capture Options* dialog box:

rpcap://\[1.2.3.4\]/\\Device\\NPF\_{12345678-1234-1234-1234-1234567890AB}

Where *1.2.3.4* is the IP address of the remote machine and *\\Device\\NPF\_{12345678-1234-1234-1234-1234567890AB}* is the interface to capture from (would be something like *eth0* on linux).

Well, where to get that interface name from? I've got that name from an already installed Wireshark on the remote machine.

## Filter rpcap traffic

If you capture on the same interface where the rpcap protocol is used to transfer the capture data between the daemon and the client, you'll soon (\~100 packets) get a \*lot\* of traffic as the deamon will capture it's own traffic though create even more traffic ...

Without deeply thinking about it, I don't see an easy way to set a correct capture filter, as the port used to transfer the rpcap data will be choosen randomly?\!? (the port seems to be negotiated while establishing - we might ask the [WinPcap](/WinPcap) about this).

## Why it currently doesn't work with WinPcap 3.1 :-(

Doing all this, you'll get a running capture. Unfortunately, no packets are captured.

The following is developer related. I've done some deep debugging and some more testing on this. The problem is the following:

We use the function pcap\_dispatch() to get new packets from [WinPcap](/WinPcap). When we call this function, a callback is done for every packet captured. The callback function will then process the packet (e.g. save it to the capture file).

When doing the same from a "remote interface", the dispatch function \*seems\* to be working as expected (e.g. returns that it had processed some packets), but just don't call the callback function :frowning: The underlying problem is probably that the [WinPcap](/WinPcap) "read" routine for remote captures doesn't tell the remote machine to start capturing; instead, that's done inside pcap\_loop() and pcap\_next\_ex(), but not pcap\_dispatch(). pcap\_loop() and pcap\_dispatch() both call the [WinPcap](/WinPcap) "read" routine; if the code to tell the remote machine to start capturing were moved from pcap\_loop() into the "read" routine, both pcap\_loop() and pcap\_dispatch() would work (and pcap\_loop() wouldn't have to know or care whether the capture was remote).

Although the pcap\_dispatch() function is marked as deprecated (in the API documentation), I would consider this to be a bug in [WinPcap](/WinPcap) ...

Doing a quick and very dirty hack, replacing the pcap\_dispatch() by the pcap\_next\_ex() function (which is now recommended by the [WinPcap](/WinPcap) API documentation; however, pcap\_dispatch() might work a bit better in Wireshark, so that it can process multiple packets if multiple packets are delivered in a single read, and pcap\_dispatch() is not considered a deprecated API in libpcap, and will not be removed as that would break source and binary compatibility), the remote feature seems to be working :smiley:

**This is fixed in [WinPcap](/WinPcap) 4.0**.

## Step by Step solution

One of the guys at Corvus Technologies has gathered all the information and instructions on how to get this working into one document. There is also an installer there of a working version.

Instructions: <http://www.corvus.net/documents/wireshark-remote>

Installer: <http://www.corvus.net/tools/> MD5:6095e0ec5e7c52b7feafad27201ef93a

Also, [here is a link](http://www.wireshark.org/lists/wireshark-dev/200507/msg00501.html) to a discussion on the Wireshark-Dev mailing list of this issue and the workaround/kludge Corvus took to enable remote packet capture.

A [bugzilla entry](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2809) details the steps involved in building support for the rpcap protocol on Linux.

---

Imported from https://wiki.wireshark.org/CaptureSetup/WinPcapRemote on 2020-08-11 23:12:05 UTC
