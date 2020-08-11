# Wireshark Development

This is the development section of the Wireshark wiki.

## Beginner?

If you are new to Wireshark development, please set up your build environment first:

  - get the source code from the [Wireshark development webpage](http://www.wireshark.org/develop.html)

  - **Win32**: the [Developer's Guide](http://www.wireshark.org/docs/wsdg_html_chunked/ChSetupWin32.html) is currently invaluable for setting up a Win32 development environment

  - **Unix-like**: you may find information in the README.xxx file suitable for your target platform - in the [root](https://code.wireshark.org/review/gitweb?p=wireshark.git;a=tree) directory of the Wireshark sources

  - **Required Libraries and Packages**: for essential and optional external dependencies on Unix and Windows, see the [Library reference in the Wireshark Developer's Guide](https://www.wireshark.org/docs/wsdg_html_chunked/ChapterLibraries.html)

Now it's time to tweak the code:

  - [doc/README.developer](https://code.wireshark.org/review/gitweb?p=wireshark.git;a=blob;f=doc/README.developer;hb=HEAD) the best manual about Wireshark dissector development so far, you will also find that one in the [documentation](https://code.wireshark.org/review/gitweb?p=wireshark.git;a=tree;f=doc;hb=HEAD) directory of the Wireshark sources - **please read and thoroughly understand all of the "Portability" and "Robustness" sections before writing any Wireshark code\!**

  - ... of course you should have a look at the [Wireshark sources](https://code.wireshark.org/review/gitweb?p=wireshark.git;a=tree;hb=refs/heads/master) itself\!

## General

  - [Wireshark documentation webpage](http://www.wireshark.org/docs/): the latest version of the *Wireshark User's Guide* and the *Wireshark Developer's Guide* in different formats (PDF, HTML, ...)

  - [/LifeCycle](/Development/LifeCycle): Life Cycle information on Wireshark releases

  - [/Roadmap](/Development/Roadmap): Roadmap for upcoming Wireshark releases

  - [/Wishlist](/Development/Wishlist): Wish list for internal features and architectural changes (as opposed to user-visible features [WishList](/WishList))

  - [SendingFilesToWireshark](/SendingFilesToWireshark): Tips on sending files to the Wireshark mailing lists

  - [/Translations](/Development/Translations): Why it's not a good idea to translate Wireshark into spanish/german/... language

## Development

  - [CreatingPatches](/CreatingPatches): Tips on creating patches before submitting them

  - [/SubmittingPatches](/Development/SubmittingPatches): Introduction to using Git & Gerrit to submit and review patches

  - [/SecureProgramming](/Development/SecureProgramming) How to write more secure code, e.g. replace insecure ANSI-C calls by more secure ones

  - [/CommonProblems](/Development/CommonProblems): Some common problems while developing Wireshark

  - [/Tips](/Development/Tips): Some selected wisdom to ease development/debugging

  - [/FilenameEncoding](/Development/FilenameEncoding): the various Unicode and code page encodings of filenames in GLib

  - [Lua](/Lua): Extending Wireshark with the extensible extension language

  - [/LibpcapFileFormat](/Development/LibpcapFileFormat) A libpcap file format description

  - [/Canary](/Development/Canary) Finding and fixing memory over- and under-runs with canaries

  - Generic dissector (<http://wsgd.free.fr/>) : display clearly your data inside wireshark without any code

  - [pyreshark](https://github.com/ashdnazg/pyreshark): A Wireshark plugin providing a simple interface for writing dissectors in Python.

  - [/Support\_library\_version\_tracking](/Development/Support_library_version_tracking) A page for tracking what OS distributions came with what versions of various libraries with which Wireshark is built

  - [/WindowsLibs](/Development/WindowsLibs) Describes how Windows libraries are built and the procedure for updating those.

  - [/StringHandling](/Development/StringHandling) How string handling should work in Wireshark (ie encoding support, how to deal with invalid strings, etc)

## Projects

### Design ideas

  - [WiretapPcapng](/WiretapPcapng) Changes to wiretap to support pcapng

  - [HighSpeedCapturing](/HighSpeedCapturing) High speed capturing improvements

  - [DecryptionBlock](/DecryptionBlock) Define a pcapng decryption block and use it to save decryption information in the file.

  - [PrefBlock](/PrefBlock) Define a pcapng block to store the preference settings needed to view the file.

  - [PrivacySettings](/PrivacySettings) Add privacy settings to determine what to put in a pcapng file.

  - [Reduce memory footprint](/Reduce-memory-footprint) Ideas on how to find the memory hogs and reduce the memory usage

### In progress

  - [/CustomColumnfication](/Development/CustomColumnfication) An ongoing project concerning predefined columns -\> custom column migration

  - [/PrivilegeSeparation](/Development/PrivilegeSeparation): A proposal to add privilege separation to Wireshark

  - [Mate](/Mate): Meta Analysis and Tracing Engine

  - [/Security](/Development/Security): Efforts to make Wireshark more secure

  - [/ExpertInfo](/Development/ExpertInfo): a better "user display" of network misbehaviour

  - [/PacketInput](/Development/PacketInput): how to get packet data into Wireshark in some "unusual" ways

  - [/OptimizePacketList](/Development/OptimizePacketList): the packet list isn't optimized for the way we use it, could make a huge difference for large capture files

  - [/CSVExport](/Development/CSVExport): Formats and problems with exporting into the CSV format

  - [/multithreading](/Development/multithreading): a list of what needs to be done in order to achieve it

  - [/SNMP](/Development/SNMP): reworking of OID handling and SNMP dissector

  - [/Optimization](/Development/Optimization): A patch for a faster but maybe slightly broken wireshark

  - [/FastFiltering](/Development/FastFiltering): A patch for fast packet filtering interactively

  - [/PcapNg](/Development/PcapNg): Read/Write the "PCAP Next Generation Dump File Format" or pcapng

  - [Python](/Python) : Extending Wireshark with Python

  - [SharkTools](/SharkTools): A project that provides "matshark" and "pyshark", which integrate Wireshark's packet dissection engine into Matlab and Python.

### Completed

  - [/DropWin32GTK1](/Development/DropWin32GTK1): Thoughts about dropping GTK1 support on Win32

  - [/PatchHandling](/Development/PatchHandling): Changing patch handling policy

  - [/Examples](/Development/Examples): Example files, which are used by the various installers as default files

  - [ReplaceDeprecatedGtkGLibFunctionUsage](/ReplaceDeprecatedGtkGLibFunctionUsage): An ongoing project to replace use of deprecated GTK and GLib functions.

  - [GoingGTK3](/GoingGTK3): A project to prepare the Shark to migrate from GTK+ 2 to GTK+ 3

  - [/QtShark](/Development/QtShark): Qt based version of Wireshark.

  - [/Update](/Development/Update): Check version and Update Wireshark on a frequent basis

## Tools

  - [Asn2wrs](/Asn2wrs): How to create a dissector using the ASN.1 compiler

  - [/WiresharkEnvCmd](/Development/WiresharkEnvCmd): A batch script to set environment variables useful for Windows development on older 1.12.x or earlier versions

  - [idl2wrs](/idl2wrs): [CORBA](/CORBA) IDL to Wireshark Plugin Generator [idl2wrs](http://www.wireshark.org/docs/man-pages/idl2wrs.html)

  - [FuzzTesting](/FuzzTesting): tools to stress test protocol dissectors

  - [Pidl](/Pidl): A perl-based [DCE/RPC](/DCE/RPC) IDL compiler (and Wireshark dissector generator) developed for Samba 4

  - [/CodeCoverage](/Development/CodeCoverage): check how much of your code is covered by the test cases

  - [/SourceMovie](/Development/SourceMovie): generate a movie about code repository history

## Discussion

-----

---

Imported from https://wiki.wireshark.org/Development on 2020-08-11 23:12:38 UTC
