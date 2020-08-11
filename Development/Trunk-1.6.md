# Past 1.6 Releases

For upcoming releases, see [Development/Roadmap](/Development/Roadmap).

## 1.6.16

Released June 7, 2013 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.6.16.html)

Done:

  - Move over the following revisions:
      - [Rev 43716](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43716) - [Bug 8725](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8725) - Fix fuzz crash in capwap dissector.
    
      - [Rev 49513](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49513) - Fix presentation of randpkt types.
    
      - [Rev 49565](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49565) - [Bug 7733](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7733) - Ensure most severe is displayed in expert column.
    
      - [Rev 48789](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48789) - Fix dissection of IMSI detach from non-EPS service type
    
      - [Rev 49623](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49623) - [Bug 8733](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8733) - Fix infinite recursion in HTTP dissector.
    
      - [Rev 49698](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49698) - [Bug 8756](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8756) - Compute the number of septets needed for an alphanumeric address
    
      - [Rev 49722](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49722) - [Bug 8739](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8739) - Move offset to end of line without assuming that we always have \\r\\n at the end of it
    
      - [Rev 49644](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49644), [Rev 49652](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49652) - [Bug 3290](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3290) - Do proper bounds checking for NULL trees.
    
      - [Rev 49787](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49787) - [Bug 8768](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8768) - TETRA dissector assertion.
    
      - [Rev 49802](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49802) - [Bug 8717](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8717) - Fix crash trying to reassembly bad ETSI DCP packets.

## 1.6.15

Released May 17, 2013 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.6.15.html)

Done:

  - Move over the following revisions:
      - [Rev 46805](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46805) - [Bug 8145](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8145) - dissect\_rpc\_array causes assertion fault when array is empty
    
      - [Rev 46905](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46905) - Improve hexline parsing of [NetScreen](/NetScreen) snoop output
    
      - [Rev 48466](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48466) - Properly set the TCP ISN's when the SYN and SYN/ACK are captured out-of-order.
    
      - [Rev 48578](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48578) - Fix a few cases in the SIP dissector where it was not taking into account that tvb\_reported\_length\_remaining() can return -1.
    
      - [Rev 48597](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48597) - Fix the incorrectly duplicated display filter for hf\_gsm\_map\_dlci.
    
      - [Rev 48601](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48601) - Fix the incorrectly duplicated display filter for hf\_gsm\_map\_etsi\_pdp\_type\_number.
    
      - [Rev 48619](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48619) - SASP: first\_flag should be static.
    
      - [Rev 48622](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48622) - Fix Coverity CID's 280305-280306: Negative loop bound.
    
      - [Rev 48664](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48664) - Newly assigned TLS and DTLS cipher suite names.
    
      - [Rev 48697](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48697) - [Bug 8450](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8450) - Do not try to systematically fetch a third digit for Country Code: its length can be from 1 to 3 digits.
    
      - [Rev 48726](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48726) - [Bug 8559](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8559) - Fix dissection of RAN-INFORMATION-APPLICATION-ERROR RIM PDU Indications.
    
      - [Rev 48814](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48814) - [Bug 8575](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8575) - Fix description of ACE4\_APPEND\_DATA flag
    
      - [Rev 48944](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48944) - [Bug 8599](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8599) - Possible uninitialized variable in MMS/BER.
    
      - [Rev 49046](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49046) - [Bug 7755](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7755) - Work around a Microsoft bug that prevented the opening of console windows (that change fixes it on Windows 7, but doesn't appear to fix it on Windows XP; whether it fixes it on Windows Vista is unknown)
    
      - [Rev 49114](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49114) - [Bug 8622](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8622) - Fix hf type error in HSRP.
    
      - [Rev 49128](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49128) - [Bug 7359](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7359) - Possible divide by zero error in SNMP decryption.
    
      - [Rev 49154](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49154),[Rev 49170](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49170) - [Bug 8627](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8627) - LISP control packet incorrectly identified as LISP data based when UDP source port is 4341.
    
      - [Rev 49321](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49321) - [Bug 6898](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6898) - Temporary fix for RTMPT out-of-memory fuzz failures.
    
      - [Rev 49326](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49326)[Bug 8681](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8681) - AMR Frame Type uses wrong Value String.
    
      - [Rev 49332](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49332) - [Bug 8629](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8629) - bad tcp checksum not detected

Not done:

  - Move over the following revisions:
      - [Rev 47874](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47874) - [Bug 7400](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7400) - Fix Lua 5.2 panic problems. -- *Doesn't apply cleanly to 1.8. Should this be deferred to 1.10?*
    
      - [Rev 48461](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48461) - [Bug 7310](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7310) - glusterfs: improve endianness handling and displaying of dict contents -- *Doesn't apply cleanly.*
    
      - [Rev 45687](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45687) - [Bug 7882](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7882) - [AddressString](/AddressString) can have a size of 1 -- *Doesn't apply cleanly.*
    
      - [Rev 48563](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48563) - [Ask 19844](http://ask.wireshark.org/questions/19844) - Add checksum\_bad (set to FALSE) to the tree when the checksum is correct. -- *Doesn't apply cleanly.*
    
      - [Rev 48613](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48613) - [Bug 8532](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8532) - Fix filters as well as dissection of lat and long according to 3GPP TS 23.032. -- *Doesn't apply cleanly.*
    
      - [Rev 49019](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49019) - [Rev 49024](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49024) - [Bug 8610](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8610) - Ensure that tap is called after full dissection, even in case of exception -- *Doesn't apply cleanly.*
    
      - [Rev 49187](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49187) - [Bug 8608](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8608) - Use correct PRF for DTLS 1.2 -- *Doesn't apply cleanly.*
    
      - [Rev 49214](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=49214) - [Bug 8638](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8618) - NULL terminate bit field list. -- *Doesn't exist in 1.6?.*

## 1.6.14

Released March 6, 2013 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.6.14.html)

Done:

  - Move over the following revisions:
    
      - [Rev 42893](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42893) - [Bug 5825](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5825) - Fix to BACapp item length causes Buildbot crash output: randpkt-2011-04-13-1899.pcap.
    
      - [Rev 47494](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47494) - packet-fmp\_notify.c: Add missing hf\[\] entries.
    
      - [Rev 47605](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47605) - Fix ERROR: NO ARRAY: packet-tlv.c, hf\_docsis\_rcv\_mod\_enc\_ctr\_freq\_asgn.
    
      - [Rev 47982](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47982) - [Bug 8382](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8382) - Crash in ms-mms dissector (manual backport of r47979).
    
      - [Rev 45324](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45324) - [Bug 7789](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7789) - Fix infinite loop in sflow dissector.
    
      - [Rev 45355](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45355) - [Bug 7802](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7802) - Fix infinite loop in SCTP dissector.
    
      - [Rev 47568](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47568) - Fix Coverity CID 973548: Dereference null return value.
    
      - [Rev 47646](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47646) - [Bug 8320](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8320) - Fix typo in case value that led to misdissection of TSPEC IEs.
    
      - [Rev 47658](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47658) - [Bug 8332](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8332) - Bugfix potential buffer overflow in RTPS/RTPS2 dissectors.
    
      - [Rev 47672](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47672) - [Bug 8335](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8335) - Crash in packet-mount.c with packet with negative length field.
    
      - [Rev 47675](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47675) - [Bug 8331](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8331) - Fix decoding long UCS-2 strings in packet-bacapp.c.
    
      - [Rev 47681](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47681) - [Bug 8337](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8337) - Infinite loop in AMPQ dissector.
    
      - [Rev 47692](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47692) - [Bug 8340](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8340) - Divide by zero in ACN dissector.
    
      - [Rev 47708](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47708) - [Bug 8346](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8346) - Memory buffer overrun in packet-cimd.c.
    
      - [Rev 47725](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47725) - [Bug 6434](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6434) - Data combined via ssl\_desegment\_app\_data not visible via "Follow SSL Stream" only decrypted ssl data tabs.
    
      - [Rev 47729](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47729) - [Bug 8321](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8321) - Feed the RTP tap before trying to dissect a possible malformed payload, influencing RTP statistics.
    
      - [Rev 47775](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47775) - [Bug 8359](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8359) - Infinite loop in packet-fcsp.c.
    
      - [Rev 47872](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47872) - [Bug 7939](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7939) - Register media types json-rpc and jsonrequest for JSON.
    
      - [Rev 47877](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47877) - [Bug 6020](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6020) - Bugfix Lua pinfo.cols.protocol not holding value in postdissector.
    
      - [Rev 47921](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47921) - [Bug 8410](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8410) - Fix dissection of flowDurationMicroseconds in Netflow dissector
    
      - [Rev 47936](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47936) - Fix dissection of method name in case of RAck header
    
      - [Rev 47966](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47966) - Fix Coverity CID 280365: Logically dead code.
    
      - [Rev 48010](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48010), [Rev 48011](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48011) - [Bug 8380](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8380) - DTLS reassembly issues. Be careful of r48011, it's complicated and will definitely need some reworking to backport safely.
    
      - [Rev 48047](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48047) - The file-\>open dialog should display, "Read filter", not "Display filter".

  - [Rev 48062](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=48062) - [Bug 8432](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8432) - BE (3) AC is wrongly named as "Video" in (qos\_acs)

Not done:

  - Move over the following revisions:
      - [Rev 47575](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47575) - [Bug 8056](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8056) - Maximum value of Duration should be 32767. -- *Doesn't apply cleanly.*
    
      - [Rev 47642](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47642) - [Bug 8318](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8318) - Fix JSON decoding of UTF-16 surrogate pairs. -- *Doesn't apply cleanly.*
    
      - [Rev 47653](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47653) - [Bug 8330](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8330) - Another fix for TSPEC IEs (there was a field missing). -- *Doesn't apply cleanly.*
    
      - [Rev 47927](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47927) - [Bug 8378](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8378) - Fix decoding of GSM MAP SMS Diagnostics -- *Doesn't apply cleanly.*
    
      - [Rev 47965](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47965) - Fix Coverity CID 280362: Logically dead code. -- *Doesn't apply cleanly.*

## 1.6.13

Released January 29, 2013 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.6.13.html)

