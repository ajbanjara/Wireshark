# Past 1.0 Releases

For upcoming releases, see [Development/Roadmap](/Development/Roadmap).

## 1.0.17 (Unreleased)

Done:

  - Move over the following revisions:
      - [Rev 34111](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34111) - [Bug 5230](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5230) - BER stack overflow.

The 1.0 branch reached End Of Life on September 30, 2010. There will be no official 1.0.17 release.

## 1.0.16

Released: August 31, 2010 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.0.16.html)

Done:

  - Move over the following revisions:
      - [Rev 33894](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33894) - Update libtoolize files
    
      - [Rev 33916](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33916), [Rev 33917](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33917), [Rev 33924](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33924), and [Rev 33925](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33925) - Make sure DLLs are loaded safely on Windows.

## 1.0.15

Released: July 29, 2010 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.0.15.html)

Done:

  - Move over the following revisions:
      - [Rev 33321](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33321) - [Bug 4867](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4867) - Fix the [SigComp](/SigComp) Universal Decompressor Virtual Machine buffer overrun.
    
      - *More...*

## 1.0.14

Released: June 10, 2010 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.0.14.html)

Done:

  - Move over the following revisions:
      - [Rev 32650](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32650) - [Bug 4734](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4734) - NULL pointer dereference in the SMB dissector.
    
      - [Rev 32774](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32774) - [Bug 1791](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1791) - Allow Open button to work when you've typed in the location bar in the Open dialog
    
      - [Rev 32848](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32848) - Fix fuzz failure on systems that don't like NULL pointers to strings in vsnprintf
    
      - [Rev 32922](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32922), [Rev 33046](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33046) - Fix a stack overrun in the BER dissector.
    
      - [Rev 32961](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32961), [Rev 32962](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32962), [Rev 32963](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32963) - Fix improper use of \<stdarg.h\> that can cause crashes on some platforms, warn people not to do that
    
      - [Rev 33028](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33028) - [Bug 4815](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4815) - Fix the build on Fedora 13
    
      - [Rev 33061](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33061), [Rev 33065](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33065) - [Bug 4826](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4826) - Infinite loop in the SigComp UDVM.
    
      - [Rev 33087](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33087), [Rev 33090](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33090) - [Bug 4837](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4837) - Buffer overflow in the SigComp UDVM.

## 1.0.13

Released: May 5, 2010 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.0.13.html)

Done:

  - Move over the following revisions:
      - [Rev 32398](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32398) and [Rev 32400](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32400) - [Bug 4646](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4646) - Don't crash on invalid DOCSIS regrsp packet
    
      - [Rev 32465](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32465) - [Bug 3010](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3010) - Fix a couple of unitialized variables in MATE.

## 1.0.12

Released: March 31, 2010 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.0.12.html)

Done:

  - Move over the following revisions:
      - [Rev 31786](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31786) , [Rev 31787](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31787) - Fix a crash which occurs if a progress bar is displayed while generating a hex bytes pane.
    
      - [Rev 31918](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31918) - Fix configure script typo.
    
      - [Rev 32321](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=32321) - [Bug 4613](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=%204613) - Use different names for different encapsulations.

## 1.0.11

Released: January 27, 2010 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.0.11.html)

Done:

  - Move over the following revisions:
      - [Rev 28712](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28712) - Don't crash in ptvcursor API when called with a NULL tree.
    
      - [Rev 31187](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31187) - [Bug 4301](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4301) - Fix a crash in the SMB dissector.
    
      - [Rev 28839](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28839) - Remove a tvb\_free() to avoid a crash in Infiniband.
    
      - [Rev 31524](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31524) - Buffer overflows in LWRES.
    
      - [Rev 31560](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31560) - Clarify some stuff in README.developer.
    
      - [Rev 31615](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31615) - Fix the "how to capture with tcpdump" portion of the User's Guide.
    
      - [Rev 31626](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31626) - Gracefully handle a missing Kerberos configuration.
    
      - Update libgcrypt in the Windows installer to 1.4.5 - [Bug 3270](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3270)
    
      - [Rev 31396](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31396) - Bump copyright year in trunk-1.0 & trunk-1.2
    
      - [Rev 31676](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=31676) - Adjust release timestamp

## 1.0.10

Released: October 27, 2009 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.0.10.html)

Done:

  - Move over the following revisions:
      - [Rev 28891](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28891) - [Bug 3578](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3578) - RADIUS dissector crash.
    
      - [Rev 30208](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=30208) - Crash in DCERPC NT.

## 1.0.9

Released: September 15, 2009 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.0.9.html)

