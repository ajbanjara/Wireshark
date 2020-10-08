# KnownBugs - OutOfMemory

Wireshark will terminate if it runs out of memory and there's currently no solution (but some workarounds) to this.

We know this is a serious problem, but we can't do a lot about it (at least with the manpower we have). We would have to use a different GUI/platform toolkit and throw away 2/3 of the current Wireshark GUI code to completely solve this :frowning: . However, a lot can be done to improve this, although there's a lot of work involved.

## Memory Usage

Wireshark uses memory to store packet meta data (e.g. conversation and fragmentation related data) and to display this info on the screen.

How much memory is actually used depends on:

  - the number of packets captured (well, depending on the capture duration and the network load on the line)
  - the kind of packets captured (small/large packets, some packet types will lead to much more memory usage than others)
  - the preference settings, e.g. the "TCP desegmentation" setting

In my experience (and with the capture files and Preference settings I'm usually working with), I need memory about ten times the actual capture file size. But again, this will largely depend on the things noted above.

The [Performance](/Performance) page gives some hints how to reduce memory usage.

## Why memory consumption is not a memory leak\!

While dissecting packets, Wireshark needs a growing amount of memory for mainly two reasons:

  - information in the packet list
  - information that is kept in order to support more advanced protocol analysis, such as:
      - conversation information so that dissection of a given packet can depend on prior packets
      - reassembly of segmented packets
      - sequence number analysis for TCP
      - (there are probably many more such examples)

Wireshark cannot throw away this information as it might be required later; Wireshark keeps this information in memory until the capture file is closed.

So the more packets you load, the more memory you will need.

## Work Around(s)

If you encounter problems that Wireshark is running out of memory, you can do the following:

  - Wireshark will use all memory it can get, this includes physical and virtual memory (swap disc/file space). You may increase the memory available, physical and/or swap disc/file size. However, swap space is *much* slower than physical memory.

  - Per-process resource limits may be in place. For example, 32-bit processes will, on most OS, only be able to use up to 4 Gbytes of memory, regardless of how much memory (including swap) the system has (see also some Windows-specific info on this below). Another example is FreeBSD 6.x which has a default limit of 524288KB on the data size of a single program running in memory. See the limits(1) man page for more information on viewing and changing this.

  - While capturing: If you're not doing an "Update list of packets in real time" capture, it shouldn't consume memory as it captures - although it \*will\* consume memory when you stop the capture and it reads it in, so that ultimately won't help. If you're just capturing data for later processing, you might try using dumpcap (although you might have to split the resulting file in order to read it into Wireshark, as per the next item).

  - Split the capture file into several smaller ones. This can be done while capturing using the "Use multiple files" setting in the capture options, or using the [editcap](http://www.wireshark.org/docs/man-pages/editcap.html) command line tool. Switching to a new file while capturing won't release *all memory* (some memory leaks currently remain), but it will release *a lot* of it.

  - For processing multiple hours and/or days of data, refer to the attached document detailing an approach for using Wireshark to produce Network-Usage Baselines on multiple GBs of data. This was developed in June 2007 while performing network analysis on data which was captured using Wireshark. [Using Wireshark to Create Network-Usage Baselines.pdf](uploads/__moin_import__/attachments/KnownBugs/OutOfMemory/Using-Wireshark-to-Create-Network-Usage-Baselines.pdf) (10 June 2007)

### Other tools

If Wireshark is running out of memory, that probably means that you're letting it run for a very long time or you're analyzing very large capture files. You may find that another tool does what you want better than Wireshark. Use [dumpcap](http://www.wireshark.org/docs/man-pages/dumpcap.html) for long term capturing, it's intended for this purpose, or see [Tools](/Tools) for other tools which may be more suitable for the task.

## Memory limitations on Microsoft Windows

The following is a summary of information from the MSDN: [Large Memory Support](http://msdn.microsoft.com/en-us/library/windows/desktop/aa366718%28v=vs.85%29.aspx) and related pages.

### Physical memory

Slightly simplified, the maximum physical memory windows supports:

| Windows Version         | 32 bit  | 64 bit  |
| ----------------------- | ------- | ------- |
| XP Pro                  | 4GB     | 128GB   |
| Vista Business          | 4GB     | 128GB   |
| Various Server Versions | 4-128GB | 4GB-1TB |

Detailed information about the specific limits can be found at: [Memory Limits for Windows Releases](http://msdn.microsoft.com/en-us/library/windows/desktop/aa366778%28v=vs.85%29.aspx)

More physical memory than the above limits will be ignored by windows.

### Virtual memory

Wireshark can be compiled as either a 32- or 64-bit application on Windows. The maximum amount of virtual memory Wireshark uses depends on several things:

  - 32-bit application
      - 32 bit Windows:
          - 2GB RAM
          - 3GB RAM with boot.ini /3GB switch (Wireshark Git commit 9fb143d508442a2b41f1597c9bfc377578f33d0f or later required)
      - 64 bit Windows:
          - 2GB RAM
          - 4GB RAM (Wireshark Git commit 9fb143d508442a2b41f1597c9bfc377578f33d0f or later required)
  - 64-bit application (of course only on 64-bit Windows):
      - 8 TB RAM

Traditionally, a single program on windows can use up to 2GB RAM (the rest is used for Windows internal purposes). Since Wireshark Git commit 9fb143d508442a2b41f1597c9bfc377578f33d0f (first released in 0.99.5) Wireshark/Tshark is linked with the /LARGEADDRESSAWARE switch that enables usage of up to 3GB/4GB RAM as described above.

XXX - I couldn't find any information about the maximum total amount of virtual memory for ALL processes in a system.

### Enable the /3GB switch

For various Windows Server versions, XP Pro and Vista, the usage of 3GB for a single process can be activated by a change in the boot.ini file:

  - Remove file attributes of the file c:\\boot.ini: c:\\\>attrib -s -h boot.ini

  - Edit boot.ini and append /3GB to the appropriate entry under \[operating systems\]

  - Add file attributes to the file c:\\boot.ini again: c:\\\>attrib +s +h boot.ini

  - Reboot

Now you should be able to use up to 3GB virtual memory with Wireshark.

Details at: [4-Gigabyte RAM Tuning](http://msdn.microsoft.com/en-us/library/windows/desktop/bb613473%28v=vs.85%29.aspx)

## Background on termination when out of memory

Memory allocation is done using glib's g\_malloc()/g\_free() implementation. Unlike the common malloc() function, g\_malloc() will terminate the program if it's runnning out of memory.

Many of the GLib (and GTK+) facilities that Wireshark uses, such as GHashTables, use g\_malloc() too. So even if Wireshark were to use a different memory allocator, that wouldn't help if it continued to use those facilities.

Some effort is currently done to eliminate the usage of g\_malloc() from the dissector code. Removing this from the GTK+ code will be almost impossible. However, most of the major consumers of memory are not in the GUI, so if we eliminate the use of GLib facilities that use g\_malloc() (and make sure that we check for memory allocator failures, or use a memory allocator that throws an exception on failure and catch the exception and clean up\!), that'll probably help somewhat.

## External links

  - [The notorious Wireshark “Out of Memory” problem](http://blog.packet-foo.com/2013/05/the-notorious-wireshark-out-of-memory-problem/), by Jasper Bongertz

---

Imported from https://wiki.wireshark.org/KnownBugs/OutOfMemory on 2020-08-11 23:15:52 UTC
