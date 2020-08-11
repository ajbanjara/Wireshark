Sebek \[ref 2\] is the most advanced and complex honeynet data capture tool. It is an open-source tool whose purpose is to capture from a honeypot as much information as possible of the attacker’s activities by intercepting specific system calls (syscalls) at the kernel level.

Sebek is based on a client-server architecture. The client is installed on the honeypots and the server is typically deployed on the Honeywall, that is, the honeynet gateway all the traffic entering and leaving the honeynet passes through. The Sebek client component uses techniques similar to those used by kernel-based rootkits. \[ref 3\] Sebek is implemented in the form of a Linux Kernel Module (LKM) on Linux, as an OS kernel driver on Windows, and as a kernel patch on the various \*BSD operating systems. The server module contains user-level tools that allow to gather and display the information captured and exported by the Sebek clients.

![http://www.securityfocus.com/images/infocus/Sebek\_v3\_packet\_header.png](http://www.securityfocus.com/images/infocus/Sebek_v3_packet_header.png "http://www.securityfocus.com/images/infocus/Sebek_v3_packet_header.png")

<span class="small">**Sebek protocol version 3 packet header.**</span>

Reference: <http://www.securityfocus.com/infocus/1855>

---

Imported from https://wiki.wireshark.org/Protocols/sebek on 2020-08-11 23:22:40 UTC
