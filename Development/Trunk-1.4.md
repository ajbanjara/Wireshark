# Past 1.4 Releases

For upcoming releases, see [Development/Roadmap](/Development/Roadmap).

## 1.4.15

Released: August 15, 2012 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.4.15.html)

Done:

  - Move over the following revisions:
      - [Rev 44111](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44111), [Rev 44112](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44112), [Rev 44113](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44113), [Rev 44117](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44117) - [Bug 7498](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7498) - Crash in NFS dissector when "file\_name\_snooping" & "file\_full\_name\_snooping" preferences enabled.
    
      - [Rev 43149](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43149) - [Bug 7562](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7562) - Fix EtherCAT Mailbox crash.
    
      - [Rev 44247](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44247) - [Bug 7566](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7566) - Fix dcp-etsi divide-by-zero error.
    
      - [Rev 44289](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44289) - [Bug 7571](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7571) - Fix XTP crash.
    
      - [Rev 44312](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44312) - [bug 7570](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7570) - Check CIP MSP packets for number of services overruns.
    
      - [Rev 44317](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44317) - [Bug 7603](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7603) - Large loop in the AFP dissector.
    
      - [Rev 44320](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44320) - [Bug 7568](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7568) - Fix RTPS2 crash.
    
      - [Rev 44366](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44366) - [Bug 7569](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7569) - Fix STUN crash.
    
      - [Rev 44403](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44403) - [Bug 7573](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7573) - Large loop in the CTDB dissector.
    
      - [Rev 44476](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44491) - Fix memcpy in Bluetooth L2CAP.
    
      - [Rev 44491](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44491) - Fix subtle g\_strdup\_printf() memory leaks.
    
      - [Rev 44500](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44500) - Update SCTP PPID table.

## 1.4.14

Released: July 24, 2012 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.4.14.html)

Done:

  - Move over the following revisions:
      - [Rev 43501](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43501) - [Bug 7021](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7021) - Don't fill in an error message unless pcap\_open() actually fails
    
      - [Rev 43139](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43139) - [Bug 7340](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7340) - Netscreen - can't parse packet-header when interface name contain hyphen
    
      - [Rev 43172](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43172), [Rev 43173](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43173) - Don't use Windows [FormatMessage](/FormatMessage)() unsafely
    
      - [Rev 43174](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43174) - [Bug 5241](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5241) - Cannot run tshark under tcp using decode-as format for syslog
    
      - [Rev 43179](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43179) - Do not use BASE\_NONE for FT\_\*INT\* types.
    
      - [Rev 43187](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43187) - [Ask 11798](http://ask.wireshark.org/questions/11798) - Fix UDP-Lite checksum verification.
    
      - [Rev 43191](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43191) - Remove a duplicate entry from the AUTHORS list
    
      - [Rev 43212](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43212) - [Bug 6917](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6917) - Use ".", not ",", as the decimal point in floating-point values in filter expressions
    
      - [Rev 43224](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43224) - Note in README.developer that calls to "expert" functions should not be under 'if (tree)'
    
      - [Rev 43277](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43277) - Draw protocol tree in proper [GtkTreeView](/GtkTreeView).
    
      - [Rev 43561](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43561) - [Bug 7427](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7427) - Link Wireshark with @GLIB\_LIBS@, as @GTK\_LIBS@ doesn't necessarily include all the GLib libraries needed by Wireshark
    
      - [Rev 43576](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43576) - [Bug 7436](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7436) - Make nfs dissection not depend on tree construction.
    
      - [Rev 43784](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43784) - [Debian Bug 680056](http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=680056) - Crash in PPP dissector
    
      - [Rev 43850](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43850) - Add some relevant ethertypes

Not Done:

  - Move over the following revisions:
      - [Rev 42899](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42899) - [Bug 5735](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5735) - Unable to reassemble EAP-TLS fragments across multiple RADIUS packets -- *Doesn't apply to 1.4 (even though the bug refers to that version)*

## 1.4.13

Released: May 22, 2012 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.4.13.html)

Done:

  - Move over the following revisions:
      - [Rev 42114](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42114), [Rev 42116](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42116) - [Bug 7122](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7122) - Fixes Bluetooth HCI event infinite loop
    
      - [Rev 42328](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42328) - Set up Wireshark to handle pcap-ng files on OS X
    
      - [Rev 42329](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42329) - Set up Wireshark to handle pcap-ng files with a .ntar suffix on Windows
    
      - [Rev 42330](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42330) - Include .ntar as a suffix for pcap-NG files and include .dmp as a suffix for pcap files
    
      - [Rev 42407](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42407),[Rev 42431](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42431) - [Bug 7221](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7221) - Fix emem allocation alignment on SPARC (and other such CPUs)
    
      - [Rev 41937](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41937), [Rev 41938](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41938), [Rev 41941](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41941) - [Bug 6922](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6922) - Work around [WinPcap](/WinPcap) bug where it returns an error but leaves junk in the error message string
    
      - [Rev 41995](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41995) - [Bug 7043](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7043) - Set the minimum length of the Internet Timestamp option to 4 bytes.
    
      - [Rev 42108](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42108) - [Bug 7130](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7130) - Use right names for items in a DNS CERT RR
    
      - [Rev 42120](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42120) - Fix handling of one 5View file error, and update the name of the company from whom the 5View stuff came (and it's apparently "5View", not "5Views"); fix is from the 1.6 branch
    
      - [Rev 42129](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42129) - [Bug 7119](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7119) - ANSI MAP infinite loop
    
      - [Rev 42144](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42144) - Don't byte swap bytes past the end of the packet data in Cisco Secure IDS IP logs
    
      - [Rev 42200](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42200) - Fix packet-diameter bug which tries to allocate too much memory when an unknown vendor is encountered.
    
      - [Rev 42388](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42388) - [Bug 6779](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6779) - User-Password - PAP decoding passwords longer than 16 bytes
    
      - [Rev 41741](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41741) - [Bug 6983](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6983) - [Bug 7118](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7118) - 802.3 infinite loop
    
      - [Rev 42203](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42203) - [Bug 7121](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7121) - BACapp infinite loop
    
      - [Rev 42121](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42121) - [Bug 7124](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7124) - Fixes LTP infinite loop
    
      - [Rev 42122](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42122) - [Bug 7125](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7125) - R3 infinite loop

## 1.4.12

Released: March 27, 2012 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.4.12.html)

