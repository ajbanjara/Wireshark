*This page is outdated and needs some more updates (labeling issues, templates etc).*
---

# Reporting Bugs

Despite our best efforts, bugs make it into Wireshark from time to time. If you find a bug, we want to know about it.

First verify that this bug is not already known and/or solved. You can do this by searching the [Wireshark Issue database](https://gitlab.com/wireshark/wireshark/issues). If the problem isn't listed there, please create a new issue.

## Where to Report Bugs

The preferred way of reporting bugs is through the [Wireshark Issues database](https://gitlab.com/wireshark/wireshark/issues). If that fails the [Wireshark developer mailing list](https://www.wireshark.org/mailman/listinfo/wireshark-dev) can act as an alternative.

## What to Report

### Your Platform

Wireshark runs on a multitude of operating systems, including Windows, MacOS X, Linux, \*BSD, Solaris, and others. It's important to let us know what platform(s) you're having trouble with. You can get the complete version and build information using one of two methods:

  - In Wireshark, select *Help-\>About Wireshark* from the main menu. You can copy the build information in the about box by simply clicking the *Copy to Clipboard* button and paste it into your report.

  - From the command line, run "tshark -v" or "wireshark -v". This will print the build information in your terminal window.

In either case the build information should look something like this:

```
3.6.1 (v3.6.1rc0-12-ge8e6f99e4fc1)

Compiled (64-bit) using GCC 11.2.0, with Qt 5.15.2, with libpcap, with POSIX
capabilities (Linux), with libnl 3, with GLib 2.70.1, with zlib 1.2.11, with Lua
5.2.4, with GnuTLS 3.7.2 and PKCS #11 support, with Gcrypt 1.9.4, with MIT
Kerberos, with MaxMind DB resolver, with nghttp2 1.43.0, with brotli, with LZ4,
with Zstandard, with Snappy, with libxml2 2.9.12, with libsmi 0.4.8, with
QtMultimedia, without automatic updates, with SpeexDSP (using system library),
without Minizip.

Running on Linux 5.15.0-2-amd64, with Intel(R) Core(TM) i5-4570 CPU @ 3.20GHz
(with SSE4.2), with 15949 MB of physical memory, with GLib 2.70.2, with zlib
1.2.11, with Qt 5.15.2, with libpcap 1.10.1 (with TPACKET_V3), with c-ares
1.18.1, with GnuTLS 3.7.2, with Gcrypt 1.9.4, with nghttp2 1.43.0, with brotli
1.0.9, with LZ4 1.9.3, with Zstandard 1.4.8, with libsmi 0.4.8, with light
display mode, without HiDPI, with LC_TYPE=en_US.UTF-8, binary plugins supported
(20 loaded).
```

### A Capture File

Including a capture file is important for two reasons: it helps us duplicate the problem and it lets us perform regression testing so that the problem doesn't reappear.

If Wireshark crashes while you're capturing, there should be a temporary capture file left over. To find this file, select *Help-\>About Wireshark-\>Folders* from the main menu. There should be a folder in the list called "Temp". Inside this folder should be a file called "wiresharkXXXX...". This is the temporary file.

### How to Duplicate the Problem

In your report you should describe the steps necessary to duplicate the problem. Also mention stuff like the kind of network you capture from or the type of capture file you read in. Any other specifics of the platform not covered by the default bug fields are also appreciated.

### Debugger Output

The backtrace output of a debugger (e.g. "bt" or "bt full" under gdb) is frequently helpful if the bug causes a crash. If possible add it as an attachment to the bug report, as pasting it into the text box makes the report bloated.

Sometimes it is also useful to have the output of Valgrind attached to a bug report, if the bug involves memory corruptions or leaks.

## Sensitive Information

If your bug report contains sensitive information you can keep the information private:

  - In Gitlab Issues you can mark the issue as "confidential". This makes the issue accessible to the reporter and Team members only. (Gitlab docs: [Confidential issues](https://docs.gitlab.com/ee/user/project/issues/confidential_issues.html))

  - Instead of sending the report to the [Wireshark development mailing list](https://www.wireshark.org/mailman/listinfo/wireshark-dev) (which is a public forum) you can send it to <security@wireshark.org>, which has limited distribution.

## Additional Information

Issues filed in the issue database are monitored by the developers and solved as time permits. It may be that additional information is required to find the cause of the problem. A comment will be added to the issue report requesting that information. These changes will be sent to the email address associated with your GitLab account,
so it is important to monitor that mailbox. Please respond to these requests to keep the investigation into the
problem going, even if you can't provide the information yourself.

## Reporting Viruses

If your AV software flags a problem with Wireshark or its installer, please open a bug with the following information:

  - The name of the virus or trojan

  - The **exact** product you're using, including manufacturer, product name, and version

  - The virus definition version or release date you're using

AV vendors won't talk to us if we don't have this information. (Half the time they won't talk to us if we **do** have it.) We're received several virus reports over the years. So far they've all been [FalsePositives](/FalsePositives).

---

Imported from https://wiki.wireshark.org/ReportingBugs on 2020-08-11 23:23:54 UTC
