# Packet Input

[[_TOC_]]

It's frequently asked how to get packet data into Wireshark, when the common ways are not really suitable.

For live capturing, **the [CaptureSetup](/CaptureSetup) page will give a comprehensive overview** about the ways that are already implemented.

The following page is about to choose the first steps to develop features not available yet.

The way to choose will depend if you just have some capture files in a format Wireshark don't understand, or if you really want to capture live network data in a way libpcap/WinPcap don't support.

## Loading an existing file (with an unknown file format)

So you have an external application (or a file of it), which produces network packet data in a file format Wireshark don't understand.

You could (in the preferred order):

  - change the application to produce Wireshark compatible file formats (e.g. [Development/LibpcapFileFormat](/Development/LibpcapFileFormat)); this might require adding a new link-layer type to libpcap (if you are doing this, ask <tcpdump-workers@tcpdump.org> to assign you a link-layer type value for it - do ***not*** arbitrarily choose a value)

  - add support for the file format to Wireshark's wiretap library (if you know the file format or are willing to do the reverse engineering work)

  - write an external converter which converts external file format to libpcap (but then, why not simply adding this feature to wiretap, so Wireshark can read the file directly)

It's pretty easy to add another file format to wiretap (you must know that file format, of course). Further information can be found in the README files in the [wiretap](http://anonsvn.wireshark.org/wireshark/trunk/wiretap/) directory of the Wireshark sources.

## Capturing from a physical network device

So you have some special hardware and want to get that captured data into Wireshark.

Unfortunately, this task will be almost certainly platform dependent.

### Improve the existing way (OS driver/libpcap/WinPCap)

The standard capturing will use the network card driver of the operating system and libpcap/WinPcap to actually capture the packet data.

Improving this is the preferred way to get things done, as all applications using libpcap/WinPcap will benefit from this effort.

For the common network hardware types, most (if not all) of the development work is already done. You'll find an overview at the [Supported Capture Media](/CaptureSetup/NetworkMedia) page. So the work left to do is to write a network card driver for the OS you are using (and probably for other OS's as well).

For network hardware, e.g. very special or brand new, you may have to do some more work.

Pros:

  - capture control from within Wireshark and other applications, like ntop (convenience)
  - capture filters available

Cons:

  - the release cycles are usually "slow"
  - the libpcap versions shipped with the various UNIX OS distributions may be pretty outdated

**So if you want to do it this way, you should contact the libpcap/WinPcap teams about your project, as this is not the subject of the Wireshark team.**

### Write your own capture application

If you don't want to use the standard way, you could write own capture application from scratch.

Pros:

  - possible higher performance compared to generic libpcap/WinPcap implementation (if done properly)
  - easily add special features not already part of libpcap/WinPcap/Wireshark (e.g.: triggers/alarms)
  - can use proprietary mechanisms (e.g. libraries) providing the capture data

Cons:

  - probably a lot of work
  - still need to implement a OS dependent driver (if not already available from somewhere else)
  - no capture control from within Wireshark and other applications (inconvenience)
  - no capture filters (until implemented)
  - reinvent the wheel
  - risk of facing ugly implementation problems (probably already solved in libpcap)

This might be an option if you already have some proprietary mechanism (e.g. a vendor based library) to get the capture data.

## Capturing from a pipe

If you know how, you can do a lot of strange things using pipes :smiley:

See the [CaptureSetup](/CaptureSetup) page for details.

---

Imported from https://wiki.wireshark.org/Development/PacketInput on 2020-08-11 23:12:57 UTC