Done:

  - Move over the following revisions:
      - [Rev 39873](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39873) - [Ask 8649](http://ask.wireshark.org/questions/8649) - Thou shalt not use proto\_tree\_add\_string() with an FT\_BYTES field.
    
      - [Rev 40508](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40508) - [Bug 6735](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6735) - Properly set the per-packet encapsulation on a seek-and-read on a K12 text file
    
      - [Rev 40616](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40616) - [Bug 6687](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6687) - Avoid a potential infinite loop by stopping dissection when a message has no tlvblock.
    
      - [Rev 40644](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40644) - [Bug 5687](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5687) - Some PGM options are not parsed correctly.
    
      - [Rev 40727](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40727) - [Bug 6766](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6766) - Fix incorrect usage of g\_ascii\_strdown() (don't port over the epan/wslua/wslua\_proto.c changes, they don't apply to 1.4)
    
      - [Rev 40769](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40769) - Disable the Save-As button in the toolbar if we cannot save the file.
    
      - [Rev 40911](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40911) - [wireshark-user 14477](http://article.gmane.org/gmane.network.wireshark.user/14477) - Update the documentation to match the sort order.
    
      - [Rev 40927](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40927) - Disable the File-\>Merge... menu item if we cannot save the file.
    
      - [Rev 40944](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40944) - [Bug 6815](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6815) - Don't get strings with tvb\_get\_ptr() in IAX2.
    
      - [Rev 37856](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37856),[Rev 40949](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40949),[Rev 40950](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40950) - [wireshark-devel 24846](http://article.gmane.org/gmane.network.wireshark.devel/24846) - Correctly display the TCP flags and allow tcp.flags filtering to work properly without potentially causing a crash.
    
      - [Rev 40962](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40962) - [Bug 6823](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6823) - Pass pinfo as an argument rather than as a global variable
    
      - [Rev 41008](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41008) - [Bug 6804](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6804) - Fix underflow/crash when loading corrupt WTAP\_ENCAP\_ERF PCAP file.
    
      - [Rev 41025](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41025) - [Bug 6765](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6765) - When handing off from HTTP to a dissector for the entity body, if we have a media type, use it to determine the subdissector before trying other means
    
      - [Rev 41030](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41030) - ERF TYPE\_PAD records don't necessarily have payload, so don't treat one that doesn't as an error
    
      - [Rev 41037](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41037), [Rev 41097](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41097), [Rev 41098](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41098), [Rev 41100](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41100), [Rev 41130](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41130) - [Bug 6846](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6846) - Don't reject pcap-NG blocks with options longer than 100 bytes
    
      - [Rev 41036](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41036) - [Bug 6847](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6847) - Fix DTLS decryption
    
      - [Rev 41057](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41057) - [Bug 6833](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6833) - Handle too-large pointer values in MPEG-2 Transport Stream packets
    
      - [Rev 41143](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41143), [Rev 41145](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41145), [Rev 41152](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41152) - Check for pcap-NG blocks with a too-small block length (do this by moving [Rev 41153](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41153) from the 1.6 branch - that rev involves manual intervention needed in the 1.6 and 1.4 branches)
    
      - [Rev 41272](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41272) - [Bug 6891](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6891) - Don't abort if Expression dialog user selects a predefined value which happens to be BASE\_DEC\_HEX or BASE\_HEX\_DEC.
    
      - [Rev 41348](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41348) - [Bug 5939](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5939) - Fix reading from pipe/stdin
    
      - [Rev 41718](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41718) - [Bug 6972](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6972) - ISAKMP : VendorID [CheckPoint](/CheckPoint) : Malformed Packet (Wrong minimum Length)
    
      - [Rev 41734](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41734) - [Bug 6232](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6232) - No error for UDP/IPv6 packet with zero checksum

### Not Done

  - Move over the following revisions:
      - [Rev 41333](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41333) - Check for non-null-terminated names in NRB records, handle large NRB records -- *Does not exist in 1.4*

## 1.4.11

Released: January 11, 2012 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.4.11.html)

Done:

  - Move over the following revisions:
      - [Rev 39719](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39719) - [Bug 6537](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6537) - Revert [Rev 39665](http://anonsvn.wireshark.org/viewvc?view=revision&revision=39665) from [Bug 6472](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6472).
    
      - [Rev 39744](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39744) - [Bug 5575](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5575) - Fix memory errors in Lua dissectors.
    
      - [Rev 39748](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39748) & [Rev 39749](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39749) - No return within a TRY/CATCH/ENDTRY.
    
      - [Rev 39777](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39777) - Reset protocol preferences to default before loading a new profile
    
      - [Rev 39754](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39754) - [Bug 6548](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6548) - 80211 QoS Control: Add Raw TID
    
      - [Rev 39779](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39779) & [Rev 39999](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39999) - [Bug 6555](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6555) - CAPWAP dissector tries to allocate -1 bytes of memory during reassembly.
    
      - [Rev 39831](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39831) - [Bug 6564](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6564) - Add more length checks for integer values in SNMP variable bindings
    
      - [Rev 39834](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39834) - [Bug 6570](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6570) - The Originator protocol identifier is not present in the "provisioning actions operation -61".
    
      - [Rev 39902](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39902) - [Bug 6503](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6503) - Wireshark crashes if a field of type BASE\_CUSTOM is applied as a column
    
      - [Rev 39886](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39886) - [Bug 6578](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6578) - Fix time stamp handling for Network Monitor 2.x-format files
    
      - [Rev 39930](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39930) - Don't try to write packets with unsupported encapsulations to pcap-NG files
    
      - [Rev 39944](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39944) - Don't try to write packets with unsupported encapsulations to Tektronix K12 text output files
    
      - [Rev 39959](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39959) - [Bug 3046](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3046) - "Closing File\!" Dialog Hangs
    
      - [Rev 39878](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39878), [Rev 39882](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39882), [Rev 39883](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39883), [Rev 39884](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39884), [Rev 39885](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39885), [Rev 39894](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39894), [Rev 39895](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39895) - [Bug 6578](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6578) - Prevent some crashes with times that can't be handled by localtime()/gmtime()/ctime()/etc.
    
      - [Rev 39961](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39961),[Rev 39963](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39963),[Rev 39986](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39986) - [Bug 6561](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6561) - IPv4 UDP/TCP Checksum incorrect if routing header present.
    
      - [Rev 40075](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40075) - [Bug 6643](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6643) - Don't dissect an "April 1 RFC" TCP option; the option is officially unassigned and some people use it for their own experimental purposes
    
      - [Rev 40076](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40076) - [Bug 6560](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6560) - IPv6 UDP/TCP Checksum incorrect if routing header present with 0 segments left
    
      - [Rev 40097](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40097), [Rev 40099](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40099) (from 1.6 branch, not trunk) - [Ask 5826](http://ask.wireshark.org/questions/5826), [Ask 7618](http://ask.wireshark.org/questions/7618) - Report errors in Wireshark when trying to get the capabilities of an interface
    
      - [Rev 40130](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40130) - fix for [Rev 38723](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38723), some BGP AS\_PATH packets were no longer dissected
    
      - [Rev 40133](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40133) - [Bug 6649](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6649) - [ZigBee](/ZigBee) ZCL Dissector reports invalid status
    
      - [Rev 40138](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40138) - Don't use pcap\_version\[\]; on most platforms it doesn't give the version with which the program was compiled, and it can cause other problems
    
      - [Rev 40153](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40153),[Rev 40154](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40154),[Rev 40155](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40155) - [Bug 6250](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6250) - If the http object to be exported has no filename, use a generic "object" name instead. This avoids a Wireshark crash while still allowing the user to export the object.
    
      - [Rev 40158](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40158) - Allow for true error reporting on Windows setup.
    
      - [Rev 40162](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40162),[Rev 40184](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40184) - [Bug 3809](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3809) - Add missing \</field\> for data tree.
    
      - [Rev 40164](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40164) - [Bug 6663](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6663) - Clamp packet reported length at G\_MAXINT to avoid crashes
    
      - [Rev 40165](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40165) - [Bug 6666](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=%206666) - Check for too-large packets in 5View files
    
      - [Rev 40166](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40166) - [Bug 6667](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=%206667) - Check for too-large packets in i4b files
    
      - [Rev 40167](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40167) - [Bug 6668](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=%206668) - Check for too-large packets, and some other problems, in iptrace files
    
      - [Rev 40168](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40168), [Rev 40174](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40174) - [Bug 6669](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=%206669) - Limit the maximum frame table size in Network Monitor files
    
      - [Rev 40169](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40169) - [Bug 6670](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=%206670) - Check for bad record sizes in LANalyzer files
    
      - [Rev 40170](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40170) - Check for too-large packets in \*Peek-ng, nettl, and Apple Bluetooth [PacketLogger](/PacketLogger) files
    
      - [Rev 40194](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40194) - [Bug 6634](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6634) - Report a dissector bug, rather than crashing, for NULL arguments to some routines
    
      - [Rev 40195](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40195), [Rev 40196](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40196) - [Bug 6634](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6634) - Don't bother looking at the destination link-layer address, correctly handle the source link-layer address
    
      - [Rev 40245](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40245) - [Bug 5727](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5727) - Restrict TFTP conversation once the second port is known.
    
      - [Rev 40266](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40266),[Rev 40275](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40275) - [Bug 6391](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6391) - Avoid a potential buffer overflow
    
      - [Rev 40274](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40274) - Fix mapping of Wiretap encapsulations to per-file-type encapsulations
    
      - [Rev 40280](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40280),[Rev 40281](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40281) - [Bug 6562](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6562) - Incorrect Parsing of SCPS Capabilities Option introduced in response to [Bug 6194](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6194) with [Rev 38326](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38326)
    
      - [Rev 40304](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40304) - [Bug 5580](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5580) - Only update the time elapsed between the previous displayed packet and this packet if the packet is actually displayed.
    
      - [Rev 40316](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40316), [Rev 40317](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40317) - Force DEP+ASLR in our DLLs.
    
      - [Rev 40353](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40353) - Happy new year
    
      - [Rev 40387](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40387) - [Bug 6711](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6711) - Length field of pseudo header while computing UDP checksum is not correct
    
      - [Rev 40423](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40423) - [Bug 6719](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6719) - pcapio.c: bug in libpcap\_write\_interface\_description\_block

## 1.4.10

Released: November 1, 2011 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.4.10.html)

Done:

  - Move over the following revisions:
      - [Rev 36246](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36246) - Close fp in error case in ssl\_parse\_key\_list to avoid leakage. (Coverity 597)
    
      - [Rev 38948](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38948) - [Ask 6207](http://ask.wireshark.org/questions/6207) - Fix locale problem with "Rel Start" time
    
      - [Rev 38967](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38967) - [Bug 4109](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4109) - Timestamp Sequence Field in Bundle Protocol fails if over 32 bits.
    
      - [Rev 38977](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38977) - [Bug 6336](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6336) - BACnet property time-synchronization-interval (204) name shown incorrectly as time-synchronization-recipients
    
      - [Rev 39017](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39017) - [Bug 6347](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6347) - Incorrect decoding of BIT STRING type
    
      - [Rev 39031](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39031) - [Bug 3778](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3778) - Wrong PCEP XRO sub-object decoding
    
      - [Rev 39061](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39061), [Rev 39062](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39062), [Rev 39080](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39080) - [Bug 6362](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6362) - Increase maximum number of identically named objects to be exported from 10 to 1000 and turn off error dialog boxes.
    
      - [Rev 39213](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39213) - Always update splash screen when action has changed.
    
      - [Rev 39214](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39214) - Added register action for loading Lua plugins.
    
      - [Rev 39221](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39221) - [Bug 5431](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5431) - Removed the protocol registration updates in the splash screen for Python dissectors.
    
      - [Rev 39234](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39234) - [Bug 6414](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6414) - Incorrect identification of UDP-encapsulated NAT-keepalive packets.
    
      - [Rev 39248](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39248) & [Rev 39251](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39251) & [Rev 39258](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39258) & [Rev 39267](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39267) & [Rev 39268](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39268) - [Bug 6241](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6241) - Fixed reallocation of UAT for custom headers.
    
      - [Rev 39266](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39266) - [Bug 1710](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1710) - Assertion failed when doing File-\>Quit-\>Save during live
    
      - [Rev 39277](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39277) - Fix tshark -z conv,ipv6\[,filter\].
    
      - [Rev 39297](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39297) - [Bug 6435](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6435) - Typo FT\_IPv4 isf FT\_IPv6.
    
      - [Rev 39390](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39390) - [Bug 6452](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6452) - Fix handling of ajp13 response headers
    
      - [Rev 39392](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39392) - [Bug 6453](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6453) - Two minor bugs in Wiretap library: The Network Instruments Observer file format abbreviation is incorrect ("niobserverv") and the packet header magic number is incorrectly byte swapped a second time when reporting an invalid value
    
      - [Rev 39445](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39445) - [Bug 5987](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5987),[Bug 6457](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6457) - Be sure to close and clean up any currently open file before opening a new file.
    
      - [Rev 39485](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39485) - [Bug 6471](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6471) - Don't assume system or interface scope IDs are 4 bytes long
    
      - [Rev 39494](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39494) - [Bug 6469](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6469) - GSM SMS fill bits corrected
    
      - [Rev 39500](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39500) - [Bug 6476](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6476) - Null pointer dereference in Infiniband
    
      - [Rev 39506](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39506) - [Bug 6449](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6449) - Last RTPS2 submessage allowed to have zero octets\_to\_next\_header.
    
      - [Rev 39508](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39508) - [Bug 6479](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6479) - Buffer overflow in ERF
    
      - [Rev 39529](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39529) - Improve documentation of text2pcap -l flag - fix terminology, point to <http://www.tcpdump.org/linktypes.html>
    
      - [Rev 39558](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39558) - Fixed using signed 64-bits integer in custom column.
    
      - [Rev 39562](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39562) & [Rev 39563](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39563) - Added some Lua error messages (instead of terminating)
    
      - [Rev 39569](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39569) - Display BASE\_DEC\_HEX correct for uint64.
    
      - [Rev 39665](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39665) - [Bug 6472](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6472) - Only have one Filter Expression window.
    
      - [Rev 39666](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39666) - [Bug 6295](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6295) - Support full 64-bit SNMP values.
    
      - [Rev 39673](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39673) - Increase the size of a unknown INTEGER.
    
      - [Rev 39681](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39681) - Don't ep\_strdup the protocol name when register a Lua dissector.

## 1.4.9

Released: September 8, 2011 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.4.9.html)

Done:

  - Move over the following revisions:
      - [Rev 38247](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38247) - Avoid a possible infinite loop in dissect\_delete().
    
      - [Rev 38303](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38303),[Rev 38304](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38304) - [Bug 5731](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5731) - Unable to configure zero length SNMP Engine ID
    
      - [Rev 38326](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38326) - [Bug 6194](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6194) - Fixes for SCPS TCP option.
    
      - [Rev 38399](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38399) - [Bug 5848](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5848) - H.323 RAS packets missing from packet counts in "Telephony-\>VoIP Calls" and the "Flow Graph" for the call.
    
      - [Rev 38410](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38410) - [Bug 6135](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6135) - If we can't create the root tvb handle the failure gracefully.
    
      - [Rev 38414](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38414) - [Bug 6136](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6136) - Load our default Lua scripts from an explicit path.
    
      - [Rev 38419](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38419) - [Bug 6219](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6219) - Offset calculated incorrectly for sFlow extended data.
    
      - [Rev 38444](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38444) & [Rev 38445](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38445) - [Bug 6228](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6228) - Apply filter if pressing enter when having a auto completion window and nothing is selected.
    
      - [Rev 38491](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38491) - [Bug 6229](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6229) - Fix parsing of PCAPNG files with comments.
    
      - [Rev 38542](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38542) - [Bug 6237](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6237) - Misdecoding 3G Neighbour Cell Information Element in SI2quater message due to a coding typo
    
      - [Rev 38561](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38561) & [Rev 38565](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38565) - [Bug 6244](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6244) - mis-spelled word "unknown" in assorted files
    
      - [Rev 38601](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38601) - [Bug 6122](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6122) - Malformed Packet in decode for BGP-AD update
    
      - [Rev 38680](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38680) - [Bug 6257](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6257) - btl2cap extended window shows wrong bit.
    
      - [Rev 38723](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38723) - [Bug 6188](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6188) - BGP : AS\_PATH attribute was decode wrong
    
      - [Rev 38728](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38728) - [Bug 6262](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6262) - packet-ndmp.c dissector incorrectly represents "ndmp.bytes\_left\_to\_read" as signed.
    
      - [Rev 38790](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38790) - [Bug 6289](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6289) - Write out a default snaplen in pcap-ng files if the snaplen is unknown
    
      - [Rev 38792](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38792) - [Bug 6265](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6265) - Write out extension headers when writing out LINKTYPE\_ERF packets.
    
      - [Rev 38823](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38823) - [Bug 6279](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6279) - COPY as CSV to clipboard from RTP stream analysis only copies 1st line many times.
    
      - [Rev 38833](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38833) - Fix some problems in the code to handle [CommView](/CommView) files.
    
      - [Rev 38840](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38840) - Clean up guchar vs. guint8 in Wiretap, and fix some cases where we weren't properly filling in the pseudo-header for pcap and pcap-ng files.
    
      - [Rev 34079](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34079) & [Rev 38862](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38862) - Support negative values when viewing seconds with hours and minutes.
    
      - [Rev 38865](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38865) - [Bug 6276](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6276) - RTPS2: MAX\_BITMAP\_SIZE is defined incorrectly.
    
      - [Rev 38910](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38910) - [Bug 6311](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6311) - MEGACO context tracking fix - context id reuse

## 1.4.8

Released: July 18, 2011 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.4.8.html)

Done:

  - Move over the following revisions:
      - [Rev 34840](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34840) - [Bug 5379](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5379) - Fix sflow decode error for some extended formats
    
      - [Rev 37625](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37625) - Infinite loop in Ascend/Lucent parser.
    
      - [Rev 37663](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37663) - [Bug 6009](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6009) - Information transfer rate is a 7 bit value.
    
      - [Rev 37668](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37668) - [Bug 6022](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6022) - 802.11 Disassociation Packet's "Reason Code" field is imprecisely decoded/described
    
      - [Rev 37681](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37681) - Really print the rpcap username when logging. (Applying this patch will need manual processing).
    
      - [Rev 37756](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37756) - [Bug 6028](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6028) - Don't assert on invalid custom columns, just set as invalid/unknown
    
      - [Rev 37760](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37760) - [Bug 5006](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5006) - Fix Lua TvbRange:tvb documentation
    
      - [Rev 37761](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37761) - [Bug 5199](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5199) - Fix Lua ByteArray:tvb documentation
    
      - [Rev 37763](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37763) - [Bug 5960](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5960) - Fix Lua TvbRange:string to return whole string
    
      - [Rev 37771](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37771) - [Bug 6055](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6055) - IEEE 802.15.4 GTS Descriptor count is a 3 bit field
    
      - [Rev 37779](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37779) - Fix locale problem.
    
      - [Rev 37780](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37780) - Print the filter string, if specified.
    
      - [Rev 37783](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37783) - [Bug 5941](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5941) - Don't increase the len field of the GByteArray that provides the backing data for an FT\_BYTES field; the length must correspond to data that's actually there.
    
      - [Rev 37784](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37784) - [Bug 5895](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5895) - Add sanity checks in range.c
    
      - [Rev 37785](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37785) - [Bug 5895](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5895) - Add argument validation to Lua Pref.range
    
      - [Rev 37786](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37786) - [Bug 5896](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5896) - Remove "range" from Lua's Pref.range(), as this value shall be fetched from the "default".
    
      - [Rev 37787](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37787) - [Bug 5569](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5569) - Added check for invalid chars in abbrev in Lua [ProtoField](/ProtoField) functions.
    
      - [Rev 37788](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37788) - [Bug 6018](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6018) - Add NULL checks in Lua GUI functions and fix typos in Lua error print
    
      - [Rev 37812](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37812) - [Bug 5715](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5715) - Use UTF8 in error messages to avoid problems with locale
    
      - [Rev 37816](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37816) - [Bug 5803](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5803) - \#ifdef HAVE\_LIBGCRYPT block includes a line too many.
    
      - [Rev 37828](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37828) & [Rev 37842](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37842) - [Bug 6073](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6073) - Strengthen some heuristics + avoid big loops in RPCAP
    
      - [Rev 37853](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37853) - [Bug 4716](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4716) - Avoid false TCP zero window probe condition.
    
      - [Rev 37854](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37854) - [Bug 6059](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6059) - Don't abort processing of zero window probes and display keepalive payload.
    
      - [Rev 37895](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37895) - Fetch svn revision also when checked out with git-svn
    
      - [Rev 37923](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37923) - Fix memory leak, using ep\_alloc() instead of g\_malloc().
    
      - [Rev 37927](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37927) - [Bug 6093](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6093) - 802.11 Association Response Packet's "Status Code" field is imprecisely decoded/described
    
      - [Rev 37930](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37930) - [Bug 6044](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6044) - Avoid infinite loop in ansi\_map dissector by incrementing offset by the correct number of bytes.
    
      - [Rev 37945](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37945) - Subdissectors must be called regardless of whether "tree" is NULL or not.
    
      - [Rev 37955](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37955) - Tighten MSRP header format check
    
      - [Rev 37957](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37957) - Have GIOP heuristics take into account message size endianness.
    
      - [Rev 38023](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38023) - [Bug 6120](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6120) - Wireshark crash during RTP stream analysis
    
      - [Rev 38064](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38064) - [Bug 6131](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6131) - Improved check for valid custom column in preferences
    
      - [Rev 38070](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38070) - [Bug 4878](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4878) & [Bug 6110](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6110) - Remove the warning "\[Errno 2\] No such file or directory: '/opt/local/lib/wireshark/python/1.4.8/wspy\_dissectors'"
    
      - [Rev 38072](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38072) - Handle versions of GTK+ where gdk-pixbuf is a separate library

## 1.4.7

Released: May 31, 2011 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.4.7.html)

Done:

  - Move over the following revisions:
      - [Rev 36304](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36304) - Fix TCP desegmentation/reassembly in face of retransmissions.
    
      - [Rev 36691](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36691) - [Bug 5834](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5834) - Decode the SI value in DATA messages correctly
    
      - [Rev 36714](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36714) - Unbreak live capture using PCAPNG format
    
      - [Rev 36723](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36723) - [Bug 5605](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5605) - bug on gtk wireshark telephony-\>mtp3-\>msus
    
      - [Rev 36958](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36958) - Fix a large/infinite loop in DICOM.
    
      - [Rev 36975](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36975) - [Bug 5817](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5817) - Handle [NetMon](/NetMon) "raw IP" link-layer types.
    
      - [Rev 36997](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36997) - [Bug 5889](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5889) - Incorrect decoding of timestamp type CP56Time2a.
    
      - [Rev 37011](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37011) - Don't crash if we have a corrupt Diameter dictionary.
    
      - [Rev 37068](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37068) - Don't crash if we have a malformed snoop file.
    
      - [Rev 37081](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37081) - [Bug 5908](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5908) Fix double free in tvb\_uncompress()
    
      - [Rev 37114](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37114), [Rev 37115](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37115), & [Rev 37116](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37116) - Use the new official MIME type for pcap files in the Info.plist for the OS X bundle and in the freedesktop.org wireshark.desktop file.
    
      - [Rev 37128](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37128) - Integer overflow (and crash) in the Visual Networks file code.
    
      - [Rev 37135](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37135) - [Bug 5920](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5920) - DNP3 dissector incorrect constants AL\_OBJ\_FCTR\_16NF \_FDCTR\_32NF \_FDCTR\_16NF
    
      - [Rev 37183](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37183) - Clean up SMB output when info level not captured in request due to snapshot length.
    
      - [Rev 37188](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37188) - [Bug 5464](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5464) - AIM dissector has some endian issues.
    
      - [Rev 37192](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37192) - Clean up some routine names.
    
      - [Rev 37196](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37196) - Fix field display name in NTLMSSP.
    
      - [Rev 37197](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37197) - Don't display version field in NTLMSSP if it's not present.
    
      - [Rev 37199](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37199)[Bug 5928](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5928) - 3GPP QoS: Traffic class is not decoded properly.
    
      - [Rev 37236](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37236) - Don't increase the len field of the GByteArray that provides the backing data for an FT\_BYTES field; the length must correspond to data that's actually there.
    
      - [Rev 37239](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37239) - [Bug 5930](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5930) - Allow Lua dissectors to add FT\_FRAMENUMs.
    
      - [Rev 37286](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37286) - Fix the dissection of info level 2 for Transaction2 query and set operations (and other miscellaneous cleanups).
    
      - [Rev 37370](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37370) - [Bug 5947](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5947) - Fix the mask for extracting FMID.
    
      - [Rev 37374](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37374) - Don't show hidden columns in TShark.
    
      - [Rev 37426](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37426) - [Bug 5954](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5954) - Avoid processing tvb when fragment dissection didn't create one.
    
      - [Rev 37439](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37439) - [Bug 5962](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5962) - Fix DHCPv6 remote identifier option parsing.

## 1.4.6

Released: April 18, 2011 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.4.6.html)