Done:

  - Move over the following revisions:
      - [Rev 25183](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25183) - [Bug 3499](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3499) - Add adns\_dll.dep and adns\_dll.rc to the release tarball to fix the Windows build.
    
      - [Rev 25871](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25871) - Register the FTP dissector by name.
    
      - [Rev 28471](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28471) - [Bug 3469](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3469) - Add support for [NetScreen](/NetScreen) Snoop output on bridged ADSL interfaces without PPP.
    
      - [Rev 28482](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28482) - [Bug 3223](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3223) and [Bug 3414](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3414) - Use the user defined comment in the Capture Interfaces dialog box.
    
      - [Rev 28503](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28503) - [Bug 3483](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3483) - Throttle splash screen updates when running remote.
    
      - [Rev 28538](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28538) - [Bug 3489](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3489) - Array overrun on copy of filter expression on GTK1 build.
    
      - [Rev 28549](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28549) - [Bug 1740](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1740) - Set SIGPIPE handler every time the program starts.
    
      - [Rev 28550](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28550) - [Bug 3361](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3361) - Resolve a crash issue in the filter bar when having a function on the RHS which does not return the same type as the LHS.
    
      - [Rev 28555](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28555) and [Rev 28556](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28556) - [Bug 3429](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3429) - Downgrade a g\_assert() to a proper if statement to avoid a crash.
    
      - [Rev 28592](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28592) - [Bug 2504](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2504) - Quick fix to sync expert\_tapdata\_s.
    
      - [Rev 28620](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28620) - [Bug 3505](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3505) - Fixed bit position for wlan\_mgt.fixed.delba.param.initiator.
    
      - [Rev 28633](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28633) - Lua fix in value\_string\_from\_table().
    
      - [Rev 28640](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28640) - [Bug 3509](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3509) - Use correct type to avoid DISSECTOR\_ASSERT\_NOT\_REACHED.
    
      - [Rev 28670](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28670) - FIXED: "Home" and "End" keys don't work when editing a filter in the filter toolbar.
    
      - [Rev 28671](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28671) - Update services.
    
      - [Rev 28683](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28683) and [Rev 28684](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28684) - Upgrade KFW to 3.2.2.
    
      - [Rev 28696](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28696) - [Bug 3524](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3524) - Fixed interface id on writing pcapng files.
    
      - [Rev 28749](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28749) - [Bug 3535](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3535) - Lucent/Ascend parser infinite loop while parsing large dumps.
    
      - [Rev 28815](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28815) - [Bug 3564](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3564) - Fix a crash in AFS.
    
      - [Rev 28839](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28839) - Removed a tvb\_free() to avoid a crash (in plugin directory).
    
      - [Rev 28917](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28917) - Make it compile on AIX.
    
      - [Rev 28931](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28931) - [Bug 3536](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3536) - Fix crashes in the filter dialog and filter toolbar when referencing a "range-string" field type.
    
      - [Rev 29051](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29051) - [Bug 3694](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3694) - Use correct length for "Version OD Calling" in FF.
    
      - [Rev 28642](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28642) - Support NR-SACKS, fix crashes in TSN analysis.
        
          - Maybe a bit much, to shoehorn in a new feature with a bugfix? Could we limit this to the array index checks in sctp\_stat.c and sctp\_graph\_dlg.c ? *The array and AUTHORS fixes have been backported -- Gerald*
    
      - [Rev 29813](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29813) - [Bug 3986](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3986) - Large loop in [OpcUa](/OpcUa).
    
      - [Rev 29830](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29830) - Fix the ChmodBPF startup item to work.
    
      - [Rev 29831](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29831) - Add a note about a Snow Leopard bug to the README.macosx file.
    
      - [Rev 29839](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29839) - Fix handling of the bearer control unit identifier.
    
      - [Rev 29881](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=29881) - [Bug 2767](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2767) - Fix dumpcap crash when user hits Ctrl-C

## 1.0.8

Released: May 21, 2009 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.0.8.html)

Done:

  - Move over the following revisions:
      - [Rev 27663](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27663) - Keep the DLT\_USER table in memory.
    
      - [Rev 27714](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27714) - Small fix in s5066.
    
      - [Rev 28031](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28031) - Fix processing of padding in RTCP.
    
      - [Rev 28046](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28046) - Add note about "Decimal Separator" when using -z io,stat,... in the tshark manual page
    
      - [Rev 28058](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28058) - [Bug 3409](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3409) - packet\_sccp.c: Init an uninit'd variable which was the cause of intermittent crashes.
    
      - [Rev 28088](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28088) - Fix displaying inconsistency in SSL protocol
    
      - [Rev 28128](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28128) - Fix a crash in PCNFSD from Mark Cave-Ayland.
    
      - [Rev 28201](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28201) - 'illegal' characters in the comment block.
    
      - [Rev 28325](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28325) - Postpone marking Lua objects as expired until the whole frame is completed.
    
      - [Rev 28333](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28333) - Lua support is no plugin.
    
      - [Rev 28358](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28358) - Extend error reporting from Port`  `Audio libary in RTP player.
    
      - [Rev 28379](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28379) - Corrected name and abbrev used for ASN.1 sequence of and set of
    
      - [Rev 28397](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28397) - Use se\_alloc0 and ep\_alloc0 in SCCP.
    
      - [Rev 28409](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=28409) - [Bug 3470](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3470) - Fix crash in NDMP.
  - Use the latest Diameter .xml files

## 1.0.7

Released: April 8, 2009 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.0.7.html)

