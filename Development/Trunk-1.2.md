# Past 1.2 Releases

For upcoming releases, see [Development/Roadmap](/Development/Roadmap).

## 1.2.18

Released: June 28, 2011 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.2.18.html)

The 1.2 branch reached End Of Life on June 30, 2011. There will be no official 1.2.19 release.

Done:

  - Move over the following revisions:
      - [Rev 37236](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37236) - Don't increase the len field of the GByteArray that provides the backing data for an FT\_BYTES field; the length must correspond to data that's actually there (actually fixed in rev 37783, but needed for merge)
    
      - [Rev 37625](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37625) - Infinite loop in Ascend/Lucent parser.
    
      - [Rev 37760](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37760) - [Bug 5006](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5006) - Fix Lua TvbRange:tvb documentation
    
      - [Rev 37761](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37761) - [Bug 5199](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5199) - Fix Lua ByteArray:tvb documentation
    
      - [Rev 37763](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37763) - [Bug 5960](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5960) - Fix Lua TvbRange:string to return whole string
    
      - [Rev 37783](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37783) - [Bug 5941](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5941) - Don't increase the len field of the GByteArray that provides the backing data for an FT\_BYTES field; the length must correspond to data that's actually there.
    
      - [Rev 37784](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37784) - [Bug 5895](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5895) - Add sanity checks in range.c
    
      - [Rev 37785](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37785) - [Bug 5895](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5895) - Add argument validation to Lua Pref.range
    
      - [Rev 37786](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37786) - [Bug 5896](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5896) - Remove "range" from Lua's Pref.range(), as this value shall be fetched from the "default".
    
      - [Rev 37787](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37787) - [Bug 5569](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5569) - Added check for invalid chars in abbrev in Lua [ProtoField](/ProtoField) functions.
    
      - [Rev 37788](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37788) - [Bug 6018](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6018) - Add NULL checks in Lua GUI functions and fix typos in Lua error print

## 1.2.17

Released: May 31, 2011 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.2.17.html)

Done:

  - Move over the following revisions:
      - [Rev 36958](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36958) - Fix a large/infinite loop in DICOM.
    
      - [Rev 37011](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37011) - Don't crash if we have a corrupt Diameter dictionary.
    
      - [Rev 37068](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37068) - Don't crash if we have a malformed snoop file.
    
      - [Rev 37081](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37081) - [Bug 5908](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5908) Fix double free in tvb\_uncompress()
    
      - [Rev 37114](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37114), [Rev 37115](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37115), & [Rev 37116](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37116) - Use the new official MIME type for pcap files in the Info.plist for the OS X bundle and in the freedesktop.org wireshark.desktop file.
    
      - [Rev 37128](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37128) - Integer overflow (and crash) in the Visual Networks file code.

## 1.2.16

Released: April 15, 2011 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.2.16.html)

Done:

  - Move over the following revisions:
      - [Rev 36162](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36162) - [Bug 5743](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5743) - tshark incorrectly calculates tcp stream for SYN packets when port numbers are re-used
    
      - [Rev 36174](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36174) - [Bug 5662](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5662) - Wireshark crashes if SSL preferences RSA key is actually a DSA key
    
      - [Rev 36190](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36190) - Fix LDAP filter counter initialization.
    
      - [Rev 36232](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36232) - [Bug 5762](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5762) - Error when opening snoop from Juniper SSG-140
    
      - [Rev 36471](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36471) - text2pcap: Fix a typo in the help message
    
      - [Rev 36483](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36483) - Update the Windows GNUTLS packages.
    
      - [Rev 36608](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36608) - [Bug 5754](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5754) & [Bug 5793](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5793) - Crash in X.590if
    
      - [Rev 34805](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34805) - [Bug 1671](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1671) - Allow objects to be saved that otherwise couldn't be.
    
      - [Rev 34808](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34808) - [Bug 1671](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1671) - Make maxlen a gsize instead of a guint.

## 1.2.15

Released: March 1, 2011 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.2.15.html)

Done:

  - Move over the following revisions:
      - [Rev 35791](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35791) - [Bug 5652](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5652) - Wireshark could free an invalid pointer while reading a pcap-ng file.
    
      - [Rev 35953](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35953) - Fix a buffer overflow in the Nokia DCT3 file reader.
    
      - [Rev 36029](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36029) - [Bug 5717](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5717) - Infinite recursion in CLDAP and SMB.
    
      - [Rev 35633](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35633) - [Bug 4645](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4645) - Wireshark Crashing by pressing 2 Buttons
    
      - [Rev 35788](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35788) - nmake \[Wireshark\] on Windows fails after updating cygwin bash to v 4.1.9-2
    
      - [Rev 36061](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36061) - [Bug 5698](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5698) - Potential access violation when writing to LANalyzer files
    
      - [Rev 36096](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36096) - Close UAT file after loading
    
      - [Rev 36101](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36061) - [Bug 5732](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5732) - LDAP filter strings can consume excessive memory.

## 1.2.14

Released: January 11, 2011 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.2.14.html)

Done:

  - Move over the following revisions:
      - [Rev 34265](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34265) - Fix bug \#553 by ensuring that the upper-left corner of Wireshark is within the viewable area of the monitor.
    
      - [Rev 35153](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35153) - [Bug 4141](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4141)[Rev 35154](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35154)[Rev35155](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35155)[rev 35156](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35156)[Rev 35175](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35175)[Rev 35176](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35176) - Reassemble.c leaks memory for GLIB \> 2.8 Free fragment data and fragment keys in fragment\_table when neccessary. reassembled\_table remains to be fixed.
    
      - [Rev 35228](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35228) - [Bug 5505](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5505) - Dissect LTE-PDCP upload packets as upload packets, not download packets
    
      - [Rev 35292](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35292) - [Bug 5530](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5530) - Fix an overflow in the MAC LTE dissector.
    
      - [Rev 35298](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35298) - [Bug 5530](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5530) - Fix an overflow caused by a too-long SNMP engineId UAT preference.
    
      - [Rev 35304](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35304) - eliminate dissector-bug assertion in SAMR dissector.
    
      - [Rev 35313](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35313) - [Bug 4211](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4211) - eliminate dissector-bug assertion in TCP dissector.
    
      - [Rev 35318](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35318) - [Bug 5539](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5539) - Fix an overflow in the ENTTEC dissector.
    
      - [Rev 35322](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35322) - New Year.
    
      - [Rev 35328](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35328) - fix some misdissections in the UNISTIM dissector.
    
      - [Rev 35330](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35330) - handle OCTET STRINGs dissected as a field if the OCTET STRING's length isn't appropriate for the type of the field.
    
      - [Rev 35332](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35332) - in the Diameter dissector, do length checking for Integer32, Integer64, Unsigned64, Float32, and Float64, as well as for Unsigned32.
    
      - [Rev 35335](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35335) - in the Diameter dissector, don't return a value label from AVP dissectors if the length of the AVP is wrong.
    
      - [Rev 35337](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35337) - fix handling of VMS TCPtrace captures that don't end with a TCPIPTRACE-W-BUFFERSFUL error message.
    
      - [Rev 35357](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35357), [Rev 35369](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35369) - [Bug 4048](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4048) - Don't use DISSECTOR\_ASSERT() to handle errors in packet data.

## 1.2.13

Released: November 19, 2010 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.2.13.html)

