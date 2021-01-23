# Wireshark Development

This is the development section of the Wireshark wiki.

## Beginner?

If you are new to Wireshark development, please set up your build environment first:

  - Get the source code from the [Wireshark development webpage](http://www.wireshark.org/develop.html)

  - **Windows**: the [Developer's Guide](http://www.wireshark.org/docs/wsdg_html_chunked/ChSetupWin32.html) is currently invaluable for setting up a development environment in Microsoft Windows

  - **Unix-like**: you may find information in the README.xxx file suitable for your target platform - in the [root](https://gitlab.com/wireshark/wireshark/-/tree/master) directory of the Wireshark sources

  - **Required Libraries and Packages**: for essential and optional external dependencies on Unix and Windows, see the [Library reference in the Wireshark Developer's Guide](https://www.wireshark.org/docs/wsdg_html_chunked/ChapterLibraries.html)

Now it's time to tweak the code:

  - [doc/README.developer](https://gitlab.com/wireshark/wireshark/-/raw/master/doc/README.developer) the best manual about Wireshark dissector development so far, you will also find that one in the [documentation](https://gitlab.com/wireshark/wireshark/-/tree/master/doc) directory of the Wireshark sources - **please read and thoroughly understand all of the "Portability" and "Robustness" sections before writing any Wireshark code\!**

  - ... of course you should have a look at the [Wireshark sources](https://gitlab.com/wireshark/wireshark/-/tree/master) itself!

## General

  - [Wireshark documentation webpage](http://www.wireshark.org/docs/): the latest version of the *Wireshark User's Guide* and the *Wireshark Developer's Guide* in different formats (PDF, HTML, ...)

  - [LifeCycle](/Development/LifeCycle): Life Cycle information on Wireshark releases

  - [Roadmap](/Development/Roadmap): Roadmap for upcoming Wireshark releases

  - [Wishlist](/Development/Wishlist): Wish list for internal features and architectural changes (as opposed to user-visible features [WishList](/WishList))

  - [SendingFilesToWireshark](/SendingFilesToWireshark): Tips on sending files to the Wireshark mailing lists

  - [Translations](/Development/Translations): Why it's not a good idea to translate Wireshark into spanish/german/... language

## Development

### General

  - [Creating Patches](/CreatingPatches): Tips on creating patches before submitting them

  - [Submitting Patches](/Development/SubmittingPatches): Introduction to using Git & GitLab to submit and review patches

  - [Secure Programming](/Development/SecureProgramming) How to write more secure code, e.g. replace insecure ANSI-C calls by more secure ones

  - [Common Problems](/Development/CommonProblems): Some common problems while developing Wireshark

  - [Tips](/Development/Tips): Some selected wisdom to ease development/debugging

  - [Libpcap File Format](/Development/LibpcapFileFormat) A libpcap file format description

  - [Canary](/Development/Canary) Finding and fixing memory over- and under-runs with canaries

  - [pyreshark](https://github.com/ashdnazg/pyreshark): A Wireshark plugin providing a simple interface for writing dissectors in Python.

  - [Support library version tracking](/Development/Support_library_version_tracking) A page for tracking what OS distributions came with what versions of various libraries with which Wireshark is built

  - [Windows Libraries](/Development/WindowsLibs) Describes how Windows libraries are built and the procedure for updating those.

### Character encodings

  - [Character encodings](/Development/Character-encodings): Character encodings used in Wireshark and the systems on which Wireshark runs

  - [Platform string encoding](/Development/Platform-string-encoding): Dealing with non-UTF-8 strings other than strings in packets, such as file names and environment variables

### Non-C dissectors

  - [Lua](/Lua): Extending Wireshark with the extensible extension language

  - Generic dissector (<http://wsgd.free.fr/>) : display clearly your data inside wireshark without any code

## Projects

### Design ideas

  - [Wiretap Pcapng](/WiretapPcapng) Changes to wiretap to support pcapng

  - [High Speed Capturing](/HighSpeedCapturing) High speed capturing improvements

  - [Decryption Block](/DecryptionBlock) Define a pcapng decryption block and use it to save decryption information in the file.

  - [Preference Block](/PrefBlock) Define a pcapng block to store the preference settings needed to view the file.

  - [Privacy Settings](/PrivacySettings) Add privacy settings to determine what to put in a pcapng file.

  - [Reduce memory footprint](/Reduce-memory-footprint) Ideas on how to find the memory hogs and reduce the memory usage

### In progress

  - [Custom Columnfication](/Development/CustomColumnfication) An ongoing project concerning predefined columns -\> custom column migration

  - [Privilege Separation](/Development/PrivilegeSeparation): A proposal to add privilege separation to Wireshark

  - [Mate](/Mate): Meta Analysis and Tracing Engine

  - [Security](/Development/Security): Efforts to make Wireshark more secure

  - [Packet Input](/Development/PacketInput): how to get packet data into Wireshark in some "unusual" ways

  - [String handling in dissectors](/Development/String-handling-in-dissectors) How string handling should work in Wireshark (ie encoding support, how to deal with invalid strings, etc)

  - [Optimize PacketList](/Development/OptimizePacketList): the packet list isn't optimized for the way we use it, could make a huge difference for large capture files

  - [CSV Export](/Development/CSVExport): Formats and problems with exporting into the CSV format

  - [Multithreading](/Development/multithreading): a list of what needs to be done in order to achieve it

  - [SNMP](/Development/SNMP): reworking of OID handling and SNMP dissector

  - [Optimization](/Development/Optimization): A patch for a faster but maybe slightly broken wireshark

  - [Fast Filtering](/Development/FastFiltering): A patch for fast packet filtering interactively

  - [Pcapng](/Development/PcapNg): Read/Write the "PCAP Next Generation Dump File Format" or pcapng

  - [Python](/Python) : Extending Wireshark with Python

  - [SharkTools](/SharkTools): A project that provides "matshark" and "pyshark", which integrate Wireshark's packet dissection engine into Matlab and Python.

### Completed

  - [DropWin32GTK1](/Development/DropWin32GTK1): Thoughts about dropping GTK1 support on Win32

  - [Patch Handling](/Development/PatchHandling): Changing patch handling policy

  - [Examples](/Development/Examples): Example files, which are used by the various installers as default files

  - [Replace Deprecated Gtk and GLib Function Usage](/ReplaceDeprecatedGtkGLibFunctionUsage): An ongoing project to replace use of deprecated GTK and GLib functions.

  - [Going GTK3](/GoingGTK3): A project to prepare the Shark to migrate from GTK+ 2 to GTK+ 3

  - [QtShark](/Development/QtShark): Qt based version of Wireshark.

  - [sharkd](/Development/sharkd): A program that makes Wireshark capabilities available via a programmatic interface.

  - [Update](/Development/Update): Check version and Update Wireshark on a frequent basis

## Tools

  - [Asn2wrs](/Asn2wrs): How to create a dissector using the ASN.1 compiler

  - [WiresharkEnvCmd](/Development/WiresharkEnvCmd): A batch script to set environment variables useful for Windows development on older 1.12.x or earlier versions

  - [idl2wrs](/idl2wrs): [CORBA](/CORBA) IDL to Wireshark Plugin Generator [idl2wrs](http://www.wireshark.org/docs/man-pages/idl2wrs.html)

  - [Fuzz Testing](/FuzzTesting): tools to stress test protocol dissectors

  - [Pidl](/Pidl): A perl-based [DCE/RPC](/DCE/RPC) IDL compiler (and Wireshark dissector generator) developed for Samba 4

  - [/CodeCoverage](/Development/CodeCoverage): check how much of your code is covered by the test cases

  - [/SourceMovie](/Development/SourceMovie): generate a movie about code repository history

## Discussion

-----

---

Imported from https://wiki.wireshark.org/Development on 2020-08-11 23:12:38 UTC
