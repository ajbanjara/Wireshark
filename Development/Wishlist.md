# Wireshark Development Wishlist

The following is a list of internal code features and architectural changes that could be useful in Wireshark. They might improve performance, enable new functionality, fix problems with the existing code, enable improvements to existing dissectors or enable new dissectors, etc.

New user-visible features should be requested in the main [WishList](/WishList).

[[_TOC_]]

## General / Unsorted

1.  Create a powerful API documentation, this should be done at least for the API files relevant to dissector developers. Add doxygen tags to the files and generate documentation from it. As generating the docs for the complete Wireshark sources takes quite a lot of time, this might not be done at every generation run. - *Ulf Lamping*

2.  Moving the dissectors into a shared library (libwireshark) is great, but it's a shared library that still shows its roots as coming from an application which didn't want to share. That is, Wireshark can have only one file dissected in memory at once. Many dissectors take advantage of this design to define global variables. We need to have a struct (epan\_session) which keeps track of all memory that the dissectors need to use, but only for that particular file. Then Wireshark could open more than one file, and other apps could more easily make use of libwireshark. (And it would be one step closer to being able to be built as a Mac OS X native application; the model in OS X is that one process normally handles all open files for that application. -*Guy Harris*)

3.  Fix PDML export, so it's compatible with <http://analyzer.polito.it/>, see <http://analyzer.polito.it/30alpha/docs/dissectors/PDMLSpec.htm> - *Ulf Lamping*

4.  Finish writing the *Wireshark Developer's Guide*. - *Ulf Lamping*

5.  Allow Wireshark to maintain more information post-dissection to avoid the large amounts of reprocessing/CPU thrashing that occurs any time a display filter is changed, new statistics window built, etc.

6.  I frequently use Wireshark on 2GB datasets - the system is a multiproc Xeon machine with 8GB of RAM, however Wireshark (windows release) does not seem to be aware of the other 3 out of 4 processors available and just sits on one proc. Could multiprocessor support be added across platforms that support it for those of us who have large captures to deal with (a sort, while still amazingly fast, is NOT real time with this size data set) Thank you. - *Everett Basham* ( <efb@uwave.com> ) (Wireshark is a single-threaded application, so, while it's quite happy to run its one-and-only thread on any of the 4 processors on your machine, it'll only run that thread on one processor at any given time. If by "a sort" you're referring to sorting the packet list on a given column, that's done by GTK+, and GTK+ doesn't use multiple threads for that. I suspect that the native Windows toolkit doesn't use multiple threads for that, either. -*Guy Harris*)
    
    With multi-core processors, multiprocessor systems are now a lot more common. There are limits on what can be done with them, as dissection is a bit "embarrassingly serial" - dissecting packet N may depend on information from previous packets - but most of the dependencies are probably between packets in a given conversation, so we might be able to dissect packets from different conversations in parallel as long as the dissection of packets in the conversations in question is no longer dependent on *other* conversations. -*Guy Harris*
    
    That won't work for protocols like SIP, H.323, or MGCP, which are used to decide RTP/RTCP flows. (i.e., there's a cross-conversation dependency, and you don't know which UDP flows are related until the SIP/H.323/MGCP ones tell you) But maybe if we someday support multiple simultaneous file processing, we could do each file in a separate thread. :smiley: -Hadriel

7.  Don't require all dissectors to be in memory at once. Move more dissectors into plugins, and only load the "dependency information" into memory. By that I mean, load the information about which ports the protocol is used on, but don't actually load the dissector unless it's needed by the dissection in process. (The "dependency information" would perhaps be the configuration file from the "Run-time configuration of protocol registration" item. -*Guy Harris*)

## Dissector infrastructure

