# Past 1.8 Releases

For other and upcoming releases, see the [Git repository shortlog](https://code.wireshark.org/review/gitweb?p=wireshark.git;a=shortlog;h=refs%2Fheads%2Fmaster-1.8).

## 1.8.13

Released March 7, 2014 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.8.13.html)

Done:

  - Move over the following revisions:
      - [Change 338](https://code.wireshark.org/review/#/c/338/) - Fix unregistered hf errors from t124 dissector (errors come from the backport of r49644)
    
      - [Change 343](https://code.wireshark.org/review/#/c/343/) - [Bug 9598](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9598) - Clear the intermediate line buffer for DMX channels.
    
      - [Change 105](https://code.wireshark.org/review/#/c/105/) - DVB-CI: correct a typo in a filter string
    
      - [Change 7](https://code.wireshark.org/review/#/c/7/) - [Bug 9633](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9633) - Do not try to add a new NAL unit when the previous one was not decoded.
    
      - [Change 8](https://code.wireshark.org/review/#/c/8/) - [Bug 9649](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9649) - SMPP: source\_telematics\_id value length is 1 byte.
    
      - [Rev 54181](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=54181) - [Bug 9571](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9571) - Fix " Wireshark stops showing new packets but dumpcap keeps writing them to the temp file"
    
      - [Rev 49145](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49145) - [Bug 9488](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9488) - Remove static packet\_info \*gpinfo and just use the packet\_info provided by the function
    
      - [Rev 54227](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=54227) - [Bug 9578](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9578) - Homeplug dissector bug: STATUS\_ACCESS\_VIOLATION: dissector accessed an invalid memory address

## 1.8.12

Released December 17, 2013 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.8.12.html)

Done:

  - Move over the following revisions:
      - [Rev 53197](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53197) - [Bug 9388](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9388) - Avoid an infinite loop in SIP dissector.
    
      - [Rev 52987](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52987) - BAT has a bouquet ID, no service ID
    
      - [Rev 53071](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53071) - [Bug 9031](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9031) - SIP contact-param parsing fails in case the last parameter includes a quoted string.
    
      - [Rev 53148](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53148) - [Bug 9382](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9382) - Fix dissection of GSM MAPv3 ReportSM\_[DeliveryStatusRes](/DeliveryStatusRes).
    
      - [Rev 53247](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53247) - [Bug 9409](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9409) - don't call proto\_item\_get\_len() when the argument can be NULL
    
      - [Rev 53322](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53322) - fix DVB-CI application capability handling
    
      - [Rev 53626](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53626) - Support long Domain Names in NTLMSSP v2 and prevent crash
    
      - [Rev 53627](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53627) - [Bug 8976](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8976) - crash when selecting "Decode As" based on SCTP PPID.
    
      - [Rev 53838](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53838) - [Bug 9521](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9521) - Correctly update the data length of the SCSI payload within ISCSI.
    
      - [Rev 53842](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53842) - [Bug 9512](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9512) - DTLS: Fix buffer overflow in mac check.
    
      - [Rev 54138](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=54138) - [Bug 9563](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9563) - fix "decode as" for time protocol.
    
      - [Rev 53940](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53940) - [Bug 9550](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9550) - GSM SMS UDH EMS control expects 4 octets instead of 3 with OPTIONAL 4th.

Not done:

  - Move over the following revisions:
      - [Rev 52215](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52215) - [Bug 9186](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9186) - Minor correction to dissection of DLR frames in Ethernet/IP dissector -- *Doesn't apply?*
    
      - [Rev 50272](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50272) - [Bug 8871](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8871) - TLS decryption fails with XMPP start\_tls -- *Doesn't apply?*
    
      - [Rev 52208](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52208) - [Bug 5349](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5349) - EAP-TLS reassemble does not happen because of misplaced if (tree) -- *Doesn't apply?*
    
      - [Rev 52403](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52403) - [Bug 9206](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9206) - Improve "eHRPD Indicator" NVSE dissection in 3GPP2 A11 Registration Request -- *Doesn't apply?*
    
      - [Rev 52493](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52493) - [Bug 9258](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9258) - Fix tshark core dump when it can't keep up with dumpcap's ring of files. -- *Doesn't apply?*
    
      - [Rev 52683](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52683) - [Bug 9129](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9129) - Limit UAT dialog to single popup to prevent UAT list from becoming unsynchronized (and possibly crash) -- *Doesn't apply?*
    
      - [Rev 52733](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52733) - [Bug 9300](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9300) - Fix padding bytes overlapping due to NDR alignment -- *Doesn't apply?*
    
      - [Rev 53646](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53646) - [Bug 9433](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9433) - Bugfix timestamp formatting of Gigamon trailer. -- *Doesn't apply?*
    
      - [Rev 53670](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53670) - [Bug 8894](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8894) - Tx MCS set is not interpreted properly in WLAN beacon frame. -- *Doesn't apply?*
    
      - [Rev 53845](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53845) - [Bug 9505](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9505) - RLC dissector cannot assemble PDUs with SNs skipped and wrap-arounded. -- *Doesn't apply?*
    
      - [Rev 53843](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53843) - [Bug 9512](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9512) - dtls: fix buffer overflow in mac check. -- *Breaks API / ABI?*

## 1.8.11

Released November 1, 2013 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.8.11.html)

Done:

  - Move over the following revisions:
      - [Rev 52464](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52464) - [Bug 9252](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9252) - Fix WCCP fix hash buckets assignment info decoding
    
      - [Rev 51942](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51942) - [Bug 9126](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9126) - Fix the value of 'SEND\_TO\_UE' in the DIAMETER Gx dictionary for Packet-Filter-Usage AVP
    
      - [Rev 52036](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52036) - [Bug 9139](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9139) - Misuse of pointer-to-pointer in IEEE-802.15.4 dissector
    
      - [Rev 52131](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52131) - [Bug 9157](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9157) - BSSGP: Fix dissection of Trace Type IE in SGSN-INVOKE-TRACE message
    
      - [Rev 52154](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52154) - [Bug 9168](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9168) - PER dissector crash
    
      - [Rev 52157](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52157) - Minor ENIP dissector bugfixes
    
      - [Rev 52221](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52221) - When a line of text wraps to the next line, the character that caused the line to wrap was not being printed.
    
      - [Rev 52354](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52354) - [Bug 9228](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9228) - Ensure that decompressed tvb exists before trying to add it to the tree
    
      - [Rev 52209](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52209) - [Bug 5349](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5349) - EAP-TLS reassemble does not happen because of misplaced if (tree)
    
      - [Rev 52463](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52463) - [Bug 9248](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9248) - Fix (near) infinite loop and bugfix some missed offset increments.
    
      - [Rev 52570](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52570) - [Bug 9263](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9263) - Don't allow the TCP dissector to assume that either tvb\_length\_remaining() or tvb\_reported\_length\_remaining() always return a value \>= 0.
    
      - [Rev 52734](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52734),[Rev 52735](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52735) - [Bug 9301](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9301) - Datablob size is NDR64/32 dependent
    
      - [Rev 52736](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52736) - [Bug 9302](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9302) - dce-rpc: properly dissect multiple PDU in the same packet
    
      - [Rev 52738](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52738) - Remove if (fh\_tree) checks as add\_ethernet\_trailer() calls such functions as dissector\_try\_heuristic(), expert\_add\_info(), and col\_append\_str(), which all need to be called whether fh\_tree is NULL or not.
    
      - [Rev 52838](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52838) - [Bug 9317](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9317) - Display the frame number on the packet summary line if it's one of the configured columns.
    
      - [Rev 52977](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52977) - [Bug 9296](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9296) - Take a copy of dissector string registrations to fix Lua registrations.
    
      - [Rev 52566](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52566) - [Bug 9262](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9262) - Fix dissection of PTP Management messages
    
      - [Rev 52732](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52732) - [Bug 9299](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9299) - NULL check ref\_nt\_challenge\_response and ref\_lm\_challenge\_response
    
      - [Rev 53016](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53016) - [Bug 9360](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9360) - Fix IRC response command filter

Not done:

  - Move over the following revisions:
      - [Rev 52215](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52215) - [Bug 9186](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9186) - Minor correction to dissection of DLR frames in Ethernet/IP dissector -- *Doesn't apply?*
    
      - [Rev 50272](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50272) - [Bug 8871](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8871) - TLS decryption fails with XMPP start\_tls -- *Doesn't apply?*
    
      - [Rev 52208](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52208) - [Bug 5349](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5349) - EAP-TLS reassemble does not happen because of misplaced if (tree) -- *Doesn't apply?*
    
      - [Rev 52403](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52403) - [Bug 9206](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9206) - Improve "eHRPD Indicator" NVSE dissection in 3GPP2 A11 Registration Request -- *Doesn't apply?*
    
      - [Rev 52493](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52493) - [Bug 9258](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9258) - Fix tshark core dump when it can't keep up with dumpcap's ring of files. -- *Doesn't apply?*
    
      - [Rev 52683](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52683) - [Bug 9129](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9129) - Limit UAT dialog to single popup to prevent UAT list from becoming unsynchronized (and possibly crash) -- *Doesn't apply?*
    
      - [Rev 52733](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52733) - [Bug 9300](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9300) - Fix padding bytes overlapping due to NDR alignment -- *Doesn't apply?*

## 1.8.10

Released September 10, 2013 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.8.10.html)

Done:

  - Move over the following revisions:
      - [Rev 51599](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51599) - [Bug 9085](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9085) - GSM A-I/F DTAP: fix display of Detach Type IE in Detach Request message
    
      - [Rev 51195](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51195) - [Bug 9005](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9005) - Fix fuzz failure in NBAP dissector.
    
      - [Rev 51196](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51196) - [Bug 9020](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9020) - Fix infinite loop in assa-r3 dissector.
    
      - [Rev 51213](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51213) - [Bug 9019](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9019) - Buffer overflow in packet-rtps.c
    
      - [Rev 51213](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51213) - [Bug 9019](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9019) - Buffer overflow in packet-rtps2.c (manually copy diff to second file, no longer in trunk).
    
      - [Rev 51516](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51516) - Ensure ldap\_call\_response\_t struct is always completely initialized
    
      - [Rev 51603](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51603) - [Bug 9079](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9079) - Very long loop in MQ dissector.
    
      - [Rev 51788](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51788) - [Bug 9103](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9103) - Warning for attempting to install 64-bit Wireshark on a 32-bit machine has an embedded "\\n"
    
      - [Rev 50923](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50923) - [Bug 8980](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8980) - IO graph advanced, error when calculating value for field of type FT\_RELATIVE\_TIME with multiple items in single frame
    
      - [Rev 50940](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50940) - [Bug 8918](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8918) - Incorrect dissection of IPFIX (min/max)[IpTotalLength](/IpTotalLength) fields.
    
      - [Rev 50969](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50969) - [Bug 8841](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8841) - Fix PER normally small non-negative whole number dissection when it is greater than or equal to 64
    
      - [Rev 51313](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51313) - - fix dissect\_sip\_tcp\_heur()
    
      - [Rev 51321](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51321) - [Bug 9031](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9031) - SIP contact-param parsing should be stopped when finding a comma separator
    
      - [Rev 51339](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51339) - [Bug 9038](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9038) - 802.11 HT Extended Capabilities B10 decode incorrect
    
      - [Rev 51360](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51360) - [Bug 9036](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9036) - Ethercat ADS byte highlighting is incorrect
    
      - [Rev 51448](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51448) - Buffer overflow (off-by-1 error) in SSS dissector. Also, protect against tvb\_length\_remaining possibly returning -1.
    
      - [Rev 51493](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51493) - Make sure rawshark initializes a struct.
    
      - [Rev 51566](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51566) - Support SVN later than 1.7.11 in make-version
    
      - [Rev 51785](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51785) - [Bug 9101](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9101) - As per the HTTP spec, prefer chunked transfer-encoding to content-length when reassembling if we get both.
    
      - [Rev 51789](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51789) - [Ask 24221](http://ask.wireshark.org/questions/24221) - Display "TEID/GRE Key" field consistently as hexadecimal.
    
      - [Rev 51815](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51815) - Added syntax and range checks for Lua Prefs.range default values.
    
      - [Rev 51872](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51872) - [Bug 4461](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4461) - Fixed [ByteArray](/ByteArray) append/prepend and concat crashes.
    
      - [Rev 51899](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51899) - [Bug 5200](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5200) - Initialize all tvb values in [FieldInfo](/FieldInfo)\_get\_range.
    
      - [Rev 49673](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49673) - [Bug 8742](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8742) - Fix corrupt-netmon crash

Not done:

  - Move over the following revisions:
      - [Rev 51236](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51236) - [Bug 9014](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9014) - Crash in TShark with option "-z io,stat" in the presence of negative relative packet timestamps -- *Doesn't apply cleanly*
    
      - [Rev 51422](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51422) - [Bug 8989](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8989) - SGI Nsym disambiguation is unconditionally displayed when dissecting VHT -- *Doesn't exist in 1.8?*

## 1.8.9

Released July 26, 2013 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.8.9.html)

Done:

  - Move over the following revisions:
      - [Rev 48758](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48758) - Allow linking with GnuTLS 3.1.10+.
    
      - [Rev 50134](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50134) - [Bug 8831](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8831) - Near-infinite loop in BT-SDP dissector.
    
      - [Rev 50450](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50450) - [Bug 8911](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8911) - Fix long loop in DIS dissector
    
      - [Rev 50474](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50474) - [Bug 8916](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8916) - DVB-CI: fix integer wrap around caused by invalid TPDU length
    
      - [Rev 50504](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50504) - [Bug 8923](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8923) - Fix very long loop in gsm\_a\_rr (and other proto\_tree\_add\_bits\_item() callers)
    
      - [Rev 50672](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50672) - [Bug 8940](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8940) - Fix fuzz failure in gsm\_a\_common.
    
      - [Rev 49567](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49567) - [Bug 8708](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8708) - Add MAC-DATA support to TETRA dissector and other minor improvements
    
      - [Rev 49863](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49863) - [bug 8782](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8782) - SCSI (SPC) sense key specific information field must not include SKSV.
    
      - [Rev 49837](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49837) - Fix all errors and warnings found by podchecker.
    
      - [Rev 49851](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49851), [Rev 49852](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49852), [Rev 49854](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49854) - [Bug 8763](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8763) - Don't treat zero-length names in Name Resolution Block entries as errors, and discard zero-length names returned by IP-address-to-host-name resolvers or supplied from pcap-ng NRBs.
    
      - [Rev 49865](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49865), [Rev 49866](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49866) - [Bug 8774](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8774) - Explicitly set the pod file encoding to utf8 to hopefully accommodate UTF-8 characters in the AUTHORS file.
    
      - [Rev 49899](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49899) - Fix wrong offset in H.235 tokens causing malformed packet exception.
    
      - [Rev 49908](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49908) - [Bug 8793](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8793) - Don't crash when Flow Graph window cancelled while Graph Analysis window is open.
    
      - [Rev 49937](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49937) - [Bug 3034](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3034) - Wireshark hides under Taskbar
    
      - [Rev 49939](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49939) - [Bug 3123](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3123) - Wireshark doesn't translate IEEE802a OUI
    
      - [Rev 49946](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49946) - [Bug 7543](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7543) - Lines of text are truncated if they are either longer than the paper width or past the paper height.
    
      - [Rev 49983](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49983) - [Rev 49984](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49984) - Perform a signed comparison, rather than unsigned, because tvb\_length\_remaining() can return -1.
    
      - [Rev 49985](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49985) - [Bug 8722](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8722) - Fix possible uninitialized variable in PER dissectors.
    
      - [Rev 50125](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50125) - [Bug 4507](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4507) - IEEE 802.15.4 frame check sequence in "Chipcon mode" not displayed correctly (RSSI should be displayed in dB, not dBm).
    
      - [Rev 50127](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50127), [Rev 50128](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50128) - Fixes for Ethernet FCS.
    
      - [Rev 50151](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50151) - [Bug 8851](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8851) - ansi\_637\_tele dissector displays MSB as MBS for Call-Back Number
    
      - [Rev 50173](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50173) - [Bug 8813](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8813) - Support IPv6 on Solaris later than 5.8
    
      - [Rev 50185](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50185) - [Bug 8857](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8857) - IMAP dissector: do not assume that we must have at least 1 character present per line before \\r\\n
    
      - [Rev 50226](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50226) - [Bug 8828](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8828) - Always initialize pdata in dissect\_ndr\_\* functions.
    
      - [Rev 50228](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50228) - [Bug 8864](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8864) - Bugfix KDSP dissector.
    
      - [Rev 50282](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50282) - Try to do something sane if the size argument to tvb\_format\_\*() functions is negative. (Fixes Coverity CID 1035325: Improper use of negative value)
    
      - [Rev 50301](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50301) - Guard against tvb\_reported\_length\_remaining() possibly returning -1. (Fixes Coverity CID 1035326: Improper use of negative value)
    
      - [Rev 50305](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50305) - Ensure 'info' is not NULL before dereferencing it. (Fixes Coverity CID 280618: Dereference before null check)
    
      - [Rev 50313](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50313) - Cache malformed filter for expert info.
    
      - [Rev 50423](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50423) - [Bug 8888](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8888) - Fix over-allocation in tshark's io-stat.
    
      - [Rev 50465](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50465),[Rev 50469](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50469) - [Bug 8909](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8909) - Graph Filter field limited to 256 characters (advanced filter field limited to 100 characters)
    
      - [Rev 50480](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50480) - [Bug 8897](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8897) - SIP stats shows incorrect values for Max/Ave setup times.
    
      - [Rev 50483](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50483) - [Bug 5734](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5734) - Use luaL\_optnumber for [ProtoField](/ProtoField) mask, to avoid a signed cast.
    
      - [Rev 50510](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50510) - In packet-slsk.c:check\_slsk\_format(), compare the return value of tvb\_length\_remaining() \> 0 instead of \!= 0 since the function can return -1.
    
      - [Rev 50745](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50745) - [Bug 8955](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8955) - Invalid preference names aren't reported as such
    
      - [Rev 50791](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50791) - [Bug 8959](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8959) - Filter doesn't support cflow ASN larger than 65535.
    
      - [Rev 50826](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50826) - [Bug 8953](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8953) - Counted string fields often cause the packet to falsely show up as malformed
    
      - [Rev 50892](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50892) - [Bug 8960](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8960) - Fix mongo dissection: allow FT\_STRING's to be added with a length of -1.
    
      - [Rev 49697](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49697) - [Bug 8742](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8742) - Fix corrupt-netmon crash

Not done:

  - Move over the following revisions:
      - [Rev 50179](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50179) - [Bug 8835](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8835) - Bugfix support for RFC 4379. -- *Didn't apply cleanly*
    
      - [Rev 50210](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50210) - [Bug 8852](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8852) - Fix LISP decoding. -- *Doesn't apply to 1.8?*
    
      - [Rev 50230](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50230) - [Bug 8823](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8823) - Separate IP option type fields for each dissector that uses dissect\_ip\_tcp\_options(). -- *Doesn't apply cleanly*

## 1.8.8

Released June 7, 2013 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.8.8.html)

Done:

  - Move over the following revisions:
      - [Rev 44674](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44674) - [Bug 7664](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7664) (partial),[Bug 8726](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8726) - Fix crash in the GMR1\_BCCH dissector.
    
      - [Rev 43716](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43716) - [Bug 8725](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8725) - Fix fuzz crash in capwap dissector.
    
      - [Rev 46128](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46128) - [Bug 7880](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7880),[Bug 8727](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8727) - Fix PPP fuzz crash.
    
      - [Rev 49409](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49409) - Handle truncated packets with DLT\_USERxy
    
      - [Rev 49418](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49418) - [Bug 8697](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8697) - Don't access nbap\_dch\_chnl\_info if the index is \> maxNrOfDCHs.
    
      - [Rev 49426](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49426) - Add some newlines at the end of the wireshark.pod.template file so the authors are printed properly.
    
      - [Rev 49437](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49437) - [Bug 8680](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8680) - Add decryption for WPA eapol 4-way handshake
    
      - [Rev 49451](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49451) - [Bug 8066](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8066) - Add argument to printf to prevent "corrupted" data.
    
      - [Rev 49513](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49513) - Fix presentation of randpkt types.
    
      - [Rev 49565](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49565) - [Bug 7733](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7733) - Ensure most severe is displayed in expert column.
    
      - [Rev 49546](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49546) - Fix computation of TP-User-Data-Length when SMS is coded with GSM 7 bit default alphabet and TP-User-Data-Header field is present
    
      - [Rev 49679](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49679) - [Bug 8729](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8729) - Denial of service via crafted RDP packet.
    
      - [Rev 49686](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49686) - [Bug 8730](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8730) - Infinite loop in GSM CBCH dissector.
    
      - [Rev 49729](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49729) - [Bug 8759](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8759) - handle list ending delimiter in bt-dht peer list
    
      - [Rev 49744](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49744) - [Bug 8764](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8764) - Fix fuzz failure in assa\_r3 dissector.
    
      - [Rev 48789](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48789) - Fix dissection of IMSI detach from non-EPS service type
    
      - [Rev 49610](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49610) - [Bug 8731](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8731) - Bugfix crash when 'SCTP' -\> 'Prepare Filter for this Association' has no associations.
    
      - [Rev 49623](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49623) - [Bug 8733](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8733) - Fix infinite recursion in HTTP dissector.
    
      - [Rev 49682](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49682) - [Bug 8744](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8744) - Display C12.22 Invocation Id as unsigned integer
    
      - [Rev 49698](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49698) - [Bug 8756](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8756) - Compute the number of septets needed for an alphanumeric address
    
      - [Rev 49722](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49722) - [Bug 8739](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8739) - Move offset to end of line without assuming that we always have \\r\\n at the end of it
    
      - [Rev 49644](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49644), [Rev 49652](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49652) - [Bug 3290](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3290) - Do proper bounds checking for NULL trees.
    
      - [Rev 49739](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49739) - [Bug 8760](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8760) - Fix crash from fuzz'd Veriwave file.
    
      - [Rev 49787](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49787) - [Bug 8768](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8768) - TETRA dissector assertion.
    
      - [Rev 49802](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49802) - [Bug 8717](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8717) - Fix crash trying to reassembly bad ETSI DCP packets.
    
      - [Rev 49804](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49804) - [Bug 8736](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8736) - Crash analyzing VoIP Calls (T38)

## 1.8.7

Released May 17, 2013 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.8.7.html)