Done:

  - Move over the following revisions:
      - [Rev 29929](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29929) - Save some memory: Don't statically allocate ett\[\] arrays used "dynamically".
    
      - [Rev 30802](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30802) - \[NAS EPS\] Incorrect decoding of UE Network Capability IE
    
      - [Rev 30803](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30803) - [Bug 4198](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4198) - Small fixes for Attach Request message decoding
    
      - [Rev 30820](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30820) - [Bug 4203](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4203) - \[NAS EPS\] Expert Info error triggered when decoding a Security Mode Complete message
    
      - [Rev 31116](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31116) - [Bug 4290](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4290) - \[NAS EPS\] various small fixes for message decoding.
    
      - [Rev 31380](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31380) - [Bug 4362](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4362) - \[NAS EPS\] Fix Attach Reject message decoding
    
      - [Rev 31559](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31559) - Fix some gcc -Wshadow warnings ....
    
      - [Rev 31718](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31718) - [Bug 4432](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4432) - Activate dedicated EPS bearer context accept may have no IE's.
    
      - [Rev 32130](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33455) - [Bug 4562](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4562) - \[NAS EPS\] Various small bug fixes.
    
      - [Rev 33455](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33455) - [Bug 5343](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5343) - Add missing else handling a zero msg\_auth\_code.
    
      - [Rev 33371](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33371) - Allow dissection if not ciphered
    
      - [Rev 30119](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30119) - (long overdue) fix Bootp Agent Info dissection
    
      - [Rev 30158](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30158) - Fix crash when running tshark -x without -V
    
      - [Rev 34581](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34581) - [Bug 5318](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5318) - Fix SE memory overflow in LDSS dissector.
    
      - [Rev 34583](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34583) - Copy GDK pixbuf loaders libs to the Wireshark.app
    
      - [Rev 34660](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34660) & [Rev 34661](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34661) - [Bug 5340](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5340) - Calculate correct start time for "View as time of day" in IO Graph.
    
      - [Rev 34709](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34709) - Redissect packets instead of reload file on UAT changes.
    
      - [Rev 34755](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34755) - [Bug 5289](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5289) - A GTK-ERROR can occur in packets when there are multiple Netbios/SMB headers in a single frame
    
      - [Rev 34759](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34759) - [Bug 3894](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3894) - File-Open Display Filter is overwritten by Save-As Filename
    
      - [Rev 34823](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34823) - Handle large gap reports when doing a TSN plot.
    
      - [Rev 34867](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34867) - Export proto\_item\_append\_string().

## 1.2.12

Released: October 11, 2010 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.2.12.html)

Done:

  - Move over the following revisions:
    
      - [Rev 34031](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34031) - [Bug 5162](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5162) - Set correct length for GTP header.
    
      - [Rev 34039](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34039) - Ensure we always print the heading when dumping PSML and CSV.
    
      - [Rev 34111](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34111) - [Bug 5230](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5230) - BER stack overflow.
    
      - [Rev 33906](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33906) - [Bug 5126](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5126) - Fix ERROR:capture.c:141:capture\_start: assertion failed: (capture\_opts-\>state == CAPTURE\_STOPPED)
    
      - [Rev 34080](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34080) - [Bug 5194](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5194) - Wireshark mistakenly writes "not all data available" for IPv4 checksum - Fix a regression introduced in 1.2.11
    
      - [Rev 34408](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34408) - Fix crash in RPC if subdissector changed private\_data and threw an exception
    
      - [Rev 34468](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34468) - Remove the border around the main window.

  - Update [WinPcap](/WinPcap)

## 1.2.11

Released: August 30, 2010 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.2.11.html)

Done:

  - Move over the following revisions:
      - [Rev 28992](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29397) - Added some casts for true\_false\_string's.
    
      - [Rev 29066](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29066) - optimizes the data source name processing.
    
      - [Rev 29205](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29205) - reassemble.h: update two comments; reassemble.c: correct a typo.
    
      - [Rev 29397](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29397) - White space changes
    
      - [Rev 29427](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29427) - introduces packet\_add\_new\_data\_source()
    
      - [Rev 29940](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29940) - Use the slice allocator if GLIB \>= 2,10,0
    
      - [Rev 33697](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33697) + [Rev 33704](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33704) - [Bug 5072](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5072) - put check\_col()s back in col\_append\_fstr() and col\_append\_sep\_fstr()
    
      - [Rev 33846](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33846) - [Bug 5114](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5114) - Fix infinite loop in bootp dissector
    
      - [Rev 33916](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33916), [Rev 33917](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33917), [Rev 33924](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33924), and [Rev 33925](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33925) - Make sure DLLs are loaded safely on Windows.
    
      - [Rev 33725](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33725) - [Bug 5081](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5081)- Fix for 'Uninitialised pointer in packet-rtsp.c causes crash'
    
      - [Rev 33735](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33735) - [Bug 5087](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5087) - Protect tvb\_\* functions in a TRY-CATCH block
    
      - [Rev 33764](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33764)[Rev 33774](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33774)[Rev 33776](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33776)[Rev 33777](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33777) - [Bug 5130](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5103) - Dissector bug, protocol SDP: tvbuff.c:629: failed assertion "tvb && tvb-\>initialized"
    
      - [Rev 33775](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33775)[Rev 33778](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33778) - Call tvb\_get\_bits32() if leading\_zero\_bits \> 16.
    
      - [Rev 33780](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33780) - [Bug 5105](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5105) - IP should not compute the header checksum if within an error packet such as ICMP.
    
      - [Rev 33894](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33894) - Update libtoolize files
    
      - [Rev 33921](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33921) and [Rev 33922](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33922) - Include [WinPcap](/WinPcap) 4.1.2 in the U3 and [PortableApps](/PortableApps) builds - Also requires [WpdPack](/WpdPack)\_4\_1\_2.zip
    
      - [Rev 33941](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33941) - [Bug 5148](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5148) - Avoid crash in ps\_clean\_string().
    
      - [Rev 33947](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33947) - [Bug 5146](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5146) - Make wireshark-dev depend on the right automake.

## 1.2.10

Released: July 29, 2010 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.2.10.html)

Done:

  - Move over the following revisions:
    
      - [Rev 28602](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28602), [Rev 28617](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28617) - [Bug 5009](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5009) - editcap SEGFAULTs on empty input file.
    
      - [Rev 33209](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33209) - Fix: Malformed packet if port is missing from path.
    
      - [Rev 33212](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33212) - [Bug 4868](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4868) - Fix for: Wireshark crash selecting Inter-Asterisk exchange v2 packet data
    
      - [Rev 33280](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33280) - [Bug 4897](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4897) - Fix crash found by fuzz-test
    
      - [Rev 33321](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33321) - Fix [SigComp](/SigComp) UDVM overflows.
    
      - [Rev 33327](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33327) - [Bug 4916](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4916) - zlib-1.2.5 cause tshark to stop live capture
    
      - [Rev 33329](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33329) - [Bug 4926](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4926) - Avoid crash when adding SNMP Users.
    
      - [Rev 33349](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33349) - [Bug 4945](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4945) - Remove any '%\<interface\>' from default filter.
    
      - [Rev 33354](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33354) - Make sure the BER dissector sets a TVB.
    
      - [Rev 33371](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33371) - Allow dissection if not ciphered.
    
      - [Rev 33375](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33375) - Make the PRES dissector work again (regression since 33048)
    
      - [Rev 33376](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33376)[Rev33377](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33377) - [Bug 4860](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4860) - Crash triggered when changing display filter from right-mouse pop-up menu via packet-list.
    
      - [Rev 33457](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33457) - [Bug 4982](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4982) - Handle concatenated Status and other OMAPI message.
    
      - [Rev 33472](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33472) - [Bug 4854](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4854) - Don't crash if a column is present twice.
    
      - [Rev 33483](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33483) - [Bug 4993](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4993) - Mac support flags are little endian too.
    
      - [Rev 33526](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33526) - Don't pass tvb data to col\_set\_str(), as it will not stay around.
    
      - [Rev 33611](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33611) - [Bug 5037](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5037) - Fix SCSI command ACCESS CONTROL IN.
    
      - [Rev 33637](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33637) - [Bug 5053](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5053) - packet-ipmi.c: Fix potential infinite loop: for (guint8=0; guint8 \< guint; guint8++);
    
      - [Rev 33643](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33643) - Fix unistim message length tracking
    
      - [Rev 33648](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33648) - [Bug 5055](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5055) - wrogn decoding of GTP Prime (GTP') Packets.

  - Copy over get\_ber\_length and try\_get\_ber length from the trunk.

  - Update [WinPcap](/WinPcap) installer to 4.1.2.

## 1.2.9

Released: June 10, 2010 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.2.9.html)