Done:

  - [Rev 36694](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36694) - Fix for [Bug 5837](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5837) - Wireshark (and tshark) crashes on tcp traffic

## 1.4.5

Released: April 15, 2011 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.4.5.html)

Done:

  - Move over the following revisions:
      - [Rev 35788](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35788) - Fix: Cygwin make fails after updating to bash v 4.1.9.2
    
      - [Rev 36180](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36180) - [Bug 5189](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5189) - Wireshark crashes when cancelling a large sort operation
    
      - [Rev 34115](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34115) - [Bug 5209](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5209) - Fix sscanf arguments, may cause crash
    
      - [Rev 36160](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36160) - Account for locales where the comma is used for the decimal symbol
    
      - [Rev 36162](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36162) - [Bug 5743](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5743) - tshark incorrectly calculates tcp stream for SYN packets when port numbers are re-used
    
      - [Rev 36166](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36166) - Account for locales where the comma is used for the decimal symbol
    
      - [Rev 36174](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36174) - [Bug 5662](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5662) - Wireshark crashes if SSL preferences RSA key is actually a DSA key
    
      - [Rev 36178](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36178) - [Bug 5746](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5746) - Wireshark unable to decode PPP in HDLC framing in an sflow (RFC3176) flow sample
    
      - [Rev 36190](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36190) - Fix LDAP filter counter initialization.
    
      - [Rev 36210](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36210) - [Bug 5759](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5759) - All MySQL fields should be displayed as little-endian.
    
      - [Rev 36226](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36226) - Prevent possible crash if a dumpcap file write error;
    
      - [Rev 36232](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36232) - [Bug 5762](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5762) - Error when opening snoop from Juniper SSG-140
    
      - [Rev 36330](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36330) - [Bug 3785](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3785) - Fix dissection of HTTP when the headers are split across multiple packets and there is no content-length
    
      - [Rev 36470](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36470) - [Bug 5803](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5803) - \#ifdef HAVE\_LIBGCRYPT block includes a line too many.
    
      - [Rev 36471](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36471) - text2pcap: Fix a typo in the help message
    
      - [Rev 36483](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36483) - Update the Windows GNUTLS packages.
    
      - [Rev 36498](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36498) - [Bug 5798](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5798) - Don't try to run svnversion if it isn't executable
    
      - [Rev 36554](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36554) - [Bug 5816](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5816) - Export proto\_field\_is\_referenced
    
      - [Rev 36608](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36608) - [Bug 5754](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5754) & [Bug 5793](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5793) - Crash in X.590if

