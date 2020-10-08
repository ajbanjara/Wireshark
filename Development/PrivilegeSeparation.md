# Privilege Separation

One of the requirements for the 1.0 release was the addition of privilege separation. This feature minimizes the impact of any security-related bugs in Wireshark's dissector code.

In a discussion on the [development mailing list](http://thread.gmane.org/gmane.network.ethereal.devel/10752), the following roles were suggested:  
(Correct thread? [February 07, 2005](https://www.wireshark.org/lists/ethereal-dev/200502/) : [[Ethereal-dev] Priv sep in ethereal](https://www.wireshark.org/lists/ethereal-dev/200502/msg00195.html) )

| Role       | Privilege Level                        | Description                                                                                               |
| ---------- | -------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| Capture    | OS-dependent                           | Reads live capture data                                                                                   |
| Dissection | Non-privileged user, possibly chrooted | Dissects packet data. The majority of Wireshark's security-related bugs have been in its dissection code. |
| Filesystem | Normal user                            | Normal file-handling, e.g. reading and writing capture files, preferences, etc.                           |

At a minimum, the capture role should be separated out. Splitting off the dissection role would be *really* useful, however.

## Questions

1.  **Why are elevated privileges required in the first place?** On many operating systems, they aren't. BSD-derived systems provide a device (/dev/bpf) that lets you set capturing privileges based on file permissions. Solaris provides a similar mechanism via network devices (e.g. /dev/hme0), although you might still need root privileges to capture in promiscuous mode. Digital/Tru64 UNIX also has a mechanism to allow non-root users to capture packets. Two notable exceptions are Linux and Windows. Linux has capabilities (particularly CAP\_NET\_RAW), but this feature isn't in wide use. On Windows, it appears that Windows requires Administrator privileges for the initial capture after a reboot; see [the WinPcap FAQ item on that](http://www.winpcap.org/misc/faq.htm#Q-7). Subsequent captures (until the next reboot) won't require Administrator privileges. AIX might behave the way Windows does; it has /dev/bpf devices, which could probably be given the relevant permissions, but the BPF driver isn't loaded at boot time - it has to be loaded by libpcap, which requires root privileges to do that. In addition, the BPF devices don't persist across reboots, so a permission change would also have to be done by libpcap, which would create those devices. See the tcpdump man page for a detailed discussion of the privileges required for packet capture on various OSes.

2.  **How can this be done under Windows?** The MSDN article [Running with Special Privileges](http://msdn.microsoft.com/en-us/library/ms717802\(VS.85\).aspx) seems to be pointing in the right direction. The article [GUI-Based RunAs](http://www.codeguru.com/Cpp/misc/misc/system/article.php/c3749/) at CodeGuru might also help.

## Links

  - [OpenSSH privilege separation](http://www.citi.umich.edu/u/provos/ssh/privsep.html)

  - [Postfix architecture](http://www.postfix.org/OVERVIEW.html)

  - [Secure Programming for Linux and Unix HOWTO](http://www.tldp.org/HOWTO/Secure-Programs-HOWTO/index.html)

  - [This is the Linux kernel capabilities FAQ](http://ftp.kernel.org/pub/linux/libs/security/linux-privs/kernel-2.4/capfaq-0.2.txt)

  - <http://www.rstack.org/oudot/rmll/slides/8/privsep-en.pdf>

  - <http://www.ece.cmu.edu/~dawnsong/papers/privtrans.pdf>

  - <http://www.cs.berkeley.edu/~daw/papers/setuid-usenix02.pdf>

  - A [development list thread](http://marc.info/?l=ethereal-dev&m=106323363514496&w=4) about using Linux capabilities along with a [proposed patch](http://marc.info/?l=ethereal-dev&m=106474175731631&w=4)

## Discussion

For the capturing role, would it be beneficial to create a separate setuid-if-needed program? It would provide local capturing initially, but we might be able to add remote capture support (similar to [WinPcap](/WinPcap)'s rpcap feature) at a later date. That way, we wouldn't have to worry about elevating privileges in the main program. - *Gerald Combs*

How is privilege seperation typically done? Will we start Wireshark with a lower privilege and raise it if required, or start with a higher level and lower it for the tasks not requiring it? - *Ulf Lamping*

For the capturing part, we maybe could use the mechanism already implemented for "Update list of packets in real time", so a child task is always used for the capturing things. - *Ulf Lamping*

At least on UN\*X, that's how the separate setuid-if-needed program would work - it'd be given whatever privileges it needs, and it'd do all the capturing work. It should **not** have any GUI code; instead of having the packet counts and stop button dialog handled by the child process, as is now done for "Update list of packets in real time", the child process should send the packet counts to the parent process over the pipe (note that we might want to have the pipe be non-blocking, with a protocol that allows re-synchronization if data is lost, so that if the parent is too busy, for whatever reason, to read from the pipe, the child doesn't stall), and the parent process should handle the capture dialog.

That could simplify the capture code, as it wouldn't have to worry about "Update list of packets in real time" vs. non-real-time captures, and wouldn't have to worry about select() vs. timeouts.

That might be harder on Windows - I don't know how you'd send the equivalent of a signal to the child process to get it to stop capturing, and I'm not sure whether you can

1.  have something equivalent to non-blocking mode on a pipe;

2.  add a handle for the pipe to the set of event handles that the GLib or Windows main loop waits on. - *Guy Harris*

No problem with stopping the capturing child on windows, I've implemented that already months ago using [TerminateProcess](https://gitlab.com/wireshark/wireshark/-/commit/7b7f7e7f9ad0225f7ed927098a02e402fa2f5870) (ok, it's maybe not the best possible way, but it seems to be working quite well).

So how can you set the pipe into non-blocking mode (which functions to use, so I can read the docs a bit) and what exact effect will that have? Will that work on all supported unix versions as well?

The second part maybe even more tricky. The usual function in windows is `WaitForMultipleObjects` when I remember correct, but I really don't know how that interfere with GLib's event handling (it's main loop). - *Ulf Lamping*

`TerminateProcess()` causes the process to exit immediately - after perhaps having written part of the last packet, but not all of it, to the capture file (packets are written to a buffered stream using the "standard I/O library" routines, with the buffer being flushed when it fills, when the file is closed, or when `fflush()` is called - without offering it the chance to clean up and write out the last part of the packet to the capture file; see [the MSDN section on child processes](http://msdn.microsoft.com/en-us/library/ms686722\(VS.85\).aspx). That might cause errors when reading the capture file.

In UN\*X, the pipe can be set into non-blocking mode with `fcntl()`, by setting `O_NONBLOCK`. I'm not sure whether a UN\*X-style non-blocking mode exists on Windows.

Another possibility would be to use shared memory to share packet counts between the parent and child, with some form of wakeup - but you'd need some form of wakeup that can be handled in a window system event loop, unless you have the parent process wake up periodically and update the counts. That might be enough - if packets aren't coming in very fast, it probably won't waste many CPU cycles to have Wireshark wake up every second or so and update the display **if** the counts changed, and, if they **are** coming in very fast, the counts would probably change every second or so anyway.

GLib's main loop, on Windows, uses, as I remember, `MsgWaitForMultipleObjects()` if there are alternate event source specified; on UN\*X, it uses `poll()`.

One problem with a separate set-UID process to do capturing on UN\*X is that, to stop a capture, the main process wouldn't be able to send a signal to the child process, as it'd be running under a different user ID. It'd have to find some other way to deliver an asynchronous event, or send it an event over, for example, a pipe. Unfortunately, unless `select()` or `poll()` can be used in the main loop of the child process, it can't wait for both packets *and* events - and, unfortunately, one operating system that doesn't support `select()` or `poll()` on capture devices is Mac OS X 10.4, as the BPF devices are character devices and 10.4 doesn't support `select()` or `poll()` on *any* character devices.

Another possiblity would be to do the capture in the same process, but to have Wireshark, on platforms that support a way of relinquishing set-UID privileges and later reclaiming them (e.g., the saved set-user ID feature plus `seteuid()`), relinquish its set-UID privileges as the first thing it does in `main()` and then reclaim them when enumerating network interfaces or opening a capture device - and relinquish them as soon as it's enumerated the interfaces or opened the capture device, so that it's running with elevated privilege for as short a time as possible. This would also be useful in TShark, so *it* doesn't have to be split into multiple processes.

It appears that:

  - BSDs and Linux for the past several years, Digital UNIX 4.0 and later, SunOS 4.1.3 and later, SunOS 5.x, IRIX 6.5 (and possibly earlier), and AIX 4.3 and later support `seteuid()` and the saved set-user ID feature;

  - HP-UX 10.0 and later support `setresuid()` (which can be used to implement `seteuid()`) and the saved set-user ID feature;

so we might be able to do that on all UN\*X platforms we need to support. -*Guy Harris*

One thing doing the capture in the same process and running with elevated privileges only when opening capture devices **doesn't** provide is protection against a dissector problem allowing a malicious process to inject code that elevates the privilege of the process (e.g., with `seteuid()`). -*Guy Harris*

A post to -users included this OpenBSD Wireshark port that may be used as a starting point: <http://secure.lv/~nikns/stuff/ports/wireshark-0.99.5.tar> *--Stephen Fisher*

---

Imported from https://wiki.wireshark.org/Development/PrivilegeSeparation on 2020-08-11 23:13:00 UTC