Done:

  - Move over the following revisions:
      - [Rev 30940](http://anonsvn.wireshark.org/viewvc?view=rev&revision=30940) - Export more BER functions.
    
      - [Rev 32068](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32068) - [Bug 4405](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4405) - Allow dots in XML tags.
    
      - [Rev 32650](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32650) - [Bug 4734](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4734) - NULL pointer dereference in the SMB dissector.
    
      - [Rev 32680](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32680) - [Bug 4543](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4543) - Calculate correct PDU length if the per\_length\_determinant is one byte long.
    
      - [Rev 32715](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32715) & [Rev 32716](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32716), [Rev 32719](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32719) - [Bug 4708](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4708) & [Bug 4748](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4748) - Fix a compatibility issue with zlib 1.2.5.
    
      - [Rev 32723](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32723) - [Bug 4721](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4721) - Enable "Decode As..." for ethertype 0x0000.
    
      - [Rev 32733](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32733) - Bring back "1 min / 10 min" in IO Graph Tick interval.
    
      - [Rev 32752](http://anonsvn.wireshark.org/viewvc?view=rev&revision=32752) - [Bug 4752](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4752) - Fix: Kerberos pre-auth type constants - MS extensions are wrong.
    
      - [Rev 32756](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32756) - Show IGMP version field as generated.
    
      - [Rev 32765](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32765) & [Rev 32766](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32766) - Fix display filter documentation generation.
    
      - [Rev 32772](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32772) - [Bug 4758](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4758) - Check for overflow in HTTP content length
    
      - [Rev 32774](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32774) - [Bug 1791](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1791) - Allow Open button to work when you've typed in the location bar in the Open dialog
    
      - [Rev 32848](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32848) - Fix fuzz failure on systems that don't like NULL pointers to strings in vsnprintf
    
      - [Bug 4773](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4773) - Pick up patch from bug, to fix failed backport to trunk-1.2
    
      - [Rev 32911](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32911) - [Bug 4777](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4777) - Don't crash when closing a file chooser window frame.
    
      - [Rev 32922](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32922), [Rev 33046](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33046) - Fix a stack overrun in the BER dissector.
    
      - [Rev 32947](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32947) - [Bug 4782](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4782) - Correct decoding for BGP ORF.
    
      - [Rev 32956](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32956) - [Bug 4780](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4780) - Fix for "text2pcap expects \\n delimited text (instead of \\r\\n) on win32".
    
      - [Rev 32961](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32961), [Rev 32962](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32962), [Rev 32963](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32963) - Fix improper use of \<stdarg.h\> that can cause crashes on some platforms, warn people not to do that
    
      - [Rev 32987](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32987) - [Bug 4797](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4797) - Don't crash when the user presses Ctrl+Backspace in the display filter entry.
    
      - [Rev 33003](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33003) - [Bug 4798](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4798) - Fix sizes in dissection of several PGM protocol fields.
    
      - [Rev 33005](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33005) - [Bug 4035](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4035) - Don't crash if the user disables real-time updates during a capture.
    
      - [Rev 33028](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33028) - [Bug 4815](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4815) - Fix the build on Fedora 13
    
      - [Rev 33061](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33061), [Rev 33065](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33065) - [Bug 4826](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4826) - Infinite loop in the SigComp UDVM.
    
      - [Rev 33079](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33079) - [Bug 4839](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4839) - Fix for "The NFS FH hash (nfs.fh.hash) incorrectly matches multiple filehandles"
    
      - [Rev 33087](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33087), [Rev 33090](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33090) - [Bug 4837](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4837) - Buffer overflow in the SigComp UDVM.
    
      - [Rev 33091](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33091) - Increase ACN storage room in TCAP
    
      - [Rev 33105](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33105) - [Bug 4838](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4838) - Fix AES-CTR decoding in IPSec. (Patch applied by hand to trunk, use patch from bug for trunk-1.2)
    
      - [Rev 33168](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33168) - [Bug 4306](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4306) - Avoid a crash when deleting the first character in the filter.

## 1.2.8

Released: May 5, 2010 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.2.8.html)

Done:

  - Move over the following revisions:
      - [Rev 28809](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28809), [Rev 32393](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32393) - [Bug 4503](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4503) - These fix misidentification of non-pcap-ng files as pcap-ng files and non-PacketLogger files as PacketLogger files
    
      - [Rev 30191](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30191) - Fix header file; required for Rev 32357
    
      - [Rev 30363](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30363),[Rev 31512](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31512),[Rev 32357](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32357), [Rev 32390](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32390) - Set the interface name and capture filter in the main window. Add an option to set the name for stdin.
    
      - [Rev 32362](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32362), [Rev 32363](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32363) - Fix crash when double-clicking on empty packet list
    
      - [Rev 32396](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32396) - [Bug 4644](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4644) - Don't crash on DOCSIS Baseline Privacy Key Management Response packets with a bad code
    
      - [Rev 32398](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32398) and [Rev 32400](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32400) - [Bug 4646](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4646) - Don't crash on invalid DOCSIS regrsp packet
    
      - [Rev 32433](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32433) and [Rev 32434](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32434) - [Bug 1958](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1958) - Use 64-bit variable for HTTP content-length
    
      - [Rev 32456](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32456) - [Bug 4535](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4535) - Reassemble SSL record when SSL record header spans two packets
    
      - [Rev 32465](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32465) - [Bug 3010](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3010) - Fix a couple of uninitialized variables in MATE.
    
      - [Rev 32481](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32481) - [Bug 4678](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4678) - Update NTP clock source descriptions
    
      - [Rev 32499](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32499) - [Bug 4635](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4635) - Fix for ptp dissector correction field bug
    
      - [Rev 32500](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32500) - [Bug 3387](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3387) - Don't crash when changing the font and deleting a column at the same time. Note: NEW\_PACKET\_LIST protections can be removed when backporting (though it's not really necessary).
    
      - [Rev 32517](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32517) - [Bug 4695](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4695) - Add Proto`  `Field\_ \_tostring() to Users Guide.
    
      - [Rev 32548](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32548) - Tell, in the version info, if we're a 32- or 64-bit process. (This isn't a bug, but it would be useful to know in the bug reports.)
    
      - [Rev 32582](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32582) - EVRC packet bundling not handled correctly.
    
      - [Rev 32585](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32585) - [Bug 4624](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4624) - Set the sequence number for the next PDU if the current frame contains both the finish of the previous and the complete next one.
    
      - [Rev 32603](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32603) - [Bug 4308](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4308) - Pop up the "you don't want to be running as root\!" dialog **after** showing the main window.

## 1.2.7

Released: March 31, 2010 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.2.7.html)

Done:

  - Move over the following revisions:
      - [Rev 30249](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30249) - [Bug 4049](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4049) - Add support for FT\_BOOLEAN fields to wslua Field`  `Info.
    
      - [Rev 30305](http://anonsvn.wireshark.org/viewvc?view=rev&revision=30305) , [Rev 30570](http://anonsvn.wireshark.org/viewvc?view=rev&revision=30570) , [Rev 30729](http://anonsvn.wireshark.org/viewvc?view=rev&revision=30729) - [Bug 4487](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4487) - I/O Graph dropdown boxes not working correctly.
    
      - [Rev 31032](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31032) - [Bug 4437](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4437) - When decoding a Cell Identifier, curr\_offset is not increased after reading rnc-id.
    
      - [Rev 31659](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31659) - Revert incorrect changes from [Rev 31499](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31499).
    
      - [Rev 31738](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31738) - IANA updates and fixes for PPP types.
    
      - [Rev 31786](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31786) , [Rev 31787](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31787) - Fix a crash which occurs if a progress bar is displayed while generating a hex bytes pane.
    
      - [Rev 31918](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31918) - Fix configure script typo.
    
      - [Rev 31919](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31919) - Another configure script fix.
    
      - [Rev 31978](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31978) - [Bug 4525](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4525) - Corrected values for Ident`  `Info in Profinet.
    
      - [Rev 31985](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31985) - [Bug 4524](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4524) - GSM SMS PDU TPVPF wrong interpretation.
    
      - [Rev 31987](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31987) - [Bug 4522](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4522) - Fix crash from context menu. Port to main\_menu.c
    
      - [Rev 32005](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32005) - [Bug 2478](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2478) - Allow full repeated use of welcome screen.
    
      - [Rev 32081](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32081) - [Bug 2426](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2426) - Check for duplicate entries in usmUserTable.
    
      - [Rev 32090](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32090) - Slow handling of large SIP captures.
    
      - [Rev 32112](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32113) - [Bug 3230](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3230) - Negative INTEGER number displayed as positive number in snmp dissector.
    
      - [Rev 32146](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32146) - [Bug 4563](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4563) - Fix crash on working with non tvb backed tree item.
    
      - [Rev 32193](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32193) - [Bug 4565](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4565) - Make pseudo GLib function play nice with NULL pointers.
    
      - [Rev 31438](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31438) - [Bug 4547](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4547) - Fix for GLib-CRITICAL \*\* Message on Wireshark 1.2.6.
    
      - [Rev 32296](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32296), [Rev 32298](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32298), [Rev 32299](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32299), and [Rev 32300](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32300) - [Bug 3205](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3205) - Use 64-bit bytes counter in io,stat.
    
      - [Rev 32304](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32304) - [Bug 4119](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4119) - Fix RTP player crash when sequence number jumps. Applying rev 32302 first may make it apply cleaner.
    
      - [Rev 32321](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32321) - [Bug 4613](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=%204613) - Use different names for different encapsulations.
    
      - [Rev 31872](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31872) - [Bug 4176](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4176) - Add Old`  `Cigarettes Windows 2000 XP API Wrapper, restoring Windows 2000 support.
    
      - [Rev 31996](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31996) - Use the current GTK+ 2.16 packages.

## 1.2.6

Released: January 27, 2010 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.2.6.html)