Done:

  - Move over the following revisions:
      - [Rev 47295](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47295) - [Bug 8231](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8231) - Fix rx\_min calculation in dcp-etsi. Also fixes fuzz failure reported in [Bug 8543](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8543).
    
      - [Rev 47758](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47758) and related - Better running executable detection in the Windows installer and uninstaller.
    
      - [Rev 47805](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47805) - [Bug 8364](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8364) - Denials of Service in packet-reload.c, [Bug 8546](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8546) - Denial of Service remains in packet-reload.c in 1.8.6
    
      - [Rev 48196](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48196) - Don't show message boxes when doing a silent install or uninstall.
    
      - [Rev 48332](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48332) - [Bug 8481](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8481) - Crash via bad format string in call to val\_to\_str().
    
      - [Rev 48419](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48419) - [Bug 8499](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8499) - Signed/unsigned confusion caused bad allocation requests in websocket dissector.
    
      - [Rev 45286](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45286) - Fix unused-result warning in privileges.c
    
      - [Rev 48582](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48582) - [Bug 6011](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6011) & [Bug 7926](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7926) - Remove searching in $prefix for packages.
    
      - [Rev 48644](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48644) - [Bug 8540](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8540),[Bug 8541](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8541) - Fix two crashing overflows in dcp-etsi.
    
      - [Rev 48842](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48842) - [Bug 8317](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8317) - Fix saving of name resolution blocks.
    
      - [Rev 48894](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48894) - [Bug 8458](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8458) - Infinite loop in mysql dissector.
    
      - [Rev 48919](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48919) - [Bug 8464](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8464) - Very long loop in etch dissector.
    
      - [Rev 49071](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49071) - missing g\_free()
    
      - [Rev 49072](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49072) - missing g\_free()
    
      - [Rev 43547](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43547) - Clean up capture option tooltip spacing and remove an extraneous word (at the end of the monitor mode description). Also use sizeof for a buffer size.
    
      - [Rev 46905](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46905) - Improve hexline parsing of [NetScreen](/NetScreen) snoop output
    
      - [Rev 48159](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48159) - Avoid a potential divide-by-zero condition.
    
      - [Rev 45687](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45687) - [Bug 7882](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7882) - [AddressString](/AddressString) can have a size of 1
    
      - [Rev 48261](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48261) - [Bug 8452](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8452) - Replace use of INCLUDES with AM\_CPPFLAGS in all Makefiles
    
      - [Rev 48393](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48393) - [Bug 8493](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8493) - Use proto\_tree\_add\_item instead of proto\_tree\_add\_bits\_item to display Used Cipher
    
      - [Rev 49210](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49210) - [Bug 8636](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8636) - Use correct Fibre Channel EOFs
    
      - [Rev 48466](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48466) - Properly set the TCP ISN's when the SYN and SYN/ACK are captured out-of-order.
    
      - [Rev 48563](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48563) - [Ask 19844](http://ask.wireshark.org/questions/19844) - Add checksum\_bad (set to FALSE) to the tree when the checksum is correct.
    
      - [Rev 48578](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48578) - Fix a few cases in the SIP dissector where it was not taking into account that tvb\_reported\_length\_remaining() can return -1.
    
      - [Rev 48595](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48595) - Fix the incorrectly duplicated display filter for hf\_om2k\_cbi.
    
      - [Rev 48597](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48597) - Fix the incorrectly duplicated display filter for hf\_gsm\_map\_dlci.
    
      - [Rev 48601](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48601) - Fix the incorrectly duplicated display filter for hf\_gsm\_map\_etsi\_pdp\_type\_number.
    
      - [Rev 48602](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48602) - Fix the incorrectly duplicated display filter for hf\_ixveriwave\_vw\_info\_retryCount.
    
      - [Rev 48613](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48613) - [Bug 8532](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8532) - Fix filters as well as dissection of lat and long according to 3GPP TS 23.032.
    
      - [Rev 48616](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48616) - Fix the incorrectly duplicated display filter for hf\_kdsp\_source\_name.
    
      - [Rev 48619](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48619) - SASP: first\_flag should be static.
    
      - [Rev 48620](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48620) - Fix Coverity CID's 281433-281434: Unintended sign extension (as well as Coverity 702381: Missing break in switch, which comes along for the ride.)
    
      - [Rev 48622](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48622) - Fix Coverity CID's 280305-280306: Negative loop bound.
    
      - [Rev 48628](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48628) - Fix the incorrectly duplicated display filter for hf\_openwire\_throwable\_linenumber.
    
      - [Rev 48664](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48664) - Newly assigned TLS and DTLS cipher suite names.
    
      - [Rev 48684](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48684) - [Bug 8548](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8548) - Fix IRC dissector so it can handle multiple params.
    
      - [Rev 48697](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48697) - [Bug 8450](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8450) - Do not try to systematically fetch a third digit for Country Code: its length can be from 1 to 3 digits.
    
      - [Rev 48724](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48724) - [Bug 8556](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8556) - Don't check for MPEG-2 Transport files before checking for ERF files, as some ERF files pass the MPEG-2 Transport heuristic
    
      - [Rev 48726](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48726) - [Bug 8559](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8559) - Fix dissection of RAN-INFORMATION-APPLICATION-ERROR RIM PDU Indications.
    
      - [Rev 48736](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48736) - Set 'details' radio button sensitivity also at the creation of the dialog.
    
      - [Rev 48767](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48767) - [Bug 8554](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8554) - Part of Ping Reply Message in ICMPv6 Reply Message is marked as "Malformed Packet"
    
      - [Rev 48814](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48814) - [Bug 8575](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8575) - Fix description of ACE4\_APPEND\_DATA flag
    
      - [Rev 48850](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48850) - [Bug 8572](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8572) - Endian error and IP:Port error when decoding BT-DHT response message
    
      - [Rev 48882](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48882),[Rev 48893](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48893) - [Bug 8583](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8583),[Bug 8460](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8460) - Fix IO graph crash and bad behaviour when capture spans too much real time.
    
      - [Rev 46187](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46187), [Rev 48308](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48308), [Rev 48900](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48900), [Rev 48901](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48901) - [Bug 8446](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8446) - Wifi details are not stored in the Decryption Key Management dialog (post 1.8.x)
    
      - [Rev 48928](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48928) - [Bug 8596](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8596) - GTPv2 MM Context (UMTS Key, Quad, and Quint Decoded) incorrectly
    
      - [Rev 48944](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48944) - [Bug 8599](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8599) - Possible uninitialized variable in MMS/BER.
    
      - [Rev 47729](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47729), [Rev 49019](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49019), [Rev 49024](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49024) - [Bug 8610](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8610) - Ensure that tap is called after full dissection, even in case of exception
    
      - [Rev 49046](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49046) - [Bug 7755](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7755) - Work around a Microsoft bug that prevented the opening of console windows (that change fixes it on Windows 7, but doesn't appear to fix it on Windows XP; whether it fixes it on Windows Vista is unknown)
    
      - [Rev 49111](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49111) - [Bug 8618](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8618) - Allow port 0 in SSL Keys List.
    
      - [Rev 49114](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49114) - [Bug 8622](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8622) - Fix hf type error in HSRP.
    
      - [Rev 49128](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49128) - [Bug 7359](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7359) - Possible divide by zero error in SNMP decryption.
    
      - [Rev 49154](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49154),[Rev 49170](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49170) - [Bug 8627](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8627) - LISP control packet incorrectly identified as LISP data based when UDP source port is 4341.
    
      - [Rev 49187](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49187) - [Bug 8608](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8608) - Use correct PRF for DTLS 1.2
    
      - [Rev 49214](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49214) - [Bug 8638](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8618) - NULL terminate bit field list.
    
      - [Rev 49296](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49296) - Fix dissection of old IMS Diameter AVP.
    
      - [Rev 49321](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49321) - [Bug 6898](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6898) - Temporary fix for RTMPT out-of-memory fuzz failures.
    
      - [Rev 49334](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49334) - [Bug 8689](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8689) - csids wiretap heuristic overriding mp2t
    
      - [Rev 49326](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49326)[Bug 8681](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8681) - AMR Frame Type uses wrong Value String.
    
      - [Rev 49332](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49332) - [Bug 8629](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8629) - bad tcp checksum not detected
    
      - [Rev 49379](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49379) - [Bug 8197](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8197) - Fix read-after-free from tvb\_new\_octet\_aligned().

Not done:

  - Move over the following revisions:
      - [Rev 47874](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47874) - [Bug 7400](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7400) - Fix Lua 5.2 panic problems. -- *Doesn't apply cleanly to 1.8. Should this be deferred to 1.10?*
    
      - [Rev 48461](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48461) - [Bug 7310](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7310) - glusterfs: improve endianness handling and displaying of dict contents -- *Doesn't apply cleanly.*

## 1.8.6

Released March 6, 2013 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.8.6.html)

Done:

  - Move over the following revisions:
    
      - [Rev 43185](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43185) - [Bug 8274](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8274) - Null-pointer dereference caught by coverity in trunk and subsequently reported as a bug against 1.8.
    
      - [Rev 47177](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47177)[Rev 47272](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47272) -[Rev 47273](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47273) - [Bug 8274](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8274) - Incorrect decoding of Cell Broadcast Message over SABP
    
      - [Rev 47401](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47401) - Fix dissection of SI6 when carried in a SACCH Info Modify message.
    
      - [Rev 47433](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47433) - [Bug 8290](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8290) - Allow up to 64 OPTIONAL / DEFAULT components per SEQUENCE.
    
      - [Rev 47478](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47478) - [Bug 8297](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8297) - Fix typo errors for 'apply as filter-\>selected' and 'apply as filter-\>not selected' menu items.
    
      - [Rev 47494](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47494) - packet-fmp\_notify.c: Add missing hf\[\] entries.
    
      - [Rev 47563](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47563) - [Bug 8073](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8073) - Work-around fix (not a backport) for dfilter macro crashes that doesn't break API/ABI for 1.8. The actual fix in trunk is much nicer.
    
      - [Rev 47605](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47605) - Fix ERROR: NO ARRAY: packet-tlv.c, hf\_docsis\_rcv\_mod\_enc\_ctr\_freq\_asgn.
    
      - [Rev 47778](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47778) - [Bug 8360](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8360) - Infinite loop in HARP/IP dissector (manual backport of r47776).
    
      - [Rev 47888](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47888) - [Bug 8383](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8383) - Crash in csnStreamDissector (manual backport of r44899).
    
      - [Rev 46466](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46466) - Fix compile warning back-ported to 1.8.
    
      - [Rev 47981](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47981) - [Bug 8382](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8382) - Crash in ms-mms dissector (manual backport of r47979).
    
      - [Rev 46391](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46391) - [Bug 8039](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8039) - MPLS infinite loop.
    
      - [Rev 47568](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47568) - Fix Coverity CID 973548: Dereference null return value.
    
      - [Rev 47575](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47575) - [Bug 8056](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8056) - Maximum value of Duration should be 32767.
    
      - [Rev 47577](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47577) - [Bug 8306](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8306) - Fix BACnet's Loop Object Setpoint-Reference property.
    
      - [Rev 47646](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47646) - [Bug 8320](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8320) - Fix typo in case value that led to misdissection of TSPEC IEs.
    
      - [Rev 47649](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47649) - [Bug 8325](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8325) - Patch registering ieee802154 dissector to Linux SLL frames.
    
      - [Rev 47653](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47653) - [Bug 8330](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8330) - Another fix for TSPEC IEs (there was a field missing).
    
      - [Rev 47658](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47658) - [Bug 8332](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8332) - Bugfix potential buffer overflow in RTPS/RTPS2 dissectors.
    
      - [Rev 47672](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47672) - [Bug 8335](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8335) - Crash in packet-mount.c with packet with negative length field.
    
      - [Rev 47674](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47674) - [Bug 8065](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8065) - Voice RTP player crash if player is closed while playing.
    
      - [Rev 47675](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47675) - [Bug 8331](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8331) - Fix decoding long UCS-2 strings in packet-bacapp.c
    
      - [Rev 47681](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47681) - [Bug 8337](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8337) - Infinite loop in AMPQ dissector.
    
      - [Rev 47692](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47692) - [Bug 8340](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8340) - Divide by zero in ACN dissector.
    
      - [Rev 47700](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47700) - [Bug 8341](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8341) - Bad malloc call in packet-websocket.c.
    
      - [Rev 47708](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47708) - [Bug 8346](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8346) - Memory buffer overrun in packet-cimd.c.
    
      - [Rev 47725](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47725) - [Bug 6434](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6434) - Data combined via ssl\_desegment\_app\_data not visible via "Follow SSL Stream" only decrypted ssl data tabs .
    
      - [Rev 47729](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47729) - [Bug 8321](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8321) - Feed the RTP tap before trying to dissect a possible malformed payload, influencing RTP statistics.
    
      - [Rev 47775](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47775) - [Bug 8359](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8359) - Infinite loop in packet-fcsp.c.
    
      - [Rev 47795](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47795) - [Bug 8345](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8345) - Malformed IEEE80211 frame triggers DISSECTOR\_ASSERT.
    
      - [Rev 47808](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47808) - [Bug 8364](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8364) - Denials of Service in packet-reload.c.
    
      - [Rev 47872](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47872) - [Bug 7939](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7939) - Register media types json-rpc and jsonrequest for JSON.
    
      - [Rev 47877](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47877) - [Bug 6020](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6020) - Bugfix Lua pinfo.cols.protocol not holding value in postdissector.
    
      - [Rev 47915](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47915) - [Bug 8407](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8407) - FMTP protocol is big endian.
    
      - [Rev 47921](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47921) - [Bug 8410](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8410) - Fix dissection of flowDurationMicroseconds in Netflow dissector
    
      - [Rev 47927](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47927) - [Bug 8378](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8378) - Fix decoding of GSM MAP SMS Diagnostics
    
      - [Rev 47936](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47936) - Fix dissection of method name in case of RAck header
    
      - [Rev 47965](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47965) - Fix Coverity CID 280362: Logically dead code.
    
      - [Rev 47966](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47966) - Fix Coverity CID 280365: Logically dead code.
    
      - [Rev 48010](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48010), [Rev 48011](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48011) - [Bug 8380](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8380) - DTLS reassembly issues. Be careful of r48011, it's complicated and will definitely need some reworking to backport safely.
    
      - [Rev 48047](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48047) - The file-\>open dialog should display, "Read filter", not "Display filter".

  - [Rev 48062](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48062) - [Bug 8432](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8432) - BE (3) AC is wrongly named as "Video" in (qos\_acs)

Not done:

  - Move over the following revisions:
      - [Rev 47642](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47642) - [Bug 8318](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8318) - Fix JSON decoding of UTF-16 surrogate pairs. -- *Not in 1.8*

## 1.8.5

Released January 29, 2013 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.8.5.html)