Done:

  - Move over the following revisions:
      - [Rev 25043](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25043) - don't require that SNMPv3 passwords be 8 characters or longer.
    
      - [Rev 26652](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26652) - Fix some "format not a string literal and no format arguments" warnings.
    
      - [Rev 26802](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26802)[Rev 26808](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26808) - [Bug 3067](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3067) RTP dynamic payload clock rates incorrectly determined.
    
      - [Rev 26827](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26827) - [Bug 3048](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3048) - Correct use of proto\_tree\_add\_int\_format().
    
      - [Rev 27083](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27083) - [Bug 3269](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3269) - Add missing initializer to prevent Checkpoint CPHA dissector crash. (See also [Bug 2813](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2813))
    
      - [Rev 27311](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27311) - Handle V3 Send`  `Routing`  `Info`  `Res where the tag\[3\] is missing.
    
      - [Rev 27379](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27379) - [Bug 3233](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3233) - ANSI MAP digits type decode and bitmask corrections
    
      - [Rev 27383](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27383) - [Bug 3236](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3236) - The size element has been in network byte order since october 2004, Someone mixed up the TCP and UDP protocol numbers.
    
      - [Rev 27396](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27396) - Make "Copy as Filter" on the packet list actually work.
    
      - [Rev 27424](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27424) - The uat files can be saved before any other preferences, so try creating the personal configuration directory if saving the uat file fails.
    
      - [Rev 27458](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27458) - [Bug 3172](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3172) - tshark fails to properly close capture files when opening new ones.
    
      - [Rev 27469](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27469) - [Bug 3255](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3255) - ANSI MAP fix for missing MEID/MSC ID number in Reg`  `Not
    
      - [Rev 27470](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27470) - [Bug 3257](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3257) - BACnet Private`  `Transfer`  `Error shows malformed packet.
    
      - [Rev 27478](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27478) & [Rev 27482](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27482) - [Bug 3262](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3262) - NULL dereference in the LDAP dissector on Windows.
    
      - [Rev 27484](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27484) - [Bug 3260](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3260) - Make the silent NSIS installer silent.
    
      - [Rev 27507](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27507) - [Bug 3271](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3271) - Fix crash in ASN.1 dissector when using 'type table'
    
      - [Rev 27529](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27529) - [Bug 3247](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3247) - Incorrect index adjustment causes failure to dissect multiple capabilities in optional parameters.
    
      - [Rev 27531](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27531) - [Bug 3276](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3276) - SM Power Save value 3 not presented according to 802.11n Draft 2.07
    
      - [Rev 27550](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27550) - [Bug 3284](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3284) - ECWmin and ECWmax incorrectly set equal.
    
      - [Rev 27624](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27624) - BACnet [TimeSync](/TimeSync) message AM/PM error.
    
      - [Rev 27661](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27661), [Rev 27662](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27662) & [Rev 27674](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27674) - Fix some cases on Windows where filenames containing non-ascii characters would not work properly.
    
      - [Rev 27682](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27682) - Large loop in NetFlow/IPFIX.
    
      - [Rev 27691](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27691) - Fix small memory leak when running in build directory.
    
      - [Rev 27831](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27831) & [Rev 27836](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27836) & [Rev 27858](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27858) & [Rev 27923](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27923) - Fix ANSI MAP ASN1 description Bugs.
    
      - [Rev 27902](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27902) - Change of author address
    
      - [Rev 27918](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27918) - Fix RF5 crash.

## 1.0.6

Released: February 6, 2009 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.0.6.html)

Done:

  - Move over the following revisions:
      - [Rev 25279](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25279) - If we have pcap\_open, call it instead of pcap\_open\_live, otherwise we might crash.
    
      - [Rev 26202](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26202) - Fix to properly delete/add port when pref changed.
    
      - [Rev 27030](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27030) - Fix RSA key import for GNUTLS 2.5.x and newer.
    
      - [Rev 27038](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27038) - Select right protocol when showing no UDP(lite) summary
    
      - [Rev 27045](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27045) - Don't stop dissecting dhcpv6 on an invalid Client FQDN option ([Bug 3134](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3134))
    
      - [Rev 27061](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27061) - One last snprintf.h to remove
    
      - [Rev 27064](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27064) - Overflow fixes from babi
    
      - [Rev 27066](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27066) - Fix to [Rev 27064](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27064)
    
      - [Rev 27073](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27073) - Terminate use of Port`  `Audio after using RTP player. *Please verify before apply, since my platform doesn't allow me to test this right now*
    
      - [Rev 27095](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27095) - WPS uses UUID values, these are 16 bytes long.
    
      - [Rev 25990](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25990) - Clean up the Linux USB pseudoheader dissection.
    
      - [Rev 26868](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26868) - More Linux USB pseudoheader dissection cleanups.
    
      - [Rev 26995](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26995) - Fix follow\_tcp crash when stream filter creation fails([Bug 3119](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3119))
    
      - [Rev 27020](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27020) - More USB dissection cleanups.
    
      - [Rev 27033](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27033) - Dissect more USB messages.
    
      - [Rev 27034](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27034) - Display the USB CONTROL response data only if there \*is\* CONTROL response data.
    
      - [Rev 27036](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27036) - Dissect more USB messages.
    
      - [Rev 27046](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27046) - Fix dissection of some USB messages.
    
      - [Rev 27049](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27049) - Clean up display of some USB messages.
    
      - [Rev 27090](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27090) - Fix incorrect err\_posn\_tbl used during atm cell header error checking.
    
      - [Rev 27099](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27099) - Handle the new DLT\_USB\_LINUX\_MMAP link-layer type.
    
      - [Rev 27107](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27107) - Address licensing questions.
    
      - [Rev 27113](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27113) - Name changes for DLT\_USB\_LINUX\_MMAP -\> DLT\_USB\_LINUX\_MMAPPED.
    
      - [Rev 27117](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27117) - Wrong decoding IMSI with GSM MAP protocol([Bug 3116](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3116))
    
      - [Rev 27139](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27139) - Keep Lua from clobbering the stack ([Bug 3062](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3062))
    
      - [Rev 27158](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27158) & [Rev 27159](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27159) & [Rev 27172](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27172) - Fix crashes & etc reading K12text files ([Bug 1937](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1937))
    
      - [Rev 27165](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27165) - Fix [Bug 3175](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3175) Make the WCCP dissector "new style".
    
      - [Rev 27171](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27171) - CDP checksum calculation corrections ([Bug 3112](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3112))
    
      - [Rev 27177](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27177) - SMPP option dissection corrections ([Bug 3128](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3128))
    
      - [Rev 27190](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27190) - We had a roll-over of the calendar thingy.
    
      - [Rev 27191](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27191) - Prevent column access without proper check ([Bug 2902](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2902))
    
      - [Rev 27192](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27192) - Actually check column status before writing to it ([Bug 2902](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2902))
    
      - [Rev 27199](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27199) - Remove global variables, reduces label routines and actually check column status before writing to it ([Bug 2902](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2902))
    
      - [Rev 27201](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27201) - Add missing {0, NULL} tuples to value strings in header files.
    
      - [Rev 27205](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27205) - Implement dissection and use of address type in Interface and Label Stack TLV's. ([Bug 3179](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3179))
    
      - [Rev 27208](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27208) - dumpcap does not honor capture termination if exactly "-c \<capture packet count\>" packets have been captured
    
      - [Rev 27222](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27222) & [Rev 27223](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27223) & [Rev 27224](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27224) - Make the column check actually check the information column status. ([Bug 2902](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2902))
    
      - Remove asn2wrs.py changes from [Rev 25897](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25897) which was accidentally added in [Rev 26915](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26915)
    
      - [Rev 27269](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27269) - I'm pretty sure time\_s and time\_ns don't come from the same 4 bytes
    
      - [Rev 27276](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27276) - ANSI MAP fix for TRN digits/SMS and OTA subdissection [Bug 3214](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3214)
    
      - [Rev 27328](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=27328) - Add initializer for force\_docsis\_encap preference

