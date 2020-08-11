## Jeff Morriss' Wireshark page

I've been a Wireshark contributor since June of 2001 (starting with support for ANSI [MTP3](/MTP3) and [M2PA](/M2PA)--which was then only an Internet-Draft) and a core developer (with SVN commit access) since November 2006.

### Contributions

My "major" (not so major, I'd say) contributions have been:

  - Support for M2PA: the first version used ID version 2 and later I added draft-2 support back into the dissector--which had moved on to newer IDs--when it became clear draft-2 was still being actively used in the field

  - Support for the ANSI, China, and Japan variants of [MTP3](/MTP3) and MTP3-management

  - Support for [SCCP](/SCCP) (ITU and the ANSI, China, and Japan variants) and SCCP-management

  - Some minor work on the [ISUP](/ISUP) dissector for the ANSI variant (this still needs a lot more work\!)

  - Support for [SSCOP](/SSCOP) over [UDP](/UDP) and SSCF-NNI, the latter being useful for MTP3-b (broadband or "over ATM" MTP3)

  - The initial implementation of the "range" preference type (though Guy heavily reworked my initial attempt)

  - Support for MTP2 and MTP3 DLT types (natively storing MTP2 and MTP3 directly in PCAP files)

### Interests

My day job revolves around Telecom ([SS7](/SS7) then [SIGTRAN](/SIGTRAN) then [DIAMETER](/DIAMETER)) so that's where my primary interests in Wireshark are. Like everybody else I'd like to have more time to work on Wireshark (both my own work and reviewing submitted patches). Things I'd like to do (or investigate doing) in Wireshark (some of these are my personal notes so I can remember them):

  - Bug fixes (I worked in Support for 10 years so I have a particular thing against bugs)

  - Chase down memory leaks
    
      - se\_ and ep\_ more things (get rid of g\_hash's where possible)

  - Relative sequence numbers for SCTP

  - Something equivalent to TCP timestamps (time since last frame in this conversation) for SCTP

  - Now that we save the default preferences, have a "restore defaults" button in the preferences window (maybe even one for each protocol?)

  - Finish the ANSI port of the ISUP dissector

  - 64-bit counters (32-bits is so, like, early 1990's :smiley: )

  - Create an SS7/SIGTRAN protocol preference tree. But, as noted on the -dev list a while back:
    
      - [Maybe](http://www.wireshark.org/lists/wireshark-dev/200703/msg00496.html) we should be able to flatten the list so non-SS7/SIGTRAN users can find the preferences. I tried to do this once (think it would be easy) and it didn't work. So much for writing GUI code.
    
      - [Maybe](http://www.wireshark.org/lists/wireshark-dev/200703/msg00532.html) this would allow us to move the MTP3 standard preference (which is used by M3UA, ISUP, and others) into, say, an "SS7/SIGTRAN" preference?

  - Getting rid of (at least for most uses) ITEM\_LABEL\_LENGTH. See [bug 2009](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=2009).

Things I'm interested in but probably won't ever do anything about:

  - Parallelism and multi-threading: I spend a lot of time working on Sun systems which don't have the fastest CPUs in the world but there are usually lots of them

  - How to make it easier to work with (in the GUI) multiple PDUs in one frame (which is extremely common over SCTP). [This idea](http://www.wireshark.org/lists/wireshark-dev/200606/msg00147.html) looks good to me.

### About me

I have worked at <span class="strike">Ulticom Mavenir</span> Mitel since 1998: until 2008 in Customer Support and since then in System Engineering. I'm not a developer (though I went to school to be one), I just play one on the Internet. :wink:

I currently live in New Jersey (USA) though I recently lived in Singapore and I previously lived in Antibes (near Nice and Cannes), France.

The time I pretend that I'd like to spend on Wireshark is frequently spent instead with my family, something I do complain about but shouldn't (because I do enjoy that time).

This is a picture of my son and me in Mureung Valley in South Korea (May, 2007). ![JeffMorriss.jpg](uploads/__moin_import__/attachments/JeffMorriss/JeffMorriss.jpg "JeffMorriss.jpg")

---

Imported from https://wiki.wireshark.org/JeffMorriss on 2020-08-11 23:15:38 UTC