## 1.4.4

Released: March 1, 2011 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.4.4.html)

Done:

  - Move over the following revisions:
      - [Rev 33136](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33136) - [Bug 2907](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2907)/[Bug 5601](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5601) - Use find\_or\_create\_conversation() rather than only conversation\_new().
    
      - [Rev 34018](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34018) - [Bug 5157](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5157) - Crash in NTLMSSP dissector
    
      - [Rev 34300](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34300) - [Bug 5614](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5614) - NTLMSSP dissector may fail to compile due to space embedded in C comment delimiters.
    
      - [Rev 34618](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34618) - [Bug 5326](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5326) - Use col\_add\_str to store column text from Lua dissector.
    
      - [Rev 35556](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35556) - [Bug 5584](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5584) - Corrections to ANSI MAP ASN.1 specifications.
    
      - [Rev 35583](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35583) - [Bug 5585](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5585) - When searching in packet bytes, the field and bytes are not immediately shown.
    
      - [Rev 35594](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35594) - Allow for expert items to be actually attached somewhere.
    
      - [Rev 35599](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35599) - Allow presentation of Gauge32 values larger than 0x7FFFFFFF.
    
      - [Rev 35621](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35621) - [Bug 5606](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5606) - Allow (value-)string matches against BASE\_HEX and BASE\_DEC\_HEX fields.
    
      - [Rev 35626](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35626) - Fix a memory issue in the P\_Mul dissector
    
      - [Rev 35651](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35651) - [Bug 5615](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5615) - Allow name resolving for IPv6 Link Local and Multicast addresses
    
      - [Rev 35686](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35686) - [Bug 5627](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5627) - DHCPv6 dissector formats DUID\_LLT time incorrectly
    
      - [Rev 35726](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35726) - Fix two cases of 'if (x = y)' which should be 'if (x == y)'
    
      - [Rev 35737](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35737) - [Bug 5639](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5639) - Allow for IEEE 802.3bc-2009 style PoE TLVs.
    
      - [Rev 35777](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35777) - [Bug 5646](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5646) - Fixes to the HIP packet dissector
    
      - [Rev 35791](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35791) - [Bug 5652](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5652) - Wireshark could free an invalid pointer while reading a pcap-ng file.
    
      - [Rev 35795](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35795) - [Bug 5630](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5630) - Use col\_add\_str to store column text from Lua dissector.
    
      - [Rev 35888](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35888) - [Bug 5665](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5665) - Accommodate the CMake build on Ubuntu 10.10.
    
      - [Rev 35953](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35953) - Fix a buffer overflow in the Nokia DCT3 file reader.
    
      - [Rev 36029](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36029) - [Bug 5717](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5717) - Infinite recursion in CLDAP and SMB.
    
      - [Rev 35561](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35561)[Rev 35566](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35566) - Switch to using proto\_add\_bits\_item in a couple of places and fix missing stepping of bit\_offset.
    
      - [Rev 35595](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35595)[Rev 35596](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35596)[Rev 35597](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35597) - [Bug 5598](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5598) - In MM context the container contains IE:s not a complete DTAP message.
    
      - [Rev 35633](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35633) - [Bug 4645](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4645) - Wireshark Crashing by pressing 2 Buttons
    
      - [Rev 35679](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35679) - [Bug 5593](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5593) - The attemt to pretify MSISDN and IMSI breaks the ULP dissection.
    
      - [Rev 35788](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35788) - nmake \[Wireshark\] on Windows fails after updating cygwin bash to v 4.1.9-2
    
      - [Rev 35889](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35889) - [Bug 5668](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5668) - Update E.212 dissector according to Polish national regulatory MNC assignment document.
    
      - [Rev 35914](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35914) & [Rev 35916](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35916) - [Bug 5677](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5677) - Handle MIME type application/ipp as IPP.
    
      - [Rev 35947](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35947) - Make sure RTP conversations are created.
    
      - [Rev 35949](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35949) - [Bug 5653](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5653) - Display "Day of Year" for January 1 as 1, not 0.
    
      - [Rev 35999](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35999) - [Bug 5700](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5700) - Correctly display the Final CAP Slot field.
    
      - [Rev 36028](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36028) - [Bug 5702](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5702) - Swap SRC\_AS\_PEER and DST\_AS\_PEER.
    
      - [Rev 36052](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36052) - [Bug 5716](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5716) - dumpcap: -q option behavior doesn't match documentation
    
      - [Rev 36061](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36061) - [Bug 5698](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5698) - Potential access violation when writing to LANalyzer files
    
      - [Rev 36096](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36096) - Close UAT file after loading
    
      - [Rev 36101](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36061) - [Bug 5732](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5732) - LDAP filter strings can consume excessive memory.
  - Update user-guide library, tag and include in installer.