## 1.0.5

Released: December 12, 2008 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.0.5.html)

Done:

  - Move over the following revisions:
      - [Rev 24989](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24989) & [Rev 24994](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24994) - Support for RFC 2920 SMTP Command Pipelining, which also happens to fix a DoS found by researchers at Bkis
    
      - [Rev 25867](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25867) - Support for IAB MAC address resolution.
    
      - [Rev 26328](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26328) & [Rev 26420](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26420) - Fix [Bug 2229](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2229) MPEG PES decode reports "Malformed Packet" when PES packet length is 0
    
      - [Rev 26088](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26088) - Fix [Bug 2828](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2828) Add Answer or Request to the Command name in the info column depending on if the R bit is set or not.
    
      - [Rev 26302](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26302) - Work around a gcc bug which makes time\_secs\_to\_str\_buf() assert.
    
      - [Rev 26421](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26421) - Always use theme widget for display filter entries.
    
      - [Rev 26502](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26502) - Always use correct theme background color in preferences.
    
      - [Rev 26522](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26522) - Fix [Bug 2534](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2534) Add the Content-Length header as a header string, while maintaining the content-length filter option.
    
      - [Rev 26531](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26531) - Let the ENIP and CIP dissectors fill the Protocol and Info columns by calling them even when tree == NULL.
    
      - [Rev 26597](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26597) - Fix [Bug 2979](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2979) Build Script`  `Exec as an Intel only application instead of universal so the whole MAC OS X application shows up as Intel only.
    
      - [Rev 26598](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26598) - Fix [Bug 2979](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2979) Build Script`  `Exec as an Intel or PPC application, according to the building host.
    
      - [Rev 26600](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26600) - Use correct dates in the OSX application info.
    
      - [Rev 26612](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26612) - Fix [Bug 2844](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2844) Make the OSX application launch when having space in the path.
    
      - [Rev 26626](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26626) & [Rev 26634](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26634) & [Rev 26635](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26635) & [Rev 26636](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26636) & [Rev 26637](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26637) & [Rev 26638](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26638) - Fix [Bug 3017](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3017) & [Bug 3018](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3018) & [Bug 3019](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3019) & [Bug 3020](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3020) & [Bug 3021](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3021) & [Bug 3022](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3022) Memory leaks
    
      - [Rev 26734](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26734) - Fix an infinite loop in WLCCP.
    
      - [Rev 26744](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26744) - Wrong item lengths, rtsp traling bits gave"Malformed packet" if not present, Frame\_num removed as length needs info from previous packet.
    
      - [Rev 26746](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26746) - Dissector fails for OIDs with [MacAddress](/MacAddress) in index.
    
      - [Rev 26752](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26752) - Fix a couple of wrong offsets, terminate dissecton where it is incomplete.
    
      - [Rev 26809](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26809) - Fix [Bug 3071](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3071) Use correct address to find conversation.
    
      - [Rev 26816](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26816) - g\_array\_append\_val should not accept pointer as argument in wtap\_register\_encap\_type.
    
      - [Rev 26841](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26841) - Fix [Bug 3079](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3079) Remove memory leaks in making VoIP calls graph.
    
      - [Rev 26848](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26848) - Fix [Bug 3086](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3086) Remove bitmask from FT\_STRING fields, causing assert when printing.
    
      - [Rev 26873](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26873) - Plug memory leak in RTP player.
    
      - [Rev 26452](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26452) - Add Python 2.6 to auto detection on Win32(Requires asn2wrs updates).
    
      - [Rev 26700](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26700) - Fix [Bug 3090](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3090) Fix double free bug caused by Lua GC after opening and closing Lua console
    
      - [Rev 26867](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26867) - The updated Profile wasn't expanded in all places.
    
      - [Rev 26877](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26877) - Put Qualification`  `Directive`  `Res in the tree, Use correct tag value for messageWaitingNotificationType (145) and analogRedirectRecord is OPTIONAL.
    
      - [Rev 26901](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26901) - Handle IP packets with a zero length in a way that doesn't make the entire payload, when running over Ethernet, look as if it's a trailer and FCS
    
      - [Rev 26905](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26905) - Expanded a profile in one of the message
    
      - [Rev 26908](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26908) - Fix [Bug 3085](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3085) Correct interpretation of QoS T-bit.
    
      - [Rev 26909](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26909) - Bugfixes for PTP dissector.
    
      - [Rev 26922](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26922) - Fix [Bug 2832](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2832) Show the actual Private or Experimental TLV/LDP msg value.
    
      - [Rev 26586](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26586) - Fix bug in each dissector: port pref change was ignored; Related: proto\_reg\_handoff rework.
    
      - [Rev 25709](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25709) - In a call to proto\_tree\_add\_bytes\_format(): actually pass a pointer to the start of the bytes
    
      - [Rev 26205](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26205) - Fix so pkt\_ccc port pref works; proto\_reg\_handoff's: gen'l cleanup.
    
      - [Rev 26208](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26208) - proto\_reg\_handoff: fix so port pref change works; gen'l cleanuop
    
      - [Rev 26718](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26718) [Rev 26719](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26719) - Fix bug wherein proto\_reg\_handoff... wasn't being called during dissector init; (definition of proto\_reg\_hand\_off... wasn't left-justified and thus was not found when generating register.c) Also: slight changes related to proto\_reg\_handoff and proto\_register: Use find\_dissector; gboolean for intiialized flag; localize saved range pref;
    
      - [Rev 26934](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26934) - Fix PPI bitfields.