Done:

  - Move over the following revisions:
      - [Rev 45646](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45646) - [Bug 7871](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7871) - increment offset to point to the first byte after the options (the code used to set an absolute position, if that was 0, we were stuck in an endless loop).
    
      - [Rev 46315](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46315) - [Bug 8022](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8022) - Fix potential crash (and memory leak?) in code that frees the frame data structure on close.
    
      - [Rev 46386](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46386) - [Bug 8046](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8046) - Add names for Fibre Channel over Ethernet group MAC addresses.
    
      - [Rev 46415](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46415) - [Bug 8040](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8040) - Fix R3 inifinite loop.
    
      - [Rev 46420](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46420) - [Bug 8043](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8043) - Fix "MPLS very very large loop".
    
      - [Rev 46345](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46345) - [Bug 8038](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8038) - Prevent a counter overflow in while loops.
    
      - [Rev 46577](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46577), [Rev 46579](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46579) - [Bug 7945](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7945) - Fix DTN/Bundle fuzz failure.
    
      - [Rev 46705](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46705) - [Bug 8112](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8112) - Ensure bytes exist in tvb unicode string functions.
    
      - [Rev 46739](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46739) - [Bug 8111](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8111) - Set the dtls record length for reassembly before adding a fragment. Does not fix the underlying issue but does shut up the build-bot.
    
      - [Rev 46881](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46881) - Add detection of Windows 8 and Windows Server 2012.
    
      - [Rev 46882](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46882) - Welcome in 2013.
    
      - [Rev 47045](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47045) - [Bug 8199](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8199) - CMSSTATUS dissector hangs - guint16 needed to prevent rollover.
    
      - [Rev 47046](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47046) - [Bug 8198](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8198) - RTPS dissector crash - bugfix nested loop that wasn't breaking out of the main loop when subloop really wanted it to.
    
      - [Rev 47098](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47098) - [Bug 8213](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8213) - Heap corruption in DCP-ETSI by running past the end of a fragment array.
    
      - [Rev 47123](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47123), [Rev 47125](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47125) - [Bug 8222](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8222) - fix long loop in DCP-ETSI
    
      - [Rev 46334](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46334) - [Bug 8035](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8035) - Wrong packet bytes are selected for ISUP CUG binary code.
    
      - [Rev 46336](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46336) - [Bug 8036](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8036) - Check length of Slow Protocol OAM Vendor Specific Event Notification and add an expert info if it is not at least 2 bytes long.
    
      - [Rev 46510](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46510) - [Bug 8075](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8075) - Fix reassembly of jumbo SSL frames.
    
      - [Rev 46556](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46556) - [Bug 8098](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8098) - Incorrect dissection of SAC and RAC in 3GPP ULI AVP.
    
      - [Rev 46999](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46999) - [Bug 8111](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8111) - Sanity checks for fragment\_set\_tot\_len().
    
      - [Rev 47000](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47000) - [Bug 8111](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8111) - Revert the temporary workaround in the DTLS dissector.
    
      - [Rev 47114](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47114) - [Bug 8197](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8211) - Null the finfo pointer after we free it. Partially fixes the bug.
    
      - [Rev 47132](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47132) - [Bug 8227](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8227) - Electromagnetic Emission Parser parses field Event Id as Entity Id.
    
      - [Rev 47136](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47136) - [Bug 8212](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8212) - Avoid dissector assert in JXTA dissector.
    
      - [Rev 47144](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47144) - Describe terminal services detection correctly.
    
      - [Rev 47173](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47173) - snmp pdu's of more than 127 bytes have incorrect length reported.
    
      - [Rev 47223](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47223) - CID 280286 - Avoid infinite loop in LAPD dissector (drop last\_packet\_end\_offset at the same time).
    
      - [Rev 47248](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47248) - Prevent copying longer than expected NTLM SSP key.
    
      - [Rev 47277](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47277) - [Bug 8085](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8085) - Wrong bytes highlighted with "Find Packet...".
    
      - [Rev 47294](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47294) - CID 280529 & 280530 - Check the validity of TLVs before using their retrieved data.
    
      - [Rev 47298](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47298), [Rev 47300](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47300) - [Bug 7877](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7877) - Illegal character is used in temporary capture file name.
    
      - [Rev 47314](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47314) - [Bug 8177](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8177) - Bugfix crash caused by AirPDcap decryption.
    
      - [Rev 47328](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47328) - [Bug 2426](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2426) - Allow SNMP user table entry to be re-editted even if engineID/Username remains the same.
    
      - [Rev 47329](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=47329) - make dumpabi target build with multiple digits in library version numbers.

## 1.6.12

Released November 28, 2012 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.6.12.html)

Done:

  - Move over the following revisions:
      - [Rev 45340](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45340) - Vastly improve the debug presentation( of trees)+.
    
      - [Rev 45357](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45357) - [Bug 7804](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7804) Fix se\_tree\_lookup32\_array\_le()
    
      - [Rev 45459](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45459) - [Bug 7844](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7844) - Prevent infinite loop in ICMPv6 dissector
    
      - [Rev 45463](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45463), [Rev 45464](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45464) - [Bug 7848](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7848) - Make the ISUP CIC field decimal, so it doesn't need proto\_tree\_add\_item\_format() and shows up in "Add as filter..." in decimal
    
      - [Rev 45476](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45476),[Rev 45486](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45486) - Fix packet-ndps bugs & possible infinite loops
    
      - [Rev 45477](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45477) - Fix possible infinite loops
    
      - [Rev 45500](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45500) - packet-fmp\_notify: Fix (what appears to be) a minor "off by one" bug in 'for' loop
    
      - [Rev 45524](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45524), [Rev 45548](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45548) - [Bug 7858](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7858) - When rounding a 32-bit offset value up, take all 32 bits into account so it doesn't wrap around
    
      - [Rev 45545](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45545) - [Ask 14963](http://ask.wireshark.org/questions/14963) - Handle both Prism header DID value code sets, and clean up some other Prism-header stuff
    
      - [Rev 45609](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45609) - [Bug 1284](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1284) - Handle frames in Prism-header or AVS-header files that have neither an AVS nor a Prism header
    
      - [Rev 45621](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45621) - Only cap\_len (not pkt\_len) bytes of buffer are valid
    
      - [rev 46098](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46098) - [Bug 8006](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8006) - misspelling (typo) in display filter field name
    
      - [Rev 45310](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45310) - [Bug 7787](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7787) USB infinite loops
    
      - [Rev 45321](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45321) - [Bug 7797](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7797) Fix dissection of IEEE 802.11 Channel Switch Announcement element
    
      - [Rev 45331](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45331) - When comparing if the window is outside the viewable area's(x,y), take into account that the viewable area's (x,y) may not be (0,0). (This was a slight modification of [Rev 34265](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34265), which was made to attempt to resolve [Bug 553](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=553). It is unknown if this additional change finally resolves that bug or if another change such as a GTK+ upgrade finally resolved it, but bug 553 seems to be no longer reproducible.)
    
      - [Rev 45354](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45354), [Rev 45359](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45359), [Rev 45360](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45360), [Rev 45361](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45361) - [Bug 7803](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7803) Various fixes for RADIUS dictionary parsing
    
      - [Rev 45510](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45510) - [Bug 7855](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7855) Fix a STATUS\_ACCESS\_VIOLATION in ISAKMP dissector
    
      - [Rev 45559](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45559) - [Bug 7864](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7864) - Error in AUXILIARY SECURITY HEADER Parsing for 802.15.4 in dissect\_ieee802154\_common function. Offset should be +8 not +4
    
      - [Rev 45614](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45614) - [Bug 7869](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7869) WTP infinite loop
    
      - [Rev 45660](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45660) - Wireshark-generated [PostScript](/PostScript) files are DSC non-conforming so be sure to include "%\!" in the header comment.
    
      - [Rev 45717](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45717) - [Bug 7879](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7879) - Avoid infinite loop in RTCP dissector.
    
      - [Rev 45742](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45742) - [Bug 7909](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7909) - Fix USB descriptor parsing issue from r45310
    
      - [Rev 45820](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45820) - [Bug 7913](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7913) color filter cancel, delete the incomplete list entry
    
      - [Rev 45823](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45823) - [Bug 7790](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7790) - Add missing offset increment after displaying minimum count
    
      - [Rev 46003](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46003), [Rev 46004](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46004) - [Bug 6665](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6665) - Sanely handle corrupt tpncp.dat files.
    
      - [Rev 46153](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=46153) - [Bug 8011](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=8011) - Core dumped during sctp association analysis.

## 1.6.11

Released October 2, 2012 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.6.11.html)

