# Past 1.10 Releases

For other and upcoming releases, see the [Git repository shortlog](https://code.wireshark.org/review/gitweb?p=wireshark.git;a=shortlog;h=refs%2Fheads%2Fmaster-1.10).

Release Notes for each release are available on the [main site](https://www.wireshark.org/docs/relnotes/).

## 1.10.6

Released March 7, 2014 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.10.6.html)

Done:

  - Move over the following revisions:
      - [Change 338](https://code.wireshark.org/review/#/c/338/) - Fix unregistered hf errors from t124 dissector (errors come from the backport of r49644)
    
      - [Change 13](https://code.wireshark.org/review/#/c/13/) - [Bug 9483](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9483) - Avoid crash when creating a Lua [TvbRange](/TvbRange) from a [FieldInfo](/FieldInfo).
    
      - [Change 44](https://code.wireshark.org/review/#/c/44/) - [Bug 9549](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9549) - Improved Lua [ProtoField](/ProtoField).new().
    
      - [Change 344](https://code.wireshark.org/review/#/c/344/), [change 345](https://code.wireshark.org/review/#/c/345/) - [Bug 9572](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9572) - Longer data fields in Modbus/TCP aren't displayed.
    
      - [Change 346](https://code.wireshark.org/review/#/c/346/) - [Bug 9598](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9598) - Clear the intermediate line buffer for DMX channels.
    
      - [Change 104](https://code.wireshark.org/review/#/c/104/) - DVB-CI: correct a typo in a filter string
    
      - [Change 6](https://code.wireshark.org/review/#/c/6/) - [Bug 9633](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9633) - Do not try to add a new NAL unit when the previous one was not decoded.
    
      - [Change 347](https://code.wireshark.org/review/#/c/347/) - [Bug 9340](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9340) - Permit building with GTK 3.10+ by ignoring deprecations.)
    
      - [Rev 54295](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=54295),[Rev 54296 (partial)](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=54296) - Replace g\_memmove (deprecated) with memmove.
    
      - [Change 349](https://code.wireshark.org/review/#/c/349/) - [Bug 9634](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9634) - Fix pcap heuristics broken in r49999.
    
      - [Change 5](https://code.wireshark.org/review/#/c/5/) - [Bug 9649](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9649) - SMPP: source\_telematics\_id value length is 1 byte.

## 1.10.5

Released December 19, 2013 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.10.5.html)

Done:

  - Move over the following revisions:
      - [Rev 54181](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=54181) - [Bug 9571](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9571) - Fix " Wireshark stops showing new packets but dumpcap keeps writing them to the temp file"
    
      - [Rev 54225](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=54225) - [Bug 9577](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9577) - Wireshark 1.10.4 shuts down when promiscuous mode is unchecked
    
      - [Rev 54227](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=54227) - [Bug 9578](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9578) - Homeplug dissector bug: STATUS\_ACCESS\_VIOLATION: dissector accessed an invalid memory address

## 1.10.4

Released December 17, 2013 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.10.4.html)

Done:

  - Move over the following revisions:
      - [Rev 53195](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53195) - [Bug 9388](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9388) - Avoid an infinite loop in SIP dissector.
    
      - [Rev 53627](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53627) - [Bug 8976](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8976) - crash when selecting "Decode As" based on SCTP PPID.
    
      - [Rev 53803](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53803) - [Bug 9488](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9488) - Remove global gpinfo variable and use pinfo directly (backport of r49145).
    
      - [Rev 53071](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53071) - [Bug 9031](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9031) - SIP contact-param parsing fails in case the last parameter includes a quoted string.
    
      - [Rev 53086](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53086) - [Bug 9383](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9383) - Incorrect FATTR4\_SECURITY\_LABEL value
    
      - [Rev 53148](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53148) - [Bug 9382](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9382) - Fix dissection of GSM MAPv3 ReportSM\_[DeliveryStatusRes](/DeliveryStatusRes).
    
      - [Rev 53205](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53205) - [Bug 8966](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8966) - Initialize last entry of background\_color array to avoid having a RGBA(0,0,0,0) transparent black in graph analysis window.
    
      - [Rev 53247](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53247) - [Bug 9409](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9409) - don't call proto\_item\_get\_len() when the argument can be NULL
    
      - [Rev 53257](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53257) - [Bug 9112](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9112) - Fix incorrect "bytes missing in capture file" in "check\_fragments".
    
      - [Rev 53398](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53398) - [Bug 9435](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9435) - SEL Fast Message bug fix for signed 16-bit integer fast meter messages.
    
      - [Rev 53399](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53399) - [Bug 9435](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9435) - DNP3 bug fix for analog data sign bit bandling.
    
      - [Rev 53608](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53608),[Rev 53611](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53611) - Make "Use promiscuous mode on all interfaces" toggle button work properly again.
    
      - [Rev 53609](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53609),[Rev 53610](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53610) - Make "Capture on all interfaces" toggle button behave properly, particularly when all interfaces had been selected but one of them is deselected.
    
      - [Rev 53626](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53626) - Support long Domain Names in NTLMSSP v2 and prevent crash
    
      - [Rev 53646](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53646) - [Bug 9433](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9433) - Bugfix timestamp formatting of Gigamon trailer.
    
      - [Rev 53670](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53670) - [Bug 8894](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8894) - Tx MCS set is not interpreted properly in WLAN beacon frame.
    
      - [Rev 53728](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53728) - Specify SI units for the max filesize autostop condition. Properly document the capture buffer size in IEC units.
    
      - [Rev 53838](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53838) - [Bug 9521](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9521) - Correctly update the data length of the SCSI payload within ISCSI.
    
      - [Rev 53842](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53842) - [Bug 9512](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9512) - DTLS: Fix buffer overflow in mac check.
    
      - [Rev 53845](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53845) - [Bug 9505](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9505) - RLC dissector cannot assemble PDUs with SNs skipped and wrap-arounded.
    
      - [Rev 53940](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53940) - [Bug 9550](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9550) - GSM SMS UDH EMS control expects 4 octets instead of 3 with OPTIONAL 4th.
    
      - [Rev 54148](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=54148) - Fix alignment issue in GTK2 flowgraph "packet choice" window.
    
      - [Rev 52987](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52987) - BAT has a bouquet ID, no service ID
    
      - [Rev 53322](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53322) - fix DVB-CI application capability handling
    
      - [Rev 54138](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=54138) - [Bug 9563](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9563) - fix "decode as" for time protocol.
    
      - [Rev 53631](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53631) - [Bug 9478](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9478) - GSM SMS User Data header fill bits are wrong when using a 7 bits ASCII / IA5 encoding.

Not done:

  - Move over the following revisions:
      - [Rev 52159](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52159) - [Bug 9164](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9164) - Add dissector\_try\_uint\_new() to the list of exported symbols -- *API change*
    
      - [Rev 52208](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52208) - [Bug 5349](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5349) - EAP-TLS reassemble does not happen because of misplaced if (tree) -- *Doesn't apply?*
    
      - [Rev 53107](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53107) - [Bug 9378](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9378) - Fix for checking RTPS sub message length. -- *Doesn't apply?*
    
      - [Rev 53843](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53843) - [Bug 9512](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9512) - dtls: fix buffer overflow in mac check. -- *Breaks API / ABI?*

## 1.10.3

Released November 1, 2013 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.10.3.html)

Done:

  - Move over the following revisions:
      - [Rev 52464](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52464) - [Bug 9252](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9252) - Fix WCCP fix hash buckets assignment info decoding
    
      - [Rev 52507](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52507) - [Bug 9044](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9044) - "Follow TCP Stream" shows only first HTTP req+res
    
      - [Rev 51942](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51942) - [Bug 9126](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9126) - Fix the value of 'SEND\_TO\_UE' in the DIAMETER Gx dictionary for Packet-Filter-Usage AVP
    
      - [Rev 51919](http://anonsvn.wireshark.org/viewvc?view=revision&revision=51919) - [Bug 8946](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8946) - GTS starting slot in the Beacon frame is not parsed correctly.
    
      - [Rev 52036](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52036) - [Bug 9139](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9139) - Misuse of pointer-to-pointer in IEEE-802.15.4 dissector
    
      - [Rev 52131](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52131) - [Bug 9157](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9157) - BSSGP: Fix dissection of Trace Type IE in SGSN-INVOKE-TRACE message
    
      - [Rev 52154](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52154) - [Bug 9168](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9168) - PER dissector crash
    
      - [Rev 52157](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52157) - Minor ENIP dissector bugfixes
    
      - [Rev 52215](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52215) - [Bug 9186](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9186) - Minor correction to dissection of DLR frames in Ethernet/IP dissector
    
      - [Rev 52221](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52221) - When a line of text wraps to the next line, the character that caused the line to wrap was not being printed.
    
      - [Rev 52330](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52330) - [Bug 9204](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9204) - Fix parsing of padding in RTP header extension
    
      - [Rev 52338](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52338) - [Bug 9218](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9218) - Fix typo in MODCOD list of DVB-S2 dissector
    
      - [Rev 50272](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50272) - [Bug 8871](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8871) - TLS decryption fails with XMPP start\_tls
    
      - [Rev 52354](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52354) - [Bug 9228](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9228) - Ensure that decompressed tvb exists before trying to add it to the tree
    
      - [Rev 52209](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52209) - [Bug 5349](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5349) - EAP-TLS reassemble does not happen because of misplaced if (tree)
    
      - [Rev 52403](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52403) - [Bug 9206](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9206) - Improve "eHRPD Indicator" NVSE dissection in 3GPP2 A11 Registration Request
    
      - [Rev 52404](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52404) - [Bug 9198](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9198) - [WebSphere](/WebSphere) MQ V7 Bug Fix [Bug 8322](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8322) TSHM\_EBCDIC
    
      - [Rev 52773](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52773) - [Bug 9209](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9209) - Fix Debian package build from the source tarball: generate wsicon32.xpm
    
      - [Rev 52463](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52463) - [Bug 9248](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9248) - Fix (near) infinite loop and bugfix some missed offset increments.
    
      - [Rev 52493](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52493) - [Bug 9258](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9258) - Fix tshark core dump when it can't keep up with dumpcap's ring of files.
    
      - [Rev 52512](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52512) - Don't close the Capture Options dialog if there's an error in it.
    
      - [Rev 52566](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52566) - [Bug 9262](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9262) - Fix dissection of PTP Management messages
    
      - [Rev 52570](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52570) - [Bug 9263](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9263) - Don't allow the TCP dissector to assume that either tvb\_length\_remaining() or tvb\_reported\_length\_remaining() always return a value \>= 0.
    
      - [Rev 52659](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52659) - H.225.0: fix handling of compound parameters in Generic Extensible Framework (H.460.22 did not work well)
    
      - [Rev 52662](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52662) - [Bug 9199](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9199) - edns0 "Higher bits in extended RCODE" incorrectly decoded in DNS dissector
    
      - [Rev 52679](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52679) - [Bug 9130](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9130) - Prevent crash if wrong "packet lengths range" entered
    
      - [Rev 52683](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52683) - [Bug 9129](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9129) - Limit UAT dialog to single popup to prevent UAT list from becoming unsynchronized (and possibly crash)
    
      - [Rev 52733](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52733) - [Bug 9300](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9300) - Fix padding bytes overlapping due to NDR alignment
    
      - [Rev 52734](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52734),[Rev 52735](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52735) - [Bug 9301](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9301) - Datablob size is NDR64/32 dependent
    
      - [Rev 52736](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52736) - [Bug 9302](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9302) - dce-rpc: properly dissect multiple PDU in the same packet
    
      - [Rev 52738](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52738) - Remove if (fh\_tree) checks as add\_ethernet\_trailer() calls such functions as dissector\_try\_heuristic(), expert\_add\_info(), and col\_append\_str(), which all need to be called whether fh\_tree is NULL or not.
    
      - [Rev 52838](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52838) - [Bug 9317](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9317) - Display the frame number on the packet summary line if it's one of the configured columns.
    
      - [Rev 52732](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52732) - [Bug 9299](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9299) - NULL check ref\_nt\_challenge\_response and ref\_lm\_challenge\_response
    
      - [Rev 52977](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52977) - [Bug 9296](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9296) - Take a copy of dissector string registrations to fix Lua registrations.
    
      - [Rev 52859](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52859) - [Bug 9327](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9327) - Bluetooth: SDP: Fix PBAP features presentation
    
      - [Rev 53016](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=53016) - [Bug 9360](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9360) - Fix IRC response command filter

Not done:

  - Move over the following revisions:
      - [Rev 52159](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52159) - [Bug 9164](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9164) - Add dissector\_try\_uint\_new() to the list of exported symbols -- *API change*
    
      - [Rev 52208](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=52208) - [Bug 5349](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5349) - EAP-TLS reassemble does not happen because of misplaced if (tree) -- *Doesn't apply?*

## 1.10.2

Released September 10, 2013 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.10.2.html)

Done:

  - Move over the following revisions:
      - [Rev 50479](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50479),[Rev 50516](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50516),[Rev 50535](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50535),[Rev 50595](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50595),[Rev 50740](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50740),[Rev 50741](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50741),[Rev 50903](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50903) - [Bug 8908](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8908) - Fix tree expansion/restore.
    
      - [Rev 50956](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50956),[Rev 50984](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50984),[Rev 50986](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50986),[Rev 50992](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50992),[Rev 50993](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50993) - [Bug 7278](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7278) - Restore capture filters into per-interface combo boxes.
    
      - [Rev 51015](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51015) - Use proper shared library versions
    
      - [Rev 51130](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51130) - [Bug 8827](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8827) - Fix wmem crash in bthci\_acl dissector.
    
      - [Rev 51195](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51195) - [Bug 9005](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9005) - Fix fuzz failure in NBAP dissector.
    
      - [Rev 51196](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51196) - [Bug 9020](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9020) - Fix infinite loop in assa-r3 dissector.
    
      - [Rev 51599](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51599) - [Bug 9085](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9085) - GSM A-I/F DTAP: fix display of Detach Type IE in Detach Request message
    
      - [Rev 51213](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51213) - [Bug 9019](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9019) - Buffer overflow in RTPS dissector
    
      - [Rev 51516](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51516) - Ensure ldap\_call\_response\_t struct is always completely initialized
    
      - [Rev 51603](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51603) - [Bug 9079](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9079) - Very long loop in MQ dissector.
    
      - [Rev 51788](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51788) - [Bug 9103](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9103) - Warning for attempting to install 64-bit Wireshark on a 32-bit machine has an embedded "\\n"
    
      - [Rev 50923](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50923) - [Bug 8980](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8980) - IO graph advanced, error when calculating value for field of type FT\_RELATIVE\_TIME with multiple items in single frame
    
      - [Rev 50940](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50940) - [Bug 8918](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8918) - Incorrect dissection of IPFIX (min/max)[IpTotalLength](/IpTotalLength) fields.
    
      - [Rev 49436](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49436) - [Bug 8982](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8982) - Syntax error in reordercap.pod.
    
      - [Rev 50969](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50969) - [Bug 8841](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8841) - Fix PER normally small non-negative whole number dissection when it is greater than or equal to 64
    
      - [Rev 51073](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51073) - [Bug 8995](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8995) - Fix make-dissector-reg.py to work if system python is version 3+
    
      - [Rev 51152](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51152) - [Bug 9012](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9012) - SCSI dissector does not parse PERSISTENT RESERVE commands correctly
    
      - [Rev 51233](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51233) - [Bug 9022](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9022) - Fix dissection of SIP Feature-Caps header field
    
      - [Rev 51313](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51313) - fix dissect\_sip\_tcp\_heur()
    
      - [Rev 51321](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51321) - [Bug 9031](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9031) - SIP contact-param parsing should be stopped when finding a comma separator
    
      - [Rev 51333](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51333) - [Bug 9035](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9035) - Indicate the right direction in info column
    
      - [Rev 51339](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51339) - [Bug 9038](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9038) - 802.11 HT Extended Capabilities B10 decode incorrect
    
      - [Rev 51360](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51360) - [Bug 9036](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9036) - Ethercat ADS byte highlighting is incorrect
    
      - [Rev 51395](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51395) - Fix bugs in packet-rohc.c with tvb\_length\_remaining() possibly returning -1.
    
      - [Rev 51422](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51422) - [Bug 8989](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8989) - SGI Nsym disambiguation is unconditionally displayed when dissecting VHT
    
      - [Rev 51448](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51448) - Buffer overflow (off-by-1 error) in SSS dissector. Also, protect against tvb\_length\_remaining possibly returning -1.
    
      - [Rev 51493](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51493) - Make sure rawshark initializes a struct.
    
      - [Rev 51508](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51508) - Use the correct length field when tagging an SSID
    
      - [Rev 51523](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51523) - [Bug 8993](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8993) - Use icons that are compatible with OS X 10.5.
    
      - [Rev 51566](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51566) - Support SVN later than 1.7.11 in make-version
    
      - [Rev 51576](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51576) - [Ask 23891](http://ask.wireshark.org/questions/23891) - Fix bugs with using maximum of 2GiB for the autostop filesize stop condition.
    
      - [Rev 51610](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51610) - [Bug 9088](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9088) - STP: fix dissection of MSTI Root Identifiers for all MSTIs
    
      - [Rev 51785](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51785) - [Bug 9101](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9101) - As per the HTTP spec, prefer chunked transfer-encoding to content-length when reassembling if we get both.
    
      - [Rev 51789](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51789) - [Ask 24221](http://ask.wireshark.org/questions/24221) - Display "TEID/GRE Key" field consistently as hexadecimal.
    
      - [Rev 51800](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51800) - Duplicate field names in ISDN SUP.
    
      - [Rev 51805](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51805) - Make the Lua dissector "init" routine work again.
    
      - [Rev 51815](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51815) - Added syntax and range checks for Lua Prefs.range default values.
    
      - [Rev 51020](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51020) - Fix potential fuzz failure caused by fix for bug 3290.
    
      - [Rev 51872](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51872) - [Bug 4461](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4461) - Fixed [ByteArray](/ByteArray) append/prepend and concat crashes.
    
      - [Rev 51903](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51903) - [Bug 5201](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5201) - Return [ByteArray](/ByteArray) as "value" for [FieldInfo](/FieldInfo)'s with type FT\_NONE (which has data).
    
      - [Rev 51899](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51899) - [Bug 5200](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5200) - Initialize all tvb values in [FieldInfo](/FieldInfo)\_get\_range.
    
      - [Rev 51903](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51903) - [Bug 5201](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5201) - Return [ByteArray](/ByteArray) as "value" for [FieldInfo](/FieldInfo)'s with type FT\_NONE (which has data).
    
      - [Rev 49673](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49673) - [Bug 8742](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8742) - Fix corrupt-netmon crash

Not done:

  - Move over the following revisions:
      - [Rev 51077](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51077) - [Bug 8995](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8995) - Fix configure script to get Python major version correctly if system python is version 3+ -- *Didn't apply (copied updated code over by hand)*
    
      - [Rev 51236](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=51236) - [Bug 9014](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9014) - Crash in TShark with option "-z io,stat" in the presence of negative relative packet timestamps -- *Doesn't apply cleanly*

## 1.10.1

Released July 26, 2013 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.10.1.html)

Done:

  - Move over the following revisions:
      - [Rev 49490](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49490) - [Bug 8895](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8895) - Remove capture\_unix\_ifnames.c from cmake.
    
      - [Rev 49697](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49697) - [Bug 8742](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8742) - initialize netmon frame\_table
    
      - [Rev 49798](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49798) - [Bug 8774](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8774) - Wrong encoding for 2 pod files causes build to fail.
    
      - [Rev 49802](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49802) - [Bug 8717](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8717) - Fix crash trying to reassembly bad ETSI DCP packets.
    
      - [Rev 49804](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49804) - [Bug 8736](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8736) - Crash analyzing VoIP Calls (T38)
    
      - [Rev 49811](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49811) - [Bug 8773](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8773) - Explicitly clear the icon cache in the Windows installer and uninstaller.
    
      - [Rev 49830](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49830) - Display private and global profiles correctly in the profiles menu.
    
      - [Rev 49837](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49837) - Fix all errors and warnings found by podchecker.
    
      - [Rev 49848](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49848) - Misaligned columns in hex dump pane with pango-1.18.x
    
      - [Rev 49850](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49850) - Get rid of GTK+ warnings when editing interface settings from the welcome screen.
    
      - [Rev 49851](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49851), [Rev 49852](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49852), [Rev 49854](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49854) - [Bug 8763](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8763) - Don't treat zero-length names in Name Resolution Block entries as errors, and discard zero-length names returned by IP-address-to-host-name resolvers or supplied from pcap-ng NRBs.
    
      - [Rev 49567](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49567) - [Bug 8708](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8708) - Add MAC-DATA support to TETRA dissector and other minor improvements
    
      - [Rev 49863](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49863) - [bug 8782](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8782) - SCSI (SPC) sense key specific information field must not include SKSV.
    
      - [Rev 49865](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49865), [Rev 49866](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49866) - [Bug 8774](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8774) - Explicitly set the pod file encoding to utf8 to hopefully accommodate UTF-8 characters in the AUTHORS file.
    
      - [Rev 49899](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49899) - Fix wrong offset in H.235 tokens causing malformed packet exception.
    
      - [Rev 49908](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49908) - [Bug 8793](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8793) - Don't crash when Flow Graph window cancelled while Graph Analysis window is open.
    
      - [Rev 49910](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49910) - [Rev 49986](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49986) - Fix dissection of 3GPP2 SMS messages when the User Data Header field is present (for fragmented SMS)
    
      - [Rev 49937](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49937) - [Bug 3034](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3034) - Wireshark hides under Taskbar
    
      - [Rev 49939](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49939) - [Bug 3123](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3123) - Wireshark doesn't translate IEEE802a OUI
    
      - [Rev 49946](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49946) - [Bug 7543](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7543) - Lines of text are truncated if they are either longer than the paper width or past the paper height.
    
      - [Rev 49983](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49983) - [Rev 49984](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49984) - Perform a signed comparison, rather than unsigned, because tvb\_length\_remaining() can return -1.
    
      - [Rev 49985](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49985) - [Bug 8722](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8722) - Fix possible uninitialized variable in PER dissectors.
    
      - [Rev 49991](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49991) - [Bug 8809](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8809) - Wrong size of LLRP ProtocolID Parameter in Accessspec Parameter.
    
      - [Rev 50049](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50049) - Decode bit 15 of DSR Flags (fix cut-n-pasteo).
    
      - [Rev 50064](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50064) - [Bug 6090](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6090) - Clear the list store when resetting the VoIP Calls dialog.
    
      - [Rev 50083](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50083) - [Bug 8826](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8826) - Avoid using an already-deleted proto\_item in P1 dissector.
    
      - [Rev 50090](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50090) - [Bug 8830](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8830) - Prevent an out of bounds access in 802.11 Radiotap dissector
    
      - [Rev 50094](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50094) - [Bug 8828](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8828) - Double-free in DCOM-SYSACT dissector
    
      - [Rev 50125](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50125) - [Bug 4507](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4507) - IEEE 802.15.4 frame check sequence in "Chipcon mode" not displayed correctly (RSSI should be displayed in dB, not dBm).
    
      - [Rev 50127](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50127), [Rev 50128](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50128) - Fixes for Ethernet FCS.
    
      - [Rev 50134](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50134) - [Bug 8831](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8831) - Near-infinite loop in BT-SDP dissector.
    
      - [Rev 50145](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50145) - [Bug 8849](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8849) - Various bugfixes in iec104 dissector.
    
      - [Rev 50151](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50151) - [Bug 8851](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8851) - ansi\_637\_tele dissector displays MSB as MBS for Call-Back Number
    
      - [Rev 50171](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50171) - [Bug 8853](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8853) - Add a missing subtree initialization to prevent an assert during NFS dissection
    
      - [Rev 50173](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50173) - [Bug 8813](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8813) - Support IPv6 on Solaris later than 5.8
    
      - [Rev 50179](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50179) - [Bug 8835](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8835) - Bugfix support for RFC 4379.
    
      - [Rev 50185](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50185) - [Bug 8857](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8857) - IMAP dissector: do not assume that we must have at least 1 character present per line before \\r\\n
    
      - [Rev 50203](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50203) - [Bug 5413](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5413) - Make colors used by colorize\_filter\_te\_as\_\* as preferences (to help alleviate possible color blinding issues).
    
      - [Rev 50210](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50210) - [Bug 8852](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8852) - Fix LISP decoding.
    
      - [Rev 50226](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50226),[Rev 50432](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50432),[Rev 50478](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50478) - [Bug 8828](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8828) - Always initialize pdata in dissect\_ndr\_\* functions, replace DISSECTOR\_ASSERTs with slots for expert info.
    
      - [Rev 50228](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50228) - [Bug 8864](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8864) - Bugfix KDSP dissector.
    
      - [Rev 50230](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50230) - [Bug 8823](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8823) - Separate IP option type fields for each dissector that uses dissect\_ip\_tcp\_options().
    
      - [Rev 50258](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50258) - [Bug 8875](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8875) - Fix an infinite loop in BT OBEX
    
      - [Rev 50264](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50264),[Rev 50266](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50266) - Fix a couple encoding arguments in VNC.
    
      - [Rev 50282](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50282) - Try to do something sane if the size argument to tvb\_format\_\*() functions is negative. (Fixes Coverity CID 1035325: Improper use of negative value)
    
      - [Rev 50301](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50301) - Guard against tvb\_reported\_length\_remaining() possibly returning -1. (Fixes Coverity CID 1035326: Improper use of negative value)
    
      - [Rev 50303](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50303),[Rev 50306](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50306) - Declare 'err' volatile. (Fixes Coverity CID 997052: Infinite loop)
    
      - [Rev 50305](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50305) - Ensure 'info' is not NULL before dereferencing it. (Fixes Coverity CID 280618: Dereference before null check)
    
      - [Rev 50313](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50313) - Cache malformed filter for expert info.
    
      - [Rev 50450](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50450) - [Bug 8911](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8911) - Fix long loop in DIS dissector
    
      - [Rev 50474](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50474) - [Bug 8916](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8916) - DVB-CI: fix integer wrap around caused by invalid TPDU length
    
      - [Rev 50495](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50495) - Match libtool built shared library version numbers with CMake
    
      - [Rev 50504](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50504) - [Bug 8923](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8923) - Fix very long loop in gsm\_a\_rr (and other proto\_tree\_add\_bits\_item() callers)
    
      - [Rev 50672](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50672) - [Bug 8940](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8940) - Fix fuzz failure in gsm\_a\_common.
    
      - [Rev 50728](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50728) - Allow continued dissection of Diameter even if one AVP is malformed.
    
      - [Rev 50734](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50734) - [Bug 8941](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8941) - Fix fuzz failure in NTLMSSP.
    
      - [Rev 50335](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50335) - Avoid attempting to free stack memory (Fixes Coverity CID 280323: Free of array-typed value).
    
      - [Rev 50336](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50336) - Fix Coverity CID 660: Negative array index read.
    
      - [Rev 50341](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50341) - [Bug 8889](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8889) - Fix SCTP bytes graph crash.
    
      - [Rev 50397](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50397) - [Bug 8160](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8160) - Fix calculation of delta-displayed-time when using -2 and -Y together.
    
      - [Rev 50423](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50423) - [Bug 8888](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8888) - Fix over-allocation in tshark's io-stat.
    
      - [Rev 50445](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50445) - [Bug 8906](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8906) - List all timestamp options in help and man pages.
    
      - [Rev 50465](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50465),[Rev 50469](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50469) - [Bug 8909](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8909) - Graph Filter field limited to 256 characters (advanced filter field limited to 100 characters)
    
      - [Rev 50471](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50471) - Avoid having double "Default" entry in "Create New Profile".
    
      - [Rev 50472](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50472) - [Bug 8904](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8904) - Bugfix uninitialized values in SMTP conversation structure.
    
      - [Rev 50455](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50455)[Rev 50457](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50457) - [Bug 8884](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8884) - Wireshark crashes when switching from a v1.11.0 profile to a v1.4.6 prof and then to a v1.5.1 profile.
    
      - [Rev 50480](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50480) - [Bug 8897](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8897) - SIP stats shows incorrect values for Max/Ave setup times.
    
      - [Rev 50483](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50483) - [Bug 5734](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5734) - Use luaL\_optnumber for [ProtoField](/ProtoField) mask, to avoid a signed cast.
    
      - [Rev 50510](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50510) - In packet-slsk.c:check\_slsk\_format(), compare the return value of tvb\_length\_remaining() \> 0 instead of \!= 0 since the function can return -1.
    
      - [Rev 50602](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50602) - [Bug 8920](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8920) - Fix dissection of NFSv4 delegation.
    
      - [Rev 50609](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50609) - [Bug 8932](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8932) - Issue with Capture Options Adapter List
    
      - [Rev 50651](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50651) - [Bug 8904](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8904) - Null-pointer in profinet heuristics.
    
      - [Rev 50745](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50745) - [Bug 8955](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8955) - Invalid preference names aren't reported as such
    
      - [Rev 50786](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50786) - [Bug 8957](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8957) - Remove a copy /paste error triggering a malformed exception when dissecting IPv4 DHCP Support Mode option
    
      - [Rev 50787](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50787) - [Bug 8958](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8958) - Highlight the right number of bytes for the PadN option data field
    
      - [Rev 50791](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50791) - [Bug 8959](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8959) - Filter doesn't support cflow ASN larger than 65535.
    
      - [Rev 50826](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50826) - [Bug 8953](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8953) - Counted string fields often cause the packet to falsely show up as malformed
    
      - [Rev 50892](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=50892) - [Bug 8960](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8960) - Fix mongo dissection: allow FT\_STRING's to be added with a length of -1.

## 1.10.0

Released June 5, 2013 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.10.0.html)

Done:

  - Move over the following revisions:
      - [Rev 49261](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49261) - Fix compilation
    
      - [Rev 49278](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49278) - Eliminate some includes of ui/simple\_dialog.h by files that don't use anything from it.
    
      - [Rev 49259](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49259) - Add the possibility to use a key for per-packet-data
    
      - [Rev 49281](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49281) - Don't fill in err\_str if we're not going to use it.
    
      - [Rev 49286](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49286) - Merge capture\_start\_confirmed() into capture\_start\_cb().
    
      - [Rev 49293](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49293) - Pull dnd\_merge\_files() into dnd\_open\_file\_cmd(); the resulting code is a bit simpler.
    
      - [Rev 49313](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49313) - Show the number of per-packet-data entries and which protocol has made entries in the frame.
    
      - [Rev 49317](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49317) - Un-shadow a couple of variables.
    
      - [Rev 49434](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49434) - [Bug 8696](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8696) - When another profile is selected, its column.hidden preference is ignored.
    
      - [Rev 49486](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49486) - On OS X, get the interface type from the System Configuration framework.
    
      - [Rev 49487](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49487) - Add missing include file that's needed so symbols are defined on all platforms.
    
      - [Rev 49493](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49493) - Pull the capture-session state information out of capture\_opts and put it into a separate capture\_session structure.
    
      - [Rev 49491](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49491) - Rename capture\_opts\_trim\_iface() to capture\_opts\_default\_iface\_if\_necessary(), to reflect what it actually does.
    
      - [Rev 49497](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49497) - Fix the Windows side to look for the signal pipe stuff in cap\_session.
    
      - [Rev 49517](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49517) - Declare routines in capture\_sync.h
    
      - [Rev 49535](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49535) - Make a routine not used outside this file static.
    
      - [Rev 49546](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49546) - Fix computation of TP-User-Data-Length when SMS is coded with GSM 7 bit default alphabet and TP-User-Data-Header field is present
    
      - [Rev 49554](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49554) - [Bug 8714](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8714) - Fix tshark core when run with "-q -2 -r"
    
      - [Rev 49565](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49565) - [Bug 7733](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7733) - Ensure most severe is displayed in expert column.
    
      - [Rev 49566](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49566) - [Bug 8700](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8700) - Bluetooth: Highlight correct bytes in some SDP trees (Part 2).
    
      - [Rev 49570](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49570) - Add Mike Garratt to the list of authors.
    
      - [Rev 49605](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49605) - Error out if the user omits mandatory fields in the SCCP user table.
    
      - [Rev 49606](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49606) - [Bug 8721](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8721) - Fix quadratic-time performance of ICMP taps.
    
      - [Rev 49610](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49610) - [Bug 8731](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8731) - Bugfix crash when 'SCTP' -\> 'Prepare Filter for this Association' has no associations.
    
      - [Rev 49616](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49616) - Correct the c-ares directory name in the clean\_setup target.
    
      - [Rev 49623](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49623) - [Bug 8733](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8733) - Fix infinite recursion in HTTP dissector.
    
      - [Rev 49633](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49633), [Rev 49655](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49655) - [Bug 8604](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8604) - Fix crash with GTK+ \> 3.8.
    
      - [Rev 49644](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49644), [Rev 49652](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49652) - [Bug 3290](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3290) - Do proper bounds checking for NULL trees.
    
      - [Rev 49651](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49651) - [Bug 8735](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8735) - Check USB CCID length to see if there are bytes for subdissectors to use instead of calling them blindly.
    
      - [Rev 49653](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49653) - [Server Fault 512059](http://serverfault.com/questions/512059/why-am-i-seeing-so-many-mapi-unknown-request-response-in-a-packet-capture) - Give the operation number when reporting that a given operation is not handled by a DCE RPC dissector.
    
      - [Rev 49657](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49657), [Rev 49661](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49661) - Fix profile hosts behavior.
    
      - [Rev 49682](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49682) - [Bug 8744](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8744) - Display C12.22 Invocation Id as unsigned integer
    
      - [Rev 49684](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49684) - [Bug 8745](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8745) - Upgrade AP-title ASN.1 description
    
      - [Rev 49686](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49686) - [Bug 8730](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8730) - Infinite loop in GSM CBCH dissector.
    
      - [Rev 49698](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49698) - [Bug 8756](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8756) - Compute the number of septets needed for an alphanumeric address
    
      - [Rev 49722](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49722) - [Bug 8739](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8739) - Move offset to end of line without assuming that we always have \\r\\n at the end of it
    
      - [Rev 49729](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49729) - [Bug 8759](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8759) - handle list ending delimiter in bt-dht peer list
    
      - [Rev 49744](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49744) - [Bug 8764](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8764) - Fix fuzz failure in assa\_r3 dissector.
    
      - [Rev 49752](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49752) - [Bug 8034](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8034) - Friendly Names support causing unnecessary delay when Wireshark starts.
    
      - [Rev 49739](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49739) - [Bug 8760](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8760) - Fix crash from fuzz'd Veriwave file.
    
      - [Rev 49765](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49765) - [Bug 8224](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8224) - Wireshark can incorrectly interpret the export filename as the same as the current filename.
    
      - [Rev 49780](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49780) - Allow tshark to read pcap files and either save them as new pcap files or pipe output to another tshark or wireshark instance.

## 1.10.0rc2

Released May 22, 2013

Done:

  - Move over the following revisions:
      - [Rev 49046](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49046), [Rev 49069](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49069), [Rev 49070](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49070) - [Bug 7755](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7755) - Work around a Microsoft bug that prevented the opening of console windows (that change fixes it on Windows 7, but doesn't appear to fix it on Windows XP; whether it fixes it on Windows Vista is unknown)
    
      - [Rev 49071](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49071) - don't crash when a new pipe is created and we can't determine the linktype
    
      - [Rev 49072](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49072) - missing g\_free()
    
      - [Rev 49111](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49111) - [Bug 8618](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8618) - Allow port 0 in SSL Keys List.
    
      - [Rev 49150](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49150) - missing WS\_DLL\_PUBLIC tags in epan/strutil.h
    
      - [Rev 49114](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49114) - [Bug 8622](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8622) - Fix hf type error in HSRP.
    
      - [Rev 49128](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49128) - [Bug 7359](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7359) - Possible divide by zero error in SNMP decryption.
    
      - [Rev 49134](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49134) - [Bug 8615](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8615) - Enable Start button after adding remote interfaces.
    
      - [Rev 48994](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49134) - When MPLS dissector calls IP, propagate change tvb tvbuff length.
    
      - [Rev 49140](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49140),[Rev 49142](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49142),[Rev 49157](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49157) - [Bug 8600](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8600) - Finish SMTP AUTH NTLM and PLAIN handling
    
      - [Rev 49154](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49154),[Rev 49170](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49170) - [Bug 8627](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8627) - LISP control packet incorrectly identified as LISP data based when UDP source port is 4341.
    
      - [Rev 49166](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49166) - [Bug 8598](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8598) - Fix display filter highlighting for GTK3
    
      - [Rev 49187](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49187) - [Bug 8608](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8608) - Use correct PRF for DTLS 1.2
    
      - [Rev 49084](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49084), [Rev 49116](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49116), [Rev 49122](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49122), [Rev 49123](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49123), [Rev 49124](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49124), [Rev 49125](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49125), [Rev 49126](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49126), [Rev 49127](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49127) - Add Bluetooth and Classic global configuration profiles. Update the default coloring rules.
    
      - [Rev 49206](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49206) - add IDs for host license, play count
    
      - [Rev 49210](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49210) - [Bug 8636](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8636) - Use correct Fibre Channel EOFs
    
      - [Rev 49215](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49215) - [Bug 8634](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8634) - call PKG\_PROG\_PKG\_CONFIG explicitly in configure.ac
    
      - [Rev 49296](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49296) - Fix dissection of old IMS Diameter AVP.
    
      - [Rev 49321](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49321) - [Bug 6898](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6898) - Temporary fix for RTMPT out-of-memory fuzz failures.
    
      - [Rev 49334](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49334) - [Bug 8689](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8689) - csids wiretap heuristic overriding mp2t
    
      - [Rev 49301](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49301) - Display Command Qualifier in case of Open Channel (broken in r48862)
    
      - [Rev 49418](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49418) - [Bug 8697](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8697) - Don't access nbap\_dch\_chnl\_info if the index is \> maxNrOfDCHs.
    
      - [Rev 49437](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49437) - [Bug 8680](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8680) - Add decryption for WPA eapol 4-way handshake
    
      - [Rev 49202](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49202), [Rev 49445](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49445) - [Bug 8631](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8631) - RFC 6887 Port Control Protocol Response 96 bit reserved not 64 bit (and enhance r/opcode dissection)
    
      - [Rev 49104](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49104) - Make C12.22 work over UDP.
    
      - [Rev 49133](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49133) - Extend the value\_string that show the platform from where the packet was captured.
    
      - [Rev 49169](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49169) - Revert 49166: It breaks compilation and is not a proper fix ayway
    
      - [Rev 49148](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49148), [Rev 49149](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49149), [Rev 49155](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49155), [Rev 49171](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49171). Ixia Anue ethernet trailer dissector - hopefully simple enough still to go in.
    
      - [Rev 49214](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49214) - [Bug 8638](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8618) - NULL terminate bit field list.
    
      - [Rev 49219](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49219), [Rev 49220](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49220) - Allow the CSS path in the HTML man pages to be specified via POD\_CSS\_URL.
    
      - [Rev 49227](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49227), [Rev 49230](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49230) - The Interface column cannot be hidden any more.
    
      - [Rev 49231](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49231) - Set Start menu button inactive, if capture is in progress.
    
      - [Rev 49322](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49322) - [Bug 6898](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6898) - Make the RTMPT size limit a preference so people who want to reassemble massive packets can do so.
    
      - [Rev 49326](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49326)[Bug 8681](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8681) - AMR Frame Type uses wrong Value String.
    
      - [Rev 49330](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49330) - [Bug 8662](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8662) - Add more bluetooth color filters.
    
      - [Rev 49332](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49332) - [Bug 8629](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8629) - bad tcp checksum not detected
    
      - [Rev 49333](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49333) - Only add one "New from Global" entry in the profiles menu.
    
      - [Rev 49361](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49361) - [Bug 8690](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8690) - Clean up the right-click Profile menu (enhancement but I think the UI is much nicer like this).
    
      - [Rev 49379](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49379) - [Bug 8197](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8197) - Fix read-after-free from tvb\_new\_octet\_aligned().
    
      - [Rev 49409](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49409) - Handle truncated packets with DLT\_USERxy
    
      - [Rev 49426](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49426) - Add some newlines at the end of the wireshark.pod.template file so the authors are printed properly.
    
      - [Rev 49456](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49456) - Fix Fix trimming the maximum number if display filter entries.
    
      - [Rev 49451](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49451) - [Bug 8066](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8066) - Add argument to printf to prevent "corrupted" data.
    
      - [Rev 49466](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49466) - Make sure we apply POD\_CSS\_URL everywhere.
    
      - [Rev 49477](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49477) - On MacOSX en1 is not necessarily wireless.
    
      - [Rev 49480](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49480) - Apply the filter string if all interfaces are selected.
    
      - [Rev 49481](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49481) - [Bug 8700](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8700) - Highlight correct bytes in some SDP trees.
    
      - [Rev 49482](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49482) - Only overwrite the scanned link layer properties if they are specified by command line options.
    
      - [Rev 49488](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49488) - [Bug 8706](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8706) - String change "Stream" to "Follow Stream" in colour preferences.
    
      - [Rev 49513](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49513) - Fix presentation of randpkt types.

## 1.10.0rc1

Released April 26, 2013

Done:

  - Move over the following revisions:
      - [Rev 48983](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48983) - Fix Dead initialization (Found by Clang)
    
      - [Rev 49025](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49025), [Rev 49044](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49044), [Rev 49045](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49045) - [Bug 8609](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8609) - Send output of "-D" and "-L" flags to the standard output, and, in Wireshark, do the right magic to make them show up in a console.

---

Imported from https://wiki.wireshark.org/Development/Trunk-1.10 on 2020-08-11 23:13:15 UTC