## 1.0.4

Released: October 20, 2008 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.0.4.html)

Done:

  - Move over the following revisions:
    
      - [Rev 25195](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25195) - Fix [Bug 2924](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2924) (BoF in Bluetooth ACL).
    
      - [Rev 25377](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25377) and [Rev 25487](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25487) - Add missing functions to libwireshark.def
    
      - [Rev 26161](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26161) - VC6 Build problem: wiretap/k12text.c includes unistd.
    
      - [Rev 26164](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26164) - NSIP IP Address IE dissection error.
    
      - [Rev 26166](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26166) - Add missing break statement
    
      - [Rev 26169](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26169) - Fixes [Bug 2859](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2859) (Skip data portion of unknown TLV. Expand type interpretation and several other cleanups.)
    
      - [Rev 26173](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26173) - Clean up malformed packet reporting for 802.11
    
      - [Rev 26174](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26174) - Handle Airopeek V9 network subtype 2
    
      - [Rev 26190](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26190) - Fixes [Bug 2870](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2870) (Per packet memory corruption)
    
      - [Rev 26195](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26195) - Do not flag a low TTL if sending to a multicast address (224.0.0.0/4)
    
      - [Rev 26207](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26207) - Fixes [Bug 2876](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2876) (The dissector asserted displaying cookies in DTLS frames)
    
      - [Rev 26212](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26212) - Fixes [Bug 2875](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2875) (Partial fix to build --without-zlib)
    
      - [Rev 26214](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26214) - Fixes [Bug 2865](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2865) (selected\_registrar fiels in WPS IE should be 1b, not 2b)
    
      - [Rev 26228](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26228) - Fix an SNMP spelling error.
    
      - [Rev 26248](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26248) - Fixes [Bug 2889](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2889) (Add description of FT\_UINT\_BYTES)
    
      - [Rev 26268](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26268) - Fixes [Bug 2891](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2891) (Make -p command line argument work also in wireshark)
    
      - [Rev 26272](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26272) - Add the missing part of the fix for "Failure to dissect long SASL wrapped LDAP response".
    
      - [Rev 26275](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26275) - Fixes [Bug 2903](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2903) (emv -\> evm in ppi filter)
    
      - [Rev 26296](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26296) - BoF in the NFS dissector
    
      - [Rev 26311](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26311) - Fixes [Bug 2860](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2860) (Malformed Packet DCP ETSI error with UDP packet length 9)
    
      - [Rev 26314](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26314) - Fixes [Bug 2917](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2917) (Modbus/TCP ignores function code 43)
    
      - [Rev 26327](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26327) - Fix assertion on malformed commview capture (bug 2926).
    
      - [Rev 26333](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26333) - Fixes [Bug 2922](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2922) (crash due to uninitialized data)
    
      - [Rev 26369](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26369) - Fixes [Bug 2944](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2944) (Textual corrections)
    
      - [Rev 26393](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26393) - Fix [Bug 2934](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2934) (Crash when printing non-tvb-backed fields).
    
      - [Rev 25339](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25339), [Rev 25342](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25342), [Rev 25344](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25344), and [Rev 25347](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25347) - Fix bug [Bug 2549](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2549) (crash when PRP dissector is enabled). (The middle 2 revisions are only needed so the last one applies cleanly.)
    
      - [Rev 26409](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26409) - Partial fix [Bug 2627](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2627) (Let MP2T call its subdissectors, even without tree).
    
      - [Rev 26425](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26425) and [Rev 26426](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26426) - Fix [Bug 2823](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2823) (Do not pass automatic variables back into caller space).
    
      - [Rev 26437](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26437) - Create a manifest for rawshark.exe.
    
      - [Rev 26458](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26458) - Partial fix [Bug 2964](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2394) (No "Export bytes" from right click menu in packet summary pane)
    
      - [Rev 26469](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26469) - Wireless toolbar fixes.
    
      - [Rev 26475](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26475) - Bugfix for Certificate Request messages.
    
      - [Rev 26487](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26487) - Fix [Bug 2685](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2685), along with a couple of other [AirPcap](/AirPcap) bugs.

  - Update services and manuf

  - Fix [Bug 2867](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2867) which was caused by a misplaced port from TRUNK to TRUNK-1.0

## 1.0.3

Released: September 3, 2008 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.0.3.html)