Done:

  - Move over the following revisions:
      - [Rev 44691](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44691) - [Bug 7670](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7670) - Use correct filter name and value string for the dissection of Qos attribute "Reliability Class" in GMM/SM message
    
      - [Rev 44510](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44510) - [Bug 7624](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7624) - dissect\_per\_constrained\_integer\_64b fails for 64 bits
    
      - [Rev 44513](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44513), [Rev 44533](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44533) - fix field type for some 64 bits header fields
    
      - [Rev 44749](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44749) - [Bug 7666](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7666) - Check that DRDA command has a minimum length of 10 bytes to prevent a potential infinite loop
    
      - [Rev 44790](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44790) - [Bug 7691](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7691) - TKIP dissection : wrong IS\_TKIP macro
    
      - [Rev 44844](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44844), [Rev 44880](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44880) - [Bug 5979](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5979) - Allow Win64 to use more than 2 Gbytes of memory.
    
      - [Rev 44881](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44881) - [Bug 7718](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7718) - Fix dissection of NAS Uplink and Downlink Count in MM Context IE
    
      - [Rev 44940](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44940) - [Bug 7724](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7724) - callsinfo-\>stop\_fd not set in all branches for UNISTIM.
    
      - [Rev 45007](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45007) - Fix ICMP and ICMPv6 request/response tracking with checksum corner case.
    
      - [Rev 45111](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45111) - [Bug 7753](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7753) - Fix display of WRITE BUFFER and SEND DIAGNOSTIC fields in SCSI dissector
    
      - [Rev 45142](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45142) - Implement and document the Custom plugin system.
    
      - [Rev 45146](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45146), [Rev 45148](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45148) - [Bug 5016](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5016) - No markers show up when maps are displayed
    
      - [Rev 45150](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45150) - [Bug 5778](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5778) - Volume label field is not displayed correctly.
    
      - [Rev 45174](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45174) - [Bug 6230](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6230) - Truncated/partial JPEG files are not dissected
    
      - [Rev 45229](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=45229) - -B hasn't been Win32-only for a while, so update the Wireshark man page

## 1.6.10

Released August 15, 2012 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.6.10.html)

Done:

  - Move over the following revisions:
      - [Rev 43149](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43149) - [Bug 7562](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7562) - Fix EtherCAT Mailbox crash.
    
      - [Rev 44111](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44111), [Rev 44112](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44112), [Rev 44113](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44113), [Rev 44117](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44117) - [Bug 7498](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7498) - Crash in NFS dissector when "file\_name\_snooping" & "file\_full\_name\_snooping" preferences enabled.
    
      - [Rev 44247](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44247) - [Bug 7566](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7566) - Fix dcp-etsi divide-by-zero error.
    
      - [Rev 44289](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44289) - [Bug 7571](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7571) - Fix XTP crash.
    
      - [Rev 44307](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44307) - [Bug 7561](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7561) - Fix GSM RLC MAC crash.
    
      - [Rev 44312](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44312) - [bug 7570](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7570) - Check CIP MSP packets for number of services overruns.
    
      - [Rev 44317](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44317) - [Bug 7603](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7603) - Large loop in the AFP dissector.
    
      - [Rev 44320](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44320) - [Bug 7568](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7568) - Fix RTPS2 crash.
    
      - [Rev 44366](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44366) - [Bug 7569](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7569) - Fix STUN crash.
    
      - [Rev 44403](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44403) - [Bug 7573](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7573) - Large loop in the CTDB dissector.
    
      - [Rev 42564](http://anonsvn.wireshark.org/viewvc?view=revision&revision=42564) - [Bug 7542](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7542) - Dissector bug, protocol X2AP, in packet 17019451: proto.c:1347: failed assertion "length == 4
    
      - [Rev 43956](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43956) - [bug 7514](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7516) - Link ISDN SAPI 16 to X.25
    
      - [Rev 44008](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44008) - [Bug 7524](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7524) - 8-PSK structure in GSM Classmark 3 is not properly dissected.
    
      - [Rev 44103](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44103) - Fix Tshark Help Menu
    
      - [Rev 44476](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44491) - Fix memcpy in Bluetooth L2CAP.
    
      - [Rev 44491](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44491) - Fix subtle g\_strdup\_printf() memory leaks.
    
      - [Rev 44500](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=44500) - Update SCTP PPID table.

## 1.6.9

Released July 23, 2012 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.6.9.html)

