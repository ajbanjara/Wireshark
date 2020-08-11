# Beta Releases

These were the changes incorporated into the beta releases leading up to 1.0.0

## 0.99.9

Starting with 0.99.8/0.99.9, odd-numbered versions were used for development snapshots only. There was no official 0.99.9 release.

## 0.99.8

Released: Feb 27, 2008 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-0.99.8.html)

Complete:

  - Move over the following revisions:
    
      - [Rev 24388](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24388) - Add rawshark.rc.in to the tarball
    
      - [Rev 24396](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24396) - Fix a wrong mask that could lead to a uint8 overflow
    
      - [Rev 24398](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24398) - Fix pcapng timestamp writing and reading (for usec resolution captures-nsec was ok)
    
      - [Rev 24400](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24400) - Update manuf and faq
    
      - [Rev 24403](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24403) - Fix dlt conversion in rawshark
    
      - [Rev 24417](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24417) - Some custom column fixes
    
      - [Rev 24422](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24422) - Don't build rawshark if we don't have libpcap
    
      - [Rev 24428](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24428), [24429](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24429), [24431](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24431), [24434](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24434), [24436](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24436), and [24437](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24437) - Add rawshark.html to packaging and Wireshark help menu. (These also add ws.css to the man page HTML files.)
    
      - [Rev 24449](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24449), [24450](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24450) - Fix ws.css dist problems.
    
      - [Rev 24457](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24457) - Fix handling of unsigned SNMP MIB values.
    
      - [Rev 24459](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24459) - Fix EtherCAT length mask.
    
      - [Rev 24465](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24465) - Fix setresuid/setresgid detection
    
      - [Rev 24466](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24466) - Add missing distribution files
    
      - [Rev 24467](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24467) - Fix NPE in SNMP
    
      - [Rev 24471](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24471) - Fix crash in SCTP
    
      - [Rev 24472](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24471) - Require GNUTLS 1.2

  - Remove mention of custom column types from release notes until the feature is fully developed? (see discussion at <http://www.wireshark.org/lists/wireshark-dev/200802/msg00149.html>)

  - Fix blocker bugs

## 0.99.7

Released: Dec 19, 2007 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-0.99.7.html)