Done:

  - Move over the following revisions:
      - [Rev 24833](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24833) - Fix or enhancement? It fixes error where MIKEY General Extension is reported as malformed packet
    
      - [Rev 25833](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25833) - Clean up an interface open error message on Windows.
    
      - [Rev 24878](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24878) - Tighten heuristics for RedbackLI to prevent it from dissecting non-RedbackLI packets
    
      - [Rev 25033](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25033) - Fix manpage path for rpm package
    
      - [Rev 25289](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25289) - Fix the tcp reassembly routine in epan/follow.c
    
      - [Rev 25322](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25322) - Export ptvcursor routines from libwireshark on Windows
    
      - [Rev 25677](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25677) - Fix fuzz crash in tvb\_uncompress()
    
      - [Rev 25719](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25719) - Always dissect Ethernet packets in ERF files as Ethernet
    
      - [Rev 25720](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25720) - ERF Ethernet preferences cleanup
    
      - [Rev 25722](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25722) - Fix off-by-one error in capture stop condition
    
      - [Rev 25724](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25724) - Just offer "FCS" and "no FCS" as options for Ethernet ERF packets
    
      - [Rev 25729](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25729) - Clean up PPP Multilink and Bridge Control Protocol dissection
    
      - [Rev 25732](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25732) - More PPP BCP cleanups
    
      - [Rev 25736](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25736) - Always dissect ATM packets in ERF files as ATM; fix ATM heuristics
    
      - [Rev 25737](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25737) - Have a CHDLC/PPP heuristic as a dissection option for HDLC packets in ERF files
    
      - [Rev 25739](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25739) - Fix recognition of Infiniband packets in ERF files
    
      - [Rev 25751](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25751) - Correct size AIM TLV 0x14.
    
      - [Rev 25752](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25752) - Retrieve 32 i.s.o. 24 bits from AIM TLV u32 value
    
      - [Rev 25766](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25766) - PPPoE tags PADG, PADC, and PADQ corrected (includes prerequisite [Rev 25031](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25031))
    
      - [Rev 25781](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25781) - Remove annoying [AirPcap](/AirPcap) error dialogs
    
      - [Rev 25814](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25814) - Fix TCP desegmentation when minimal header spans multiple segments
    
      - [Rev 25831](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25831) - Remove dead code in rawshark.c.
    
      - [Rev 25845](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25845) - Fix [Bug 2453](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2453): a memory corruption issue in wslua (includes prerequisites [Rev 24887](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24887) and [Rev 25175](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25175))
    
      - [Rev 25857](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25857) - Make docbook files compile after applying [Rev 25845](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25845) listed above. (A fix for a fix :smiley: )
    
      - [Rev 25862](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25862) - Fix malformed SIP headers (empty header line missing) and add an expert item explaining the fault (includes prerequisites [Rev 25531](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25531))
    
      - [Rev 25879](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25879) - Fix 802.11 group key decryption (includes prerequisites [Rev 25551](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25551) and [Rev 25581](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25581))
    
      - [Rev 25890](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25890) - Fix Failure to dissect long SASL wrapped LDAP response.
    
      - [Rev 25923](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25923) & [Rev 25924](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25924) - Fix a crash due to ep memory corruption in UMTS-FP/K12
    
      - [Rev 25956](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25956) - Include asn1/Makefile.inc.nmake and asn1/Makefile.preinc.nmake into the distribution package
    
      - [Rev 25961](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25961) - Fix [Bug 2780](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2780): Reverse direction RTP payload save
    
      - [Rev 25964](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25964) - Fix [Bug 2778](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2778): RTCP BYE message padding test
    
      - [Rev 24726](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24726) - Fixed bug with tvb\_get\_bits64()
    
      - [Rev 24942](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24942) - patch for tvb\_get\_bits16 not to read past end of buffer
    
      - [Rev 25028](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25028) - Get rid of some unused code
    
      - [Rev 25677](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25677) - Fix [Bug 2649](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2649) by adding some length checks to two while loops in tvb\_uncompress()
    
      - [Rev 25879](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25879) - WPA group key decryption from Brian Stormont
    
      - [Rev 25928](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25928) - Have some UAT helper functions copying the passed buffer before freeing the contained buffer.(If relevant in the GTK1 version)
    
      - [Rev 25940](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25940) - Make the buttons of the UAT dialog usable again, and get rid of some gtk warnings.(If relevant in the GTK1 version)
    
      - [Rev 25950](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25950) - remove a debug printf.(If relevant in the GTK1 version)
    
      - [Rev 25974](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25974) - Fix an se\_leak
    
      - [Rev 26012](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26012) - Fix for retransmission of fragmented NDS reply packets. etc.
    
      - [Rev 26020](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26020) - dl-map decoder error when decode HARQ\_DLMAP\_IE and normal IE.
    
      - [Rev 26024](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26024) - Add a missing {0,NULL} in a value\_string
    
      - [Rev 26053](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26053) - Fix from Christopher Maynard as reported in [Bug 2822](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2822).
    
      - [Rev 26054](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26054) - Modified version of a fix from Christopher Maynard as reported in [Bug 2822](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2822).
    
      - [Rev 26057](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26057) - Fix a case of && which should be &; add some parentheses for clarity.
    
      - [Rev 26058](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26058) - Fix a (probably benign) case where it appears that && should be &
    
      - [Rev 26070](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26070) - Fix a couple of crashes in WPA group key decryption
    
      - [Rev 26071](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26071) - Add another buffer length check to group key decryption
    
      - [Rev 26115](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=26115) - Fetch the key length using pntohs. Initialize and check its length

## 1.0.2

Released: July 10, 2008 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.0.2.html)

