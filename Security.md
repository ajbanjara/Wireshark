# Security

This page collects information about the secure usage of Wireshark.

[[_TOC_]]

# Introduction

In recent time, Wireshark was often mentioned in security bulletins about having several security related bugs fixed. This is caused by code reviews of individuals and interested parties and by the effort of the Wireshark team to automatically find bugs. It is expected that this will continue - at least in the near future.

Because there is always the potential for Wireshark exploits, special care should be taken to avoid security related problems while running Wireshark or at least to reduce the possible impact.

Whether this is a problem for yourself will depend on the situation: A small SoHo network will probably be less critical compared to a company's 24/7 mission critical web server, capturing data from an internal network is probably more secure than capturing internet traffic, ...

It's not the intention of this page to discuss the opinion of certain persons that the usage of Wireshark itself is "insecure", because you can see network data like transported passwords. BTW: Security through obscurity just doesn't work.

# Why is Wireshark so buggy?

Well, it's not that buggy as it may seem. Recent automated code inspections showed a much lower defect rate compared to other known open source programs (the defect rate of closed source programs is not known but may be even higher). Unfortunately most bugs found in the Wireshark code are security related so they are mentioned in the security bulletins.

In most programs, only small sections of code work directly with "outside" data (e.g. from a file or network). By focusing on these small sections during code reviews, developers can eliminate most security problems.

Wireshark is different. The vast majority of its code base deals directly with data from the "outside", so a code review on the relevant parts would cover most if not all of the complete Wireshark code. Running "wc -l epan/dissectors/\*.\[ch\]" returns over 2,500,000 lines of code that's expected to handle fresh-off-the-wire data\! Auditing all of this would be a **huge** effort, and may not guarantee success.

Wireshark is implemented in ANSI C, which is vulnerable to security problems like buffer overflows (compared to more securely designed languages like Java or C\#). ANSI C is used for several reasons; the main reason is performance, as Wireshark is often used to work with huge amounts of data. Another reason is that implementations of other languages might not be as commonly available on all the platforms Wireshark supports.

To make things worse, the Wireshark development is done in an "experimental character" as new protocols are added all the time and existing ones are greatly improved, the main reason that Wireshark has gained such a wide support of protocols. The developers providing code to Wireshark (literally hundreds) have very divergent programming experience, from advanced networking specialists to novice programmers, making it more likely that new bugs get in.

As a result, Wireshark is more vulnerable to attacks than most other programs.

# Which user actions are critical?

Having a bug in the GUI code (e.g. a crash while printing) can be quite annoying. However, these bugs are usually not security related as they cannot be triggered from the outside.

The most critical action is analyzing packets when they are read in. The following actions will call into the myriad lines of dissector code with data coming from the "outside":

  - Open a capture file

  - If "Update list of packets in real time" is used while capturing

  - if "Update list of packets in real time" is *not* used after capture stops

# Administrator/root account not required\!

Many Wireshark users think that Wireshark requires a root/Administrator account to work with.

That's not a good idea, as using a root account makes any exploit far more dangerous: a successful exploit will have immediate control of the whole system, compromising it completely.

First of all, most Wireshark functions can always be used with a (probably very limited) user account. In particular, the protocol dissectors which have shown most of the security related bugs do not need a root account\!

Only capturing (and gathering capture interface information) may require a root account, but even that can usually be "circumvented", see [CaptureSetup/CapturePrivileges](/CaptureSetup/CapturePrivileges) for details how to do so.

# Protect Yourself\!

There are some things you can do:

  - **Always update to the latest Wireshark version** available as bugs are fixed frequently. You can join the announce mailing list to stay informed about new versions.

  - **Don't run Wireshark as root/Administrator\!** See [CaptureSetup/CapturePrivileges](/CaptureSetup/CapturePrivileges) for details how to do so.

  - **Analyze capture files in an uncritical environment.** You may create a special (limited) user account or even use a dedicated machine for this task.

  - Use a small capture tool which is less likely affected by security bugs, e.g.: tcpdump or dumpcap) and transfer the capture file to the uncritical environment mentioned above

  - The [SampleCaptures](/SampleCaptures) wiki page collects capture files for automated tests. If you have a capture file with an undecoded protocol help the developers and attach the file to that page.

# Help is on the way\!

The Wireshark developers agree that the current situation isn't actually satisfying.

Current effort is spent in several ways to improve Wireshark in that regard:

  - Automated tests uncover previously unknown bugs
  - code reviews take place
  - potential unsecure functions are removed from the code
  - ... and many other things

You'll find more information about that effort at the [Development/Security](/Development/Security) page.

As it's a lot of effort involved in the above tasks, it's unpredictable when they'll be finished (if ever).

---

Imported from https://wiki.wireshark.org/Security on 2020-08-11 23:24:32 UTC