## 1.4.3

Released: January 11, 2011 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.4.3.html)

Done:

  - Move over the following revisions:
      - [Rev 33820](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33820) - [Bug 5426](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5426)- Fix display of Client's FQDN and clear up the confusion with the S, O and N bits from the RFC descriptions.
    
      - [Rev 34764](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34764) - (Trivial): Fix up a comment.
    
      - [Rev 35004](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35004) - Fix dissection on Via header.
    
      - [Rev 35010](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35010) - [Bug 5420](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5420) - Cannot load wpcap.dll or packet.dll from the Wireshark application directory.
    
      - [Rev 35015](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35015) - Bug in tvb\_get\_bits32()-
    
      - [Rev 35016](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35016) - [Bug 5430](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5430) - Remove Supported Channels length check.
    
      - [Rev 35021](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35021) - [Bug 5393](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5393) - Wrong length calculation in new\_octet\_aligned\_subset\_bits() (PER dissector.
    
      - [Rev 35023](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35023) - [Bug 5394](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5394) - Function dissect\_per\_bit\_string\_display might read more bytes than available (PER dissector).
    
      - [Rev 35030](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35030) - Add libtool version info to libwsutil.
    
      - [Rev 35055](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35055) - [Bug 5447](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5447) - Fix assertion when using ASN.1 type table
    
      - [Rev 35056](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35056) - [Bug 5444](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5444) - Bug with RWH parsing in Infiniband dissector.
    
      - [Rev 35074](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35074) - [Q\&A 1147](http://ask.wireshark.org/questions/1147/colorize-with-filter-problem) - Fix "colorize as filter" functionality
    
      - [Rev 35086](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35086) - [Bug 5421](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5421) - Wireshark crashes with Copy -\> Description on date/time fields
    
      - [Rev 35090](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35090) - [Bug 5453](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5453) - Use [GetNativeSystemInfo](/GetNativeSystemInfo)() call instead of [GetSystemInfo](/GetSystemInfo)() on Windows when available to get accurate processor architecture when running 32-bit Wireshark under WOW64 (x86 emulator for 64-bit Windows)
    
      - [Rev35091](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35091) - [Bug 5455](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5455) - Delegated-IPv6-Prefix(123) is shown incorrect as X-Ascend-Call-Attempt-Limit(123)
    
      - [Rev 35097](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35097) - Fix the range limits on the SCCP user table.
    
      - [Rev 35115](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35115) - Don't crash trying match a BASE\_CUSTOM field against a hex number
    
      - [Rev 35128](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35128) - [Bug 5463](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5463) - Stop ep\_strbuf\_new() from truncating final character in newly created & copied strings
    
      - [Rev 35151](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35151) - mp2t dissector: init defragmentation and reassembly each time a capture file is loaded
    
      - [Rev 35153](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35153) - [Bug 4141](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4141)[Rev 35154](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35154)[Rev35155](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35155)[rev 35156](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35156)[Rev 35175](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35175)[Rev 35176](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35176) - Reassemble.c leaks memory for GLIB \> 2.8 Free fragment data and fragment keys in fragment\_table when neccessary. reassembled\_table remains to be fixed.
    
      - [Rev 35194](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35194) - [Bug 5475](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5475) - Properly dissect Packet Flow Identifier IE
    
      - [Rev 35216](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35216) - [Bug 5485](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5485) - Properly dissect TLSv1.2 [CertificateRequest](/CertificateRequest) messages
    
      - [Rev 35228](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35228) - [Bug 5505](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5505) - Dissect LTE-PDCP upload packets as upload packets, not download packets
    
      - [Rev 35241](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35241) - [Bug 5510](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5510) - CIGI 3.2 and 3.3 support is repaired.
    
      - [Rev 35247](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35247) - [Bug 5513](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5513) - Prepare RTP streams filter from Fwd and Rev parts.
    
      - [Rev 35252](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35252) - [Bug 5517](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5517) - MEG ID, ICC-based format is text, not binary.
    
      - [Rev 35267](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35267)[Rev 35271](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35271) - Fix the Message numbering.
    
      - [Rev 35282](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35282) - [Bug 5523](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5523) - EAP WPS RF band may be '2.4 GHz and 5 GHz'.
    
      - [Rev 35287](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35287) - [Bug 5521](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5521) - LTP dissector could cause assertion if reception claim count is too big.
    
      - [Rev 35291](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35291) - in Network Monitor files, a later packet can have a seek offset less than an earlier packet, so don't treat that as an error.
    
      - [Rev 35292](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35292) - [Bug 5530](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5530) - Fix an overflow in the MAC LTE dissector.
    
      - [Rev 35295](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35295) - Update capture options dialog description.
    
      - [Rev 35298](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35298) - [Bug 5530](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5530) - Fix an overflow caused by a too-long SNMP engineId UAT preference.
    
      - [Rev 35304](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35304) - eliminate dissector-bug assertion in SAMR dissector.
    
      - [Rev 35313](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35313) - [Bug 4211](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4211) - eliminate dissector-bug assertion in TCP dissector.
    
      - [Rev 35318](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35318) - [Bug 5539](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5539) - Fix an overflow in the ENTTEC dissector.
    
      - [Rev 35319](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35319) - properly dissect Query Lists; eliminates dissector-bug assertion in TN3270 dissector.
    
      - [Rev 35322](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35322) - New Year.
    
      - [Rev 35328](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35328) - fix some misdissections in the UNISTIM dissector.
    
      - [Rev 35330](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35330) - handle OCTET STRINGs dissected as a field if the OCTET STRING's length isn't appropriate for the type of the field.
    
      - [Rev 35332](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35332) - in the Diameter dissector, do length checking for Integer32, Integer64, Unsigned64, Float32, and Float64, as well as for Unsigned32.
    
      - [Rev 35333](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35333) - Include dumpcap in the description.
    
      - [Rev 35335](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35335) - in the Diameter dissector, don't return a value label from AVP dissectors if the length of the AVP is wrong.
    
      - [Rev 35336](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35336) - in the TN3270 dissector, display the items in the Query List under the top-level Query List item, and properly display the Request Type for a Read Partition request.
    
      - [Rev 35337](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35337) - fix handling of VMS TCPtrace captures that don't end with a TCPIPTRACE-W-BUFFERSFUL error message.
    
      - [Rev 35342](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35342) - [Bug 5537](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5537) - Fix ep memory corruption in BER dissector
    
      - [Rev 35356](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35356) - [Bug 5323](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5323) - Further fixes to the LTP dissector's handling of Report segments
    
      - [Rev 35357](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35357), [Rev 35369](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35369) - [Bug 4048](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4048) - Don't use DISSECTOR\_ASSERT() to handle errors in packet data.
    
      - [Rev 35412](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35412) - Tell the user about the Q\&A site.
    
      - [Rev 35441](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35441) & [Rev 35443](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35443) & [Rev 35444](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35444) & [Rev 35467](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35467) - Update the menu descriptions and screenshots

## 1.4.2

Released: November 19, 2010 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.4.2.html)

Done:

  - Move over the following revisions:
      - [Rev 33460](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33460) - Add a target which creates a zip file containing our .pdb files.
    
      - [Rev 34124](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34124) - Remove a few more calls to check\_col()
    
      - [Rev 34507](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34507) - [Bug 5296](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5296) - Fix crash for 'tshark -G values' when printing an "extended value string".
    
      - [Rev 34522](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34522) - Fix Rawshark's ability to read live data on 64-bit systems.
    
      - [Rev 34523](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34523) - [Bug 5299](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5299) - Fix decode of I&[M0FilterData](/M0FilterData)
    
      - [Rev 34524](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34524) - [Bug 5300](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5300) - Fix decode of MRP [LinkUp](/LinkUp) and MRP [LinkDown](/LinkDown) messages.
    
      - [Rev 34527](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34527) - Make the telnet data lines filterable elements.
    
      - [Rev 34557](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34557) - Use port range for SCTP, too
    
      - [Rev 34563](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34563), [Rev 34564](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34564) - Fix the progress bar when loading compressed files.
    
      - [Rev 34575](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34575) - [Bug 5303](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5303) - Infinite loop in ZCL Discover Attributes dissection
    
      - [Rev 34581](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34581) - [Bug 5318](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5318) - Fix SE memory overflow in LDSS dissector.
    
      - [Rev 34583](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34583) - Copy GDK pixbuf loaders libs to the Wireshark.app
    
      - [Rev 34595](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34595) - Cleanup of unnecessary tree == NULL checks in ZCL dissector.
    
      - [Rev 34597](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34597) - [Bug 5320](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5320) - Clean up properly after Lua Dumper is closed.
    
      - [Rev 34601](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34601) - Fixed "Compiled with" information in the About box.
    
      - [Rev 34657](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34657) & [Rev 34658](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34658) & [Rev 34659](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34659) - Treat unknown MIME multipart as multipart/mixed
    
      - [Rev 34660](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34660) & [Rev 34661](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34661) - [Bug 5340](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5340) - Calculate correct start time for "View as time of day" in IO Graph.
    
      - [Rev 34665](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34665) - [Bug 5344](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5344) - Wireshark tools do not detect and read some ERF files correctly
    
      - [Rev 34709](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34709) - Redissect packets instead of reload file on UAT changes.
    
      - [Rev 34742](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34742) - [Bug 5353](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5353) - Send all of editcap's usage output to the same fd
    
      - [Rev 34750](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34750) - [Bug 5357](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5357) - Fix IP Timestamp Option
    
      - [Rev 34755](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34755) - [Bug 5289](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5289) - A GTK-ERROR can occur in packets when there are multiple Netbios/SMB headers in a single frame
    
      - [Rev 34759](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34759) - [Bug 3894](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3894) - File-Open Display Filter is overwritten by Save-As Filename
    
      - [Rev 34762](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34762) - [Bug 5364](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5364) - Fix PDU header highlighting
    
      - [Rev 34765](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34765) - [Bug 5368](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5368) - AgentX dissector cannot handle null OID in Open-PDU
    
      - [Rev 34779](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34779) - Prevent false related SIP packet information
    
      - [Rev 34783](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34783) - [Bug 5330](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5330) - Network Instruments' trace files sometimes cannot be read with an error message of "Observer: bad record: Invalid magic number"
    
      - [Rev 34785](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34785) - Corrected an if-statement in field\_select\_row\_cb() where checking for hfinfo-\>strings and hfinfo-\>display.
    
      - [Rev 34791](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34791) - Bug fix: Running tshark with the following command will leave a temp file on the file system.
    
      - [Rev 34796](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34796) & [Rev 34821](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34821) - [Bug 5374](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5374) - Patch that fixes overflowing highlighting of data.
    
      - [Rev 34799](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34799) - Display the the PDU length as "cut short"if it crosses the boundary of the packet and no more packets are available.
    
      - [Rev 34823](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34823) - Handle large gap reports when doing a TSN plot.
    
      - [Rev 34829](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34829) - [bug 5378](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5378) - Missing path separator in config.nmake
    
      - [Rev 34841](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34841) - No need for the libpcap workaround in OS X 10.6.5.
    
      - [Rev 34848](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34848) - [Bug 5389](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5389) - Use python comments in python code.
    
      - [Rev 34867](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34867) - Export proto\_item\_append\_string().
    
      - [Rev 34879](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34879) - [Bug 5388](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5388) - Skip reserved word in ANCP OAM-Loopback-Test-Parameters TLV.
    
      - [Rev 34938](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34938) - [Bug 5309](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5309) - dumpcap use 50% of CPU.

## 1.4.1

Released: October 11, 2010 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.4.1.html)

