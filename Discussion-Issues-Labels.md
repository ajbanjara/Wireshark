## Discussion page how we want to handle labels for issues (and MR):

### Current state

Gitlab has a feature called labels [1] to help organize, tag and keep track of issues and MR.
Labels with a double-colon (::) are so called "scoped labels" [2]. These are mutually exclusive.

With the migration from Bugzilla to Gitlab, all the labels of the follwing two tables were generated. These tables list also the current (state: 2021-04-26 ~18:20 UTC) usage of each label.

|Name |Description | Open Issues | Open MR |
| --- | --- | --- | --- |
|build|The tools and environment required to create Wireshark. This includes CMake, Visual Studio, gcc, clang, NSIS, and associated testing and packaging scripts.| 56 | 0 |
|crash|Crash or hang in a Wireshark executable| 34 | 0 |
|docs|Documentation| 27 | 0 |
|enhancement|Enhancement or feature request| 486 | 2 |
| incident|Denotes a disruption to IT services and the associated issues require immediate attention| 0 | 0 |
| question|General questions that are not bug or enhancement requests. These should be asked at https://ask.wireshark.org/| 1 | 0 |
| translations|Translation and localization in Wireshark| 1 | 0 |
| web sites|The Wireshark web sites, including www.wireshark.org ask.wireshark.org, and gitlab.wireshark.org. Problems with infrastructure-related network services such as SMTP and DNS should be reported here as well.| 26 | 0 |

| Name | Description | Open Issues | Open MR |
| --- | --- | --- | --- |
| cli::dumpcap|Packet capture tool used by Wireshark, TShark, and sharkd| 20 | 0 |
| cli::other|Other commmand line utilities that ship with Wireshark: editcap, mergecap, capinfos, text2pcap, etc.| 37 | 0| 
| cli::tshark|The TShark text-mode analyzer| 59 | 0 |
| lib::lua| 0 | 0 |
| lib::wireshark|The library that dissects packets| 482 | 1 |
| lib::wiretap|The library that reads and writes different capture file formats (libwiretap).| 56 | 0 |
| lib::wsutil|The library that provides common utility functions (libwsutil).| 18 | 0 |
| os::bsd|FreeBSD, NetBSD, OpenBSD, and other BSD Unices| 1 | 0 |
| os::debian|Debian| 9 | 0 |
| os::fedora|Fedora| 1 | 0 |
| os::linux|Other Linux Distributions| 71 | 0 |
| os::macos|macOS| 92 | 0 |
| os::red hat|Red Hat Linux| 5 | 0 |
| os::ubuntu|Ubuntu| 24 | 0 |
| os::unix|AIX, HP-UX, Solaris, and other Unices| 1 | 0 |
| os::windows|Microsoft Windows| 368 | 0 |
| ui::gtk|The old Wireshark (GTK+) UI| 1 | 0 |
| ui::qt|The main Wireshark (Qt) UI| 392 | 0 |
| version::0.x|Versions prior to 1.0.0| 9 | 0 |
| version::1.0|Version 1.0.x| 8 | 0 |
| version::1.10|Version 1.10.x| 34 | 0 |
| version::1.12|Version 1.12.x| 41 | 0 |
| version::1.2|Version 1.2.x| 13 | 0 |
| version::1.4|Version 1.4.x| 11 | 0 |
| version::1.6|Version 1.6.x| 13 | 0 |
| version::1.8|Version 1.8.x| 10 | 0 |
| version::2.0|Version 2.0.x| 51 | 0 |
| version::2.2|Version 2.2.x| 64 | 0 |
| version::2.4|Version 2.4.x| 67 | 0 |
| version::2.6|Version 2.6.x| 67 | 0 |
| version::3.0|Version 3.0.x| 109 | 0 |
| version::3.2|Version 3.2.x| 99 | 0 |
| version::3.4|Versions 3.4.x| 1 | 0 |
| version::dev|Development or prerelease versions| 363 | 0 |

Open issues with no label: 102

Open MR with no label: 92

### Proposal

It is obvious that we currently use labels primarily for issues.

For the future I propose to have this set of labels:

| Name | Description |
| --- | --- |
| build|The tools and environment required to create Wireshark. This includes CMake, Visual Studio, gcc, clang, NSIS, and associated testing and packaging scripts.|
| crash|Crash or hang in a Wireshark executable|
| docs|Documentation|
|enhancement|Enhancement or feature request|
| translations|Translation and localization in Wireshark|
| web sites|The Wireshark web sites, including www.wireshark.org ask.wireshark.org, and gitlab.wireshark.org. Problems with infrastructure-related network services such as SMTP and DNS should be reported here as well.|
| cli::dumpcap|Packet capture tool used by Wireshark, TShark, and sharkd|
| cli::other|Other commmand line utilities that ship with Wireshark: editcap, mergecap, capinfos, text2pcap, etc.| 37 |
| ui::tshark|The TShark text-mode analyzer|
| ui::qt|The main Wireshark (Qt) UI|
| lib::lua| LUA extension |
| lib::wireshark|The library that dissects packets|
| lib::wiretap|The library that reads and writes different capture file formats (libwiretap).|
| lib::wsutil|The library that provides common utility functions (libwsutil).|
| os::bsd|FreeBSD, NetBSD, OpenBSD, and other BSD Unices|
| os::debian|Debian|
| os::fedora|Fedora|
| os::linux|Other Linux Distributions|
| os::macos|macOS|
| os::red hat|Red Hat Linux|
| os::ubuntu|Ubuntu|
| os::unix|AIX, HP-UX, Solaris, and other Unices|
| os::windows|Microsoft Windows|
| version::outdated|Version reached end of life |
| version::3.2|Version 3.2.x|
| version::3.4|Versions 3.4.x|
| version::dev|Development or prerelease versions|
|ws-status::unconfirmed | This bug has recently been added to the issue tracker. Nobody has confirmed that this bug is valid.
|ws-status::confirmed | This bug is valid.
|ws-status::waiting-for-response | To solve this issue additional data of information (a sample capture for example) is required. Most of the time the creator of the issue should add this data.
|ws-status::in-progress | This bug is not yet resolved, but is assigned to the proper person who is working on the bug.
|ws-status::invalid | The problem described is not a bug or not our bug.
|ws-status::wontfix | The problem described is a bug which will never be fixed.
|ws-status::fixed | A fix for this bug is checked into master branch.
|ws-status::duplicate | The problem is a duplicate of an existing issue.


The scoped label version has to be updated everytime we introduce a new major version. All issues having a now end of life label have to be updated to version::outdated. This can easily be done with some API calls.

Setting the label requires manual interaction (atm). So yes, this label won't reflect the real state when the issue is closed automatically (for example when a MR referencing this issue is merged or when the issue is marked as an duplicate).

Furthermore a normal user is not allowed to set labels at the moment. Having the label in the issue template won't add the label when opening an issue.

Maybe we need another bot (like triage-ops [3]) to set labels automatically.



[1]: https://docs.gitlab.com/ee/user/project/labels.html
[2]: https://docs.gitlab.com/ee/user/project/labels.html#scoped-labels
[3]: https://gitlab.com/gitlab-org/quality/triage-ops