Done:

  - Move over the following revisions:
      - [Rev 37890](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37890) - [Bug 6067](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6067) - Wrong length of items in wimax Compressed DL-MAP and UL-MAP
    
      - [Rev 42301](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42301), [Rev 43507](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43507) - crash in filter expression dialog when user clicked on a BASE\_CUSTOM field
    
      - [Rev 42623](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42623) - [Bug 6077](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6077) - Rearranging columns in preferences doesn't work
    
      - [Rev 43150](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43150) - prevent crash in 'proto\_registrar\_dump\_values'
    
      - [Rev 43184](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43184) - Values in a custom column aren't displayed as a value\_string (when appropriate).
    
      - [Rev 43186](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43186) - [Bug 6671](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6671) - BASE\_CUSTOM field is incorrectly formatted when applied as a column
    
      - [Rev 43501](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43501) - [Bug 7021](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7021) - Don't fill in an error message unless pcap\_open() actually fails
    
      - [Rev 42764](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42764) - [Bug 6640](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6640) - "Save As", if it saves all captured packets, leaves the welcome screen up
    
      - [Rev 42899](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42899) - [Bug 5735](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5735) - Unable to reassemble EAP-TLS fragments across multiple RADIUS packets
    
      - [Rev 43050](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43050) - radius dictionary.3gpp contains an invalid entry
    
      - [Rev 43139](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43139) - [Bug 7340](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7340) - Netscreen - can't parse packet-header when interface name contain hyphen
    
      - [Rev 43166](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43166) - Fix IPAddress seg fault in Diameter
    
      - [Rev 43172](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43172), [Rev 43173](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43173) - Don't use Windows [FormatMessage](/FormatMessage)() unsafely
    
      - [Rev 43174](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43174) - [Bug 5241](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5241) - Cannot run tshark under tcp using decode-as format for syslog
    
      - [Rev 43176](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43176) - [Bug 7333](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7333) - Unhandled exception ( group=1, code=4) occurs when trying to capture in pdml file
    
      - [Rev 43178](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43178),[Rev 43179](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43179) - Do not use BASE\_NONE for FT\_\*INT\* types.
    
      - [Rev 43187](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43187) - [Ask 11798](http://ask.wireshark.org/questions/11798) - Fix UDP-Lite checksum verification.
    
      - [Rev 43191](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43191) - Remove a duplicate entry from the AUTHORS list
    
      - [Rev 43203](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43203) - [Bug 6246](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6246) - Incorrect decoding of IA5String type in unaligned PER
    
      - [Rev 43212](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43212) - [Bug 6917](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6917) - Use ".", not ",", as the decimal point in floating-point values in filter expressions
    
      - [Rev 43214](http://anonsvn.wireshark.org/viewvc?view=revision&revision=43214) - [Bug 7360](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7360) - Service handover IE is not correctly dissected
    
      - [Rev 43224](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43224) - Note in README.developer that calls to "expert" functions should not be under 'if (tree)'
    
      - [Rev 43277](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43277) - Draw protocol tree in proper [GtkTreeView](/GtkTreeView).
    
      - [Rev 43556](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43556) - [Bug 7429](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7429) - Wireshark \> 1.4 does not correctly read Association ID for PS Poll packets
    
      - [Rev 43561](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43561) - [Bug 7427](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7427) - Link Wireshark with @GLIB\_LIBS@, as @GTK\_LIBS@ doesn't necessarily include all the GLib libraries needed by Wireshark
    
      - [Rev 43576](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43576) - [Bug 7436](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7436) - Make nfs dissection not depend on tree construction.
    
      - [Rev 43648](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43648) - [Bug 7438](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7438) - SNMP incorrectly marks SNMPv3 "discovery" packet as malformed
    
      - [Rev 43784](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43784) - [Debian Bug 680056](http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=680056) - Crash in PPP dissector
    
      - [Rev 43850](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43850) - Add some relevant ethertypes
    
      - [Rev 43883](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=43883) - [Bug 7508](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7508) - Dissect SNMPv3 context name as string

## 1.6.8

Released May 22, 2012 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.6.8.html)

Done:

  - Move over the following revisions:
      - [Rev 41995](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41995) - [Bug 7043](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7043) - Set the minimum length of the Internet Timestamp option to 4 bytes.
    
      - [Rev 42003](http://anonsvn.wireshark.org/viewvc?view=revision&revision=42003) - [Bug 7047](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7047) - use suboption length instead of option length to terminate option 82 suboption 9 dissection in BOOTP
    
      - [Rev 42106](http://anonsvn.wireshark.org/viewvc?view=revision&revision=42106) - [Bug 7127](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7127) - Remove an extra entry in nfsv4\_operation\_ett array
    
      - [Rev 42114](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42114), [Rev 42116](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42116) - [Bug 7122](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7122) - Fixes Bluetooth HCI event infinite loop
    
      - [Rev 42129](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42129) - [Bug 7119](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7119) - ANSI MAP infinite loop
    
      - [Rev 42200](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42200) - Fix packet-diameter bug which tries to allocate too much memory when an unknown vendor is encountered.
    
      - [Rev 42328](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42328) - Set up Wireshark to handle pcap-ng files on OS X
    
      - [Rev 42329](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42329) - Set up Wireshark to handle pcap-ng files with a .ntar suffix on Windows
    
      - [Rev 42330](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42330) - Include .ntar as a suffix for pcap-NG files and include .dmp as a suffix for pcap files
    
      - [Rev 41741](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41741) - [Bug 6983](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6983) - [Bug 7118](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7118) - 802.3 infinite loop
    
      - [Rev 41979](http://anonsvn.wireshark.org/viewvc?view=revision&revision=41979), [Rev 41984](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41984) - [Bug 7042](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7042) - Handle properly filler and do not remove last digit when decoding MSISDN
    
      - [Rev 42108](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42108) - [Bug 7130](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7130) - Use right names for items in a DNS CERT RR
    
      - [Rev 42112](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42112) - [Bug 7089](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7089) - MPLS dissector in 1.6.7 and 1.7.1 misdecodes some MPLS CW packets
    
      - [Rev 42113](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42113), [Rev 42115](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42115) - [Bug 7120](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7120) - Catch too-short TLVs
    
      - [Rev 42121](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42121) - [Bug 7124](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7124) - Fixes LTP infinite loop
    
      - [Rev 42122](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42122) - [Bug 7125](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7125) - R3 infinite loop
    
      - [Rev 42123](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42123) - [Bug 7134](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7134) - Unable to display the correct IEEE802.11 MCS data rates due to header definition
    
      - [Rev 42144](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42144) - Don't byte swap bytes past the end of the packet data in Cisco Secure IDS IP logs
    
      - [Rev 42258](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42258) - [Bug 7198](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7198) - Megaco parser problem with LF in header.
    
      - [Rev 42388](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42388) - [Bug 6779](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6779) - User-Password - PAP decoding passwords longer than 16 bytes
    
      - [Rev 42393](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42393),[Rev 42407](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42407),[Rev 42431](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42431) - [Bug 7221](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7221) - Fix emem allocation alignment on SPARC (and other such CPUs)
    
      - [Rev 42437](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42437) - [Bug 7226](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7226) - OPC UA bytestring node id decoding is wrong
    
      - [Rev 42631](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42631) - [Bug 6805](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6805) - 802.11 infinite loop
    
      - [Rev 42203](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42203) - [Bug 7121](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7121) - BACapp infinite loop
    
      - [Rev 42714](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42714) - Fix compilation with ancient zlib's (which lack Z\_BLOCK)
    
      - REVERT [Rev 40547](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40547) - [Ask 10396](http://ask.wireshark.org/questions/10396) - REVERT this revision so as to not increase the required glib version in the 1.6 branch.

Not Done

  - Move over the following revisions:
      - [Rev 42623](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=42623) - [Bug 6077](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6077) - Rearranging columns in preferences doesn't work -- *Deferring for 1.6.9. GTK+ bundle needs more testing.*

## 1.6.7

Released April 6, 2012 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.6.7.html)

Done:

  - Move over the following revisions:
      - [Rev 41876](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41876) - [Bug 6996](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6996) - At least 4 bytes is required to check PSC
    
      - [Rev 41914](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41914) - Add and update Windows registry keys.
    
      - [Rev 41937](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41937), [Rev 41938](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41938), [Rev 41941](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41941) - [Bug 6922](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6922) - Work around [WinPcap](/WinPcap) bug where it returns an error but leaves junk in the error message string
    
      - [Rev 41967](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41967) - Fix endpoint IP map (for non-IE browsers at least).

## 1.6.6

Released March 27, 2012 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.6.6.html)

Done:

  - Move over the following revisions:
      - [Rev 39260](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39260) - (BSSGP part) Use ENC\_NA as encoding for proto\_tree\_add\_item() calls which directly reference an hf item (in hf\[\] with types:
        
        FT\_NONE FT\_BYTES FT\_IPV6 FT\_IPXNET FT\_OID
    
      - [Rev 39640](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39640) - (BSSGP part) Fix proto\_tree\_add\_item( encoding args; Do whitespace cleanup (for a few files).
    
      - [Rev 40560](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40586) - (BSSGP part) Fix some duplicate display filter names.
    
      - [Rev 41037](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41037), [Rev 41097](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41097), [Rev 41098](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41098), [Rev 41100](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41100), [Rev 41130](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41130) - [Bug 6846](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6846) - Don't reject pcap-NG blocks with options longer than 100 bytes (the revs listed are in the 1.6.x branch, backported from changes in the trunk)
    
      - [Rev 41057](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41057) - [Bug 6833](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6833) - Handle too-large pointer values in MPEG-2 Transport Stream packets (in effect, a backport by hand of [Rev 41001](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41001) and [Rev 41002](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41002))
    
      - [Rev 41043](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41043) - Use the correct IE id
    
      - [Rev 41466](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41466) - Fix some Dead Store (Dead assignement/Dead increment) Warning found by Clang
    
      - [Rev 41143](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41143), [Rev 41145](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41145), [Rev 41152](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41152) - Check for pcap-NG blocks with a too-small block length
    
      - [Rev 41333](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41333) - Check for non-null-terminated names in NRB records, handle large NRB records (the rev listed is in the 1.6.x branch, backported from [Rev 41332](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41332) in the trunk)
    
      - [Rev 41348](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41348) - [Bug 5939](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5939) - Fix reading from pipe/stdin (rev 41348 is the relevant part of [Rev 37171](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37171), which has a whole bunch of feature additions that aren't needed in 1.6.x)
    
      - [Rev 37752](http://anonsvn.wireshark.org/viewvc?view=revision&revision=37752) - Protect the columns from being overwritten.
    
      - [Rev 39873](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39873) - [Ask 8649](http://ask.wireshark.org/questions/8649) - Thou shalt not use proto\_tree\_add\_string() with an FT\_BYTES field.
    
      - [Rev 40508](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40508) - [Bug 6735](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6735) - Properly set the per-packet encapsulation on a seek-and-read on a K12 text file
    
      - [Rev 40547](http://anonsvn.wireshark.org/viewvc?view=revision&revision=40547) - Use GSlice API instead of GMemChunk API for some memory allocation.
    
      - [Rev 40615](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40615) - [Bug 5237](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5237) - Convert forward slashes in URI to back slashes if WIN32.
    
      - [Rev 40616](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40616) - [Bug 6687](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6687) - Avoid a potential infinite loop by stopping dissection when a message has no tlvblock.
    
      - [Rev 40644](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40644) - [Bug 5687](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5687) - Some PGM options are not parsed correctly.
    
      - [Rev 40702](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40702) - [Bug 6761](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6761) - max\_ul\_ext isn't printed/decoded to the packet details log in GTP protocol packet.(Wrong length check)
    
      - [Rev 40727](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40727) - [Bug 6766](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6766) - Fix incorrect usage of g\_ascii\_strdown() (don't port over the epan/wslua/wslua\_proto.c changes, they don't apply to 1.6)
    
      - [Rev 40730](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40730) - Fix memory leaks involving tvb\_get\_stringz() by replacing it with tvb\_get\_ephemeral\_stringz().
    
      - [Rev 40769](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40769) - Disable the Save-As button in the toolbar if we cannot save the file.
    
      - [Rev 40873](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40873) - [Bug 6734](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6734) - GOOSE Messages don't use the length field to perform the dissection.
    
      - [Rev 40911](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40911) - [wireshark-user 14477](http://article.gmane.org/gmane.network.wireshark.user/14477) - Update the documentation to match the sort order.
    
      - [Rev 40927](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40927) - Disable the File-\>Merge... menu item if we cannot save the file.
    
      - [Rev 40937](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40937) - [Bug 6813](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6813) - no menu item Fle-\>Export-\>SSL Session Keys in GTK
    
      - [Rev 40944](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40944) - [Bug 6815](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6815) - Don't get strings with tvb\_get\_ptr() in IAX2.
    
      - [Rev 37856](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37856),[Rev 40949](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40949),[Rev 40950](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40950) - [wireshark-devel 24846](http://article.gmane.org/gmane.network.wireshark.devel/24846) - Correctly display the TCP flags and allow tcp.flags filtering to work properly without potentially causing a crash.
    
      - [Rev 40952](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40952) - [Bug 6817](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6817) - Eliminate infinite recursion in SSL and DTLS dissectors if old-style keys\_list preference is used.
    
      - [Rev 40962](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40962) - [Bug 6823](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6823) - Pass pinfo as an argument rather than as a global variable
    
      - [Rev 40967](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40967) - [Bug 6809](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6809) - Fix possible infinite loop in 802.11 dissector
    
      - [Rev 41008](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41008) - [Bug 6804](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6804) - Fix underflow/crash when loading corrupt WTAP\_ENCAP\_ERF PCAP file.
    
      - [Rev 41025](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41025) - [Bug 6765](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6765) - When handing off from HTTP to a dissector for the entity body, if we have a media type, use it to determine the subdissector before trying other means
    
      - [Rev 41030](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41030) - ERF TYPE\_PAD records don't necessarily have payload, so don't treat one that doesn't as an error
    
      - [Rev 41036](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41036) - [Bug 6847](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6847) - Fix DTLS decryption
    
      - [Rev 41040](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41040) - Add Wireshark\_package.pmdoc to the source distribution; NOTE: there's an "svn mv" in here which probably needs to be manually applied.
    
      - [Rev 41041](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41041) - Report WTAP\_ERR\_UNSUPPORTED better, report pcap-NG files with multiple SHBs as WTAP\_ERR\_UNSUPPORTED and don't crash on them in Wireshark
    
      - [Rev 41045](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41045) - [Bug 6703](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6703) - Show netflow and ZEP timestamps' fractions
    
      - [Rev 41237](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41237) - [Bug 6077](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6077) - Fix drag-n-drop of column preferences by updating GTK version. NOTE: a new Win32 libs tag is probably needed too.
    
      - [Rev 41272](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41272) - [Bug 6891](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6891) - Don't abort if Expression dialog user selects a predefined value which happens to be BASE\_DEC\_HEX or BASE\_HEX\_DEC.
    
      - [Rev 41372](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41372) - [Bug 5356](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5356) - Do capture filter checking in a separate thread
    
      - [Rev 41388](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41388) - [Bug 6826](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6826) - USB: unknown GET DESCRIPTOR response triggers assert failure
    
      - [Rev41395](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41395) - [Bug 2873](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2873) - ISO SSAP: [ActivityStart](/ActivityStart): Invalid decoding the activity parameter as a BER Integer
    
      - [Rev 41403](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41403) - [Bug 6836](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6836) - IEEE1588 PTPv2 over IPv6 -\> Padding issue.
    
      - [Rev 41536](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=#41536) - [Bug 6947](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6947) - Don't require a space at the end of the gtp.msisdn filter string
    
      - [Rev 41554](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41554) - [Bug 6951](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6951) - Multiprotocol Label Switching Echo - Return Code: Reserved (5)
    
      - [Rev 41633](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41633) - [Ask 9461](http://ask.wireshark.org/questions/9461) - If the radiotap data rate is computed from the MCS field, mark it as generated and have it cover the entire field
    
      - [Rev 41675](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41675) - [Bug 6664](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6664) - Fix Diameter crash caused by corrupted dictionary
    
      - [Rev 41680](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41680) - [Bug 6526](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6526) - Properly detect the absence of an access\_bpf group on OS X 10.5
    
      - [Rev 41718](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41718) - [Bug 6972](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6972) - ISAKMP : VendorID [CheckPoint](/CheckPoint) : Malformed Packet (Wrong minimum Length)
    
      - [Rev 41734](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41734) - [Bug 6232](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6232) - No error for UDP/IPv6 packet with zero checksum
    
      - [Rev 41787](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41787) - [Bug 6982](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6982) - Don't allow users to register HTTP custom header fields with invalid-for-an-hf-abbreviation characters (to avoid asserting out)

Not Done

  - Move over the following revisions:
      - [Rev 40384](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40384) - [Bug 6708](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6708) - Wrong tvb\_get\_bits function call in packet-csn1.c. -- *Already backported*
    
      - [Rev 40627](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40627)[Rev 40634](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40634)[Rev 40635](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40635) - [Bug 6375](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6375) - GPRS RLCMAC dissector not handling valid PDU -- *Changes don't apply cleanly*
    
      - [Rev 41344](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41344) - Fix bugs in buffer overflow checking used with calls to g\_snprintf() -- *Does not exist in 1.6*
    
      - [Rev 41791](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=41791) - Don't allow users to register IMF custom header fields with invalid-for-an-hf-abbreviation characters (to avoid asserting out) (as in [Bug 6982](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6982)) -- *Does not exist in 1.6*

## 1.6.5

Released January 11, 2012 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.6.5.html)

Done:

  - Move over the following revisions:
      - [Rev 39990](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39990),[Rev 39991](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39991) - [Bug 6325](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6325) - Wireshark netflow dissector complains there is no template found though the template is exported.
    
      - [Rev 40012](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40012) - [Bug 6549](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6549) - Wireshark crashes if no recent files.
    
      - [Rev 39878](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39878), [Rev 39882](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39882), [Rev 39883](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39883), [Rev 39884](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39884), [Rev 39885](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39885), [Rev 39894](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39894), [Rev 39895](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39895) - [Bug 6578](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6578) - Prevent some crashes with times that can't be handled by localtime()/gmtime()/ctime()/etc.
    
      - [Rev 39886](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39886) - [Bug 6578](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6578) - Fix time stamp handling for Network Monitor 2.x-format files
    
      - [Rev 39930](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39930) - Don't try to write packets with unsupported encapsulations to pcap-NG files
    
      - [Rev 39944](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39944) - Don't try to write packets with unsupported encapsulations to Tektronix K12 text output files
    
      - [Rev 39959](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39959) - [Bug 3046](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3046) - "Closing File\!" Dialog Hangs
    
      - [Rev 39961](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39961),[Rev 39963](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39963),[Rev 39986](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39986) - [Bug 6561](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6561) - IPv4 UDP/TCP Checksum incorrect if routing header present.
    
      - [Rev 40002](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40002) - [Bug 6368](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6368) - DCERPC EPM tower UUID must be interpreted always as little endian
    
      - [Rev 40024](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40024) - Prevent a crash when dissecting linked TI.
    
      - [Rev 40075](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40075) - [Bug 6643](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6643) - Don't dissect an "April 1 RFC" TCP option; the option is officially unassigned and some people use it for their own experimental purposes
    
      - [Rev 40076](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40076) - [Bug 6560](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6560) - IPv6 UDP/TCP Checksum incorrect if routing header present with 0 segments left
    
      - [Rev 40130](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40130) - fix for [Rev 38723](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38723), some BGP AS\_PATH packets were no longer dissected
    
      - [Rev 40133](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40133) - [Bug 6649](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6649) - [ZigBee](/ZigBee) ZCL Dissector reports invalid status
    
      - [Rev 40138](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40138) - Don't use pcap\_version\[\]; on most platforms it doesn't give the version with which the program was compiled, and it can cause other problems
    
      - [Rev 40153](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40153),[Rev 40154](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40154),[Rev 40155](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40155) - [Bug 6250](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6250) - If the http object to be exported has no filename, use a generic "object" name instead. This avoids a Wireshark crash while still allowing the user to export the object.
    
      - [Rev 40158](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40158) - Allow for true error reporting on Windows setup.
    
      - [Rev 40159](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40159) - [Bug 6660](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6660) - ICMPv6 DNSSL option may contain padding.
    
      - [Rev 40162](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40162),[Rev 40184](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40184) - [Bug 3809](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3809) - Add missing \</field\> for data tree.
    
      - [Rev 40164](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40164) - [Bug 6663](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6663) - Clamp packet reported length at G\_MAXINT to avoid crashes
    
      - [Rev 40165](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40165) - [Bug 6666](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=%206666) - Check for too-large packets in 5View files
    
      - [Rev 40166](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40166) - [Bug 6667](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=%206667) - Check for too-large packets in i4b files
    
      - [Rev 40167](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40167) - [Bug 6668](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=%206668) - Check for too-large packets, and some other problems, in iptrace files
    
      - [Rev 40168](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40168), [Rev 40174](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40174) - [Bug 6669](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=%206669) - Limit the maximum frame table size in Network Monitor files
    
      - [Rev 40169](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40169) - [Bug 6670](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=%206670) - Check for bad record sizes in LANalyzer files
    
      - [Rev 40170](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40170) - Check for too-large packets in \*Peek-ng, nettl, and Apple Bluetooth [PacketLogger](/PacketLogger) files
    
      - [Rev 40172](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40172) - [wireshark-users/201112/msg00063](http://www.wireshark.org/lists/wireshark-users/201112/msg00063.html) - Add -H and -W options to tshark -h output.
    
      - [Rev 40194](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40194) - [Bug 6634](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6634) - Report a dissector bug, rather than crashing, for NULL arguments to some routines
    
      - [Rev 40195](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40195), [Rev 40196](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40196) - [Bug 6634](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6634) - Don't bother looking at the destination link-layer address, correctly handle the source link-layer address
    
      - [Rev 40200](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40200) - [Bug 6032](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6032) - Reload RSA ssl keys after changing the RSA keys table
    
      - [Rev 40245](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40245) - [Bug 5727](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5727) - Restrict TFTP conversation once the second port is known.
    
      - [Rev 40266](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40266),[Rev 40275](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40275) - [Bug 6391](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6391) - Avoid a potential buffer overflow
    
      - [Rev 40274](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40274) - Fix mapping of Wiretap encapsulations to per-file-type encapsulations
    
      - [Rev 40280](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40280),[Rev 40281](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40281) - [Bug 6562](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6562) - Incorrect Parsing of SCPS Capabilities Option introduced in response to [Bug 6194](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6194) with [Rev 38326](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38326)
    
      - [Rev 40304](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40304) - [Bug 5580](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5580) - Only update the time elapsed between the previous displayed packet and this packet if the packet is actually displayed.
    
      - [Rev 40316](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40316), [Rev 40317](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40317) - Force DEP+ASLR in our DLLs.
    
      - [Rev 40353](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40353) - Happy new year
    
      - [Rev 40365](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40365) - Avoid a possible double-free in the SSL and DTLS UATs.
    
      - [Rev 40384](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40384) - [Bug 6708](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6708) - Wrong tvb\_get\_bits function call in packet-csn1.c.
    
      - [Rev 40387](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40387) - [Bug 6711](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6711) - Length field of pseudo header while computing UDP checksum is not correct
    
      - [Rev 40163](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40163)[Rev 40171](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40171)[Rev 40182](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40182)[Rev 40186](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40186)[Rev 40187](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40187)[Rev 40189](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40189)[Rev 40190](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40190)[Rev 40197](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40197)[Rev 40198](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40198)[Rev 40199](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40199)[Rev 40203](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40203)[Rev 40205](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40205)[Rev 40206](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40206)[Rev 40211](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40211)[Rev 40221](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40221)[Rev 40222](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40222)[Rev 40231](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40231)[Rev 40277](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40277)[Rev 40311](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40311) - Fix dissector memory leaks; Fix incorrect Byte view bytes selection when Details pane field is selected.
    
      - [Rev 40312](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40312) - Fix memory leaks involving tvb\_get\_string\[z\]().
    
      - [Rev 40423](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40423) - [Bug 6719](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6719) - pcapio.c: bug in libpcap\_write\_interface\_description\_block

## 1.6.4

Released November 18, 2011 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.6.4.html)

Done:

  - Move over the following revisions:
      - [Rev 38045](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38045), [Rev 38046](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38046) - [Bug 6540](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6540) - Don't use g\_mutex without having threads.
    
      - [Rev 39779](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39779) - [Bug 6555](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6555) - CAPWAP dissector tries to allocate -1 bytes of memory during reassembly.
    
      - [Rev 39719](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39719) - [Bug 6537](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6537) - Revert [Rev 39665](http://anonsvn.wireshark.org/viewvc?view=revision&revision=39665) from [Bug 6472](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6472).
    
      - [Rev 39744](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39744) - [Bug 5575](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5575) - Fix memory errors in Lua dissectors.
    
      - [Rev 39748](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39748) & [Rev 39749](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39749) - No return within a TRY/CATCH/ENDTRY.
    
      - [Rev 39777](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39777) - Reset protocol preferences to default before loading a new profile
    
      - [Rev 39754](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39754) - [Bug 6548](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6548) - 80211 QoS Control: Add Raw TID
    
      - [Rev 39831](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39831) - [Bug 6564](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6564) - Add more length checks for integer values in SNMP variable bindings
    
      - [Rev 39834](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39834) - [Bug 6570](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6570) - The Originator protocol identifier is not present in the "provisioning actions operation -61".
    
      - [Rev 39902](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39902) - [Bug 6503](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6503) - Wireshark crashes if a field of type BASE\_CUSTOM is applied as a column

## 1.6.3

Released November 1, 2011 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.6.3.html)

Done:

  - Move over the following revisions:
      - [Rev 38033](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38033) - [Bug 3810](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3810) - Use threads to fill in the recent files list.
    
      - [Rev 38301](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38301) - [Ask 6756](http://ask.wireshark.org/questions/6756) - Export tvb\_get\_bits
    
      - [Rev 38933](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38933) - [Ask 5376](http://ask.wireshark.org/questions/5376) - Don't try (and fail) to get SVN version from (release) source tarballs
    
      - [Rev 38948](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38948) - [Ask 6207](http://ask.wireshark.org/questions/6207) - Fix locale problem with "Rel Start" time
    
      - [Rev 38949](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38949), [Rev 38950](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38950), [Rev 38953](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38953), [Rev 38956](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38956) - [Bug 6322](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6322) - RTP Stream Analysis does not work for TURN-encapsulated RTP
    
      - [Rev 38951](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38951) - [Bug 6328](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6328) - Fix bug in CSN\_CHOICE implementation preventing subtree processing.
    
      - [Rev 38967](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38967) - [Bug 4109](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4109) - Timestamp Sequence Field in Bundle Protocol fails if over 32 bits.
    
      - [Rev 38977](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38977) - [Bug 6336](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6336) - BACnet property time-synchronization-interval (204) name shown incorrectly as time-synchronization-recipients
    
      - [Rev 38990](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38990) - Fix processing of the FCS when dissecting Ethernet packets
    
      - [Rev 39017](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39017) - [Bug 6347](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6347) - Incorrect decoding of BIT STRING type.
    
      - [Rev 39024](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39024) - [Bug 6345](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6345) - GUI crash on invalid IEEE 802.11 GAS frame
    
      - [Rev 39029](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39029) - [Bug 6350](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6350) - Add dissection of router address flag(R) to ICMPv6 router advertisement prefix information option per [RFC 6275](http://tools.ietf.org/html/rfc6275#section-7.2)
    
      - [Rev 39031](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39031) - [Bug 3778](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3778) - Wrong PCEP XRO sub-object decoding
    
      - [Rev 39049](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39049) - Close fp before checking if private\_key is NULL to avoid memory leak. (Coverity 597)
    
      - [Rev 39061](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39061), [Rev 39062](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39062), [Rev 39080](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39080) - [Bug 6362](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6362) - Increase maximum number of identically named objects to be exported from 10 to 1000 and turn off error dialog boxes.
    
      - [Rev 39100](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39100), [Rev 39101](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39101), [Rev 39103](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39103), [Rev 39104](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39104), [Rev 39105](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39105), [Rev 39106](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39106), [Rev 39134](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39134), [Rev 39136](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39136) - [Bug 5645](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5645), [Bug 5680](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5680), [Bug 6305](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6305), [Bug 6366](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6366) - Restore VLAN dissection back into its own dissector instead of being combined with the Ethernet dissector. This reverts the effects of [Rev 34838](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34838), which was made to resolve [Bug 2254](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2254), which has now been reopened because of this reversion.
    
      - [Rev 39140](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39140) - [Bug 6351](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6351) - Fix Bug \#6351 (Buildbot fuzztest crash);
    
      - [Rev 39158](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39158), [Rev 39162](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39162) - Don't try to remove the Ethernet/802.11 FCS yourself in the Profinet Real-Time dissector, so that you don't fail if the Ethernet or 802.11 dissector has already done so.
    
      - [Rev 39188](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39188) - [Bug 6396](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6396) - Added cursor type decoding to MySQL dissector
    
      - [Rev 39213](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39213) - Always update splash screen when action has changed.
    
      - [Rev 39214](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39214) - Added register action for loading Lua plugins.
    
      - [Rev 39221](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39221) - [Bug 5431](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5431) - Removed the protocol registration updates in the splash screen for Python dissectors.
    
      - [Rev 39234](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39234) - [Bug 6414](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6414) - Incorrect identification of UDP-encapsulated NAT-keepalive packets.
    
      - [Rev 39248](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39248) & [Rev 39251](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39251) & [Rev 39258](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39258) & [Rev 39267](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39267) & [Rev 39268](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39268) - [Bug 6241](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6241) - Fixed reallocation of UAT for custom headers.
    
      - [Rev 39266](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39266) - [Bug 1710](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1710) - Assertion failed when doing File-\>Quit-\>Save during live
    
      - [Rev 39277](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39277) - Fix tshark -z conv,ipv6\[,filter\].
    
      - [Rev 39297](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39297) - [Bug 6435](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6435) - Typo FT\_IPv4 isf FT\_IPv6.
    
      - [Rev 39304](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39304) - [Ask 6756](http://ask.wireshark.org/questions/6756) - Export str\_to\_str()
    
      - [Rev 39311](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39311) - [Bug 6420](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6420) - WPA IE pairwise cipher suite dissector uses incorrect value\_string list
    
      - [Rev 39388](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39388) - [Bug 6452](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6452) - Fix bug introduced in revision 35984
    
      - [Rev 39390](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39390) - [Bug 6452](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6452) - Fix handling of ajp13 response headers
    
      - [Rev 39392](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39392) - [Bug 6453](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6453) - Two minor bugs in Wiretap library: The Network Instruments Observer file format abbreviation is incorrect ("niobserverv") and the packet header magic number is incorrectly byte swapped a second time when reporting an invalid value
    
      - [Rev 39416](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39416) - [Bug 6452](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6452) - Fix ajp13 string length bugs
    
      - [Rev 39445](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39445) - [Bug 5987](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5987),[Bug 6457](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6457) - Be sure to close and clean up any currently open file before opening a new file.
    
      - [Rev 39485](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39485) - [Bug 6471](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6471) - Don't assume system or interface scope IDs are 4 bytes long
    
      - [Rev 39494](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39494) - [Bug 6469](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6469) - GSM SMS fill bits corrected
    
      - [Rev 39500](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39500) - [Bug 6476](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6476) - Null pointer dereference in Infiniband
    
      - [Rev 39502](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39502) - [Bug 5221](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5221) - Allow dissection of ISUP Called Party parameters with 0 digits.
    
      - [Rev 39506](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39506) - [Bug 6449](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6449) - Last RTPS2 submessage allowed to have zero octets\_to\_next\_header.
    
      - [Rev 39508](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39508) - [Bug 6479](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6479) - Buffer overflow in ERF
    
      - [Rev 39529](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39529) - Improve documentation of text2pcap -l flag - fix terminology, point to <http://www.tcpdump.org/linktypes.html>
    
      - [Rev 39558](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39558) - Fixed using signed 64-bits integer in custom column.
    
      - [Rev 39562](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39562) & [Rev 39563](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39563) - Added some Lua error messages (instead of terminating)
    
      - [Rev 39569](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39569) - Display BASE\_DEC\_HEX correct for uint64.
    
      - [Rev 39665](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39665) - [Bug 6472](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6472) - Only have one Filter Expression window.
    
      - [Rev 39666](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39666) - [Bug 6295](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6295) - Support full 64-bit SNMP values.
    
      - [Rev 39670](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39670) - Pass file to wireshark in wireshark.desktop.
    
      - [Rev 39673](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39673) - Increase the size of a unknown INTEGER.
    
      - [Rev 39681](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=39681) - Don't ep\_strdup the protocol name when register a Lua dissector.

## 1.6.2

Released September 8, 2011 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.6.2.html)

Done:

  - Move over the following revisions:
      - [Rev 38308](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38308) - [Bug 6144](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6144) - gtk/capture\_dlg.c \[misplaced comma: old gtk only\]
    
      - [Rev 38834](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38834) & [Rev 38836](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38836) - [Bug 6296](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6296) - Spelling fixes.
    <!-- end list -->
      - [Rev 37634](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37634) - [Bug 6010](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6010) - Prevent editcap from making corrupt PCAP files from JPEGs when the encapsulation is forced
    
      - [Rev 38105](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38105) - [Bug 5769](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5769) - Be sure to add all multi-byte fields to protocol tree in big endian format.
    
      - [Rev 38129](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38129),[Rev 38171](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38171) - [Bug 6114](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6114) - ICMP timestamps could be in big or little endian formats. Apply heuristics to determine which format they are.
    
      - [Rev 38164](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38164) - [Bug 6151](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6151) - pDescr should not step on until proto\_tree\_add\_text() has been called.
    
      - [Rev 38169](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38169) - [msg00401](http://www.wireshark.org/lists/wireshark-dev/201107/msg00401.html) - Export tvb\_find\_tvb.
    
      - [Rev 38205](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38205) - [Bug 6166](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6166) - CSN\_RECURSIVE\_TARRAY should count the last '0' bit.
    
      - [Rev 38213](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38213) - [Bug 6138](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6138) - The [OpenSafety](/OpenSafety) dissector could loop excessively and cause Wireshark to crash.
    
      - [Rev 38214](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38214) - Don't free memory prematurely.
    
      - [Rev 38226](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38226) - Use tvb\_length when adding MSISDN.
    
      - [Rev 38227](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38227) - [Bug 6168](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6168) - Wireshark cannot display Reachable time & Retrans timer in IPv6 RA messages
    
      - [Rev 38247](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38247) - Avoid a possible infinite loop in dissect\_delete().
    
      - [Rev 38268](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38268)[Rev 38269](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38269) - [Bug 6183](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6183) - CCRSI is not included in 3GPP 29.274 R8.
    
      - [Rev 38286](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38286) - Use pinfo-\>iphdrlen rather than a fixed vaue of 20 to make the calculation correct for IPv6 too.
    
      - [Rev 38299](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38299) - Another fix for building with MSVC2005.
    
      - [Rev 38303](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38303),[Rev 38304](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38304) - [Bug 5731](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5731) - Unable to configure zero length SNMP Engine ID
    
      - [Rev 38326](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38326), [Rev 38331](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38331) - [Bug 6194](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6194) - Fixes for SCPS TCP option.
    
      - [Rev 38340](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38340) - Don't report svn version if not building from svn.
    
      - [Rev 38397](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38397) - g\_ascii\_strdown Returns a newly-allocated string.
    
      - [Rev 38399](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38399) - [Bug 5848](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5848) - H.323 RAS packets missing from packet counts in "Telephony-\>VoIP Calls" and the "Flow Graph" for the call.
    
      - [Rev 38410](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38410) - [Bug 6135](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6135) - If we can't create the root tvb handle the failure gracefully.
    
      - [Rev 38414](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38414) - [Bug 6136](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6136) - Load our default Lua scripts from an explicit path.
    
      - [Rev 38419](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38419) - [Bug 6219](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6219) - Offset calculated incorrectly for sFlow extended data.
    
      - [Rev 38430](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38430) - [Bug 6139](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6139) - Fix crash in CSN1 dissector
    
      - [Rev 38434](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38434) - [Bug 5607](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5607) - Allow users to add extra LDFLAGS on the configure line (broken since 1.4).
    
      - [Rev 38437](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38437)+[Rev 38438](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38438) - [Bug 5608](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5608) - Fix builds on OS's that don't have getopt.h
    
      - [Rev 38444](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38444) & [Rev 38445](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38445) - [Bug 6228](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6228) - Apply filter if pressing enter when having a auto completion window and nothing is selected.
    
      - [Rev 38487](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38487) - Protect the DCERPC RTS info column
    
      - [Rev 38491](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38491) - [Bug 6229](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6229) - Fix parsing of PCAPNG files with comments.
    
      - [Rev 38542](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38542) - [Bug 6237](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6237) - Misdecoding 3G Neighbour Cell Information Element in SI2quater message due to a coding typo
    
      - [Rev 38551](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38551) - Add missing items to the PDB archive.
    
      - [Rev 38561](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38561) & [Rev 38565](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38565) - [Bug 6244](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6244) - mis-spelled word "unknown" in assorted files
    
      - [Rev 38562](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38562) & [Rev 38563](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38563) - [Bug 6245](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6245) - Avoid crash in write\_preamble()
    
      - [Rev 38583](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38583) - Fix SetProcessDEPPolicyHandler typedef.
    
      - [Rev 38601](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38601) - [Bug 6122](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6122) - Malformed Packet in decode for BGP-AD update
    
      - [Rev 38680](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38680) - [Bug 6257](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6257) - btl2cap extended window shows wrong bit.
    
      - [Rev 38728](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38728) - [Bug 6262](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6262) - packet-ndmp.c dissector incorrectly represents "ndmp.bytes\_left\_to\_read" as signed.
    
      - [Rev 38737](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38737) - Do case insensitive search for lua scripts to load.
    
      - [Rev 38790](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38790) - [Bug 6289](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6289) - Write out a default snaplen in pcap-ng files if the snaplen is unknown
    
      - [Rev 38792](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38792) - [Bug 6265](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6265) - Write out extension headers when writing out LINKTYPE\_ERF packets.
    
      - [Rev 38807](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38807) - [Bug 6287](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6287) - Fix the wrong display of CSN\_BIT under CSN\_UNION.
    
      - [Rev 38823](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38823) - [Bug 6279](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6279) - COPY as CSV to clipboard from RTP stream analysis only copies 1st line many times.
    
      - [Rev 38833](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38833) - Fix some problems in the code to handle [CommView](/CommView) files.
    
      - [Rev 38840](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38840) & [Rev 38844](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38844) - Clean up guchar vs. guint8 in Wiretap, and fix some cases where we weren't properly filling in the pseudo-header for pcap and pcap-ng files.
    
      - [Rev 38862](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38862) - Support negative values when viewing seconds with hours and minutes.
    
      - [Rev 38865](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38865) - [Bug 6276](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6276) - RTPS2: MAX\_BITMAP\_SIZE is defined incorrectly.
    
      - [Rev 38878](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38878) - [Bug 6264](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6264) - Wireshark improperly parsing 802.11 Beacon Country Information tag
    
      - [Rev 38723](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38723) - [Bug 6188](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6188) - BGP : AS\_PATH attribute was decode wrong
    
      - [Rev 38910](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38910) - [Bug 6311](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6311) - MEGACO context tracking fix - context id reuse.
    
      - [Rev 38919](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38919) - [Bug 6178](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6178) - Fix problem with the decoding of the exception schedule
    
      - [Rev 38921](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38921) - [Bug 6280](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6280) - tshark/dumpcap skips capture duration flag occasionally.

## 1.6.1

Released July 18, 2011 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.6.1.html)

Done:

  - Move over the following revisions:
      - [Rev 37238](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37238) - Refer to "Capture Help" as "Capture Help below" when there are no interfaces to capture on
    
      - [Rev 37409](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37409) - Add FindGMODULE2.cmake and FindGTHREAD2.cmake to the dist.
    
      - [Rev 37587](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37587) - Update the TShark man page to document support of LOAD().
    
      - [Rev 37589](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37589) - Add files to distribution.
    
      - [Rev 37593](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37593) - Add more missing files.
    
      - [Rev 37618](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37618) - [Bug 6008](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6008) - Clear list of interfaces before adding new interfaces.
    
      - [Rev 37625](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37625) - Infinite loop in Ascend/Lucent parser.
    
      - [Rev 37631](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37631) - Make the RELOAD ACK heuristic more strict.
    
      - [Rev 37635](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37635) & [Rev 37640](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37640) - [Bug 6012](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6012) - Fix large file support on Solaris.
    
      - [Rev 37663](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37663) - [Bug 6009](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6009) - Information transfer rate is a 7 bit value.
    
      - [Rev 37665](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37665) - Fix some error in ICMPv6 dissector...
    
      - [Rev 37668](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37668) - [Bug 6022](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6022) - 802.11 Disassociation Packet's "Reason Code" field is imprecisely decoded/described
    
      - [Rev 37681](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37681) - Really print the rpcap username when logging. (Applying this patch will need manual processing).
    
      - [Rev 37705](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37705) - [Bug 6035](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6035) - Avoid a crash in custom columns for expert items.
    
      - [Rev 37720](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37720) - Correct creating a display filter from a custom column.
    
      - [Rev 37689](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37689) & [Rev 37691](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37691) & [Rev 37694](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37694) & [Rev 37728](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37728) & [Rev 37730](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37730) - Add back support for building with MSVC2005 (and older)
    
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
    
      - [Rev 37830](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37830) - [Bug 5356](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5356) - Add a preference to turn of capture filter syntax check
    
      - [Rev 37845](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37845) - Export tvb\_get\_unicode\_string()
    
      - [Rev 37853](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37853) - [Bug 4716](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4716) - Avoid false TCP zero window probe condition.
    
      - [Rev 37854](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37854) - [Bug 6059](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6059) - Don't abort processing of zero window probes and display keepalive payload.
    
      - [Rev 37867](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37867) - [Bug 6080](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6080) - Wireshark crashes after repeating "File -\> Import -\> Cancel"
    
      - [Rev 37869](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37869) & [Rev 37870](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37870) & [Rev 37871](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37871) - Fix incorrect usage of gtk\_radio\_button\_new...()/gtk\_radio\_button\_get\_group()
    
      - [Rev 37872](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37872), [Rev 37876](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37876) & [Rev 37878](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37878) & [Rev 37879](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37879) & [Rev 37883](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37883) - [Bug 6084](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6084) - Quick hack to translate EBCDIC strings to ASCII in the MQ dissector, so they display correctly
    
      - [Rev 37880](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37880)[Rev 37885](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37885) - [Rev 38732](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38732) - [Bug 4885](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4885) (GTP Dissector not parse extension header for T-PDU(Message Type 0xFF)) - PDCP PDU number extension header support.
    
      - [Rev 37893](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37893) - [Bug 5966](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5966) - VoIP call flow graph displays BICC APM as a BICC ANM
    
      - [Rev 37895](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37895) - Fetch svn revision also when checked out with git-svn
    
      - [Rev 37918](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37918) - [Bug 6097](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6097) - Abis interface not correctly handled in gsmtap dissector
    
      - [Rev 37919](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37919) - [Bug 6098](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6098) - Wrong decoding of RLC/MAC EGPRS Packet Downlink Ack/Nack
    
      - [Rev 37923](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37923) - Fix memory leak, using ep\_alloc() instead of g\_malloc().
    
      - [Rev 37924](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37924) - [Bug 6002](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6002) - Don't set state to STATE\_EXPECT\_DATA if there's no data to read
    
      - [Rev 37926](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37926) - [Bug 6101](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6101) - CSN Ack/Nack Description wrongly handled in gsm\_rlcmac\_dl dissector (3GPP TS 44.060)
    
      - [Rev 37927](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37927) - [Bug 6093](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6093) - 802.11 Association Response Packet's "Status Code" field is imprecisely decoded/described
    
      - [Rev 37930](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37930) - [Bug 6044](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6044) - Avoid infinite loop in ansi\_map dissector by incrementing offset by the correct number of bytes.
    
      - [Rev 37945](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37945) - Subdissectors must be called regardless of whether "tree" is NULL or not.
    
      - [Rev 37953](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37953) - Fix reading of LANalyzer files
    
      - [Rev 37955](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37955) - Tighten MSRP header format check.
    
      - [Rev 37957](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37957) - Have GIOP heuristics take into account message size endianness.
    
      - [Rev 38023](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38023) - [Bug 6120](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6120) - Wireshark crash during RTP stream analysis
    
      - [Rev 38064](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38064) - [Bug 6131](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6131) - Improved check for valid custom column in preferences
    
      - [Rev 38070](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38070) - [Bug 4878](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4878) & [Bug 6110](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=6110) - Remove the warning "\[Errno 2\] No such file or directory: '/opt/local/lib/wireshark/python/1.6.1/wspy\_dissectors'"
    
      - [Rev 38072](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=38072) - Handle versions of GTK+ where gdk-pixbuf is a separate library

## 1.6.0

Released June 7, 2011 [Release notes](http://www.wireshark.org/docs/relnotes/wireshark-1.6.0.html)

Done:

  - Move over the following revisions:
      - [Rev 37372](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37372) - Move the Windows argument list conversion code to a common routine.
    
      - [Rev 37396](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37396) - Filter out arg\_list\_utf\_16to8.
    
      - [Rev 37479](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37479) - Declare the snapshot\_length as unsigned.
    
      - [Rev 37480](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37480) - When editcap's -s \<snaplen\> is used, save the new snaplen in the capture file if it's smaller than the original.
    
      - [Rev 37488](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37488) - Handle editcap's snaplen before choplen for consistency. If chopping more bytes than available, chop all by setting caplen to 0. In all cases, leave orig\_len alone.
    
      - [Rev 37524](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37524) - [Bug 5983](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5983) - DTLS fragment reassemble failure
    
      - [Rev 37525](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37525) - Add Michael Chen to AUTHORS.
    
      - [Rev 37530](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37530) - Fix a minor typo about bitmask of a reserved field.
    
      - [Rev 37538](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37538) - Dump ABI using all header files related to libwireshark
    
      - [Rev 37540](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37540) - Reorganize dumpabi targets to keep temporary files
    
      - [Rev 37543](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37543) - Fix wiretap headers to allow error-free ABI dumping.
    
      - [Rev 37544](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37544) - Include config.h and define \_U\_ for dumping ABI.
    
      - [Rev 37750](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37550)[Rev 37554](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37554)[Bug 5988](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5988) - Wrong sort of column “Packets” in “RTP Streams” window.
    
      - [Rev 37558](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37558) - [Bug 5883](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5883) - \[Dissector bug, protocol SNMP: proto.c:2761: failed assertion "DISSECTOR\_ASSERT\_NOT\_REACHED"\]
    
      - [Rev 37564](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37564) - Fix an old-style function definition.
    
      - [Rev 37567](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37567) & [Rev 37568](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37568) - Add support for LOAD() to TShark's I/O stats.
  - Bump -version-info to 1:0:0 in {epan|wsutil|wiretap}/Makefile.am

## 1.6.0rc2

Released June 2, 2011

Done:

  - Move over the following revisions:
      - [Rev 37154](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37154) - Put the UI manager code in a stable state.
    
      - [Rev 37156](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37156) - Put the UI manager code in a stable state.
    
      - [Rev 37157](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37157) - Put the UI manager code in a stable state.
    
      - [Rev 37183](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37183) - Clean up SMB output when info level not captured in request due to snapshot length.
    
      - [Rev 37188](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37188) - [Bug 5464](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5464) - AIM dissector has some endian issues.
    
      - [Rev 37192](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37192) - Clean up some routine names.
    
      - [Rev 37196](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37196) - Fix field display name in NTLMSSP.
    
      - [Rev 37197](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37197) - Don't display version field in NTLMSSP if it's not present.
    
      - [Rev 37199](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37199) - [Bug 5928](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5928) - 3GPP QoS: Traffic class is not decoded properly.
    
      - [Rev 37201](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37201)+[Rev 37202](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37202) - Don't pass NULL string pointer to format routines (NCP).
    
      - [Rev 37203](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37203) - More NULL string pointer checks.
    
      - [Rev 37207](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37207) - Really clear the EOF flag. Fixes a problem when reading pcap-ng files.
    
      - [Rev 37211](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37211), [Rev 37212](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37212), [Rev 37216](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37216), [Rev 37224](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37224), [Rev 37230](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37230), & [Rev 37235](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37235) - Fix some un-prototyped function declarations and definitions.
    
      - [Rev 37223](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37223) & [Rev 37226](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37226) - Fix some missing prototype warnings.
    
      - [Rev 37236](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37236) - Don't increase the len field of the GByteArray that provides the backing data for an FT\_BYTES field; the length must correspond to data that's actually there.
    
      - [Rev 37239](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37239) - [Bug 5930](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5930) - Allow Lua dissectors to add FT\_FRAMENUMs.
    
      - [Rev 37244](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37244) - NULL string pointer checks (gsm\_a\_bssmap). May also want to include [Rev 37247](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37247) to make future backports easier.
    
      - [Rev 37279](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37279) - Make sure that the counters in the capture info dialog gets updated. The EOF flags needs to be cleared.
    
      - [Rev 37286](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37286) - Fix the dissection of info level 2 for Transaction2 query and set operations (and other miscellaneous cleanups).
    
      - [Rev 37298](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37298) & [Rev 37314](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37314) - [Bug 5785](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5785) - Add XSLT for PDML output to render poor man's Wireshark in HTML.
    
      - [Rev 37316](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37316) - Make the ChmodBPF startup item not group-writable so SystemStarter doesn't get scared and reject it.
    
      - [Rev 37355](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37355) - [Bug 5942](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5942) - RSN IE has incorrect minimal length
    
      - [Rev 37370](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37370) - [Bug 5947](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5947) - Fix the mask for extracting FMID.
    
      - [Rev 37374](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37374) - Don't show hidden columns in TShark.
    
      - [Rev 37389](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37389) - [Bug 5949](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5949) - 802.11 IE tag number 61/62 still decoded to "Unknown"/Reserved tag Number
    
      - [Rev 37400](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37400) - Add more expert infos to SCCP dissector
    
      - [Rev 37426](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37426) - [Bug 5954](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5954) - Avoid processing tvb when fragment dissection didn't create one.
    
      - [Rev 37439](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37439) - [Bug 5962](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5962) - Fix DHCPv6 remote identifier option parsing.
    
      - [Rev 37401](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37401), [Rev 37446](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37446), [Rev 37447](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37447), [Rev 37448](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37448), [Rev 37449](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37449), [Rev 37450](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37450) & [Rev 37457](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37457) - Export SSL Session Keys.
    
      - [Rev 37427](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37427) - Added some row space to "Edit Column Details"
    
      - [Rev 37455](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37455) - [Bug 5955](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5955) - DVB-CI dissector: exception in close\_session\_request apdus (wrong offset)
    
      - [Rev 37458](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37458) - Fix a wrong length when there is unknown Atheros IE Data
    
      - [Rev 37459](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37459) - Don't return offset when it is the end of Extended Capability IE (Only use break)
    
      - [Rev 37473](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37473) - Only limit the snaplen when requested.
    
      - [Rev 37474](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37474), [Rev 37475](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37475), [Rev 37476](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37476), [Rev 37490](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37490) - Makefile targets for dumping ABI descriptors
    
      - [Rev 37487](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37487) - [Bug 5753](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5753) - openSAFETY dissector
    
      - [Rev 37486](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37486) - Vendor Specific IE (227) Specifically WPA/WME sub dissector
    
      - [Rev 37497](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37497) - [Bug 5830](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5830) - 802.11 Tag WME Qos Info field is not decoded
    
      - [Rev 37505](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37505) - Improve handling of command line errors
    
      - [Rev 37511](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37511) - [Bug 5863](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5863) - DTLS heuristics enhancements
    
      - [Rev 37521](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37521) - [Bug 5984](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5984) - openSAFETY: Infinite loop caused by fcn call arg conversion: guint-\>guint8

## 1.6.0rc1

Released May 16, 2011

Done:

  - Move over the following revisions:
      - [Rev 37162](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37162) - [Bug 5921](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=5921) - Fix for RPL DAO-ACK Processing when DODAG ID present
    
      - [Rev 37167](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37167) - Fix ChmodBPF startup item permissions
    
      - [Rev 37181](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=37181) - Don't pass NULL string pointer to format routines (Netflow)

---

Imported from https://wiki.wireshark.org/Development/Trunk-1.6 on 2020-08-11 23:13:20 UTC