Done:

  - Move over the following revisions:
    
      - [Rev 24852](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24852) - Fix SVR4 packaging to work with GTK2 too (NOTE: this was in the Done-for-1.0.1 list but the actual change was not copied over. Its neighbors in the list 24838 and 24877 were copied over so it was probably just an oversight.)
    
      - [Rev 25343](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25343) - Fix for bug \#2470; (don't memcmp past end of g\_malloc'd buffer). (Related changes to comments should probably also be copied: [Rev 25253](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25253) and [Rev 25345](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25345))
    
      - [Rev 25666](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25666) - Require libgcrypt 1.1.92 or later (packet-pkcs12-template.c needs it)
    
      - [Rev 25668](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25668) - Fix a crash when listing interfaces on some versions of Windows (Bug \#2677)
    
      - [Rev 25331](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25331) - Don't define INET6\_ADDRSTRLEN (fix compile with some MS compilers)

  - Manually add "epan/privileges.c" to WTAP\_PLUGIN\_SOURCES in Makefile.am when plugins are NOT configured (see [this message](http://www.wireshark.org/lists/wireshark-dev/200806/msg00338.html)) to fix compilation on \*NIX when we're not building with plugins.

  - Update the User Guide package from 0.99.7 version to 1.0 version

## 1.0.1

Released: June 30, 2008 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.0.1.html)

Done:

  - Move over the following revisions:
      - [Rev 24756](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24756) - Remove a newline from a filter description.
    
      - [Revs 24757](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24757) & [24758](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24758) - We're not "prerelease" any more.
    
      - [Rev 24759](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24759) - Fix bug 2393: E212 Mobile network code 3rd digit is not correctly decoded
    
      - [Rev 24760](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24760) - Fix bug 2395: BOOTP dissector fails to initialize/display some values.
    
      - [Rev 24765](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24765) - Allocate size of data pointed to (64 bits) rather than size of pointer to data...
    
      - [Rev 24768](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24768) - Fix bug 2405: build debian-package broken: misspelled variable in Makefile.am
    
      - [Rev 24769](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24769) - Fix "make svr4-package"
    
      - [Rev 24796](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24796) - Fix bug 2378: initialize tcp conversation data when coming from a conversation template
    
      - [Rev 24834](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24834) - Handle empty REMOTEHOST environment variable correctly. Needed for FreeBSD 7.0
    
      - [Rev 24837](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24837) - Fix bug 2414: Statistics \> Multicast Streams are broken
    
      - [Rev 24838](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24838) - Fix bug 2407: LDAP dissector crash (in expert info composite)
    
      - [Rev 24877](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24877) - Fix bug 2440: RTCP MOS fields display wrong values
    
      - [Rev 24929](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24929) - Fix bug 2359: Updated ERF file importer to support ERF files created with a snaplength
    
      - [Rev 24965](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24965) - Fix bug 2452: Packets incorrectly decoded as DPLAY instead of RTP
    
      - [Rev 24992](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24992) - Fix crash part of bug 2432: failed tshark PDML export to file
    
      - [Rev 25014](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25014) - Fix bug 2457: Fix wireshark-filter man page for packet-diameter\_3gpp.c fields
    
      - [Rev 25015](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25015) - Fix bug 2456: Incorrect decoding of DST MAC address of frame containing ICMPv6 Echo Request
    
      - [Rev 25039](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25039) & [25068](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25068) - Fix bug 2464: Do not assert when checking for validity of packet data in PANA
    
      - [Rev 25040](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25040) & [25069](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25069) - Do not assert when checking for validity of packet data in KISMET
    
      - [Rev 25055](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25055) - Fix bug 1392: Add port to conversation key so that RPC reassembly works when relative sequence numbers are used.
    
      - [Rev 25058](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25058) - Fix bug 2148: Don't call RPC subdissectors when there is no more data in the packet
    
      - [Rev 25118](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25118) - Fix bug 2475: Add a preference to the UNISTIM dissector so that you can set the default port back to 5000, even though this conflicts with other dissectors.
    
      - [Rev 25134](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25134) - Fix bug 2442: Some SNMP trap packets parse error.
    
      - [Rev 25135](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25135) - Fix bug 2253: SNMP trap dissectors fails.
    
      - [Rev 25137](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25137) - Fix reported problem in bug 2402: Add "tpncp." before all filters generated in TPNCP
    
      - [Rev 25146](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25146) - Fix bug 2481: Debug text output from MIKEY dissector
    
      - [Rev 25148](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25148) - Fix bug 2468: Dissector bug, protocol SNMP: proto.c:932: failed assertion.
    
      - [Rev 25150](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25150) - Fix bug 2497: RTP heuristic interferes with STUN/T38 portion of heuristic
    
      - [Rev 25168](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25168) - Fix bug 2501: Add a missing break in the wimax plugin.
    
      - [Rev 25170](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25170) - Flex (v 2.5.35) uses this symbol to "exclude" unistd.h
    
      - [Rev 15172](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25172) - Fix Bug 2493: Prevent Windows compiler error when using flex 2.5.35 (Part 1)
    
      - [Rev 25173](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25173) - Fix Bug 2493: Prevent Windows compiler error when using flex 2.5.35 (Part 2)
    
      - [Rev 25174](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25174) - Fix Bug 2493: Prevent Windows compiler error when using flex 2.5.35 (Part 3)
    
      - [Rev 25184](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25184) - Fix bug 2505: RTP header extensions with length\>4 bytes dissected incorrectly
    
      - [Rev 25207](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25207), [Rev 25211](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25211) & [Rev 25212](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25212) - Fix for bug 1735: Force foreground when background is forced
    
      - [Rev 25214](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25214) - Fix bug 2513: compilation failure on non-european windows (due to non-ascii characters)
    
      - [Rev 25221](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25221) - Fix bug 2517: BACnet BVLC NAK decoding
    
      - [Rev 25223](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25223) - Fix bug 2518: 'tshark -Tfields -e data' Omits Last Character of Data
    
      - [Rev 25351](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25351) - Set SYMROOT to make osx-package work correctly
    
      - [Rev 25373](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25373) - Print correct number of packets for captured "From first to last marked packet"
    
      - [Rev 25406](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25406) - Debian packaging files for Wireshark 1.0
    
      - [Rev 25408](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25408) - Cleanup desktop files for Debian packaging
    
      - [Rev 25409](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25409) - Fix bug 2583: Fixed enumeration type for new-mode in change-of-life-safety
    
      - [Rev 25410](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25410) - Don't include \\r in linktype on win32
    
      - [Rev 25415](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25415) & [25416](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25416) - Fixes in iFCP dissector
    
      - [Rev 25439](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25439) - Fix for FCP response code
    
      - [Rev 25442](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25442) - 802.1ah Instance tag ethernet type set to 0x88e7.
    
      - [Rev 25448](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25448) - Fix distribution packaging of debian packaging files.
    
      - [Rev 25462](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25462) & [25466](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25466) - Fix off-by-one errors in GSM SMS.
    
      - [Rev 25470](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25470) - Fix bug 2616: repair heuristic on iSCSI login command.
    
      - [Rev 25475](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25475) - Fix bug 2619: Get the current OUI dataset from IEEE.
    
      - [Rev 25476](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25476) - Fix the services file so that port 2049 is reported as "nfs" rather than "shilp".
    
      - [Rev 25443](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25443) - Return 0 from MSMMS dissector if not dissecting
    
      - [Rev 25483](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25483) - Do not overwrite existing files when copying dependencies to the osx-package, as this can overwrite the wireshark libs.
    
      - [Rev 25489](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25489) - Fix bug 2599: Make storage-based and time-based "Next file every" checkboxes behave equal
    
      - [Rev 25490](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25490) - fix BlockError value\_string.
    
      - [Rev 25516](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25516) - Update services
    
      - [Rev 25517](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25517) - Update manuf
    
      - [Rev 25525](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25525) - Make the MGCP dissector give away the package if it knows its not a MGCP
    
      - [Rev 25526](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25526) - Make the ACTRACE dissector give away the package if it knows its not a ACTRACE
    
      - [Rev 24683](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24683) - Allow custom columns in export as CSV and PSML - take II
    
      - [Rev 25579](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25579) - Fix \*NIX builds of our inet\_pton.c
    
      - [Rev 25584](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25584) & [25586](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25586) - Fix RMI information disclosure
    
      - [Rev 25590](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25590) - Fix out-of-tree builds of our inet\_pton.c
    
      - [Rev 25598](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25598) - Fix EIGRP ext IP route unreachable indication.
    
      - [Rev 25604](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25604) - Update README to current reality.
    
      - [Rev 25605](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25605) - Further updates to README.
    
      - [Rev 25608](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25608) - Make it clearer that you need to set preferences to decode ERF ATM and Ethernet captures correctly.
    
      - [Rev 25609](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25609) - Make the ERF default for HDLC captures also make it clearer that you need to set preferences.
    
      - [Rev 25612](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25612) - Fix crash in syslog dissector.
    
      - [Rev 25631](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25631) - Fix bug in IUA dissector.
    
      - [Rev 25635](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25635) - Account for IPv6 addresses in SIP Via header.
    
      - [Rev 25638](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=25638) - Don't open stdin in the Windows debug console.
  - Fix bug 2425: Copy Read\_me\_first.rtf from trunk/packaging/macosx/ to trunk-1.0/packaging/macosx/
  - Update GNUTLS and libsmi Windows library packages.

## 1.0.0

We've released Wireshark 1.0 on the first day of [Sharkfest'08](http://sharkfest.wireshark.org/sharkfest.08).

Released: March 31, 2008 [Release Notes](http://www.wireshark.org/docs/relnotes/wireshark-1.0.0.html)

Complete:

  - Move over the following revisions:
      - [Rev 24678](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24678) - Allow tshark to print custom columns.
    
      - [Rev 24679](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24679) - Allow custom columns when printing.
    
      - [Rev 24680](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24680) - Export get\_column\_custom\_field from libwireshark.
    
      - [Rev 24682](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24682) - Allow custom columns when printing - second try.
    
      - [Rev 24683](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24683) - Allow custom columns in export as CSV and PSML.
    
      - [Rev 24687](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24687) - Fix direction info in follow tcp stream
    
      - [Rev 24693](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24693) - Avoid calling some free() on WIN32 on memory that may be allocated in another heap.
    
      - [Rev 24694](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24694) - Export SRTP related functions from libwireshark.
    
      - [Rev 24691](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24691) - Handle the case where length is \> remaining tvb
    
      - [Rev 24697](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24697) - Handle the case where length is \> remaining tvb
    
      - [Rev 24698](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24698) - Return value tvb if pressent from all branches.
    
      - [Rev 24702](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24702) - Windows: use free() only if vc6 (as suggested by Peter Johansson); ...
    
      - [Rev 24703](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24703) - Use a compatible version of libgmodule for wireshark-gtk1 under Windows.
    
      - [Rev 24704](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24704) - Don't call cap\_set\_proc() inappropriately.
    
      - [Rev 24705](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24705) - Fix breakage from r24703.
    
      - [Rev 24706](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24706) - Cleanup outer Docbook files.
    
      - [Rev 24710](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24710) - Make it possible to use Glib 2.16.x (Needed if we decide to go with a newer GTK package).
    
      - [Rev 24715](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24715) - Follow SSL/UDP Stream gets direction wrong ... (bug \#1212)
    
      - [Rev 24718](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24718) - If [Rev 24710](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24710) goes in this revision needs to go in too.
    
      - [Rev 24720](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24720) - Remove some unnamed unions.
    
      - [Rev 24722](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24722) - Add libcap to INSTALL.
    
      - [Rev 24725](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24725) - Fix fuzz-test.sh under Cygwin.
    
      - [Rev 24716](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24716) - dumpcap.c: Fix for bug \#2228
    
      - [Rev 24722](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24722) - dumpcap.c: Fix typos.
    
      - [Rev 24724](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24724) - dumpcap.c: Fix typos.
    
      - [Rev 24730](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24730) - Do not add packet length twice to cum\_bytes when having a TIME REF frame (bug 2387).
    
      - [Revs 24732](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24732) & [24733](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24733) - Make "Raw" the default stream save format.
    
      - [Rev 24734](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24734) - Change the misleading "Filter" button in the Win32 File and Merge dialogs to a label.
    
      - [Rev 24735](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24735) - Add tooltips to the UNIX/Linux File and Merge dialogs.
    
      - [Rev 24727](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24727) - editcap.c: remove leftover debug printouts
    
      - [Rev 24742](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24742) - Add word wrapping back to Follow Stream dialog
    
      - [Revs 24747](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24747), [24748](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=24748) & [24749](http://anonsvn.wireshark.org/viewvc/viewvc.cgiview=rev&revision=24749) - OS X packaging fixes
  - Change the version number.

---

Imported from https://wiki.wireshark.org/Development/Trunk-1.0 on 2020-08-11 23:13:13 UTC