Done:

  - Move over the following revisions:
      - [Rev 33525](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33525) - Get our dynamic payload name from the correct location.
    
      - [Rev 33603](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33603) - [Bug 5033](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5033) - 3GPP GTPv2 header Update.
    
      - [Rev 33677](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33677) - Minor code cleanup.
    
      - [Rev 33977](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33977) - Give all files in the ringbuffer the same group-id
    
      - [Rev 33994](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33994) - [Bug 5132](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5132) - Suspend bytes-in-flight calculation when packets are missing in the trace until the next ACK is seen
    
      - [Rev 34001](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34001) - [Bug 5076](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5076) - Packet details have errors when decode MAP V2 PRN\_ACK msg.
    
      - [Rev 34011](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34011), [Rev 34012](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34012) & [Rev 34030](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34030) - [Bug 5002](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5002) - Avoid crash when renaming a display filter macro.
    
      - [Rev 34031](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34031) - [Bug 5162](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5162) - Set correct length for GTP header.
    
      - [Rev 34033](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34033) - [Bug 5163](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5163) - Allow space in list of hidden columns in preferences.
    
      - [Rev 34187](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34187), [Rev 33616](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33616), [Rev 34192](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34192), [Rev 34204](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34204) - Only use gzcleareof() if we have it
    
      - [Rev 34036](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34036) & [Rev 34037](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34037) - [Bug 5167](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5167) - Wireshark don't show mgcp calls in "Telephony" =\> "VoIP calls"
    
      - [Rev 34038](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34038) - [Bug 5165](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5165) - 1.4 version does not display the t.38 graph.
    
      - [Rev 34039](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34039) - Ensure we always print the heading when dumping PSML and CSV.
    
      - [Rev 34058](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34058) - Fix start offset and length handling in SEQUNCE OF (caused Gtk crash for sequences at the end of frame)
    
      - [Rev 34062](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34062) - [Bug 5179](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5179) - GTPv2: IMSI is decoded improperly.
    
      - [Rev 34069](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34069) - [Bug 5186](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5186) - Fix the decoding of the maximum/guaranteed bit rates for uplink/downlink.
    
      - [Rev 34084](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34084) & [Rev 34085](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34085) & [Rev 34086](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34086) & [Rev 34087](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34087) & [Rev 34089](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34089) - Decode the entire 12 bit TCP flags
    
      - [Rev 34122](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34122) + [Rev 34129](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34129) - [Bug 5160](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5160) - Get our official Win64 builds running on pre-Vista Windows
    
      - [Rev 34101](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34101) - Decode SLL payloads using a dissector table based on sll.ltype.
    
      - [Rev 34111](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34111) - [Bug 5230](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5230) - BER stack overflow.
    
      - [Rev 34113](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34113) - [Bug 5214](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5214) - Incorrect decoding of List of ARFCN in BCCH frequency list.
    
      - [Rev 34154](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34154) - [Bug 5220](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5220) - In call flow, don't show deleted codecs, and fix codec listing.
    
      - [Rev 34176](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34176) - [Bug 5239](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5239) - The CLDAP attribute value on a CLDAP reply is no longer being decoded.
    
      - [Rev 34177](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34177) - [Bug 5243](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5243) - \[NAS EPS\] Traffic Flow Template IE dissection bugs.
    
      - [Rev 34179](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34179) - [Bug 5246](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5246) - \[NAS EPS\] Use Request Type IE defined in 3GPP 24.008
    
      - [Rev 34184](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34184) - [Bug 5172](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5172) - Properly retrieve the H.245 endpoint IP address
    
      - [Rev 34199](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34199) - [Bug 5252](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5252) - Use real IPv6 destination address when RH0 has 0 segments left.
    
      - [Rev 34223](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34223) - Fix crash creating a filter (using "Expression ...") for a field with an extended value\_string.
    
      - [Rev 34239](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34239) - Track offset even when tree==NULL
    
      - [Rev 34080](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34080) - [Bug 5194](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5194) - Wireshark mistakenly writes "not all data available" for IPv4 checksum - Fix a regression introduced in 1.4.0
    
      - [Rev 34216](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34216) - [Bug 2225](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2225) - Disable sorting while capturing. (requires manual merge because of menu changes in trunk)
    
      - [Rev 34234](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34234) - Disable the "File Set" menu while capturing. (requires manual merge because of menu changes in trunk)
    
      - [Rev 34265](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34265) - [Bug 553](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=553) - Move Wireshark's upper left corner on screen if the requested position is outside of the monitor's viewable area
    
      - [Rev 34267](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34267) - [Bug 5261](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5261) - Fix offset errors
    
      - [Rev 34280](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34280) - Fix the libsmi workaround
    
      - [Rev 34282](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34282) & [Rev 34283](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34283) - [Bug 5265](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5265) - Unable to capture using pipes w/Mac OS X
    
      - [Rev 34284](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34284) - Constructed octet strings may contain zero encodings.
    
      - [Rev 34303](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34303) - [Bug 2519](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2519) - In Linux cooked captures, don't show the source address if it's zero-length (and limit it to 8 octets)
    
      - [Rev 34337](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34337) - [Bug 2225](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2225) - Ensure we always show the selected frame when changing sort order.
    
      - [Rev 34358](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34358) - [Bug 5267](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5267) - MRP packet is not correctly parsed in PROFINET multiple write record request.
    
      - [Rev 34271](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34271) [Rev 34272](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34272) [Rev 34295](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34295) [Rev 34298](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34298) - [Bug 5251](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5251) - NTLMSSP\_AUTH domain and username truncated to first letter with IE8/Windows7 (generating the NTLM packet)
    
      - [Rev 34385](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34385) - [Bug 5274](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5274) - Fix TFT decoding when having several Packet Filters defined.
    
      - [Rev 34386](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34386) - [Bug 5277](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5277) - Don't core on Solaris if no SSL password is given
    
      - [Rev 34395](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34395) - [Bug 5271](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5271) - MYSQL: Fix FIELDS\_PACKET dissection and SHOW\_FIELDS response handling
    
      - [Rev 34408](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34408) - Fix crash in RPC if subdissector changed private\_data and threw an exception
    
      - [Rev 33701](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33701) - [Bug 2691](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2691) - Fix MySQL query response dissection.
    
      - [Rev 34384](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34384) & [Rev 34388](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34388) - Show more ICMPv6 ND information.
    
      - [Rev 34446](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34446) & [Rev 34447](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34447) - Fix some menu entries
    
      - [Rev 34468](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34468) - Remove the border around the main window.
  - Update services file (we may want to automate this, like manuf and enterprise numbers)
  - Update Windows compiled help file (in lib32/lib64 /trunk and /trunk-1.4)

