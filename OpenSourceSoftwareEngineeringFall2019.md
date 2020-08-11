# Open-Source Software Engineering (Fall 2019)

This page collects information about the Wireshark project in CS 5152 (Fall 2019) - Open-Source Software Engineering.

Course description: <https://www.cs.cornell.edu/courses/cs5152/2019fa/> Tracking bug: <https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=16054>

## Project description

**Mentor**: [Peter Wu](https://lekensteyn.nl/)

**Team Size**: 4-5

**Summary**: Add decryption support to the SSH dissector.

**Description**: Wireshark is an open-source network protocol analyzer. It is used in education to provide a visual and practical understanding of networking concepts, and in industry for network-related troubleshooting and to facilitate development of new products and standards.

As increasingly more network traffic is encrypted, decryption is required to enable users to achieve an optimal understanding of application behavior. Wireshark is able to decrypt several protocols, including [TLS](/TLS), [QUIC](https://github.com/quicwg/base-drafts/wiki/Tools#wireshark), and [WireGuard](/WireGuard). Decryption does require additional key material to be extracted from applications, see the previously linked protocol pages for examples.

The [Secure Shell (SSH)](https://en.wikipedia.org/wiki/Secure_Shell) protocol is commonly used for managing remote systems, ranging from a Raspberry Pi to a global fleet of servers. [OpenSSH](https://github.com/openssh/openssh-portable#readme) is the most popular implementation, while [Dropbear](https://matt.ucc.asn.au/dropbear/dropbear.html) is a smaller implementation that is found in some routers.

Wireshark has basic support for dissection of [SSH](/SSH) protocol messages. However, most of the interesting details (commands, input/output, file transfers) are present in the encrypted fields. Tasks:

  - Study the SSH specifications (see the references at [SSH](/SSH)) with a focus on understanding message flow, the key exchange, and decryption.

  - Build a mechanism to extract session secrets from OpenSSH, Dropbear, or your favorite SSH application into a text file.

  - Modify the SSH dissector (epan/dissectors/packet-ssh.c) to support decryption using these secrets.

  - Add support for dissection of the decrypted message structures.

If time permits, one could add even more functionaliy:

  - Investigate the feasibility to implement "Follow Stream" for individual SSH channels, similar to "Follow TCP". This could be used to see the command input/output from an interactive session. This also affects the GUI.

  - Work with other projects (libssh?) to upstream changes that make it easier to dump the secrets.

  - Make it possible to embed these secrets in a pcapng capture file using the [Decryption Secrets Block](https://xml2rfc.tools.ietf.org/cgi-bin/xml2rfc.cgi?url=https://raw.githubusercontent.com/pcapng/pcapng/master/draft-tuexen-opsawg-pcapng.xml&modeAsFormat=html/ascii#rfc.section.4.8) ([example for TLS](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=15252)).

  - Add support for various key exchange algorithms and ciphers supported in SSH.

**Skills**: You will learn about:

  - Practical cryptography engineering.

  - Development of a cross-platform application in C. Ideally on Linux or macOS, but Windows also works.

  - (Optional) GUI development in Qt (C++).

  - Efficiently read internet standards.

  - Extending or developing new protocol dissectors in Wireshark.

  - Development workflow using Git and Gerrit Code Review.

  - Continuous integration testing on multiple platforms (Travis CI, Buildbot, AppVeyor, Gitlab) and operating systems.

  - (Optional) Use of tools that support development, including a debugger (GDB) and sanitizers (ASAN, UBSAN).

## Timeline

  - 29 August 2019 - Start of classes/projects
  - 14 and 15 September - Kickoff Hackathon
  - mid-October - mentors should provide midterm assessments and feedback.
  - 10 December - End of classes/projects
  - mid-December - mentors should provide final evaluations and feedback.
  - 14 to 21 December - group presentations on the project for the class.

## Ideas

The above project description is a proposal, but feel free to make other suggestions. This is an open-source project anyway :smiley:

There are many places where people can help. For inspiration:

  - [All open issues on bugs.wireshark.org](https://bugs.wireshark.org/bugzilla/buglist.cgi?limit=0&order=bug_id%20DESC&resolution=---)

  - Maybe people are requesting features or issues on <https://ask.wireshark.org/>

Some examples:

  - Modernize Lua API internals, removing weird C macros and use more idiomatic constructions.

  - UI/UX improvements (external/remote capture interfaces, statistics, interaction, ...)

  - Accessibility improvements, configurable key bindings, ....

  - Implementing new protocols or extend an existing dissector with support for newer versions or extensions

  - Improve sharkd, a daemon that enables implementing new user interfaces (for example, for Android or websites).

  - Improve the fuzzer integration to speed it up and find more bugs.

  - "Fix bugs/feature requests". Quite an open-ended task, but the process of triaging a bug, investigating the issue and coming up with a fix is very educative and helpful skill.

  - Improve documentation. We have a User's Guide which could always benefit from updates. There are also some plaintext developer documentation files, maybe it could be integrated into the Developer's Guide. Might be considered boring as writing coding is more fun, but it is also very appreciated.

  - Conversation tracking in Lua dissectors. <https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=15396>

  - Add process information for TCP/UDP packets <https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1184>

---

Imported from https://wiki.wireshark.org/OpenSourceSoftwareEngineeringFall2019 on 2020-08-11 23:17:41 UTC
