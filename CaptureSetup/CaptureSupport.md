# Platform-Specific information about adding packet capture support

You will need to make sure the machine on which you're running is configured to support packet capture, e.g. you might need a capture driver installed. The way this is done differs from operating system to operating system.

## Linux

On Linux, you need to have "packet socket" support enabled in your kernel. Your distribution might enable this by default in the kernel; most recent versions of distributions do so. If it does not, see the "Packet socket" item in the Linux "Configure.help" file.

## BSD (including macOS)

On various BSDs, you need to have BPF support enabled in your kernel. In macOS, and in newer versions of at least some free-software BSDs, it's enabled by default. In other BSDs, see the documentation for your system for information on how to enable BPF support.

## SunOS (Solaris)

In SunOS 3.x, 4.x, and 5.x, packet capture support is present by default.

## HP-UX

In HP-UX 9.x, 10,x, and 11.x, packet capture support is present by default. (XXX - true of 9.x?)

## Digital/Tru64 UNIX

On DEC OSF/1, Digital UNIX, or Tru64 UNIX, you need to have packet filtering support in your kernel; the **doconfig** command will allow you to configure and build a new kernel with that option.

## IRIX

On Irix, packet capture support is present by default.

## Windows

On Windows, you need to have [NPcap](/NPcap) or the older [WinPcap](/WinPcap) installed in order to capture network traffic.

---

Imported from https://wiki.wireshark.org/CaptureSetup/CaptureSupport on 2020-08-11 23:11:51 UTC