## 1.4.0

Released: August 30, 2010 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.4.0.html)

Done:

  - Move over the following revisions:
      - [Rev 33846](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33846) - [Bug 5114](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5114) - Fix infinite loop in bootp dissector
    
      - [Rev 33676](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33676) - Use ep-allocated strings for our data source names in the PPI dissector.
    
      - [Rev 33683](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33683), [Rev 33684](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33684) - Use local copy of Wireshark documentation on UNIX if it's available.
    
      - [Rev 33689](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33689) - Fix the GTP' header dissection a bit.
    
      - [Rev 33694](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33694) - [Bug 5011](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5011)- Put the TCP window size field back.
    
      - [Rev 33719](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33719) - Remove experimental marking on NEW\_PACKET\_LIST
    
      - [Rev 33725](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33725) - [Bug 5081](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5081)- Fix for 'Uninitialised pointer in packet-rtsp.c causes crash'
    
      - [Rev 33735](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33735) - [Bug 5087](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5087) - Protect tvb\_\* functions in a TRY-CATCH block
    
      - [Rev 33742](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33742) - Compile without HAVE\_C\_ARES and HAVE\_GETHOSTBYNAME2.
    
      - [Rev 33747](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33747) [Rev 33748](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33748) [Rev 33749](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33749) [Rev 33750](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33750) - [Bug 5051](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5051) - packet-bacapp.c: corrected the dissection of reassembled UDP packets
    
      - [Rev 33743](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33743)[Rev 33757](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33757) - Fix a crash when an entry in the popup menu is selected and there are no expert info entries.
    
      - [Rev 33751](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33751) - DICOM better reassembly, fixed sporadic decoding and export issues, several other improvements.
    
      - [Rev 33765](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33765)[Rev 33771](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33771) - 3 potentially risks of endless loop eliminated.
    
      - [Rev 33772](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33772) - [Bug 5101](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5101)- Saving Flow graph Analysis produces an incomplete text file
    
      - [Rev 33764](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33764)[Rev 33774](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33774)[Rev 33776](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33776)[Rev 33777](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33777) - [Bug 5130](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5103) - Dissector bug, protocol SDP: tvbuff.c:629: failed assertion "tvb && tvb-\>initialized"
    
      - [Rev 33775](http://anonsvn.wireshark.org/viewvc/viFix%20up%20decoding%20of%20bitfields%20in%20the%20aligned%20variant.ewvc.cgi?view=rev&revision=33775)[Rev 33778](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33778) - Call tvb\_get\_bits32() if leading\_zero\_bits \> 16.
    
      - [Rev 33780](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33780) - [Bug 5105](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5105) - IP should not compute the header checksum if within an error packet such as ICMP.
    
      - [Rev 33773](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33773) - Change font for packet information from Courier to Monaco.
    
      - [Rev 33789](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33789) - Update ZRTP dissector to draft-22
    
      - [Rev 33791](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33791)[Rev 33792](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33792) - ...Those routines do \*not\* need to read the packet data to see if it matches; that lets them run much faster.
    
      - [Rev 33794](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33794)[Bug 5110](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5110) - Add missing break.
    
      - [Rev 33797](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33797) - Handle non-Latin filenames when we're called via [ShellExecute](/ShellExecute) on Windows.
    
      - [Rev 33798](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33798)[Rev 33799](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33799) - Fix up decoding of bitfields in the aligned variant.
    
      - [Rev 33811](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33811) - [Bug 5080](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5080) - tvb\_get\_bits32 produces malformed\_packet if no\_of\_bits \< 25 and tvb remaining = 3
    
      - [Rev 33813](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33813) - Typo - wrong IE code for APN aggregate maximum bit rate in message Activate default EPS bearer context request.
    
      - [Rev 33816](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33816), [Rev 33819](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33819) - [Bug 5066](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5066) - Properly shorten filenames with multi-byte sequences in the welcome screen.
    
      - [Rev 33842](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33842) - [Bug 5052](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5066) - txOffset and updateID in ZigBee beacon are optional.
    
      - [Rev 33504](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33504) - dftest and randpkt are installed during make install, but they are not documented in any man page.
    
      - [Rev 33541](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33541) - Only link programs that call stuff in Application Services or Core Foundation with those frameworks.
    
      - [Rev 33683](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33683) - Use local copy of Wireshark documentation on UNIX if it's available.
    
      - [Rev 33876](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33876) - New packet list is no longer experimental.
    
      - [Rev 33832](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33832) - The Mobile Status msg in BSSAP+ has IMSI as first possible IE.
    
      - [Rev 33880](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33880) - Add \!ENDIF if needed.
    
      - [Rev 33887](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33887) - [Bug 5127](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5127) - Fix for attribute boolean
    
      - [Rev 33888](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33888) - new\_packet\_list\_column\_button\_pressed\_cb(): return gboolean (not void): it's an event callback;.
    
      - [Rev 33894](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33894) - Update libtoolize files
    
      - [Rev 33916](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33916), [Rev 33917](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33917), [Rev 33924](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33924), and [Rev 33925](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33925) - Make sure DLLs are loaded safely on Windows.
    
      - [Rev 33921](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33921) and [Rev 33922](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33922) - Include [WinPcap](/WinPcap) 4.1.2 in the U3 and [PortableApps](/PortableApps) builds - Also requires [WpdPack](/WpdPack)\_4\_1\_2.zip
    
      - [Rev 33198](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33198) - Do some constifying \[or other\] based upon gcc -Wwrite-strings
    
      - [Rev 33534](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33534) - There shouldn't be any need to build stuff in the top-level directory with the Lua or libgnutls flags.
    
      - [Rev 33551](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33551) - Make frames containing Malformed expert items match with "malformed" display filter.
    
      - [Rev 33692](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33692) - Fix cases where the type of a for loop variable is smaller than the type of the "end" variable.
    
      - [Rev 33707](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33707) - Avoid a possible dereference of null pointer.
    
      - [Rev 33906](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33906) - [Bug 5126](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5126) - ERROR:capture.c:141:capture\_start: assertion failed: (capture\_opts-\>state == CAPTURE\_STOPPED)
    
      - [Rev 33920](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33920) - Fix wrong length of CSeq Method parameter.
    
      - [Rev 33941](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33941) - [Bug 5148](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5148) - Avoid crash in ps\_clean\_string().
    
      - [Rev 33947](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33947) - [Bug 5146](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5146) - Make wireshark-dev depend on the right automake.

## 1.4.0rc2

Released July 29, 2010

Done:

  - Move over the following revisions:
    
      - [Rev 33158](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33158) - [Bug 4877](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4877) - Fix "/\* within comment" error
    
      - [Rev 33159](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33159) - Get rid of C++/C99-style comment
    
      - [Rev 33174](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33174) - Corrected a typo in "display seconds with hours and minutes".
    
      - [Rev 33178](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33178) - Print correct RLRE reason in Info column.
    
      - [Rev 33200](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33200) - Fix a copy paste error.
    
      - [Rev 33201](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33201) - Add dissector\_table\_foreach.
    
      - [Rev 33204](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33204) - GLIB 2.14 necessary to compile Wireshark with Protocol help.
    
      - [Rev 33209](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33209) - Fix: Malformed packet if port is missing from path.
    
      - [Rev 33210](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33210) - DECT: Fixed display of full slot data
    
      - [Rev 33212](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33212) - [Bug 4868](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4868) - Fix for: Wireshark crash selecting Inter-Asterisk exchange v2 packet data
    
      - [Rev 33219](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33219) - Add info to the "Enable OID resolution" tooltip about the 'SMI paths' and 'SMI modules' preferences
    
      - [Rev 33222](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33222) - Rename OSX dmg to include "32" or "64" - Also needs web page updates\!
    
      - [Rev 33223](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33223) - [Bug 4871](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4871) - Fix for: Wrong Ack value in TCP flow graph when using relative sequence numbers
    
      - [Rev 33243](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33243), [Rev 33252](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33252), [Rev 33316](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33316) - Enable Lua by default
    
      - [Rev 33250](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33250) - Add the Gigamon ethertype.
    
      - [Rev 33253](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33253) - Document a long supported but hidden tshark -G option.
    
      - [Rev 33255](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33255) - Use top level tree when using dissectors from "eth.trailer" heuristics.
    
      - [Rev 33256](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33256) - Add support for Gigamon headers (timestamp, source port, length, etc)
    
      - [Rev 33257](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33257) - Dissect 3GPP Diameter S6a flags.
    
      - [Rev 33258](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33258) - 3GPP NAS EPS: missing sequence number before ciphered text
    
      - [Rev 33264](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33264) - [Bug 4413](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4413) - Revert back to the old Flags entry.
    
      - [Rev 33265](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33265) - Add an expert info for "4 NOP in a row" in IP and TCP.
    
      - [Rev 33266](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33266), [Rev 33279](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33279), [Rev 33281](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33281), [Rev 33284](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33284), [Rev 33285](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33285) & [Rev 33288](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33288) - [Bug 3402](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3402) - Add "Hide Column" functionality.
    
      - [Rev 33267](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33267) - [Bug 4875](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4875) - Don't hint at a local User's Gude when there isn't one.
    
      - [Rev 33268](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33268) - Add get\_column\_visible & set\_column\_visible
    
      - [Rev 33269](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33269) - [Bug 4888](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4888) - Convert DSCP column to the proper custom column filter code.
    
      - [Rev 33270](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33270) - [Bug 4888](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4888) - Restore setting DSCP column value, when relevant.
    
      - [Rev 33271](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33271)[Rev 33272](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33272)[Rev 33273](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33273)[Rev 33275](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33275)[Rev 33276](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33276) - gmhdr clean up
    
      - [Rev 33274](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33274) - [Bug 4894](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4894) - wlan\_mgt.tag.interpretation triggers Gtk-ERROR \*\*: Byte index 6 is off end of the line aborting...
    
      - [Rev 33277](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33277) - Corrected printed name for id-permissiveAttributes.
    
      - [Rev 33280](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33280) - [Bug 4897](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4897) - Fix crash found by fuzz-test
    
      - [Rev 33282](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33282) - [Bug 4852](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4852) - Set RSSI column values when tree==NULL
    
      - [Rev 33283](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33283) - Highlight hex dump bytes fix.
    
      - [Rev 33286](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33286) - Update README.developer.
    
      - [Rev 33287](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33287)[Rev 33291](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33291) - Ensure no exceptions thrown while checking for Gigamon trailer.
    
      - [Rev 33293](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33293) - Strengthen test for Gigamon trailer
    
      - [Rev 33294](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33294) - Dissect 3GPP S1AP UE Capability Info Indication.
    
      - [Rev 33330](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33330) - 3GPP S1AP Transparent Container.
    
      - [Rev 33301](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33301) - Fix "Delta time displayed" for the first displayed packet.
    
      - [Rev 33304](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33304) & [Rev 33305](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33305) - Add a "Follow Stream" button to the conversations dialogs.
    
      - [Rev 33312](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33312)[Bug 4910](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4910) - SDCCH8 subchannel decoding error in GSM RR dissector.
    
      - [Rev 33315](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33315) - Ensure we use the numeric value when creating a filter from a custom column entry displaying a integer value.
    
      - [Rev 33319](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33319) - Run uat-\>post\_update\_cb() in uat\_load().
    
      - [Rev 33321](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33321) - Fix [SigComp](/SigComp) UDVM overflows.
    
      - [Rev 33327](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33327) - [Bug 4916](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4916) - zlib-1.2.5 cause tshark to stop live capture
    
      - [Rev 33329](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33329) - [Bug 4926](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4926) - Avoid crash when adding SNMP Users.
    
      - [Rev 33331](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33331) - [Bug 4896](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4896) - Fixed count of displayed packets.
    
      - [Rev 33332](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33332) & [Rev 33334](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33334) - Always show packets with Time Reference (as in the old packet list).
    
      - [Rev 33335](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33335) - MIPv6 Heartbeat
    
      - [Rev 33356](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33356) - Add the missing packet-s1ap.h.
    
      - [Rev 33236](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33236) [Rev 33238](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33238) [Rev 33348](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33348) - [Bug 4932](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4932) - Large loop in the Netflow dissector.
    
      - [Rev 33380](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33380) - Add End Marker.
    
      - [Rev 33384](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33384) - [Bug 4891](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4891) - new\_packet\_list: Autoscroll turns off in Wireshark 1.4.0rc1
    
      - [Rev 33385](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33385) - Fix SIP array bounds.
    
      - [Rev 33398](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33398) - Remove some double GTK\_TREE\_VIEW casts
    
      - [Rev 33399](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33399) - Fetch filter and copy summary from correct column after DND columns.
    
      - [Rev 33400](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33400) - Recreate the packet list on DND columns.
    
      - [Rev 33410](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33410) - Properly return exit status from dumpcap on Windows.
    
      - [Rev 33411](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33411), [Rev 33412](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33412), [Rev 33413](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33413) - More cleanly report uncaught exception status from dumpcap on Windows.
    
      - [Rev 33361](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33361), [Rev 33488](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33488) - [GeneralizedTime](/GeneralizedTime) and UTCTime dissection checks.
    
      - [Rev 33341](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33341), [Rev 33388](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33388), [Rev 33390](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33390), [Rev 33392](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33392) - Initialize variables.
    
      - [Rev 33430](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33430) - [Bug 4968](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4968) - Revert COL\_DSCP\_VALUE back to value set in packet-ip.c
    
      - [Rev 33433](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33433) - We have no first and second block when dumping bits view, so no adjustments.
    
      - [Rev 33440](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33440) - Show dropped packets counter after stopping a live capture, etc.
    
      - [Rev 33441](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33441) - Improve heuristics for packet-ipsec-tcp to pick up less packets to TCP port 10000.
    
      - [Rev 33455](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33455) - Add missing else handling a zero msg\_auth\_code.
    
      - [Rev 33457](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33457) - [Bug 4982](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4982) - Handle concatenated Status and other OMAPI message.
    
      - [Rev 33458](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33458) - Don't set SDKROOT when building the Wireshark.app front end so we can build the OS X dmg on both Leopard and Snow Leopard.
    
      - [Rev 33340](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33340) - Initialize variables in DCERPC DRSUAPI.
    
      - [Rev 33358](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33358) - Make sure dissect\_ber\_integer sets a value.
    
      - [Rev 33363](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33363) - [Bug 4950](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4950) Don't try to use a NULL tvb in call\_ber\_oid\_callback().
    
      - [Rev 33389](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33389) - Initialize variables in DCERPC NETLOGON.
    
      - [Rev 33396](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33396) - Initialize a variable in SPNEGO.
    
      - [Rev 33472](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33472) - [Bug 4854](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4854) - Don't crash if a column is present twice.
    
      - [Rev 33481](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33481) - Check field lengths in GMHDR.
    
      - [Rev 33483](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33483) - [Bug 4993](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4993) - Mac support flags are little endian too.
    
      - [Rev 33525](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33525) - Display the correct RTP dynamic payload name in the VoIP calls sequence diagram.
    
      - [Rev 33526](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33526) - Don't pass tvb data to col\_set\_str(), as it will not stay around.
    
      - [Rev 33527](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33527), [Rev 33528](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33528), [Rev 33529](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33529) - Make 'tshark -T fields' print all values for fields with multiple occurences
    
      - [Rev 33549](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33549), [Rev 33550](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33550) - [Bug 5008](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5008) - VRRPv3
    
      - [Rev 33556](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33556) - [Bug 5015](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5015) - Remove redundancy in VRRP MAC name resolution.
    
      - [Rev 33557](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33557) - XDMCP Query has authentication names.
    
      - [Rev 33561](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33561) - [Bug 5018](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5018) - Show the reserved values in icmpv6 type 135, 137 and 143 in the packet tree.
    
      - [Rev 33580](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33580), [Rev 33581](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33581),[Rev 33605](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33605), [Rev 33606](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33606) & [Rev 33615](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33615) - [Bug 5020](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5020) - Added [PacketCable](/PacketCable) Multimedia I05 support.
    
      - [Rev 33585](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33585) - [Bug 5019](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5019) - Fix NFS4 clientaddr4 parsing.
    
      - [Rev 33602](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33602) - [Bug 5039](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5039) - Fixed adding a boolean value as a custom column.
    
      - [Rev 33611](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33611) - [Bug 5037](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5037) - Fix SCSI command ACCESS CONTROL IN.
    
      - [Rev 33617](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33617) - [Bug 5021](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5021) - VoIP Calls 'ordering by time' is incorrect, EG 17.1111 comes before 8.1234
    
      - [Rev 33623](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33623) - [Bug 5044](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5044) - Correct V and F flag interpretation of 6lowpan Mesh Addressing Type and Header.
    
      - [Rev 33624](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33624) - [Bug 5047](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5047) - Fix 6lowpan order of non compressed fields and deep hops left field.
    
      - [Rev 33630](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33630) - Fix 6lowpan.
    
      - [Rev 33637](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33637) - [Bug 5053](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5053) - packet-ipmi.c: Fix potential infinite loop: for (guint8=0; guint8 \< guint; guint8++);
    
      - [Rev 33643](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33643) - Fix unistim message length tracking
    
      - [Rev 33648](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33648) - [Bug 5055](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5055) - Wrong decoding of GTP Prime (GTP') Packets.
    
      - [Rev 33654](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33654) - [Bug 5065](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5065) - fixes the dissection of the PDN Disconnect Request message in case the optional Protocol Configuration Options IE is not present.

  - Copy over get\_ber\_length and try\_get\_ber length from the trunk.

  - Update [WinPcap](/WinPcap) installer to 4.1.2

## 1.4.0rc1

Released June 10, 2010

Done:

  - Move over the following revisions:
      - [Rev 33157](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33157) - Change dissection of User Location Info (ULI) to show the spare bits in the protocol tree and don't show ECI as a bitfield
    
      - [Rev 33168](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33168) - [Bug 4306](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4306) - Avoid a crash when deleting the first character in the filter.

---

Imported from https://wiki.wireshark.org/Development/Trunk-1.4 on 2020-08-11 23:13:18 UTC
