# Performance

Some tips to fine tune Wireshark's performance.

There are two main topics where performance currently is an issue: large capture files and packet drops while capturing.

## Working with large capture files

If you have a large capture file e.g. \> 100MB, Wireshark will become slow while loading, filtering and alike actions.

There are some things you can do, but unfortunately this will remove some decoding comfort:

  - Disable Coloring Rules: this will significantly increase performance. To disable these rules, use *View-\>Colorize Packet List*. You could also delete all coloring rules or rename the coloring rules file.

  - Disable Network Layer (hostname) DNS lookups under View-\>Name Resolution can help speed things up

  - On MacOS X, disabling Transport Layer lookups under View-\>Name Resolution can help speed things up.

Disabling some preference settings may save you a lot of memory consumption. Be aware that these features are probably required to detect the packets properly that you want to capture. So maybe you miss packets that are missinterpreted.

You can check if that's the case, by loading a capture file, setting a display filter of the packet types in question and see if the number of displayed packets are the same with and without these settings. You may need to reload the file after changing the settings (and don't forget to press the "Save" button :-).

Some good preference setting candidates:

  - IP/Reassembled fragmented IP datagrams
  - TCP/Allow subdissectors to reassemble TCP streams

**Display system overview**

If the above hints didn't help, you may need to advance your machine. To do this, the following gives some insights which parts are worth looking at.

A simplified look at the display system:

harddisk -\> packet dissection -\> display filter / coloring rule -\> display

  - harddisk - uncritical
  - packet dissection - fine tune the Preferences
  - display filter
  - coloring rule
  - display - uncritical

The things that may help: Add more physical RAM and use a faster CPU (multi core CPU's won't help a lot, the dissection is done in a single task)

## Packet drops while capturing

After you've finished a capture, you've noticed packet drops, indicated by the statusbar counter.

What has happened? Not all packets coming in from the network could be saved into the capture file. As your machine was too slow to handle the incoming packet rate some packets had to be discarded.

General considerations:

  - stop other programs running on that machine, to remove system load

  - buy a bigger, faster machine :wink:

  - as both Wireshark and TShark are not optimized for speed on specific operating systems, use a "capture only" program to capture packets and use Wireshark/TShark later to do the analysis. Since version 0.10.15 you can use dumpcap for this (or e.g. [TcpDump](/TcpDump) / [WinDump](/WinDump))

Optimized Wireshark settings:

  - don't use *Update list of packets in real time* in the capture options dialog, to remove system load

  - Increase the *Buffer size* in the capture options dialog (set it to a reasonable value e.g. 20MB, depending on your systems memory size)(depends on OS and libpcap version)

  - Set a snap length (MTU + 18). Depending on your OS and libpcap version this might give a good effect.

  - don't use *read filters* by not using the -R command line option; this would need processing time and a lot of memory

  - don't use *capture filters* as they need processing time (but if you're not interested in all packets, a capture filter that selects only the packets in which you're interested could *reduce* overall processing time, as packets can be discarded by the capture filter before being written to a capture file - and, on systems with in-kernel capture filtering, they'd be discarded before they're even copied up to Wireshark from the kernel). On linus kernel versions \>= 3.0 you can try writting "1" to /proc/sys/net/core/bpf\_jit\_enable

**Capturing system overview**

  - Put the /tmp dir on a RAM disk.

If the above hints didn't help, you may need to advance your machine. To do this, the following gives some insights which parts are worth looking at.

A simplified look at the capturing system:

network card -\> libpcap(capture filter) -\> capture tool -\> harddisk

  - network card - some cards need a lot more CPU power than others
  - libpcap - an optional capture filter will need additional CPU power
  - capture tool - won't do much processing (get the packets from libpcap and write it to the harddisk)
  - harddisk - as fast as possible, a fast RAID might be preferrable
  - CPU - the task processed is a single task, a multi-core CPU won't help a lot

The amount of memory isn't really critical for capturing.

Of course, the system itself should be reasonable configured, e.g. a very fast CPU doesn't make real sense with only very limited RAM.

---

Imported from https://wiki.wireshark.org/Performance on 2020-08-11 23:17:53 UTC
