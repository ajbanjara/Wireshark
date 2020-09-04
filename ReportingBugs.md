This site is outdated and needs some more updates (labeling issues, templates etc).
---

# Reporting Bugs

Despite our best efforts, bugs make it into Wireshark from time to time. If you find a bug, we want to know about it.

First verify that this bug is not already known and/or solved. You can do this by searching the [Wireshark Issue database](https://gitlab.com/wireshark/wireshark/issues). If the problem isn't listed there, please create a new issue.

## Where to Report Bugs

The preferred way of reporting bugs is through the [Wireshark Issues database](https://https://gitlab.com/wireshark/wireshark/issues). If that fails the [Wireshark developer mailing list](https://www.wireshark.org/mailman/listinfo/wireshark-dev) can act as an alternative.

## What to Report

### Your Platform

Wireshark runs on a multitude of operating systems, including Windows, MacOS X, Linux, \*BSD, Solaris, and others. It's important to let us know what platform(s) you're having trouble with. You can get the complete version and build information using one of two methods:

  - In Wireshark, select *Help-\>About Wireshark* from the main menu. You can copy the build information in the about box and paste it into your report.

  - From the command line, run "tshark -v" or "wireshark -v". This will print the build information in your terminal window.

In either case the build information should look something like this:

```
Wireshark 3.3.0 (v3.3.0rc0-1948-g67d3772d1b12)

Copyright 1998-2020 Gerald Combs <gerald@wireshark.org> and contributors.
License GPLv2+: GNU GPL version 2 or later <https://www.gnu.org/licenses/gpl-2.0.html>
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Compiled (64-bit) with Qt 5.11.3, with libpcap, with POSIX capabilities (Linux),
with libnl 3, with GLib 2.58.3, with zlib 1.2.11, with SMI 0.4.8, with c-ares
1.14.0, with Lua 5.2.4, with GnuTLS 3.6.7 and PKCS #11 support, with Gcrypt
1.8.4, with MIT Kerberos, with MaxMind DB resolver, with nghttp2 1.36.0, with
brotli, with LZ4, with Zstandard, with Snappy, with libxml2 2.9.4, with
QtMultimedia, without automatic updates, with SpeexDSP (using system library).

Running on Linux 4.19.0-8-amd64, with Intel(R) Xeon(R) CPU E5-2697 v3 @ 2.60GHz
(with SSE4.2), with 16042 MB of physical memory, with locale en_US.UTF-8, with
libpcap version 1.8.1, with GnuTLS 3.6.7, with Gcrypt 1.8.4, with brotli 1.0.7,
with zlib 1.2.11, binary plugins supported (0 loaded).

Built using clang 4.2.1 Compatible Clang 7.0.1 (tags/RELEASE_701/final).
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

  - In Gitlab Issues you can mark the issue as "Confidentiality". This makes the issue accessible to the reported and Team members only.

  - Instead of sending the report to the [Wireshark development mailing list](https://www.wireshark.org/mailman/listinfo/wireshark-dev) (which is a public forum) you can send it to <security@wireshark.org>, which has limited distribution.

## Additional Information

Issues filed in the issue database are monitored by the developers and solved as time permits. It may be that additional information is required to find the cause of the problem. A comment will be added to the issue report requesting that information, and the issues's state will be labeled as #TBD#. These changes will be sent to the email address that you've provided when filing the bug report, so it is important to monitor that mailbox.

Please respond to these requests to keep the investigation into the problem going, even if you can't provide the information yourself. Once you have provided the information, you may set the bug's state back to its previous value (either UNCONFIRMED or CONFIRMED). If the requested information isn't provided within a certain amount of time the only option is to close the bug report. This window depends on the severity of the problem, as follows:

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Severity</strong></p></td>
<td><p><strong>Add. Info requests</strong></p></td>
<td><p><strong>closed after</strong></p></td>
</tr>
<tr class="even">
<td><p>Blocker</p></td>
<td><p>N/A</p></td>
<td><p>when solved</p></td>
</tr>
<tr class="odd">
<td><p>Critical</p></td>
<td><p>N/A</p></td>
<td><p>when solved</p></td>
</tr>
<tr class="even">
<td><p>Major</p></td>
<td><p>Three</p></td>
<td><p>3 months</p></td>
</tr>
<tr class="odd">
<td><p>Normal</p></td>
<td><p>Two</p></td>
<td><p>2 months</p></td>
</tr>
<tr class="even">
<td><p>Trivial</p></td>
<td><p>One</p></td>
<td><p>1 month</p></td>
</tr>
<tr class="odd">
<td><p>Enhance</p></td>
<td><p>One</p></td>
<td><p>1 month</p></td>
</tr>
</tbody>
</table>

</div>

## Reporting Viruses

If your AV software flags a problem with Wireshark or its installer, please open a bug with the following information:

  - The name of the virus or trojan

  - The **exact** product you're using, including manufacturer, product name, and version

  - The virus definition version or release date you're using

AV vendors won't talk to us if we don't have this information. (Half the time they won't talk to us if we **do** have it.) We're received several virus reports over the years. So far they've all been [FalsePositives](/FalsePositives).

---

Imported from https://wiki.wireshark.org/ReportingBugs on 2020-08-11 23:23:54 UTC
