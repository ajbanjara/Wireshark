# Reporting Bugs

Despite our best efforts, bugs make it into Wireshark from time to time. If you find a bug, we want to know about it.

First verify that this bug is not already known and/or solved. You can do this by searching the [Wireshark bug database](http://bugs.wireshark.org/). If the problem isn't listed there, please file a bug report.

## Where to Report Bugs

The preferred way of reporting bugs is through the [Wireshark bug database](https://bugs.wireshark.org/). If that fails the [Wireshark developer mailing list](https://www.wireshark.org/mailman/listinfo/wireshark-dev) can act as an alternative.

## What to Report

### Your Platform

Wireshark runs on a multitude of operating systems, including Windows, MacOS X, Linux, \*BSD, Solaris, and others. It's important to let us know what platform(s) you're having trouble with. You can get the complete version and build information using one of two methods:

  - In Wireshark, select *Help-\>About Wireshark* from the main menu. You can copy the build information in the about box and paste it into your report.

  - From the command line, run "tshark -v" or "wireshark -v". This will print the build information in your terminal window.

In either case the build information should look something like this:

    wireshark 1.0.0
    
    Compiled with GTK+ 2.12.8, with GLib 2.14.6, with WinPcap (version unknown),
    with libz 1.2.3, without POSIX capabilities, with libpcre 7.0, with SMI 0.4.5,
    with ADNS, with Lua 5.1, with GnuTLS 1.6.1, with Gcrypt 1.2.3, with MIT
    Kerberos, with PortAudio V19-devel, without AirPcap.
    
    Running on Windows XP Service Pack 2, build 2600, with WinPcap version 4.0.2
    (packet.dll version 4.0.0.1040), based on libpcap version 0.9.5.
    
    Built using Microsoft Visual C++ 6.0

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

  - In Bugzilla you can mark the bug and/or attachment as "private". This makes the bug/attachment accessible to the reported and/or CC list only. Further restriction can be made that only the [Wireshark core developers](/Developers) have access to the bug.

  - Instead of sending the report to the [Wireshark development mailing list](https://www.wireshark.org/mailman/listinfo/wireshark-dev) (which is a public forum) you can send it to <security@wireshark.org>, which has limited distribution.

## Additional Information

Bugs filed in the bug database are monitored by the developers and solved as time permits. It may be that additional information is required to find the cause of the problem. A comment will be added to the bug report requesting that information, and the bug's state will be set to "INCOMPLETE". These changes will be sent to the email address that you've provided when filing the bug report, so it is important to monitor that mailbox.

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