Complete:

  - Move over the following revisions:
    
      - [Rev 23527](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23527) - Fix crash with long hex dump pane
    
      - [Rev 23532](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23532) - Avoid redraw hex dump windows if redissecting.
    
      - [Rev 23538](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23538) - Catch SIGINT, SIGHUP, and SIGTERM on UN\*X, so we cleanly exit if, for example, we're ^C'ed. This should fix bug 2003.
    
      - [Rev 23540](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23540) - Rename Windows [ConsoleCtrHandlerRoutine](/ConsoleCtrHandlerRoutine) --\> capture\_cleanup to match SVN \#23537 change
    
      - [Rev 23545](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23545) - Make previously removed fcoe.ethertype preference obsolete.
    
      - [Rev 23546](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23546) - comment out no longer meaningful "read filter" test case.
    
      - [Rev 23548](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23548) - Correction to check for empty choice in BER. This should fix bug 2008.
    
      - [Rev 23555](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23555) - Catch a loop in IPv6. Fixes bug 2007..
    
      - [Rev 23534](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23534) - Fix for CFM Sender ID TLV bug
    
      - [Rev 23559](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23559) - More 3GPP AVP:s
    
      - [Rev 23563](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23563) - Fix for xLR==0 SCCP bug (good to have)
    
      - [Rev 23564](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23564) - Fix for RANAP called/calling SSN bug (good to have)
    
      - [Rev 23565](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23565) - Fix error printout/popup for out-of-tree builders (good to have)
    
      - [Rev 23567](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23567) - Fix SCTP reassembly crash (really should have)
    
      - [Rev 23568](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23568) - Make sure h225\_pi is initialized (fixes a crash).
    
      - [Rev 23591](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23591) - Make sure the capture process exits when it should.
    
      - [Rev 23593](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23593) - Fix a crash in the SMB dissector.
    
      - [Rev 23601](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23601) - Fix another non-ASCII filename problem (goes along with the many other non-ASCII filename problems already fixed in 0.99.7)
    
      - [Rev 23604](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23604) - Fix crash when editing UAT tables
    
      - [Rev 23608](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23608) - Get rid of C++/C99 style comments (if only to save Albert Chin the trouble of patching+reporting them in this release)
    
      - [Rev 23610](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23610) - Small fix to 23608
    
      - [Rev 23613](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23613) - Initialize a pointer in USB. Fixes a crash.
    
      - [Rev 23615](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23615) - Fix crash with bad Diameter dissectors
    
      - [Rev 23618](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23618) - Save RTP payload whenever it's complete
    
      - [Rev 23619](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23619) - Add tvb\_get\_ephemeral\_faked\_unicode and tvb\_get\_ephemeral\_stringz to epan/libwireshark.def
    
      - [Rev 23621](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23621) - Fix infinite loop in SCTP dissector
    
      - [Rev 23623](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23623) - Fix case-insensitive string matching in Turkish (and possibly other) locales
    
      - [Rev 23632](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23632) - Fixed a bug when adjusting summary filtered start time
    
      - [Rev 23639](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23639) - Fix unreported bug where the smb2 SRT filter has a comma at the beginning, making it unusable
    
      - [Rev 23642](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23642) - Fixed a possible infinite loop in atalk. This fixes bug 2035.
    
      - [Rev 23644](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23644) - Put double click on a frame link back. This fixes bug 2032.
    
      - [Rev 23648](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23648) - Apply coloring rules to marked packages. This fixes bug 2038.
    
      - [Rev 23667](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23667) - Fix a bug in Protocol Hierarchy Statistics End Packets/End Bytes calculation.
    
      - [Rev 23577](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23577) - Corrected setting of "warnings\_as\_errors\_default"
    
      - [Rev 23634](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23634) - Use NEED\_G\_ASCII\_STRCASECMP\_H in airpdcap.c
    
      - [Rev 23635](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23635) - g\_ascii\_strcasecmp.c needs glib.h
    
      - [Rev 23636](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23636) - fix the path to include g\_ascii\_strcasecmp.h
    
      - [Rev 23638](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23638) - fix the path to include g\_ascii\_strcasecmp.h
    
      - [Rev 23687](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23687) - Fix crash in packet-rpl.c, bug 2052
    
      - [Rev 23688](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23688) - Fix crash in packet-ansi\_a.c, bug 2051
    
      - [Rev 23689](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23689) - Give the flow graph window the correct title.
    
      - [Rev 23695](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23695) - \*really\* Give the flow graph window the correct title.
    
      - [Rev 23612](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23612) - Allow compilation with --as-needed (requested by bug author but fix not confirmed--not a big deal if it doesn't make it)
    
      - [Rev 23616](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23616) - libwiretap.def fix for 23612
    
      - [Rev 23676](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23676) - Add directory handling to "configure --with-libsmi"
    
      - [Rev 23702](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23702) - SNMP Traps marked as malformed - Fix confusion in BER tag handling
    
      - [Rev 23704](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23704) - MTP3MG bug fix
    
      - [Rev 23705](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23705) - Reassemble SCCP XUDTS (not a big deal)
    
      - [Rev 23728](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23728) - On Windows, let the native file dialog figure out if a file exists.
    
      - [Rev 23729](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23729) - Another IO Graphs fix, for out-of-graph values in FBar and Dot.
    
      - [Rev 23723](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23723) - Small bugfix ANSI MAP
    
      - [Rev 23753](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23753) - Add the MIB path to About-\>Folders
    
      - [Rev 23754](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23754) - Clean up r23753
    
      - [Rev 23640](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23640) - Fix SRT stats filters.
    
      - [Rev 23756](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23756) - Do not create illegal filters.
    
      - [Rev 23773](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23773) - ANSI ISUP bug fix.
    
      - [Rev 23777](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23773) - Auto scroll behavior fix.
    
      - [Rev 23787](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23773) - Fix unaligned access in WiMAX.
    
      - [Rev 23794](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23794) - Register "samr.nt\_password" as obsolete.
    
      - [Rev 23807](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23807) Fix [TiVoConnect](/TiVoConnect) dissector, seemingly broken since rev 18415.
    
      - [Rev 23820](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23820) Fix a crash bug in the CIP dissector.
    
      - [Rev 23838](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23838) - Access to freed memory - strings registered to dissector table have to be allocated permanently
    
      - [Rev 23841](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23841) - Fix [bug 2062](http://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2062)

  - Fix [bug 2055](http://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2055)

  - Upgrade to GTK+ 2.12.1 on the Windows build.

  - Upgrade to [WinPcap](/WinPcap) 4.0.2 on the Windows packaging

  - update user-guide.chm? No problem, this file is updated on each official build.

  - Finish capture privilege separation.

  - Fix blocker bugs (no blocker bugs open).

  - Fix current Buildbot problems.

  - Add "[PortableApps](/PortableApps)" (Windows USB stick) package to website

## 0.99.6

Released: Jul 5, 2007 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-0.99.6.html)

  - Move over the following revisions:
    
      - [Rev 22113](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=22113) - User Guide updates
    
      - [Rev 22115 & 22120](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=22115) - Fix filter dialog-\>add expression dialog "hang" and console errors
    
      - [Rev 22116](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=22116) - Have editcap and capinfos compile --without-plugins
    
      - [Rev 22117](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=22117) - Developer Guide updates
    
      - [Rev 22135 & 22136 & 22146](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=22136) - GSM MAP fixes (exclude packet-gsm\_ss.c)
    
      - [Rev 22151 & 22152](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=22151)[Colon separators](http://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1584)
    
      - [Rev 22138](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=22138) - Be less picky about parsing EAPOL handshakes
    
      - [Rev 22188](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=22188) - Fix compilation on OpenBSD
    
      - [Rev 22186](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=22186) - Don't try to parse EAPOL group keys as pairwise keys
    
      - [Rev 22171](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=22171) - Typo(IMPLICIT SET not working properly with -X option of asn2wrs).
    
      - [Rev 22195](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=22195) - PPI capture counts
    
      - [Rev 22198](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=22198) - Only show one error dialog in object export
    
      - [Rev 22210](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=22210) - Allow percent-escapes in WPA passphrases
    
      - [Rev 22211](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=22211) - Apply prefs in the key management dialog
    
      - [Rev 22149 & 22209](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=22209) - small X.411 fixes
    
      - [Rev 22220](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=22220) - small BACAPP fix
    
      - [Rev 22237](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=22237) - Incorporate [WinPcap](/WinPcap) 4.0.1
    
      - [Rev 22238](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=22238) - Debian package files update

  - Fix [Coverity](http://scan.coverity.com/) bugs:
    
      - 216
      - 232
      - 241
      - 240
      - 244

  - Fix blocker bugs.

  - Upgrade to GTK+ 2.10.12 on the Windows build. This fixes a [menu display bug on Vista](http://bugzilla.gnome.org/show_bug.cgi?id=392015).

  - Fix compiler warnings on various platforms

## 0.99.5

Released: Feb 1, 2007

  - Update the Windows GTK+ package(s) to 2.10.

  - Update the Windows GNUTLS package to 1.6.0.

  - Update the Windows [PortAudio](/PortAudio) package to v19.

  - Update the Windows Net-SNMP package to 5.4.

  - Move cryptographic code to epan/crypto.

  - Use the "User's Guide" as the online help system for Wireshark.

## 0.99.4

Released: Oct 31, 2006

  - Finish TCP reassembly

  - Solve the Preferences/Filter "Save" button confusion. That's the last one on my "personal GUI list" that's regular confusing newbies IMHO. It's solved by adding a Preference setting "Explicit saving changes" which defaults to off. *[UlfLamping](/UlfLamping)*

  - [396](http://bugs.wireshark.org/bugzilla/show_bug.cgi?id=396) - Saving flow data crashes Wireshark

  - [699](http://bugs.wireshark.org/bugzilla/show_bug.cgi?id=699) - "Order" buttons not working properly in Coloring Rules window

  - [1050](http://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1050), [1079](http://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1079) - The HTTP dissector could crash

  - [1096](http://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1096) - Wireshark fails to start on Windows when it can't acquire a crypto context.

  - Fix fuzz bugs currently in Bugzilla

## 0.99.3

Released: Aug 23, 2006

  - TCP reassembly updates

  - Determine our [ECCN status](http://www.bis.doc.gov/Licensing/Do_I_NeedAnECCN.html), which [is done](http://www.wireshark.org/lists/wireshark-dev/200607/msg00303.html)

  - Add GNU TLS and libgcrypt to the Windows installer

## 0.99.2

Released: July 17, 2006

  - TCP reassembly updates
  - Update the Net-SNMP library in the Windows distribution to 5.3.0.1.
  - Fix blocker bugs:
      - [852](http://bugs.wireshark.org/bugzilla/show_bug.cgi?id=852) - Follow TCP stream crashes on particular data with X Window System error
    
      - [Rev 23708](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23708) - Don't wrap in IO Graphs when drawing advanced time values above \~27 seconds.
    
      - [Rev 23711](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23711) - Added some casts to r23708.
    
      - [Rev 23712](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=23712) - Added yet another cast to r23708.

particular data with X Window System error

  - [757](http://bugs.wireshark.org/bugzilla/show_bug.cgi?id=757) - Crashes when multiple tap interfaces exist

  - [967](http://bugs.wireshark.org/bugzilla/show_bug.cgi?id=967) - crash on fuzzed SNMP capture

  - Add the Portaudio library to the Windows distribution.

## 0.99.1

The 0.99.1 release has been abandoned, as discussed in [this thread](http://www.wireshark.org/lists/wireshark-dev/200607/msg00001.html) on the wireshark-dev list.

## 0.99.0

Released: April 24, 2006

  - Fix security-related Coverity bugs
  - Add some reasonable example files for filters, rules, .... (Done in 14595)
  - Fix Bugzilla "blocker" bugs
  - Updated Lua for Windows. (GNU TLS/libgcrypt will be added pending an ECCN assignment from the U.S. Department of Commerce)

---

Imported from https://wiki.wireshark.org/Development/BetaReleases on 2020-08-11 23:12:40 UTC