Done:

  - Move over the following revisions:
      - [Rev 43412](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43412) - Followup to r43176, r43177, r43178, and r43179: prohibit FT\_\*INT\* with BASE\_NONE.
    
      - [Rev 43497](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43497) - Display expert codes in hexadecimal.
    
      - [Rev 43508](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43508), [Rev 43509](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43509) - Don't show (essentially meaningless) numeric values.
    
      - [Rev 43603](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43603) - [Bug 8073](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8073) - Convert UAT categories to "affects" flags - fixes the display filter macro UAT.
    
      - [Rev 43712](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43712) - If the offset is out of range, just assign to len to 0 so we don't end up passing a huge value to fragment\_add(). Fixes Coverity CID 280246: Improper use of negative value.
    
      - [Rev 43862](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43862) - [Bug 7435](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7435) - Check available length before trying to dissect SSL packet when desegmentation is not activated.
    
      - [Rev 44028](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44028) - Extend a value string.
    
      - [Rev 44131](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44131) - wrappers for label filling (with information about string truncation).
    
      - [Rev 44180](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44180) - Fix the remaining part of Coverity CID 280009 (formerly CID 9).
    
      - [Rev 44211](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44211) - support for AX.25, including support for LINKTYPE\_AX25. (Only address.h, proto.c(\#if 0:ed out)).
    
      - [Rev 44322](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44322) - Move the pi==NULL test into TRY\_TO\_FAKE\_THIS\_REPR.
    
      - [Rev 44371](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44371) - [Bug 4141](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4141) - Fix for memory leak in reassemble.c.
    
      - [Rev 44382](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44382) - Use g\_slice allocation for 'reassembled\_table' keys (instead of se allocation).
    
      - [Rev 44459](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44459) - Add 'fragment\_table\_destroy()'.
    
      - [Rev 44438](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44438) - Use val\_to\_str\_const() where appropriate;(...) (Diameter, ISUP, SSL).
    
      - [Rev 44487](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44487) - [Bug 7632](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7632) - Fix dissection of ISUP message Generic Numbers with no digits.
    
      - [Rev 44496](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44496) - more ephemeral memory cleanup.
    
      - [Rev 44515](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44515) - convert GStrings to more "ephemeral friendly" use.
    
      - [Rev 44636](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44636) - value-string arrays - allow "direct" access: fix dup val & fill in a "gap".
    
      - [Rev 44553](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44553) - Try to get rid of some of the" pedantic" warnings.
    
      - [Rev 44639](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44639) - Fix incorrect value (typo) in value-string array.
    
      - [Rev 44640](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44640) - Replace dup value (typo ?) with what seems to be the correct value.
    
      - [Rev 44641](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44641) - revert incorrect replacement of FALSE by ENC\_BIG\_ENDIAN(...).
    
      - [Rev 44982](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44982), [Rev 44995](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44995), [Rev 45029](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45029), [Rev 45031](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45031), [Rev 45033](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45033), [Rev 45036](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45036), [Rev 45305](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45305) - Make it possible to build with MSVC2012.
    
      - [Rev 45059](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45059) - Replaced decode\_boolean\_bitfield calls with itemized filters.
    
      - [Rev 45102](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45102) - Get rid of ../../epan/address.h:65:19: warning: comma at end of enumerator list \[-pedantic\].
    
      - [Rev 45598](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45598) - Make the variable that holds tvb\_length\_remaining() a signed integer.
    
      - [Rev 45646](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45646) - [Bug 7871](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7871) - increment offset to point to the first byte after the options (the code used to set an absolute position, if that was 0, we were stuck in an endless loop).
    
      - [Rev 45743](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45743), [Rev 45744](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45744) - Add an AT\_ value for 802.15.4 short addresses.
    
      - [Rev 45792](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45792) - Create SET\_ADDRESS\_HF that takes an additional hf\_ value(...).
    
      - [Rev 46152](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46152) - Cell Identity (CI) is 2 octets.
    
      - [Rev 46205](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46205) - Create/use several extended value strings;(...).
    
      - [Rev 46249](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46249) - here's a macro for the Request bit. Use it instead of hard-coded 0x80.
    
      - [Rev 46263](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46263) - Optimize tvb\_\*\_unicode functions.
    
      - [Rev 46266](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46266) - Fix pretty-printing of Diameter Application IDs.
    
      - [Rev 46271](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46271) - Slightly less hacky way to arrange that dictionary\_load() be called before hf\_base\[\] is initialized.
    
      - [Rev 46274](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46274) - Fix a typo; Authentication Quadruplets not dissected correctly.
    
      - [Rev 46300](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46300) - [Bug 8023](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8023) - Fix typo in LPPa protocol name.
    
      - [Rev 46302](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46302) - [Bug 7976](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7976) - Added more checks for missing/empty [ProtoField](/ProtoField) abbrev.
    
      - [Rev 46324](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46324) - Introduce, and start using, TVB\_SET\_ADDRESS() and TVB\_SET\_ADDRESS\_HF()(...).
    
      - [Rev 46315](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46315) - [Bug 8022](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8022) - Fix potential crash (and memory leak?) in code that frees the frame data structure on close.
    
      - [Rev 46324](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46324) - Introduce, and start using, TVB\_SET\_ADDRESS() and TVB\_SET\_ADDRESS\_HF().
    
      - [Rev 46334](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46334) - [Bug 8035](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8035) - Wrong packet bytes are selected for ISUP CUG binary code.
    
      - [Rev 46335](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46335) - [Bug 8037](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8037) - Fix an infinite loop in CSN.1 dissector when having more than 255 padding bits.
    
      - [Rev 46336](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46336) - [Bug 8036](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8036) - Check length of Slow Protocol OAM Vendor Specific Event Notification and add an expert info if it is not at least 2 bytes long.
    
      - [Rev 46340](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46340) - [Bug 8042](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8042) - SIP infinite loop.
    
      - [Rev 46344](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46344), [Rev 46346](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46346) - [Bug 8041](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8041) - Protect against malformed crypto-suite parameters. Fixes SDP infinite loop.
    
      - [Rev 46386](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46386) - [Bug 8046](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8046) - Add names for Fibre Channel over Ethernet group MAC addresses.
    
      - [Rev 46387](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46387) - [Bug 7998](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7998) - Fix start date written when writing DOS Sniffer files.
    
      - [Rev 46415](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46415) - [Bug 8040](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8040) - Fix R3 inifinite loop.
    
      - [Rev 46420](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46420) - [Bug 8043](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8043) - Fix "MPLS very very large loop".
    
      - [Rev 46345](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46345) - [Bug 8038](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8038) - Prevent a counter overflow in while loops.
    
      - [Rev 46439](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46439) - [Bug 3974](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3974) - Wrong decoding of gtp.target identification.
    
      - [Rev 46462](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46462) - [Bug 8009](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8009) - Update the User's Guide to 1.8.
    
      - [Rev 46464](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46464) - [Bug 3209](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3209) (partial) - Fixed the LUN tracking in FCP dissector.
    
      - [Rev 46484](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46484) - Fix dissection of Target Identification.
    
      - [Rev 46485](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46485) - Copy paste error - RAC is one byte.
    
      - [Rev 46497](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46497) - [Bug 8079](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8079) - Cause "RAB Context" PDU Numbers in packet-gtpv2.c are not dissected correctly.
    
      - [Rev 46510](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46510) - [Bug 8075](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8075) - Fix reassembly of jumbo SSL frames.
    
      - [Rev 46553](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46553) - Handle hop-by-hop-id collisions (when matching requests and answers) better(...).
    
      - [Rev 46555](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46555) - Initialize a variable to avoid a (false) may-be-used-uninitialized warning turned error.
    
      - [Rev 46556](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46556) - [Bug 8098](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8098) - Incorrect dissection of SAC and RAC in 3GPP ULI AVP.
    
      - [Rev 46564](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46564), [Rev 46566](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46566), [Rev 46567](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46567), [Rev 46570](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46570) - Assert out in some composite TVB cases.
    
      - [Rev 46577](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46577), [Rev 46579](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46579) - [Bug 7945](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7945) - Fix DTN/Bundle fuzz failure.
    
      - [Rev 46630](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46630) - Try to determine wether it is MEAS REP, EXT MEAS REP or ENH MEAS REP.
    
      - [Rev 46645](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46645), [Rev 46646](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46646) - [bug 8110](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8110) - Fix some valgrind warnings from the capture attached to this bug.
    
      - [Rev 46695](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46695) - [Bug 8115](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8115) - Expand device ID and fix a typo.
    
      - [Rev 46705](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46705) - [Bug 8112](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8112) - Ensure bytes exist in tvb unicode string functions.
    
      - [Rev 46687](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46687) - Fix GSM 7-bit default alphabet decoding in ANSI IS-637-A.
    
      - [Rev 46739](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46739) - [Bug 8111](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8111) - Set the DTLS record length for reassembly before adding a fragment. Does not fix the underlying issue but does shut up the build-bot.
    
      - [Rev 46812](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46812) - Add full modelines and minor whitespace fixes.
    
      - [Rev 46844](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46844) - Add vertical scrollbar to summary dialog window.
    
      - [Rev 44700](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44700) - [Bug 7679](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7679) - Do not try to set ROHC IR header length when the profile is unknown.
    
      - [Rev 46881](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46881) - Add detection of Windows 8 and Windows Server 2012.
    
      - [Rev 46882](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46882) - Welcome in 2013.
    
      - [Rev 46885](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46885) - [Bug 8078](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8078) - Unable to Save/Apply \[Unistim Port\] in Preferences.
    
      - [Rev 46945](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46945) - [Bug 7401](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7401) - When installing 1.8.x or later, get rid of plugins that have been replaced by built-in dissectors.
    
      - [Rev 46991](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46991) - [Bug 8168](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8168) - Detect properly the EMM Service Request message.
    
      - [Rev 46930](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46930) - [Bug 8105](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8105) - Allow use of huge values for localtime / ctime / gmtime with MSVC 2008 or later.
    
      - [Rev 46999](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46999) - [Bug 8111](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8111) - Sanity checks for fragment\_set\_tot\_len().
    
      - [Rev 47045](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47045) - [Bug 8199](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8199) - CMSSTATUS dissector hangs - guint16 needed to prevent rollover.
    
      - [Rev 47046](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47046) - [Bug 8198](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8198) - RTPS dissector crash - bugfix nested loop that wasn't breaking out of the main loop when subloop really wanted it to.
    
      - [Rev 47098](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47098) - [Bug 8213](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8213) - Heap corruption in DCP-ETSI by running past the end of a fragment array.
    
      - [Rev 47123](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47123), [Rev 47125](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47125) - [Bug 8222](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8222) - fix long loop in DCP-ETSI.
    
      - [Rev 46433](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46433) - Fix the behavior of "Apply as Filter -\> Not Selected".
    
      - [Rev 46958](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46958) - [Bug 8167](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8167) - Fix an incorrect logical check for no\_of\_bits\!=0 in proto\_tree\_add\_split\_bits\_item\_ret\_val().
    
      - [Rev 47000](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47000) - [Bug 8111](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8111) - Revert the temporary workaround in the DTLS dissector.
    
      - [Rev 47036](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47036) - [Bug 8193](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8193) - Add dissection of Dual Address Bearer Flag bit in Common Flags IE
    
      - [Rev 47071](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47071) - [Bug 8208](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8208) - Display ECI and LAC in decimal and fix highlighting of CGI, SAI, RAI, TAI, ECGI and LAI fields
    
      - [Rev 47112](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47112) - [Bug 8211](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8211) - Bugfix version number in EtherIP dissector.
    
      - [Rev 47114](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47114) - [Bug 8197](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8197) - Null the finfo pointer after we free it. Partially fixes the bug.
    
      - [Rev 47132](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47132) - [Bug 8227](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8227) - Electromagnetic Emission Parser parses field Event Id as Entity Id.
    
      - [Rev 47136](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47136) - [Bug 8212](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8212) - Avoid dissector assert in JXTA dissector.
    
      - [Rev 47144](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47144) - Describe terminal services detection correctly.
    
      - [Rev 47173](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47173) - snmp pdu's of more than 127 bytes have incorrect length reported.
    
      - [Rev 44696](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44696) - Revert back-port of [Bug 7348](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7348) to revert [ABI breakage](http://seclists.org/wireshark/2013/Jan/122).
    
      - [Rev 47223](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47223) - CID 280286 - Avoid infinite loop in LAPD dissector.
    
      - [Rev 47248](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47248) - Prevent copying longer than expected NTLM SSP key.
    
      - [Rev 47277](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47277) - [Bug 8085](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8085) - Wrong bytes highlighted with "Find Packet..."
    
      - [Rev 47304](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47304) - mpls-echo: Add two missing hf array entries.
    
      - [Rev 47294](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47294) - CID 280529 & 280530 - Check the validity of TLVs before using their retrieved data.
    
      - [Rev 47298](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47298), [Rev 47300](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47300) - [Bug 7877](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7877) - Illegal character is used in temporary capture file name.
    
      - [Rev 47314](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47298) - [Bug 8177](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8177) - Bugfix crash caused by AirPDcap decryption.
    
      - [Rev 47328](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47298) - [Bug 2426](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2426) - Allow SNMP user table entry to be re-editted even if engineID/Username remains the same.
    
      - [Rev 47329](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47329) - make dumpabi target build with multiple digits in library version numbers.

## 1.8.4

Released November 28, 2012 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.8.4.html)

Done:

  - Move over the following revisions:
      - [Rev 43681](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43681) - Don't call subdissectors / expert...() / col...() under 'if (tree)'
    
      - [Rev 43841](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43841) - Pass in proper offset to dfilter\_sip\_status\_line(). Was seeing problems with 180 + 200 responses in same frame (over TCP).
    
      - [Rev 43854](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43854) - Fix some clang warnings: implicit conversion from enumeration type '[GtkStateType](/GtkStateType)'(...)
    
      - [Rev 44186](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44186) - Get rid of some GTK\_CHECK\_VERSION instances by using compatability macros.
    
      - [Rev 44438](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44438) - Use val\_to\_str\_const() where appropriate;
    
      - [Rev 44511](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44511) - [Bug 7784](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7784) OOPS: dissector table "sctp.ppi" doesn't exist
    
      - [Rev 44559](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44559) - Use capture scoped memory for hash table functionality.
    
      - [Rev 44515](http://anonsvn.wireshark.org/viewvc/trunk/epan/dissectors/packet-dtls.c?r1=44511&r2=44515) - convert GStrings to more "ephemeral friendly" use.
    
      - [Rev 44611](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44611) - Replace the last instance of gnutls\_datum with gnutls\_datum\_t. The former is deprecated, and the latter is already being used elsewhere in the file.
    
      - [Rev 45210](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45210) - Don't fetch the exit code of our child process, we never use it.
    
      - [Rev 45212](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45212) - Revert most of r45210. We don't use the return value of [GetExitCodeProcess](/GetExitCodeProcess)(), but it still needs to be called to get childstatus.
    
      - [Rev 45310](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45310), [Rev 45339](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45339) - [Bug 7787](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7787) infinite loop in USB dissector
    
      - [Rev 45321](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45321) - [Bug 7797](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7797) Fix dissection of IEEE 802.11 Channel Switch Announcement element
    
      - [Rev 45324](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45324), [Rev 45329](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45329) - [Bug 7789](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7789) sFlow infinite loops
    
      - [Rev 45331](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45331) - When comparing if the window is outside the viewable area's(x,y), take into account that the viewable area's (x,y) may not be (0,0). (This was a slight modification of [Rev 34265](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34265), which was made to attempt to resolve [Bug 553](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=553). It is unknown if this additional change finally resolves that bug or if another change such as a GTK+ upgrade finally resolved it, but bug 553 seems to be no longer reproducible.)
    
      - [Rev 45337](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45337), [Rev 45338](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45338) - [Bug 7801](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7801) infinite loop in 3GPP2 A11 dissector
    
      - [Rev 45339](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45339) - Fix error caught by valgrind where we were running off the end of a variable (...)
    
      - [Rev 45340](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45340) - Vastly improve the debug presentation( of trees)+.
    
      - [Rev 45354](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45354), [Rev 45359](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45359), [Rev 45360](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45360), [Rev 45361](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45361) - [Bug 7803](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7803) Various fixes for RADIUS dictionary parsing
    
      - [Rev 45355](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45355) - [Bug 7802](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7802) infinite loop in SCTP dissector
    
      - [Rev 45370](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45370) - improve the default window placement position when there's more than one monitor.
    
      - [Rev 45408](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45408) - [Bug 7800](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7800) crash in EIGRP dissector
    
      - [Rev 45429](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45429) - [Bug 7780](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7780) - Info line is incorrect on SIP message containing another SIP message in body
    
      - [Rev 45431](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45431) - [Bug 7820](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7820) wlan\_mgt.ht.capabilities bits 8-15 incorrectly decoded (from wrong packet offset)
    
      - [Rev 45459](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45459) - [Bug 7844](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7844) - Prevent infinite loop in ICMPv6 dissector
    
      - [Rev 45462](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45462) - Change 'for (i=1; i\<=n;...' to 'for (i=0; i\<n; ...)'(...)SCTP only.
    
      - [Rev 45463](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45463), [Rev 45464](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45464) - [Bug 7848](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7848) - Make the ISUP CIC field decimal, so it doesn't need proto\_tree\_add\_item\_format() and shows up in "Add as filter..." in decimal
    
      - [Rev 45465](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45465) - [Bug 6869](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6869) - Make the SSL dissector work with GnuTLS compiled with nettle.
    
      - [Rev 45476](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45476),[Rev 45486](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45486) - Fix packet-ndps bugs & possible infinite loops
    
      - [Rev 45477](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45477) - Fix possible infinite loops
    
      - [Rev 45495](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45495) - [Bug 7851](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7851) - Handle pcap-ng files with IDBs in the middle (and fix some other issues)
    
      - [Rev 45500](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45500) - packet-fmp\_notify: Fix (what appears to be) a minor "off by one" bug in 'for' loop
    
      - [Rev 45504](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45504), [Rev 45507](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45507) - Fix the handling of the data rate when reading and writing CommView NCF files
    
      - [Rev 45510](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45510) - [Bug 7855](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7855) Fix a STATUS\_ACCESS\_VIOLATION in ISAKMP dissector
    
      - [Rev 45524](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45524), [Rev 45548](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45548) - [Bug 7858](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7858) - When rounding a 32-bit offset value up, take all 32 bits into account so it doesn't wrap around
    
      - [Rev 45525](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45525) - The Interface Name field of the Interface Name sub-object of the Interface Information object for ICMP is \*NOT\* null-terminated; use tvb\_format\_text() for it.
    
      - [Rev 45527](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45527), [Rev 45529](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45529) - \*Always\* create a new data source when we decompress an IPv6 header (otherwise, crashes occur)
    
      - [Rev 45545](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45545) - [Ask 14963](http://ask.wireshark.org/questions/14963) - Handle both Prism header DID value code sets, and clean up some other Prism-header stuff
    
      - [Rev 43681](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43681) - [Bug 7866](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7866) - '\*' wildcard in the 'Src IP' or 'Dest IP' field of the ESP SA dialog does not work
    
      - [Rev 45609](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45609) - [Bug 1284](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1284) - Handle frames in Prism-header or AVS-header files that have neither an AVS nor a Prism header
    
      - [Rev 45620](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45620) - Fix cut-and-pasteo that could cause problems when reading files
    
      - [Rev 45621](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45621) - Only cap\_len (not pkt\_len) bytes of buffer are valid
    
      - [Rev 45626](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45626) - Fix iSeries trace reading code to get all the hex digits available for the packet
    
      - [Rev 45627](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45627) - Fix iSeries trace reading code to get the correct fractions-of-a-second in time stamps
    
      - [Rev 45614](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45614) - [Bug 7869](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7869) WTP infinite loop
    
      - [Rev 45660](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45660) - Wireshark-generated [PostScript](/PostScript) files are DSC non-conforming so be sure to include "%\!" in the header comment.
    
      - [Rev 45696](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45696) - Fix WLAN decryption when using a WPA PSK key
    
      - [Rev 45707](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45707) - [Bug 7968](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7968) - fileset.c references g\_strcmp0()
    
      - [Rev 45717](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45717) - [Bug 7879](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7879) - Avoid infinite loop in RTCP dissector.
    
      - [Rev 45742](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45742) - [Bug 7909](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7909) - Fix USB descriptor parsing issue from r45310
    
      - [Rev 45770](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45770) - [Bug 2880](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2880), [Ask 14367](http://ask.wireshark.org/questions/14367) - Allow \<interval\> to be successfully sscanf'd no matter the locale for the decimal symbol.
    
      - [Rev 45789](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45789) - [Bug 7912](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7912) - Allow dissection of ESM messages with integrity protection and EEA0 ciphering
    
      - [Rev 45823](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45823) - [Bug 7790](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7790) - Add missing offset increment after displaying minimum count
    
      - [Rev 45843](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45843) - [Bug 7938](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7938) - IPv6 Option Pad1 Incorrect dissection
    
      - [Rev 45865](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45865) - [Bug 7948](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7948) - Print the GNUTLS error message upon import failure.
    
      - [Rev 45867](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45867) - [Bug 7921](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7921) - Patch to update the decryption status right after the user updates WEP/WPA keys in the UAT.
    
      - [Rev 45950](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45950) - Fix dissection of NAS security parameters to/from E-UTRA
    
      - [rev 45980](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45980) - [Bug 7964](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7964) - GSM classmark3 8-PSK decode error
    
      - [Rev 46081](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46081) - [Bug 8000](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8000) - In de\_bssgp\_pdu\_in\_error() use current\_offset isof 0.(...)
    
      - [Rev 46098](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46098) - [Bug 8006](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8006) - misspelling (typo) in display filter field name
    
      - [Rev 46106](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46106) - [Bug 7976](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7976) - Added check for missing/empty [ProtoField](/ProtoField) abbrev in Lua.
    
      - [Rev 46111](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46111)[Rev 46113](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46113) - [Bug 8008](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8008) - Allign the tables for dissection.
    
      - [Rev 46202](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46202) - Add missing OPTIONAL keyword in RRCConnectionRequest message
    
      - [Rev 45511](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45511), [Rev 45674](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45674) - Don't leak host name resolution information from one file to the next.
    
      - [Rev 46003](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46003), [Rev 46004](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46004) - [Bug 6665](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6665) - Sanely handle corrupt tpncp.dat files.
    
      - [Rev 46005](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46005) - [Bug 7967](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7967) - Fix dissection of Server Name Indication extension in SSL/TLS traffic
    
      - [Rev 46153](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46153) - [Bug 8011](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8011) - Core dumped during sctp association analysis.
    
      - [Rev 46238](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46238) - Fix tshark "-H".

## 1.8.3

Released October 2, 2012 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.8.3.html)

Done:

  - Move over the following revisions:
      - [Rev 42997](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42997) - [Bug 7320](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7320) - From Evan Huus Memory leak in voip\_calls.c
    
      - [Rev 43136](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43136) - Support math operations (SUM, MAX, MIN, etc.) on 64-bit fields.
    
      - [Rev 43137](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43137) - Split the Advanced unit COUNT(\*) into COUNT FRAMES(\*) and COUNT FIELDS(\*) ...
    
      - [Rev 43140](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43140) - Add casting to keep Windows happy.
    
      - [Rev 43157](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43157) - Fix some dead assignments.
    
      - [Rev 43210](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43210) - Don't define value\_string arrays in a .h file (included in multiple places).(...)
    
      - [Rev 43320](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43320) - Fix typos.
    
      - [Rev 43455](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43455) - Size wrong in "File Set List" for just-finished captures.
    
      - [Rev 43536](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43536) - Update Free Software Foundation address.
    
      - [Rev 43590](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43590) - Display (and allow filtering on) the "reserved for national use" bit in the AI.
    
      - [Rev 43621](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43621) - From Evan Huus: IO Graph Fixes ...
    
      - [Rev 43681](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43681) - Don't call subdissectors / expert...() / col...() under 'if (tree)'
    
      - [Rev 43700](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43700) - [Bug 7474](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7474) - Dissect LTE RADIUS AVP 3GPP-User-Location-Info
    
      - [Rev 43705](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43705) - If there's not enough data left for a timestamp, be sure there's at least some data to pass off to the generic data dissector.
    
      - [Rev 43722](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43722) - [Bug 7356](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7356) - Print only visible columns.
    
      - [Rev 43854](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43854) - Fix some clang warnings: implicit conversion from enumeration type '[GtkStateType](/GtkStateType)' ...
    
      - [Rev 43924](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43924) - Align structs and code a bit, ultimatly code should be shared.
    
      - [Rev 43925](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43925) - Dynamically allocate " items". Make it a gpointer and cast to io\_item\_t items where needed. The aim is to make io\_stat\_graph\_t generic and reusable.
    
      - [Rev 44003](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44003) - Create/use extended value strings as appropriate;
    
      - [Rev 44025](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44025) - Fix Coverity CID's 703862-703863: Unintentional integer overflow.
    
      - [Rev 44073](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44073) - Create/use extended value strings to access certain value string arrays
    
      - [Rev 44119](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44158) - Minor cleanup.
    
      - [Rev 44158](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44158) - Add another cast that should have been part of r44025 to fully resolve Coverity CID3863: Unintentional integer overflow.
    
      - [Rev 44163](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44163) - Minor cleanup.
    
      - [Rev 44181](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44181) - remove unnecessary underscores from display filters
    
      - [Rev 44207](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44207) - [Bug 7556](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7556) - Decode correctly BACnet GetEnrollmentSummary-ACK
    
      - [Rev 44380](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44380) - Make emem\_tree\_\*32\_array functions non-destructive. ...
    
      - [Rev 44401](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44401), [Rev 44408](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44408) - Iterate over the emem\_tree\_\*32\_array key data instead of using recursion.
    
      - [Rev 44413](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44413) - convert some simple uses to use ephemeral memory
    
      - [Rev 44438](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44438) - (BACAPP,HSRP, IEEE80211 part) Use val\_to\_str\_const() where appropriate; (...)
    
      - [Rev 44454](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44454) - [Bug 7581](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7581) - dissecting hsrp packets without tree could cause endless loop
    
      - [Rev 44477](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44477) - use correct protocol id for hdcp2
    
      - [Rev 44496](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44496) - more ephemeral memory cleanup
    
      - [Rev 44510](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44510) - [Bug 7624](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7624) - dissect\_per\_constrained\_integer\_64b fails for 64 bits
    
      - [Rev 44513](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44513), [Rev 44533](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44533) - fix field type for some 64 bits header fields
    
      - [Rev 44528](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44528) - hdcp2: dissect ake\_send\_pairing\_info
    
      - [Rev 44526](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44526) - hdcp2: dissect ake\_no\_stored\_km
    
      - [Rev 44538](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44538) - col\_...() and expert...() fcns should not be under 'if (tree)';
    
      - [Rev 44571](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44571) - use session allocated memory for rtp\_add\_address/srtp\_add\_address hash tables
    
      - [Rev 44578](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44578) - Calling g\_strlcat() for every bit of a constrained integer was really slow.
    
      - [Rev 44586](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44586), [Rev 44588](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44588) - Apply the speed improvement from r44578 to 64bits variant ...
    
      - [Rev 44642](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44642) - Comment out all but first value\_string array entries with dup values
    
      - [Rev 44688](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44688) - [Bug 7668](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7668) - correct field type for lcp.opt.oui
    
      - [Rev 44689](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44689) - correct field type for ccp.opt.oui
    
      - [Rev 44690](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44690) - [Bug 7670](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7670) - Use correct filter name and value string for the dissection of Qos attribute "Reliability Class" in GMM/SM message
    
      - [Rev 44696](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44696), [Rev 44697](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44697) - [Bug 7348](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7348) - Proper sorting of dissectors on error output.
    
      - [Rev 44701](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44701) - [Bug 6881](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6881) - Fix Session ID parsing.
    
      - [Rev 44707](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44707) - [Bug 7674](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7674) - Fix Performance regression in tshark -z io,stat
    
      - [Rev 44734](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44734) - Clean up mgcpDialedDigits and add modelines ...
    
      - [Rev 44736](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44736), [Rev 44737](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44737) - [Bug 7685](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7685) - Incorrect io-stat table format when unsupported -t operand is specified and when using AVG of relative\_time fields.
    
      - [Rev 44749](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44749) - [Bug 7666](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7666) - Check that DRDA command has a minimum length of 10 bytes to prevent a potential infinite loop
    
      - [Rev 44760](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44760) - typo in DVB service descriptor
    
      - [Rev 44790](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44790) - [Bug 7691](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7691) - TKIP dissection : wrong IS\_TKIP macro
    
      - [Rev 44792](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44792) - [Bug 7697](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7697) - Fix dissection of release 98 and release 99 QoS profiles
    
      - [Rev 44801](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44801) - [Bug 7567](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7567) - Fix memory overrun in LDP dissector
    
      - [Rev 44814](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44814) - Use g\_hash\_table\_new\_full() instead of g\_hash\_table\_new() for subdissector registration tables, and use g\_free as the value\_destroy\_func. This saves us from manually freeing the value when we remove an item, and prevents us from leaking memory when we accidentally overwrite an existing item.
    
      - [Rev 44823](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44823) - [Bug 7707](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7707) - Fix dissection of small Homeplug AV frames
    
      - [Rev 44844](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44844), [Rev 44880](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44880) - [Bug 5979](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5979) - Allow Win64 to use more than 2 Gbytes of memory.
    
      - [Rev 44881](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44881) - [Bug 7718](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7718) - Fix dissection of NAS Uplink and Downlink Count in MM Context IE
    
      - [Rev 44885](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44885) - Also disable the resize grip on the profile bar (as it is on the info and packets bars; this is for GTK \< 3.0).
    
      - [Rev 44959](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44959) - Initialize ett's and hf's to "-1", not "- 1".
    
      - [Rev 44892](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44892) - [Bug 7727](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7727) - Fix multiple Diameter enum values.
    
      - [Rev 44891](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44891) - Cosmetic changes to GTPv2(Add text to items
    
      - [Rev 44927](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44927), [Rev 44928](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44928) - Actually build Interlink dissector as part of Wireshark.
    
      - [Rev 44940](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44940) - [Bug 7724](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7724) - callsinfo-\>stop\_fd not set in all branches for UNISTIM.
    
      - [Rev 44946](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44946) - [Bug 7724](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7724) - Handle SDP\_CRYPTO optional parameters better.
    
      - [Rev 44967](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44967) - Only provide the parameter data in the tvb used when calling subdissector for private extensions.
    
      - [Rev 45004](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45004) - [Bug 7736](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7736) - Fix dissection error of D-RELEASE and D-CONNECT in TETRA dissector
    
      - [Rev 45007](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45007) - Fix ICMP and ICMPv6 request/response tracking with checksum corner case.
    
      - [Rev 45012](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45012) - [Bug 7731](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7731) - Allow more than 2 dfilters in drop-down list (on fresh installs)
    
      - [Rev 45045](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45045) - [Bug 7408](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7408) - Fix Debian package build.
    
      - [Rev 45056](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45056) - Don't show the "Wireless Settings" button on non-[AirPcap](/AirPcap) adapters, so people don't ask why it's grayed out
    
      - [Rev 45058](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45058) - [Bug 7744](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7744) - Fix drag and drop URI-list for all platforms
    
      - [Rev 45085](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45085) - Don't show the "Remote Settings" button on non-remote adapters, so people don't ask why it's grayed out
    
      - [Rev 45108](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45108) - enable capture comment icon in the statusbar as soon as a capture was started
    
      - [Rev 45111](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45111) - [Bug 7753](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7753) - Fix display of WRITE BUFFER and SEND DIAGNOSTIC fields in SCSI dissector
    
      - [Rev 45146](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45146), [Rev 45148](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45148) - [Bug 5016](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5016) - No markers show up when maps are displayed
    
      - [Rev 45150](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45150) - [Bug 5778](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5778) - Volume label field is not displayed correctly.
    
      - [Rev 44338](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44338) - Make it possible to merge libpcap files with different encapsulation types by making the output file a pcapng file and constructing SHB and IDB - OPTIONAL ENHANCEMENT
    
      - [Rev 44500](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44500), [Rev 44501](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44501), [Rev 44502](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44502) - Dissect Diameter over SCTP by PPID - OPTIONAL ENHANCEMENT
    
      - [Rev 44589](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44589) - [Bug 7649](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7649) - File -\> Open always closes existing capture files
    
      - [Rev 45025](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45025) - Have File-\>import write pcapng files - OPTIONAL ENHANCEMENT
    
      - [Rev 45174](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45174) - [Bug 6230](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6230) - Truncated/partial JPEG files are not dissected
    
      - [Rev 45224](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45224) - dvb-ci: display cc item's name in the subtree title
    
      - [Rev 45216](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45216) - [Bug 7734](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7734) - BGP bad decoding for Graceful Restart Capability with only helper support
    
      - [Rev 45242](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45242) - Make IEEE 802a protocol 5 octets long and cut down code clutter.
    
      - [Rev 45229](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45229) - -B hasn't been Win32-only for a while, so update the Wireshark man page

## 1.8.2

Released August 15, 2012 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.8.2.html)

Done:

  - Move over the following revisions:
      - [Rev 43149](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43149) - [Bug 7562](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7562) - Fix EtherCAT Mailbox crash.
    
      - [Rev 43922](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43922) - [bug 7511](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7511) - Initialize required interface\_t components of a newly created interface.
    
      - [Rev 43930](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43930) - Reversed values for Bearer Context IE decodes Bearer Level Quality of Service (Bearer QoS) in ARP field the wireshark decoded preemption values(GTPv2).
    
      - [Rev 43953](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43953) - Reinsert conversation colorization shortcuts.
    
      - [Rev 43955](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43955) - [bug 7516](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7516) - GIOP request\_id used for sub dissectors is not assigned when decoding GIOP 1.2 Request message.
    
      - [Rev 43956](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43956) - [bug 7514](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7516) - Link ISDN SAPI 16 to X.25
    
      - [Rev 43957](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43957) - Use the correct symbols.
    
      - [Rev 43961](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43961) - [Bug 7506](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7506) - Analyze-\>Apply as Filter and Analyze-\>Prepare a Filter cause crashes.
    
      - [Rev 43999](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43999) - Unify the [AktionEntries](/AktionEntries) for apply/prepare filter
    
      - [Rev 43981](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43981) - [Bug 7523](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7523) - Update recv/drop counters also when no threads are used.
    
      - [Rev 44008](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44008) - [Bug 7524](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7524) - 8-PSK structure in GSM Classmark 3 is not properly dissected.
    
      - [Rev 44074](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44074) - [Bug 7533](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7533) - Handle the case where no IDB follows the SHB.
    
      - [Rev 44075](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44075) - [Bug 7533](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7533) - It seems that the length should unsigned, not signed.
    
      - [Rev 44089](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44089) - [Bug 7423](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7423) - Add handling of ringbuffer support when packets are not updated in realtime.
    
      - [Rev 44091](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44091) - Fix inverted dissection of Pre-emption Capability and Pre-emption Vulnerability.
    
      - [Rev 44103](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44103) - Fix Tshark Help Menu
    
      - [Rev 44111](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44111), [Rev 44112](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44112), [Rev 44113](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44113), [Rev 44117](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44117) - [Bug 7498](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7498) - Crash in NFS dissector when "file\_name\_snooping" & "file\_full\_name\_snooping" preferences enabled.
    
      - [Rev 44114](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44114) - [Bug 6787\#c14](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6787#c14) - Don't do 'return 0' in mpls-y1722 dissector (so mpls dissector won't try to continue dissecting).
    
      - [Rev 44118](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44118) - [Bug 6881\#c12](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6881#c12) - mpls-pm dissector: Several right-shifts should be left-shifts.
    
      - [Rev 44141](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44141) - [Bug 7266\#c10](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7266#c10) - Avoid a division by zero due to overflow.
    
      - [Rev 44247](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44247) - [Bug 7566](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7566) - Fix dcp-etsi divide-by-zero error.
    
      - [Rev 44283](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44283) - [Bug 7305](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7305) - Don't call main\_window\_update() from capture\_input\_new\_packets() on Windows.
    
      - [Rev 44287](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44287) - [Bug 7555](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7555) - Warn if AD bit is set in DNS Query
    
      - [Rev 44288](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44288) - [Bug 7572](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7572) - Fix MongoDB [DoSes](/DoSes).
    
      - [Rev 44289](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44289) - [Bug 7571](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7571) - Fix XTP crash.
    
      - [Rev 44306](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44306) - [Bug 7563](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7563) - Fix overflow in ERF dissector
    
      - [Rev 44307](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44307) - [Bug 7561](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7561) - Fix GSM RLC MAC crash.
    
      - [Rev 44312](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44312) - [bug 7570](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7570) - Check CIP MSP packets for number of services overruns.
    
      - [Rev 44317](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44317) - [Bug 7603](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7603) - Large loop in the AFP dissector.
    
      - [Rev 44320](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44320) - [Bug 7568](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7568) - Fix RTPS2 crash.
    
      - [Rev 44366](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44366) - [Bug 7569](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7569) - Fix STUN crash.
    
      - [Rev 44396](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44396) - Backport some Diameter updates
    
      - [Rev 44377](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44377),[Rev 44419](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44419) - [Bug 7563](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7563) - A second (better) fix for fuzz failure in the ERF dissector
    
      - [Rev 44403](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44403) - [Bug 7573](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7573) - Large loop in the CTDB dissector.
    
      - [Rev 44476](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44491) - Fix memcpy in Bluetooth L2CAP.
    
      - [Rev 44491](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44491) - Fix subtle g\_strdup\_printf() memory leaks.
    
      - [Rev 44500](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44500) - Update SCTP PPID table.

## 1.8.1

Released July 23, 2012 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.8.1.html)

Done:

  - Move over the following revisions:
      - [Rev 43498](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43498) - [Bug 7406](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7046) - Fix Debian dev package build: build the idl2wrs man page
    
      - [Rev 43501](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43501) - [Bug 7021](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7021) - Don't fill in an error message unless pcap\_open() actually fails
    
      - [Rev 43506](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43506),[Rev 43511](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43511) - [Bug 7412](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7412) - Display Filter Expression Window: "typeahead search" broken
    
      - [Rev 43507](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43507) - [Bug 7413](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7413) - Display Filter Expression Window: "predefined values" sometimes missing
    
      - [Rev 43561](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43561) - [Bug 7427](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7427) - Link Wireshark with @GLIB\_LIBS@, as @GTK\_LIBS@ doesn't necessarily include all the GLib libraries needed by Wireshark
    
      - [Rev 43602](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43602) - [Bug 7444](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7444) - Fix null pointer crash when adding new display filter macro
    
      - [Rev 43649](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43649), [Rev 43652](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43652), [Rev 43655](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43655) - [Bug 7457](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7457) - [Ask 12382](http://ask.wireshark.org/questions/12382) - Write out pcap-NG timestamps using the interface's time stamp resolution
    
      - [Rev 43657](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43657) - [Bug 7467](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7467) - Don't try to use data past the end of the array of interface information
    
      - [Rev 43798](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43798) - Fix a non-proto\_tree\_add\_item() passing an ENC\_ value as the last argument
    
      - [Rev 43800](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43800) - Fix a non-proto\_tree\_add\_item() passing an ENC\_ value as the last argument
    
      - [Rev 43802](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43802) - Fix non-proto\_tree\_add\_item() calls passing an ENC\_ value as the last argument
    
      - [Rev 43804](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43804) - Fix non-proto\_tree\_add\_item() calls passing an ENC\_ value as the last argument
    
      - [Rev 43806](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43806) - Fix non-proto\_tree\_add\_item() calls passing an ENC\_ value as the last argument
    
      - [Rev 43808](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43808) - Fix non-proto\_tree\_add\_item() calls passing an ENC\_ value as the last argument
    
      - [Rev 43810](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43810) - Fix non-proto\_tree\_add\_item() calls passing an ENC\_ value as the last argument
    
      - [Rev 43443](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43443) - [Bug 7391](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7391) - Wireshark crashes on bootp filter
    
      - [Rev 43448](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43448) - Do not use same name for filters with incompatible types in packet-icmp.c, packet-icmpv6.c and packet-tcp.c
    
      - [Rev 43474](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43474) - Fix dissection of NAS EPS Service Request message
    
      - [Rev 43556](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43556) - [Bug 7429](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7429) - Wireshark \> 1.4 does not correctly read Association ID for PS Poll packets
    
      - [Rev 43560](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43560) - [Bug 7430](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7430) - Dissection of EAP-SIM and EAP-AKA is broken
    
      - [Rev 43576](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43576) - [Bug 7436](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7436) - Make nfs dissection not depend on tree construction.
    
      - [Rev 43600](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43600) - [Bug 7445](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7445) - Find Next Mark duplicated (and Find Previous Mark missing) in Edit menu
    
      - [Rev 43648](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43648) - [Bug 7438](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7438) - SNMP incorrectly marks SNMPv3 "discovery" packet as malformed
    
      - [Rev 43661](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43661) - Revert part of revision 43107 which broke sub dissection of Signal and events as a new tvb wasn't created.
    
      - [Rev 43662](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43662) - Failure cause is an OCTET STRING not a string.
    
      - [Rev 43668](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43668) - [Bug 7468](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7468) - DVB-CI/CI+: fix offset error in operator\_info apdu
    
      - [Rev 43676](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43676) - Remove the empty space in the "save" dialog on Windows.
    
      - [Rev 43724](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43724) - [Bug 7479](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7479) - Don't crash if we have no more data left to dissect
    
      - [Rev 43747](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43747) - proto\_tree\_add\_boolean() takes a value, not an ENC\_ flag
    
      - [Rev 43759](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43759) - [Bug 7485](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7485) - Add support for IPv6 over PPP in Jmirror dissector
    
      - [Rev 43763](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43763) - [Bug 7488](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7488) - Unable to correctly identify IEC 61850 MMS packets
    
      - [Rev 43784](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43784) - [Debian Bug 680056](http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=680056) - Crash in PPP dissector
    
      - [Rev 43790](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43790) - Use gtk\_box\_pack\_start() isof gtk\_container\_add()
    
      - [Rev 43847](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43847) - [Bug 7505](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7505) - When writing from a WTAP\_ENCAP\_PER\_PACKET file with only one encapsulation type, use that encapsulation type rather than WTAP\_ENCAP\_PER\_PACKET for the output file
    
      - [Rev 43875](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43875) - [Bug 7489](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7489) - Don't insert extraneous Pango markup in the "not a valid display filter" message dialog
    
      - [Rev 43880](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43880) - [Bug 7501](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7501) - Don't pass possibly-unaligned pointers to routines expecting aligned pointers
    
      - [Rev 43883](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43883) - [Bug 7508](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7508) - Dissect SNMPv3 context name as string
    
      - [Rev 43898](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43898), [Rev 43901](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43901) - [Bug 7509](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7509) - Fix allocation of buffer in fix to [Bug 7501](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7501)
    
      - [Rev 43899](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43899) - [Bug 7509](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7509) - Don't throw an assertion if we can't find certain XMPP attributes when trying to track sessions
    
      - [Rev 43850](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43850) - Add some relevant ethertypes
    
      - [Rev 43868](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43868) - [Bug 6465\#c7](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6475#c7) - packet-bacapp potential crash

## 1.8.0

Released June 21, 2012 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.8.0.html)

Done:

  - Move over the following revisions:
      - [Rev 43343](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43343) - Fix dumpcap compilation on FreeBSD
    
      - [Rev 43345](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43345) - [Bug 7379](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7379) - Add a scrollbar to the list of interfaces table
    
      - [Rev 43362](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43362) - [Bug 7378](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7378) - SMS text are encoded in UTF-8, no need to escape text.
    
      - [Rev 43367](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43367) - Get rid of the remnants of NEW\_MENU\_CODE.
    
      - [Rev 43368](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43368) - Don't install main-menubar-ui.xml.
    
      - [Rev 43370](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43370),[Rev 43377](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43377) - Don't install idl2wrs except in Debian's special development package
    
      - [Rev 43371](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43371) - Fix pod typos
    
      - [Rev 43392](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43392),[Rev 43394](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43394),[Rev 43395](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43395),[Rev 43397](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43397) - [Bug 7222](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7222) - Tell non-Windows users when they need to change file formats or lose their file/packet comments.
    
      - [Rev 43406](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43406) - Separate SCTP RTT fields
    
      - [Rev 43389](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43389) - Fix IPv6 fragment offset in COL\_INFO
    
      - [rev 43401](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43401) - In INTERNAL HANDOVER COMMAND Circuit Identity Code is C(onditional(Coded optional in WS))
    
      - [rev 43408](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43408), [rev 43409](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43409) - [Bug 7383](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7383) - Put back items into the correct dtap\_tree tree and comment pd\_tree that is unused for now
    
      - [Rev 43420](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43420) - Make sure TShark doesn't assert when passed -2 and -R.

## 1.8.0rc2

Released June 18, 2012

Done:

  - Move over the following revisions:
      - [Rev 43139](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43139) - [Bug 7340](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7340) - Netscreen - can't parse packet-header when interface name contain hyphen
    
      - [Rev 43144](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43144) - GlusterFS: Display SETATTR attribute valid as a list of flags
    
      - [Rev 43147](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43147) - smb2: Fix invalid hf\[\] entry 'display' field value
    
      - [Rev 43148](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43148) - fix building Developer Guide from release tarball
    
      - [Rev 43150](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43150) - prevent crash in 'proto\_registrar\_dump\_values'
    
      - [Rev 43164](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43164) - [Bug 7346](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7346) - ua3g dissector: access violation
    
      - [Rev 43172](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43172), [Rev 43173](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43173) - Don't use Windows [FormatMessage](/FormatMessage)() unsafely
    
      - [Rev 43174](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43174) - [Bug 5241](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5241) - Cannot run tshark under tcp using decode-as format for syslog
    
      - [Rev 43175](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43175) - [Bug 5226](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5226) - sip.tag filter/column ambiguous as to whether it refers to FROM tag or TO tag
    
      - [Rev 43176](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43176) - [Bug 7333](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7333) - Unhandled exception ( group=1, code=4) occurs when trying to capture in pdml file
    
      - [Rev 43177](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43177),[Rev 43178](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43178),[Rev 43179](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43179) - Do not use BASE\_NONE for FT\_\*INT\* types.
    
      - [Rev 43180](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43180),[Rev 43181](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43181) - [Bug 6844\#c27](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6844#c27) - uasip: ip\_to\_string bug: use inet\_pton() instead
    
      - [Rev 43184](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43184) - Values in a custom column aren't displayed as a value\_string (when appropriate).
    
      - [Rev 43186](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43186) - [Bug 6671](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6671) - BASE\_CUSTOM field is incorrectly formatted when applied as a column
    
      - [Rev 43187](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43187) - [Ask 11798](http://ask.wireshark.org/questions/11798) - Fix UDP-Lite checksum verification.
    
      - [Rev 43191](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43191) - Remove a duplicate entry from the AUTHORS list
    
      - [Rev 43193](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43193),[Rev 43195](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43195) - Set the default for printing or exporting packets to displayed packets only.
    
      - [Rev 43194](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43194) - [Bug 7353](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7353) - Missing breaks in packet-rsvp.c
    
      - [Rev 43198](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43198) - [Bug 7352](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7352) - Fix memory leak in [AirPcap](/AirPcap) code
    
      - [Rev 43203](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43203) - [Bug 6246](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6246) - Incorrect decoding of IA5String type in unaligned PER
    
      - [Rev 43212](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43212) - [Bug 6917](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6917) - Use ".", not ",", as the decimal point in floating-point values in filter expressions
    
      - [Rev 43214](http://anonsvn.wireshark.org/viewvc?view=revision&revision=43214) - [Bug 7360](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7360) - Service handover IE is not correctly dissected
    
      - [Rev 43217](http://anonsvn.wireshark.org/viewvc?view=revision&revision=43217) - packet-wreth.c: Fix bugs and other issues
    
      - [Rev 43226](http://anonsvn.wireshark.org/viewvc?view=revision&revision=43226) - Fix: code under 'if(tree)' (in)directly calls sub-dissector/col\_...()/expert...() fcns
    
      - [Rev 43224](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43224) - Note in README.developer that calls to "expert" functions should not be under 'if (tree)'
    
      - [Rev 43228](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43228) - File name preferences (browse button for file name preferences).
    
      - [Rev 43236](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43236) and many others - Create Windows uninstallers in a separate build step
    
      - Part of [Rev 43267](http://anonsvn.wireshark.org/viewvc?view=revision&revision=43267) - Double registration of yami module cause not calling proto\_reg\_handoff\_yami after changing preferences.
    
      - [Rev 43271](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43271) - [Bug 7350](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7350) - Make sure pcap-ng files created by editcap -c have the necessary IDBs
    
      - [Rev 43277](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43277) - Draw protocol tree in proper [GtkTreeView](/GtkTreeView).
    
      - [Rev 43280](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43280) - [Bug 7371](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7371) - Add dissection of Release 8 or higher P-GW QoS profile
    
      - [Rev 43204](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43204), [Rev 43211](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43211), [Rev 43221](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43221), [Rev 43222](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43222), [Rev 43235](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43245) - Revert r41952 and r41953 (IPv4|6 version and DSCP).
    
      - [Rev 43303](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43303) - Fix reading back exported SSL keys, bug was introduced in r43097
    
      - [Rev 43304](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43304) - Enhance dissection of the [NewSessionTicket](/NewSessionTicket) handshake message.

## 1.8.0rc1

Released June 6, 2012

Done:

  - Move over the following revisions:

---

Imported from https://wiki.wireshark.org/Development/Trunk-1.8 on 2020-08-11 23:13:22 UTC