1.  A way to handle strings in arbitrary character sets would be useful. A string value might contain:
    
    1.  a length in bytes, and a pointer to the first element of an array of that many bytes, containing the raw data from the packet;
    
    2.  an indication of the encoding of that array of bytes (UTF-8, little-endian 16-bit Unicode, big-endian 16-bit Unicode, ISO 8859/1, ISO 8859/2, Windows code page XXX, MacRoman, etc.);
    
    3.  a length in bytes, and a pointer to that many bytes, containing a UTF-8 translation of the string.
    
    When the string is fetched, only the first two of those would be filled in. The only reason to translate a string to UTF-8 would be to display it or to compare it against another string in a filter expression; most strings in a protocol tree probably won't be used in a filter expression, and if the only reason why the protocol tree is being generated is to evaluate a filter expression, the string won't be displayed.
    
    We would probably have our own private copy of iconv and its data bases (or use GLib's wrappers) (although when they use the OS's native iconv, they can't add support for character sets that we might need but that are missing -*Guy Harris*), so that we don't have to rely on the OS having iconv *and* information about the relevant character sets (a UN\*X version might not know about all the Windows code pages we might want to handle, for example - and even if it did, I don't know whether there are standard names for character encodings, so we couldn't rely on a particular encoding having a particular name; the Single UNIX Specification says the encoding names are implementation-dependent, and I think I've seen some HP-UX documentation giving names for some encodings that are different from the names used by GNU iconv). Should we identify character sets using the values from <http://www.iana.org/assignments/character-sets>? Does that include all the DOS and Windows code pages, and all the Macintosh character sets, we'd need to support? It appears to include EBCDIC in various national forms, as well as various ISO 8859-n and EUC, but I'm not sure it has all the old Mac character sets? Displaying UTF-8 or UTF-16 or UTF-32 strings should be easy in GTK+ 2.x, as the string routines take UTF-8 strings. It's harder in GTK+ 1.2\[.x\]; see [the GDK 1.2.x documentation on fonts](http://developer.gnome.org/doc/API/gdk/gdk-fonts.html) for at least some of the painful details. However, as we're no longer supporting GTK+ 1.2\[.x\], that's no longer an issue. For other GUIs, if we do native versions (see an item below about this):
    
      - Windows' Unicode interfaces can draw UTF-16 strings (older releases might handle only the Basic Multilingual Plane, not all of Unicode), but you might need [the Microsoft Layer for Unicode](http://www.microsoft.com/globaldev/handson/dev/mslu_announce.mspx) (MSLU) on Windows 95/98/Me. Building a native Windows Wireshark using the Unicode APIs means, however, that we'd get file names in Unicode, so we'd have to handle those, e.g. using [the GLib wrappers that take path names in GLib's string encoding](http://developer.gnome.org/doc/API/2.0/glib/glib-File-Utilities.html). In addition, at least according to [the Open Layer for Unicode](http://opencow.sourceforge.net/) (Opencow) site, the licensing terms for MSLU are **not** compatible with the GPL; the license for MSLU requires that you prevent people from redistributing the MSLU. Even if it were, another problem is that, even if bundling it with the GPL'ed Wireshark counts as "mere aggregation" so that it doesn't have to be GPL'ed, using it from Wireshark might present a problem as it probably wouldn't be counted as a "system library". Opencow is a free-software replacement for MSLU. MSLU also apparently requires an "import library" to allow your executable not to care whether it's running on Windows 95/98/Me or on NT 4.0/2K/XP/2K3/Vista/etc.; the import library is part of the Platform SDK - there's a free replacement for it, [libunicows](http://libunicows.sourceforge.net/). However, as we no longer support Windows 95/98/Me, that's no longer an issue.
    
      - Qt 3.x uses QStrings as the values returned by a QListViewItem (a single item in a QListView, which would be used to implement the packet list and detail view), which can be constructed from UTF-8 or UTF-16(?) strings, so KDE 3.0 and later should handle Unicode strings.
    
      - OS X natively uses Unicode; NSStrings, used in Cocoa to supply string data for NSTableView (for the packet list) and NSOutlineView (for the packet detail), can be created from UTF-8 text strings.
    
    BTW, any stuff we can't display (invalid UTF-8 sequences, characters in some non-Unicode character set not found in Unicode) should probably be turned into Unicode FFFD, the "REPLACEMENT CHARACTER", which displays as a white question mark in a black diamond and is intended precisely for that use. I guess we can display that as "?" on a dumb terminal....

2.  Show FT\_RELATIVE\_TIME values using time\_secs\_to\_str(), etc., and have a way of specifying the time resolution to display (so you don't show a field with second resolution with nanosecond precision, for example). Are there any FT\_RELATIVE\_TIME fields that should, for example, be shown only as seconds, even if it's a *large* number of seconds?

3.  Convert hidden fields to subtrees as they are usability unfriendly. - *[UlfLamping](/UlfLamping)* (Does this belong in the main wish list? It's something the user would see. -*Guy Harris*) Hmmm, maybe, but you'd have to explain a lot. - *[UlfLamping](/UlfLamping)*

4.  A routine to handle TLVs might be useful. Many protocols have TLV sections, and many dissectors for those protocols have the same bugs. For example, if the length field of a TLV covers the entire TLV, not just the "value" part of the TLV, so that a length field with a value less than the length of the type and length fields is illegal, you **'must**' check the length and, at minimum, quit the TLV-processing loop if it's zero, otherwise your dissector can loop infinitely with malformed data. A TLV dissector that is given:
    
    1.  an hf\_ value for the type field (from which it can infer the length of that field);
    2.  an hf\_ value for the length field (from which it can infer the length of that field);
    3.  an indication of whether the length covers the entire TLV or just the V;
    4.  a table of entries for each type, containing:
        1.  a length value;
        2.  an indication of whether this type has no length field and is always as long as specified by the length value, has a length field that must always have that value, or has a length field that must be at least as long as the specified length value;
        3.  a routine to parse the value;
        4.  possibly an hf\_ field for the value - if not -1 (meaning "no hf\_ value present"), the routine pointer could be null;
    
    might be able to handle most types of TLVs (including IP and TCP options and options in various PPP control protocols, which already have a routine similar to that - that routine could perhaps be turned into the TLV-handling routine).

5.  New field types FT\_BCD and FT\_PACKED\_BCD. Wireshark is an octet based analyzer, so has to have an alternative interpretation of the little\_endian\_flag, if at all possible, for these sub-octet types. If not we'll need a whole bunch of types to cover the various BCD types.
    
      - little\_endian == FALSE
          - BCD: 0x0**N1** 0x0**N2** 0x0**N3** -\> **N1N2N3**
        
          - PACKED\_BCD: 0x**N1N2** 0x**N3**F -\> **N1N2N3**
        
          - PACKED\_BCD: 0x0**N1** 0x**N2N3** -\> **(0)N1N2N3**
      - little\_endian == TRUE
          - BCD: 0x**N1**0 0x**N2**0 0x**N3**0 -\> **N1N2N3**
        
          - PACKED\_BCD: 0x**N2N1** 0xF**N3** -\> **N1N2N3**
        
          - PACKED\_BCD: 0x**N1**0 0x**N3N2** -\> (0)**N1N2N3**

There is also a Telephony BCD

  - TBCD-STRING ::= OCTET STRING -- This type (Telephony Binary Coded Decimal String) is used to -- represent several digits from 0 through 9, \*, \#, a, b, c, two -- digits per octet, each digit encoded 0000 to 1001 (0 to 9), -- 1010 (\*), 1011 (\#), 1100 (a), 1101 (b) or 1110 (c); 1111 used -- as filler when there is an odd number of digits. -- bits 8765 of octet n encoding digit 2n -- bits 4321 of octet n encoding digit 2(n-1) +1
  - Ability to register dissectors on ip address, for example a multicast IP.

## Dissector generation

1.  A dissector generator that reads [NetPDL](http://analyzer.polito.it/30alpha/docs/dissectors/NetPDLSpec.htm) specifications for protocols and generates dissectors would be useful. Those dissectors would probably be more likely to be free of bugs than dissectors written by hand. Something to read NetPDL and interpret it at run time might also be useful for end users. Note, though, that the NetPDL page listed earlier says "***Warning: this is an early draft specification and it is subject to change. The reader must take care not to consider this document as a final specification.***"

2.  A dissector generator that takes Sun's "rpcgen" IDL for ONC RPC-based protocols and generates a dissector might be useful.

## Taps

1.  Provide a mechanism by which a tap can register a table with a given title and set of columns, giving column titles and types, and add rows to the table or update rows in the table. The table should actually be a tree, with a row in the table having a set of sub-rows that can be opened up. The tap would thus not need to have any GUI code or code to print the table - the table mechanism would handle that - and you could have the same tap code for TShark and Wireshark (and for Wireshark on more than one GUI toolkit). There could also be common code to save the table in, for example, CSV format. (At least some of this is done with the "stats tree" mechanism. -*Guy Harris*)

2.  Provide graph-drawing code for tables (line graphs, skyline graphs, bar charts, pie charts, etc.). It might be possible to migrate some graphical taps to such a mechanism, so they could have less GUI code (perhaps no GUI code). Could [GNU libplot](http://www.gnu.org/software/plotutils/) be used here?

## Capture file reading

1.  Have our own code for reading gzipped files, which would keep "snapshots" of the compression directory as it reads the file if it's open for random access as well as sequential access. Seeking forwards is currently done by reading forwards, and seeking backwards is currently done by rewinding and reading forwards, which is *very* inefficient. Periodic "snapshots" would allow random access to be done by quickly moving to the snapshot point before the target offset and reading forwards. This would also leave us less vulnerable to zlib problems, allow us to read gzipped files on systems lacking zlib, and could let us ignore file CRC errors for some file types (compressed Windows Sniffer files are gzipped, but they don't appear to have a valid CRC). Making a pluggable API for decompression code could let us plug in other decompressors, such as bzip2 (bzip2 format apparently resets the dictionary periodically, making it a bit more friendly for random access). See examples/zran.c in the current zlib source. This is now done in the trunk, but we don't yet ignore file CRC errors for compressed Windows Sniffer files, and don't have a mechanism yet for plugging in other decompressors (or compressors, in the code for writing gripped files, which we've also changed not to use the zlib I/O routines). -*Guy Harris*

2.  Refactor file reading code (file\_access.c/wtap.h): there are now multiple arrays and structs with information about file readers/writers (open\_info\_base, dump\_open\_table\_base, file\_type\_extensions\_base). Instead there should just be one struct (file\_type\_subtype\_info) with all information about reading and writing in it, and we can still create the arrays dynamically from that. Also the heuristic\_uses\_extension() fuction is called numerous times when clicking on a file in the open dialog, and this function is not cheap; instead since the info it creates each time for a given filetype never changes, it would be better to create these lists in the open\_routine lookup array on initialization. Lastly, the filetap code basically copies whole chunks of this stuff, which is silly; instead they should re-use as much code as practical. There's very little difference between wiretap and filetap in this area. -*Hadriel Kaplan*

## Capturing

1.  Work on packet capturing in wiretap - or just make it a wrapper around libpcap/WinPcap, hiding some of the stuff Wireshark and TShark currently have to do independently. (As discussed already before, the wiretap lib in it's current form does a great job of file I/O for the various capture file types (T)Wireshark supports. This is a complete task in itself which should stay in it's own lib, don't confuse it with the capturing job. I'd vote 100% to carve some more capturing related things out of (T)Wireshark into *a new* library. - *[UlfLamping](/UlfLamping)*) Most of the capture-related stuff is now in dumpcap. -*Guy Harris*

2.  Raise the task priority of the capture child (slightly) above "normal". Doing so will probably make it less likely that packet drops occur. I've done this at some other Win32 measuring programs I've implemented before and this made the output a lot more deterministic. This might help on Unix platforms too, but I don't have real experiences here. - *[UlfLamping](/UlfLamping)*

## GUI

1.  Have an on-line help file, using the native desktop environment help viewer if present, otherwise using a Web browser. Most help systems are, I think, HTML-based at this point:
    
      - [OS X's help](http://developer.apple.com/documentation/UserExperience/HelpTechnologies-date.html) is HTML-based;
    
      - [Microsoft's HTML Help](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/htmlhelp/html/hworiHTMLHelpStartPage.asp) is (obviously :smiley: ) HTML-based, and, although it doesn't come standard with Windows 95 or NT 4.0, it appears that [you can download a program to install it on those systems](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/htmlhelp/html/hwmicrosofthtmlhelpdownloads.asp);
    
      - [GNOME's help system](http://developer.gnome.org/arch/doc/help.html) is also HTML-based, although the help is written in [DocBook](/DocBook);
    
      - [KDE online manuals](http://developer.kde.org/documentation/library/kdeqt/kde3arch/help.html) are, I think, HTML-based, although they again appear to be written in [DocBook](/DocBook).
    
    If [DocBook](/DocBook) is to be used, however, there might be free tools that can generate the old pre-HTML help Windows help files, so we might not have to provide an installer for HTML Help. There might also be free tools to generate OS X help; presumably the tools to generate GNOME and KDE help are free. One problem is that if the desktop environment doesn't include a help viewer, the user might have to configure Wireshark to use their help browser - and it'd be a bit difficult to expect them to check the help to figure out how to do this. :smiley: It might be possible to translate [DocBook](/DocBook) to plain text, and display it in a text window, although that means you can't use hyperlinks; it might also be possible to supply a simple HTML displayer, based on some simple GTK+ HTML widget, although, even if you could get hooks to follow links within the help, Web links wouldn't work. Note that on-line help shouldn't necessarily just be an on-line version of the manual; it should perhaps be more "task-oriented", providing the user with immediate help in performing some operation. (I'm not sure whether the KDE or GNOME help documentation follows those rules, and it's arguably not a feature that it doesn't....) (If we need a "task-oriented" help, which might be a good idea, this might better be added to the manual, as I don't like the idea of having **another** document. - [UlfLamping](/UlfLamping))

2.  Provide alternative user interfaces, e.g. other toolkits (Qt/KDE, full GNOME, native Windows, native Aqua, etc.) and text-mode "curses". This is arguably more of a "development" issue than an "end-user" issue, as a lot of the work needed is infrastructural, e.g. providing a way to generate code for multiple UIs from a single code base (so updates to the UI don't have to be done in several places) and to provide a mechanism for plugin taps to include GUI code (so that a single GUI-based plugin tap could be used with multiple toolkits, and perhaps even offer the non-GUI functionality in TShark, e.g. a table might just be printed in TShark but could let you select table rows and perform actions on the selected row in Wireshark). (There's a port of GTK+ atop ncurses out there: see <http://zemljanka.sourceforge.net/cursed/>, although it doesn't seem to have been worked on in a while. It appears that there might finally be a native GTK+-atop-Cocoa port under development: see <http://live.gnome.org/GTK%2B/OSX> and <http://gtk-osx.sourceforge.net/>. - *Guy Harris*) Another alternative would be to use [wxWidgets](http://www.wxwidgets.org/); wxWidgets already supports Windows and GTK+, wxWidgets 3.0 is planned to support Cocoa and thus to support 64-bit applications on OS X, and there's a Google Summer of Code project to add a Qt back end.

3.  Use [Portland](http://portland.freedesktop.org/wiki/Portland) [APIs](http://webcvs.freedesktop.org/*checkout*/portland/portland/dapi/doc/API.txt) for opening URLs, determining the order of buttons in dialog boxes, etc., if, as, and when they become official stable APIs. We could provide our own implementations for OS X and Windows (we already have "open a URL" implementations for them, and the button order API would return 1 for "OK/Cancel" on Windows and 2 for "Cancel/OK" on OS X) and for platforms that don't have Portland.

## Printing

1.  Add a new implementation of "print stream" objects - see print.c and print.h - for native Windows printing of text with the Win32 printing API, and, instead of doing Windows printing by writing to a temporary file and then reading that file and printing its contents with the Win32 API, just directly print whatever's being printed.
2.  Add more methods to "print stream" objects to do graphical printing; this would allow printing of various graphs and other pictures we support in some taps.

## Build process

1.  Run make-version.pl only once per make.

2.  \--enable-static doesn't build on all platforms any more (e.g. Suse 9.0) because all static builds are not supported on those platforms. Try to link "as statically as possible".

3.  Support native win32 builds using auto-tools and gcc.

4.  Move plugins into the epan tree.
    
    As we have some GTK dependent plugins, this might be difficult. We probably have to split into GTK and not GTK based plugins. - *[UlfLamping](/UlfLamping)* The only nominally-GTK+-dependent plugin is the ASN.1 plugin, and the code in it that uses GTK+ is currently \#defined away, because plugins that depend on GTK+ won't work with TShark, and dissector plugins, at least, should be capable of working with TShark. -*Guy Harris* The small (single file) plugins are merged into the epan tree. The multiple file plugins are left as a self contained set of files. - *[JaapKeuter](/JaapKeuter)*

5.  Move libs/objects to be linked into LDADD\_xxx where appropriate.

6.  Make heimdal detection work for everyone.

## DONE

Things already done in the past.

1.  A [GtkWidget](/GtkWidget) for authors in the About box. We've got a lot of authors\! We've currently banished the list of authors to the AUTHORS file and the man page, which may be the right solution here.

2.  Finish moving GTK-dependent code into gtk/ subdirectory.

3.  Build process:
    
      - Merge epan/configure.in back into toplevel configure.in

4.  Once you can have taps with no UI code, provide a mechanism by which taps can be plugins.

5.  I just discovered that sshd sets the SSH\_CLIENT variable to source IP, source port, and destination port. That coupled with a destination IP would give us enough information to carry out remote protocol capturing, tcpdump over ssh (where "filter" filters out our own ssh packets, using the information from $SSH\_CLIENT. Any takers?): ssh remotehost tcpdump -s 2000 -w - filter,

6.  Convert the TCP Graph code to use a TCP tap, so that it doesn't have to do its own dissection of link-layer, IP, and TCP headers (the dissection it currently does handles only a few link layers).

7.  Win32 setup target: Before unpacking the files from the various zip's, delete the old directories to prevent old file version lying around being used. - *Ulf Lamping*

8.  A GtkCList replacement, with dynamic columns, allowing columns to be added, removed, or moved without having to exit and restart Wireshark. It should also generate the column contents with a callback, rather than saving the text of the columns when a row is added; this will allow changes to, for example, the format in which time stamps are displayed to take place instantly rather than requiring the entire GtkCList (or even just the time stamp column) to be regenerated, and will probably save a significant amount of memory.
    
    See [Development/OptimizePacketList](/Development/OptimizePacketList) for work in progress on this; in Wireshark 1.4.x, the [GtkTreeView](/GtkTreeView)-based list is the default, and, in the trunk, we've removed support for the old GTKCList-based list.

9.  Have the "make-reg-dotc.py" script cache the information used to build "register.c". As we keep adding dissectors, this script takes longer and longer to run.

10. Move dissectors and supporting files into the epan tree.
    
    The dissectors are already moved, I don't know if all supporting files also moved. If done, move this one to the fixed section. - *[UlfLamping](/UlfLamping)* At this point, the only ones that could arguably be moved are g711.\[ch\]; no dissectors currently use it, only the GUI RTP analysis code does, so *perhaps* it could be considered something specific to Wireshark rather than generic. -*Guy Harris* The g711.\[ch\] stuff has been moved to codecs/. I think at this point everything the dissectors need is in epan (well, except that some depend on libwiretap). I consider this done. - *Jeff Morriss*

---

Imported from https://wiki.wireshark.org/Development/Wishlist on 2020-08-11 23:13:27 UTC