Done:

  - Move over the following revisions:
    
      - [Rev 29213](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29213) - Fix a potential crash when calling out to kerberos libraries.
    
      - [Rev 29401](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29401) - use G\_GSIZE\_MODIFIER instead of %zd which is not supported by MSVC.
    
      - [Rev 30695](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30695) - [Bug 4342](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4342) - dissect signed time offset values.
    
      - [Rev 31294](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31294) - [Bug 3986](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3986) - Fix string compares (A correction for part of the previous fix for this bug)
    
      - [Rev 31297](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31297) - Squelch a GTK warning on the RTP player spinner control.
    
      - [Rev 31298](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31298) - Squelch GTK warnings on the RTP player progress bar when resizeing the window.
    
      - [Rev 31315](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31315) - Fix a crash in the wireless toolbar.
    
      - [Rev 31316](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31316) - Use pcap\_datalink\_val\_to\_description in [WinPcap](/WinPcap) if it's present.
    
      - [Rev 31317](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31317) - Update the User Guide to show the current menu.
    
      - [Rev 31318](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31318) - [Debian bug 512989](http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=512989) - Make sure there's a device to play the media.
    
      - [Rev 31326](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31326) - Update and cleanup the Developer Guide source code.
    
      - [Rev 31331](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31331) - [Bug 4340](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4340) - Reset statistics variable when restarting statistics gathering.
    
      - [Rev 31334](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31334) - Fix some \[-XX bytes missing in capture file\] messages when doing follow TCP stream.
    
      - [Rev 31364](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31364) - [Bug 4354](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4354) - Set Edit and Delete button sensitivity when deleting a row.
    
      - [Rev 31369](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31369) - Start User Guide Telephony statistics chapter.
    
      - [Rev 31393](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31393) - Set correct linktype when starting capture from the welcome page.
    
      - [Rev 31395](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31395) - [Bug 1564](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1564) - PSML - structure context node missing
    
      - [Rev 31398](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31398) & [Rev 31401](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31401) - Lua stringz fixes.
    
      - [Rev 31350](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31350) - [Bug 1605](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1605) - Dynamically update the packet list and detail.
    
      - [Rev 31360](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31360) - [Bug 658](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=658) - Time out host name lookups.
    
      - [Rev 31361](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31361) - Have get\_host\_ipaddr and get\_host\_ipaddr6 return FALSE if network name resolution is disabled.
    
      - [Rev 31400](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31400) - [Bug 4363](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4363) - wireshark decodes kerberos AS-REQ PADATA incorrectly.
    
      - [Rev 31449](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31449) - Lua: Use correct field types for signed integer.
    
      - [Rev 31471](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31471) - [Bug 4177](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4177) - Analyze \! Expert... doesn't show IP "Bad Checksum" errors.
    
      - [Rev 31472](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31472) - Change col\_set\_str() to col\_add\_str() since the string passed is freed right after the column update.
    
      - [Rev 31498](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31498) - [Bug 4183](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4183) - Wireshark can't decrypt WPA(2)-PSK when passphrase is 63 bytes.
    
      - [Rev 31499](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31499) - Fix part of Bug 3917 "tvb\_new\_real\_data is prone to memory leak"
    
      - [Rev 31514](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31514) - Try to fix a memory leak.
    
      - [Rev 31522](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31522) - Display correct chunk type for unknown chunks.
    
      - [Rev 31524](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31524) - Buffer overflows in LWRES.
    
      - [Rev 31534](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31534) - Use col\_add\_str in FIP.
    
      - [Rev 31560](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31560) - Clarify some stuff in README.developer.
    
      - [Rev 31626](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31626) - Gracefully handle a missing Kerberos configuration.

  - Update GTK+ to \[<http://www.wireshark.org/lists/wireshark-dev/201001/msg00045.html> - squelch a Secunia alert.\]

  - Update KFW to 3.2.2.

  - Update c-ares Windows package? New version 1.7.0 ([Release Notes](http://curl.haxx.se/cvs.cgi/curl/ares/RELEASE-NOTES?revision=1.45&view=markup&pathrev=cares-1_7_0)) with (maybe) important fixes. Needs [Rev 30773](http://anonsvn.wireshark.org/viewvc?view=rev&revision=30773) to be backported.

  - Drop the Windows PCRE package in favor of GRegex [Rev 31302](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31302)

  - Update GNUTLS.

  - Update GeoIP.
    
      - [Rev 31598](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31598) - Add Skein MAC authentication tag types (Only expanding value\_string).
    
      - [Rev 31609](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31609) - Fix the DHCPv6 ORO suboption offset error.
    
      - [Rev 31615](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31615) - Fix the "how to capture with tcpdump" portion of the User's Guide.
    
      - [Rev 31667](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31667) - [Bug 4417](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4417) - Prevent empty GPRS LLC S frames cause truncated data exception.
    
      - [Rev 31674](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31674) - [Bug 4402](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4402) - Escape non-printable characters when generating PDML

  - Update User Guide packages in [Wireshark-win32-libs](http://anonsvn.wireshark.org/viewvc/?root=Wireshark-win32-libs) and [Wireshark-win64-libs](http://anonsvn.wireshark.org/viewvc/?root=Wireshark-win64-libs) repositories and Makefile.nmake files.
    
      - [Rev 31396](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31396) - Bump copyright year in trunk-1.0 & trunk-1.2

## 1.2.5

Released: December 17, 2009 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.2.5.html)

Done:

  - Move over the following revisions:
      - [Rev 31011](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31011) - [Bug 4023](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4023) - Set SDP Media Format not to NULL, avoiding crash.
    
      - [Rev 29816](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29816) - [Bug 3974](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3974) - Target Identification shall be coded as TLV IE where value is coded as TargetRNC-ID
    
      - [Rev 30989](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30989) - [Bug 4247](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4247) - Fix type-field of protocol control frame
    
      - [Rev 30990](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30990) - Update the document icons
    
      - [Rev 31050](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31050) - [Bug 4255](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4255) - Give a warning for illegal preference names in lua scripts.
    
      - [Rev 31051](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31051) - [Bug 4258](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4258) - Compile fix for OpenBSD 4.5
    
      - [Rev 31071](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31071) - eDonkey "Request Parts" message has 1-3 offset start/end pairs.
    
      - [Rev 31096](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31096) - Correct OID for organizationalUnit.
    
      - [Rev 31115](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31115) - Fix EAP method type 25, 26 interpretation.
    
      - [Rev 31128](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31128) - Correct some optional ASN.1 DAP elements.
    
      - [Rev 31154](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31154) - Update User Guide: New Capture Options dialog; Add Remote Capture section.
    
      - [Rev 31160](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31160) - Add missing WTAP\_ENCAP\_DPNSS and WTAP\_ENCAP\_PACKETLOGGER to encap\_table\_base
    
      - [Rev 31172](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31172), [Rev 31173](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31173) - [Bug 4294](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4294)- Fix daintree-sna potential buffer overflow (crash ?)
    
      - [Rev 31175](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31175) - With revision [27279](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27279) the make part of revision [26467](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26467) has to be reverted too.
    
      - [Rev 31181](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31181) - Let c-ares actually resolve IPv6 addresses.
    
      - [Rev 31186](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31186) - Build correct oraddress for several X.411 Teletex values.
    
      - [Rev 31187](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31187) - [Bug 4301](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4301) - Fix a crash in the SMB dissector.
    
      - [Rev 31188](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31188) - Don't assert needlessly if [WinPcap](/WinPcap) is missing.
    
      - [Rev 31207](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31207) - Fix header field names containing dots.
    
      - [Rev 31208](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31208) - Make the check work on hexadecimal bitmasks.
    
      - [Rev 31221](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31221) - [Bug 4316](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4316) - Fix crash when using a custom RADIUS dictionary.
    
      - [Rev 31223](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31223) - [Bug 4319](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4319) - Fix crash in IPMI dissector when trying to display date/time (on Windows).
    
      - [Rev 31240](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31240) - [Bug 3801](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3801) - Fix timescale restoring RTP Graph Analysis.
    
      - [Rev 31244](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31244) - Fixes the check for types with the long extension format.
    
      - [Rev 31245](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31245) - Force 'svn info' command output as english for non-english Windows
    
      - [Rev 31246](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31246) - Adding prefs\_register\_protocol\_subtree to libwireshark.def
    
      - [Rev 31248](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31248) - Documentation fixes/improvements.
    
      - [Rev 31250](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31250) - VNC dissector fails to dissect properly the authentication
    
      - [Rev 31252](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31252) - [Bug 4288](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4288) - Fix Follow TCP Stream when multiple streams with same IP/ports are in the file.
    
      - [Rev 31254](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31254) - RTP Stream dialog should have the same duration formats in forward and reserved direction.
    
      - [Rev 31255](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31255) - Update platform, build and packaging information in WSDG.
    
      - [Rev 31256](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31256) - Add description on running and debugging your own build of Wireshark.
    
      - [Rev 31258](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31258) - Fix for a ulink element in Rev 31256.
    
      - [Rev 31257](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31257) - Update the library references in WSDG.
    
      - [Rev 31259](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31259) - Cleanup tapping section in WSDG.
    
      - [Rev 31263](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31263) - Update details about building and installing in WSUG.
    
      - [Rev 31273](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31273) - Fix the VNC Set Colormap Entries server message.
    
      - [Rev 31275](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31275) - Maintain a brave face in the absence of [WinPcap](/WinPcap).

## 1.2.4

Released: November 16, 2009 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.2.4.html)

Done:

  - Move over the following revisions:
      - [Rev 30744](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30744) - [Rev 30745](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30745) - Update SCTP ppids, fix a faulty \#define.
    
      - [Rev 30746](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30746) - Make X2AP dissection work.
    
      - [Rev 29969](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29969) - Fix bug in IE decoding.
    
      - [Rev 30747](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30747) - Documentation fix.
    
      - [Rev 30764](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30764) - Handle padded RTCP packets ending with SDES correct.
    
      - [Rev 30790](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30790) - Dissect DCERPC bind acks, if the bind request had more than 1 ctx.
    
      - [Rev 30809](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30809) - Add missing header fields in netflow dissector.
    
      - [Rev 30822](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30822) - Register by name.
    
      - [Rev 30823](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30823) - Check if we have a handle for "v110".
    
      - [Rev 30829](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30829) - Fix the property list.
    
      - [Rev 30846](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30846) - Don't crash if an interface description is empty.
    
      - [Rev 30855](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30855) - Fix parsing IPv4 header flags field.
    
      - [Rev 30953](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30953) - [Bug 4120](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4120) - Calculate amount of silence samples in samples/ms i.s.o. samples/s

## 1.2.3

Released: October 27, 2009 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.2.3.html)

Done:

  - Move over the following revisions:
      - [Rev 28658](http://anonsvn.wireshark.org/viewvc?view=rev&revision=28658) - Fixed check for no\_of\_bits in tvb\_get\_bits16(), tvb\_get\_bits32() and tvb\_get\_bits64().
    
      - [Rev 28691](http://anonsvn.wireshark.org/viewvc?view=rev&revision=28691) - Remove some "statement not reached" warnings.
    
      - [Rev 28840](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28840) [Rev 28841](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28841) - [Bug 2733](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2733) - DHCP Dissector displays negative lease time.
    
      - [Rev 29064](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29064) - [Bug 3689](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3689) - Possibly-unaligned dereference and big/little endian issue in packet-paltalk.c
    
      - [Rev 29381](http://anonsvn.wireshark.org/viewvc?view=rev&revision=29381) - Turn a comment in fast\_ensure\_contiguous() into a DISSECTOR\_ASSERT() to make the implied requirement explicit.
    
      - [Rev 29382](http://anonsvn.wireshark.org/viewvc?view=rev&revision=29382) - (Trivial change) move ensure\_contiguous() to reflect call hierarchy
    
      - [Rev 29412](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29412) - [Bug 3878](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3878) - Typos in diameter XML files.
    
      - [Rev 29432](http://anonsvn.wireshark.org/viewvc?view=rev&revision=29432) - Make mem chunk static
    
      - [Rev 29433](http://anonsvn.wireshark.org/viewvc?view=rev&revision=29433) - Add a missing DISSECTOR\_ASSERT in tvb\_init()
    
      - [Rev 29434](http://anonsvn.wireshark.org/viewvc?view=rev&revision=29434) - Use the slice allocator if GLIB \>= 2,10,0
    
      - [Rev 29441](http://anonsvn.wireshark.org/viewvc?view=rev&revision=29441) - Remove a non thread-safe usage (useful when/if we ever support threading) of a static tvbuff in tvb\_new\_real\_data(). The current version uses a static 'last\_tvb' to keep track of the last allocated tvbuff. This is needed because some of the function we call can throw an exception. This patch improves this strategy by throwing an exception (if needed) before we try to allocate the tvbuff. This way we avoid a memleak \_and\_ we don't have to track the 'last\_tvb' tvbuff.
    
      - [Rev 29442](http://anonsvn.wireshark.org/viewvc?view=rev&revision=29442) - Make some of the check\_XXX functions accept the length/reported length of the tvbuff as arguments instead the tvbuff. We'll need this feature in order to remove the non-thread usage of the 'last\_tvb' variable in tvb\_new\_subset()
    
      - [Rev 29443](http://anonsvn.wireshark.org/viewvc?view=rev&revision=29443) - Remove the non-thread safe usage of 'last\_tvb' variable in tvb\_new\_subset()
    
      - [Rev 29444](http://anonsvn.wireshark.org/viewvc?view=rev&revision=29444) - Remove unused parameters.
    
      - [Rev 29445](http://anonsvn.wireshark.org/viewvc?view=rev&revision=29445) - Add a new function, tvb\_new\_subset\_remaining(), which is a sligtly optimized version of tvb\_new\_subset().
    
      - [Rev 29844](http://anonsvn.wireshark.org/viewvc?view=rev&revision=29844) - offset\_from\_real\_beginning() is only called with 0 as second argument, so remove the argument completely.
    
      - [Rev 29914](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29914) - ssl\_association\_remove(): free assoc-\>info too.
    
      - [Rev 29917](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29917) - [Bug 3996](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3996) - Misspell in mcc\_mnc codes in packet-e212.c.
    
      - [Rev 29950](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29950) - Add info as to 32/64 bit and also if "Windows 7" to runtime version info.
    
      - [Rev 29977](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29977) - [Bug 4024](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4024) - Fix Win64 manifest issues.
    
      - [Rev 29979](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29979) - IPSec dissector could crash with decrypted payloads.
    
      - [Rev 29986](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29986) - [Bug 3542](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3542) - get\_dfs\_referral referral entry is not dissected correctly.
    
      - [Rev 29988](http://anonsvn.wireshark.org/viewvc?view=rev&revision=29988) - Remove 'type' formal parameter from tvb\_new\_with\_subset()
    
      - [Rev 30103](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30103) - [Bug 4046](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4046) - Fix type of FIP dissector header field hf\_fip\_desc\_map.
    
      - [Rev 30195](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30195) - [Bug 4064](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4064) - Fix memory leak.
    
      - [Rev 30208](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30208) - Crash in DCERPC NT.
    
      - [Rev 30274](http://anonsvn.wireshark.org/viewvc?view=rev&revision=30274) - g\_malloc0() doesn't return NULL so remove NULL error paths.
    
      - [Rev 30319](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30319) - [Bug 4053](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4053) - TCAP problem with indefinite length 'components' SEQ OF.
    
      - [Rev 30375](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30375) - [Bug 4095](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4095) - GSM MAP: an-APDU not decoded.
    
      - [Rev 30381](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30381) - Add "Drag and Drop entries..." message on Columns preferences page.
    
      - [Rev 29885](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29885) - [Bug 3417](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3417) - Don't scale the window if the SYN flag is set.
    
      - [Rev 29944](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29944) - [Bug 4017](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4017) - Fix decode of FPC and L1 Info in RSL
    
      - [Rev 29957](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29957) - [Bug 3848](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3848) - Fix decode of edonkey sourceOBFU
    
      - [Rev 30401](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30401) - Add CRC32 functions to libwireshark.def
    
      - [Rev 30468](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30468) - Add req\_resp\_hdrs\_do\_reassembly() to libwireshark.def
    
      - [Rev 30577](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30577) - FIP dissector VFID and Fabric Name descriptors are wrong
    
      - [Rev 30595](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30595) - Fix off-by-one potential crash in SMB
    
      - [Rev 30622](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30622) - WPS encodes Bool attributes as single-octet values.
    
      - [Rev 30640](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30640), [Rev 30652](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30652),[Rev 30665](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30665) - Update to [WinPcap](/WinPcap) 4.1.1.
    
      - [Rev 30667](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30667) - Do not make dialog windows transient to the Wireshark top level window on WIN32.
    
      - [Rev 30252](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30252) & [Rev 30532](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30532) - [Bug 4058](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4058) - Prime interesting fields when selecting a package, so Lua's [ProtoField](/ProtoField) can extract the field value correctly
    
      - [Rev 30681](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30681) & [Rev 30696](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30696) - [Bug 4158](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4158) - [PortableApps](/PortableApps) packaging updates.
    
      - [Rev 30698](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30698) - [Bug 4162](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4162) - Fix decode of edonkey sourceOBFU
    
      - [Rev 30702](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30702) - Fix memleaks while creating kademlia hash.
    
      - [Rev 30710](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30710) - [RelocationRequired](/RelocationRequired) incorrectly dissected.
  - Fix Memory Leaks: Replace use of GMemChunk by se\_alloc or (as noted) GSlice
    1.  [Rev 30481](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30481) - [Bug 2375](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2375) - NCP \[packet-ncp2222.inc\]
    
    2.  [Rev 30502](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30502) - Teamspeak2 \[packet-teamspeak2.c\]
    
    3.  [Rev 30505](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30505) - MGCP \[packet-mgcp.c\]
    
    4.  [Rev 30523](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30523) - SBus \[packet-sbus.c\]
    
    5.  [Rev 30522](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30522), [Rev 30524](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30524) - Radius \[packet-radius.c\]
    
    6.  [Rev 30526](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30526) - IRDA \]\[packet-irda.c\]
    
    7.  [Rev 30553](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30553) - \[stream.c\]
    
    8.  [Rev 30572](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30572) - ISAKMP \[packet=-isakmp.c\] \[GSlice\]

## 1.2.2

Released: September 15, 2009 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.2.2.html)

Done:

  - Move over the following revisions:
      - [Rev 28549](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28549) - [Bug 1740](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1740) - Set SIGPIPE handler every time the program starts.
    
      - [Rev 28589](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28589) - Restore the generation and display of LDAP DNs from RDN components.
    
      - [Rev 28849](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28849) - [Bug 3761](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3761) - Add the missing eap.xml file.
    
      - [Rev 28853](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28853) - Add missing tooltips in columns preferences.
    
      - [Rev 29145](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29145) - Fix columns preferences usability.
    
      - [Rev 29149](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29149) - Enhancement to E.212 MCC/MNC decoding(Mainly expanding value\_strings).
    
      - [Rev 29187](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29187), [Rev 29322](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29322) - Use g\_slice if glib \>=2.10 & Free frame data slice on file reset.
    
      - [Rev 29227](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29227) - Fix IPv6 addresses in URI.
    
      - [Rev 29234](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29234) - [Bug 3782](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3782) - Correctly track the Cert Authority hashes.
    
      - [Rev 29250](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29250) - [Bug 3792](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3792) - NAPTR RR (RFC 3403) replacement MUST be a fully qualified domain-name.
    
      - [Rev 29259](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29259) - [Bug 3800](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3800) - Correctly track the size of Feedback Control Information in Payload specific RTCP feedback packet.
    
      - [Rev 29260](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29260) - Addition to ZRTP cypher types (expanding value\_string only).
    
      - [Rev 29278](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29278) - Add a pointer check to SCCP.
    
      - [Rev 29285](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29285) - Add more pointer checks.
    
      - [Rev 29301](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29301) - Add pointer checks to H.225.
    
      - [Rev 29302](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29302) - [Bug 3806](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3806) - Add missing Block Ack Bitmap presentation.
    
      - [Rev 29306](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29306) - [Bug 3811](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3811) - Add missing shorthand application/vnd.ms-sync besides application/vnd.ms-sync.wbxml.
    
      - [Rev 29319](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29319) - 'if (curr\_len \<= 0)' won't work as desired when curr\_len is declared as unsigned.(gsm a).
    
      - [Rev 29334](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29334) - [Bug 3820](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3820) - Properly handle IPv6 No next header.
    
      - [Rev 29335](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29335) - Wireshark Portable: Avoid crash due to missing [WinPcap](/WinPcap).
    
      - [Rev 29337](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29337) - Fix display filter autocompletion for protocols using delayed field initialization.
    
      - [Rev 29364](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29364), [Rev 29366](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29366) - [Bug 3849](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3849) - Fix a crash in ERF file support.
    
      - [Rev 29385](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29385) - [Bug 3837](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3837) - Fix a bogus 802.11 assertion.
    
      - [Rev 29391](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29391) - [Bug 3693](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3693) - Restore the formatting of the saved graph.
    
      - [Rev 29392](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29392) - Fix memoryleak causing crash with long SSL traces.
    
      - [Rev 29394](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29394) - A typo in 2 of the field names causes the apn not to be displayed.
    
      - [Rev 29403](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29403) - [Bug 3893](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3893) - Fix crash due to an initialized dissector handle.
    
      - [Rev 29462](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29462) - Typo: parameter\_tvb to be used.
    
      - [Rev 29456](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29456) - [Bug 3963](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3963) - Fix the OpenBSD build.
    
      - [Rev 29457](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29457) - [Bug 3773](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3773) - Change window\_new() to dlg\_window\_new() and destroy the window with the top level window.
    
      - [Rev 29468](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29468) - Properly handle closing/destruction of RTP player window.
    
      - [Rev 29472](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29472) - [Bug 3915](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3915) - packet-gsm\_a\_rr.c: flip gsm\_a\_rr\_mv\_vals, 0 means vaild.
    
      - [Rev 29482](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29482) - "Missuse" of pinfo.
    
      - [Rev 29498](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29498) - Fix two bugs related to SCTP TSN graphs.
    
      - [Rev 29520](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29520) - Update list of PPIDs.(value\_string updates).
    
      - [Rev 29549](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29549) - [Bug 3889](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3889) - Minor errors in gsm rr dissectors
    
      - [Rev 29535](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29535), [Rev 29536](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29536) - [Bug 3675](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3675) - The proto,colinfo tap doesn't work if the INFO column isn't being printed.
    
      - [Rev 29598](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29598), [Rev 29599](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29599), [Rev 29600](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29600), [Rev 29601](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29601) - Minor Bug Fixes
    
      - [Rev 29641](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29641) - Workaround a bug in Mac OS X for 64-bit applications.
    
      - [Rev 29654](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29654) - [Bug 3913](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3913) - Free pointer array after calling proto\_find\_finfo()
    
      - [Rev 29491](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29491), [Rev 29656](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29656) - [Bug 3330](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3330) - Fix several memleaks
    
      - [Rev 29678](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29678) - This fixes a crash due to recent.gui\_time\_format being invalid (-1).
    
      - [Rev 29679](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29679) - [Bug 3640](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3640) - Saving config profiles on Windows crashes wireshark.
    
      - [Rev 29693](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29693) - [Bug 3901](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3901) - Dissect\_ccch does not dissect sys info content.
    
      - [Rev 29695](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29695), [Rev 29696](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29696), [Rev 29697](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29697), [Rev 29698](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29698) - Fix some drawing issues in TSN plots and add plotting of duplicate TSNs.
    
      - [Rev 29700](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29700) - [Bug 3946](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3946) - Incorrect station identifier parsing in Kingfisher dissector.
    
      - [Rev 29719](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29719) - [Bug 3640](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3640) - Update main pane geometry correctly after changing profile, a bug introduced in r28918.
    
      - [Rev 29726](http://anonsvn.wireshark.org/viewvc?view=rev&revision=29726), [Rev 29727](http://anonsvn.wireshark.org/viewvc?view=rev&revision=29727) - [Bug 3984](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3984) - Don't pass ep\_alloc()'ed strings to col\_set\_str().
    
      - [Rev 29787](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29787) - Bug in H.248 decoding
    
      - [Rev 29813](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29813) - [Bug 3986](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3986) - Large loop in [OpcUa](/OpcUa).
    
      - [Rev 29814](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29814) - [Bug 3987](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3987) - Option Request option values are in 16 bit units.
    
      - [Rev 29830](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29830) - Fix the ChmodBPF startup item to work.
    
      - [Rev 29831](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29831) - Add a note about a Snow Leopard bug to the README.macosx file.
    
      - [Rev 29839](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29839) - Fix handling of the bearer control unit identifier.
    
      - [Rev 29843](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29843) - [Bug 3890](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3890) - Fix bug in WPA decryption.
    
      - [Rev 29847](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29847) - Correct endianness of TI CC24xx FCS bitmasks.
    
      - [Rev 29881](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29881) - [Bug 2767](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2767) - Fix dumpcap crash when user hits Ctrl-C
    
      - [Rev 29886](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29886), [Rev 29903](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29903) - OS X dmg Finder window tweaks.
    
      - [Rev 29906](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29906) - [Bug 4008](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4008) - Fix crash on TLSv1.2 packets

## 1.2.1

Released: July 20, 2009 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.2.1.html)

Done:

  - Move over the following revisions:
      - [Rev 28768](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28768) - [Bug 3539](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3539) - Fix for reading pcapng files.
    
      - [Rev 28769](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28769), [Rev 28773](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28773) and [Rev 28803](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28803) - hf declaration fixes(do not regenerate asn1 files unless needed).
    
      - [Rev 28774](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28774) - [Bug 2541](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3541) - ANSI MAP legInformation BER Error.
    
      - [Rev 28796](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28796) and [Rev 28810](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28810) - Change window\_new() to dlg\_window\_new() and destroy the window with the top level window.
    
      - [Rev 28801](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28801) - [Bug 3559](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3559) - Don't let the index run over the array boundary.
    
      - [Rev 28808](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28808) - Don't crash on reading packetlogger files.
    
      - [Rev 28815](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28815) - [Bug 3564](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3564) - Fix a crash in AFS.
    
      - [Rev 28818](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28818) - Fix ICMPv6 RA parsing.
    
      - [Rev 28822](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28822) - Diameter xml updates.
    
      - [Rev 28837](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28837) - [Bug 3555](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3555) - Fix "Wireshark crashes when no Ethernet Connected": Cancel hostname lookup timers if c-ares is not initialized.
    
      - [Rev 28838](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28838) - Ensure dct3trac packets never longer than 23 bytes.
    
      - [Rev 28839](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28839) - Removed a tvb\_free() to avoid a crash.
    
      - [Rev 28850](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28850) - [Bug 3565](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3565) - Wireshark crashes when reading a pcapng file.
    
      - [Rev 28852](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28852) - [Bug 2200](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2200) - Back out r28452, which is causing errors when reading from pipes.
    
      - [Rev 28857](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28857) - [Bug 3560](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3560) - Wireshark does not handle pseudo headers when reading a pcapng file.
    
      - [Rev 28858](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28858) - Wireshark can convert pcapng files to pcap when all interfaces use the same encapsulation.
    
      - [Rev 28859](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28859) - Wireshark can write pcapng files using one encapsulation type which makes use of pseudo headers.
    
      - [Rev 28860](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28860) - [Bug 3590](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3590) - 802.11 decryption is broken.
    
      - [Rev 28862](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28862) - Wireshark can write pcapng files using multiple encapsulation types.
    
      - [Rev 28863](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28863) - Cleanup of pcap-common and pcapng code.
    
      - [Rev 28864](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28864) - Cleanup of pcapng code.
    
      - [Rev 28865](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28865) - Fix a bug in reading of pcap files introduced in r28863.
    
      - [Rev 28866](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28866) - [Bug 3620](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=%203620) - Wireshark can convert pcap files generated by text2pcap to pcapng.
    
      - [Rev 28868](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28868) - Stop loading of pcapng files with multiple section header blocks.
    
      - [Rev 28873](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28873) - [Bug 3556](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3556) - The title in the TCP sequence graphs is too short.
    
      - [Rev 28874](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28874) and [Rev 28876](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28876) - [Bug 3627](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3627) - Replace obsolete methods by pkg-config method for GNU TLS configuration
    
      - [Rev 28880](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28880) - [Bug 3547](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3547) - Fix to ensure [WiresharkPortable](/WiresharkPortable) uses the correct Win`  `Pcap.
    
      - [Rev 28884](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28884) - [Bug 3572](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3572) - Fix crash in btl2cap dissector: Handle malformed SDU length in L2CAP I-frame
    
      - [Rev 28886](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28886) - Fix a couple of [AirPcap](/AirPcap) channel/offset bugs
    
      - [Rev 28891](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28891) - [Bug 3578](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3578) - Fix crash caused by packet-radius.c attribute list/pair incorrect error handlling
    
      - [Rev 28963](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28963) - [Bug 3652](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3652) - Fuzz testing crash / dissector bug in MIOP
    
      - [Rev 28897](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28897) - [Bug 3570](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3570) - Fix excessive CPU usage in sFlow.
    
      - [Rev 28908](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28908) - Fix decryption key entry.
    
      - [Rev 28917](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28917) - Make it compile on AIX.
    
      - [Rev 28918](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28918) - [Bug 3640](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3640) - Fix crash when changing from a profile with a moved time column.
    
      - [Rev 28920](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28920) - [Bug 3530](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3530) - Create a temporary directory for IP map files.
    
      - [Rev 28924](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28924) - [Bug 3645](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3645) - Show correct error message when reading btsnoop files with unsupported datalink types.
    
      - [Rev 28925](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28925) - Further improve the error messages for reading btsnoop files with unsupported datalink types.
    
      - [Rev 28931](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28931) - [Bug 3536](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3536) - Fix crashes in the filter dialog and filter toolbar when referencing a "range-string" field type.
    
      - [Rev 28937](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28937) - [Bug 3651](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3651) & [Bug 3635](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3635) - Fix processing of radius 'vendor specific attributes'
    
      - [Rev 28939](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28939) - [Bug 3654](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3654) - ANSI ISUP Cause indicators with coding standard=ANSI fail to dissect.
    
      - [Rev 28947](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28947) - [Bug 3648](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3648) - Decode error for network-id in BICC BCU-ID
    
      - [Rev 28957](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28957) - [Bug 3328](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3328) - CFLOW decoding is wrong for IPv6 fields.
    
      - [Rev 28969](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28969) - [Bug 3656](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3656) - Wrong field position in [PacketCable](/PacketCable) Multimedia Extended Classifier
    
      - [Rev 29007](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29007) - Add missing packaging file (according to Debian Policy Manual)
    
      - [Rev 29008](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29008) - Fix Debian packaging control file
    
      - [Rev 29009](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29009) - Fix Debian packaging rules file
    
      - [Rev 29033](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29033) - Remove hint of name resolution when it's not there.
    
      - [Rev 29034](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29034) - Pop the welcome header when we are finished capture without updating packet list in real time, so we get back to the welcome screen when closing the file.
    
      - [Rev 29037](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29037) and [Rev 29046](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29046) - Diameter XML updates.
    
      - [Rev 29047](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29047) - [Bug 3684](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3684) - SNMP cannot be decoded in case of appended data to message
    
      - [Rev 29048](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29048) - [Bug 3650](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3650) - IEC 60870-5-104 dissector decodes nothing
    
      - [Rev 29051](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29051) - [Bug 3694](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3694) - Use correct length for "Version OD Calling" in FF.
    
      - [Rev 29060](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29060) - [Bug 3493](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3493) - Fix DICOM object export.
    
      - [Rev 29063](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29063) - [Bug 3642](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3642) - Analyze-\>Decode as... menu item becomes unavailable in some situations.(Ethernet-PW)
    
      - [Rev 29077](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29077) - [Bug 3711](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3711) - APDU incorrectly dissected(BSSLAP Protocol Not Decoded In BSSMAP-LE Messages).
    
      - [Rev 29082](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29082) - [Bug 3703](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3703) - hci\_h4: Optimize column/field handling
    
      - [Rev 29083](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29083) - [bug 3609](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3609) - SMB2 Error Response doesn't decode properly.
    
      - [Rev 29085](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29085) - [Bug 3700](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3700) - Fix 802.11 SSID length handling.
    
      - [Rev 29086](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29086) - [Bug 3705](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3705) - Handle tvb decompression failures in GIOP.
    
      - [Rev 29088](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29088) - [Bug 3723](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3723) - The description of tshark -t dd is missing from tshark.pod.
    
      - [Rev 29089](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29089) - Further "-t" documentation fixes.
    
      - [Rev 29095](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29095) - [Bug 3652](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3652) - ZIOP cleanups.
    
      - [Rev 29052](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29052) - More Diameter XML updates.
    
      - [Rev 29124](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29124) - [Bug 3733](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3733) - Problem in packet-per.c for ASN.1 PER Encoding.
    
      - [Rev 29123](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29123) - Initialize data in RSVP.
    
      - [Rev 29126](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29126) - [Bug 3438](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3438) - Allocate address memory correctly in RSVP.
    
      - [Rev 29128](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29128) - Fix a reassembly length check.
    
      - [Rev 29135](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29135) - Set the extension channel correctly in the wireless toolbar.

## 1.2.0

Released: June 15, 2009 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.2.0.html)

Done:

  - Move over the following revisions:
      - [Rev 28502](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28502) - [Bug 1427](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1427) - Changed button label to "Quit without Saving" from "Continue without Saving" when exiting Wireshark. The original label could confuse users and it would be great to have this clarification in 1.2.
    
      - [Rev 28503](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28503) - [Bug 3483](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3483) - Throttle splash screen updates when running remote.
    
      - [Rev 28509](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28509) - Detect if the setup channel is video or not. A step towards different RTP analysis for video and audio. ([Bug 165](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=165) and [Bug 269](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=269))
    
      - [Rev 28513](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28513) - [Bug 3496](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3496) - Fixes to packet packet-zbee-security.c compile when HAVE\_LIBGCRYPT is not set
    
      - [Rev 28513](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28513) - Include profinet plugin in PLUGINS symbol
    
      - [Rev 28525](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28525) - Update the version number in the documentation.
    
      - [Rev 28526](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28526) - Update the logo in the documentation.
    
      - [Rev 28527](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28527) - Update the library tags.
    
      - [Rev 28534](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28534), [Rev 28536](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28536) and [Rev 28552](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28552) - iax2 analysis: Fix the save\_as functions so they work (including work-around when save-as raises an alert box) and more ...
    
      - [Rev 28535](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28535) and [Rev 28542](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28542) - List TLS Cipher Suites also for SSLv2 Client Hellos in compatibility mode.
    
      - [Rev 28546](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28546) - Calculate jitter and delta in ms.
    
      - [Rev 28551](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28551) and [Rev 28553](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28553) - Same as 28534 & etc for RTP Analysis.
    
      - [Rev 28550](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28550) - [Bug 3361](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3361) - Resolve a crash issue in the filter bar when having a function on the RHS which does not return the same type as the LHS.
    
      - [Rev 28554](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28554) - flow\_graph & etc: Fix some graph 'save dialog' issues.
    
      - [Rev 28555](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28555) and [Rev 28556](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28556) - [Bug 3429](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3429) - Downgrade a g\_assert() to a proper if statement to avoid a crash.
    
      - [Rev 28560](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28560) and [Rev 28569](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28569) - Show max and mean Jitter (as Tshark does).
    
      - [Rev 28574](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28574) and [Rev 28600](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28600) - follow\_stream: Fix some 'save dialog' issues.
    
      - [Rev 28577](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28577) - main\_proto\_draw \[File\!Export\!Selected Packet Bytes\]: Fix some 'save dialog' issues.
    
      - [Rev 28584](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28584) - Get rid of extra newlines in error messages.
    
      - [Rev 28592](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28592) - [Bug 2504](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2504) - Quick fix to sync expert\_tapdata\_s.
    
      - [Rev 28597](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28597) - rtp\_stream: Fix some 'save dialog' issues.
    
      - [Rev 28605](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28605) - [Bug 3504](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3504) - Fix concurrent name resolution for c-ares.
    
      - [Rev 28606](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28606) and [Rev28611](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28611) - Calculate skew and clock drift, make it possible to copy the label.
    
      - [Rev 28607](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28607) - [Bug 3501](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3501) - Fix handling of pseudo-headers when doing random-access capture file reads.
    
      - [Rev 28608](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28608) - io\_stats save & firewall rules save: Fix some 'save dialog' issues.
    
      - [Rev 28609](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28609) - Fixed the type for key\_len in dissect\_key() in memcache.
    
      - [Rev 28618](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28618) - Fixed pod errors in man pages.
    
      - [Rev 28620](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28620) - [Bug 3505](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3505) - Fixed bit position for wlan\_mgt.fixed.delba.param.initiator.
    
      - [Rev 28621](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28621), [Rev 28622](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28622), [Rev 28623](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28623), [Rev 28624](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28624) and [Rev 28625](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28625) - Use liblua by default, if available.
    
      - [Rev 28629](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28629) - Unit is now in ms.
    
      - [Rev 28633](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28633) - Lua fix in value\_string\_from\_table()
    
      - [Rev 28636](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28636) - Added missing element to expert info group table.
    
      - [Rev 28637](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28637) - Changed expert info group for Lua errors.
    
      - [Rev 28640](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28640) - [Bug 3509](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3509) - Use correct type to avoid DISSECTOR\_ASSERT\_NOT\_REACHED.
    
      - [Rev 28642](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28642) - Support NR-SACKS, fix crashes in TSN analysis.
    
      - [Rev 28648](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28648) - Handle Detach and Service request, make it possible to set direction on link(UL/DL).
    
      - [Rev 28649](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28649) - Add time stamp to the list and bug fixes.
    
      - [Rev 28653](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28653) - Check for pcap-config script and use it if found (works better with libpcap 1.x, especially upcoming versions).
    
      - [Rev 28659](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28659) and [Rev 28660](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28660) - Enable some filter syntax validation.
    
      - [Rev 28664](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28664) - If we find a pcap-config script, check whether it's the broken libpcap 1.0 script and don't use it if it is.
    
      - [Rev 28670](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28670) - FIXED: "Home" and "End" keys don't work when editing a filter in the filter toolbar
    
      - [Rev 28671](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28671) - Update services
    
      - [Rev 28672](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28672) - Register Radius to a missing port (UDP 3799 from RFC3576)
    
      - [Rev 28675](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28675) - Disable interface details for adapters that don't support it.
    
      - [Rev 28679](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28679) - [Bug 3520](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3520) - From revision 00 to revision 01 the tlv values changed for the SCS TLV's.
    
      - [Rev 28681](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28681) - Bug fix in the filter autocomplete popup.
    
      - [Rev 28683](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28683) and [Rev 28684](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28684) - Upgrade KFW to 3.2.2.
    
      - [Rev 28687](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28687) and [Rev 28690](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28690) - [Bug 3508](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3508) - Fix a performance issue in filter autocomplete.
    
      - [Rev 28686](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28686) - Update the Win32 GTK+/GLib libraries.
    
      - [Rev 28689](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28689) - Update GNUTLS on Win32.
    
      - [Rev 28700](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28700) - Update Lua menu defines and put Lua functions in Tools.
    
      - [Rev 28696](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28696) - [Bug 3524](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3524) - Fixed interface id on writing pcapng files.
    
      - [Rev 28704](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28704) - Make Windows transient to main window and destoyed with it.
    
      - [Rev 28705](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28705) - [Bug 3525](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3525) - GTPv2 IE names incorrect/incomplete.
    
      - [Rev 28706](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28706) - Updates to June spec. version.
    
      - [Rev 28712](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28712) - Don't crash in ptvcursor API when called with a NULL tree.
    
      - [Rev 28719](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28719) - [Bug 3532](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3532) - Reset the detail pane protocol preferences menu on profile switching.
    
      - [Rev 28720](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28720) - [Bug 3511](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3511) - Prevent duplicate header field registrations in RADIUS.
    
      - [Rev 28721](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28721) - [Bug 3533](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3533) - Using 'ptr' after it is deallocated / released
    
      - [Rev 28736](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28736) - .pcapng files can use per packet encapsulation.
    
      - [Rev 28740](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28740) - Added missing pcap-ng support in GUI.
    
      - [Rev 28752](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28752) - Avoid a crash in the summary dialog when using pcap-ng files.

---

Imported from https://wiki.wireshark.org/Development/Trunk-1.2 on 2020-08-11 23:13:16 UTC
