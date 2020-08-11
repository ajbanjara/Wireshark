# OID handling and SNMP dissector rewrite

The usability objective of this is to be able to filter on values of SNMP variables like: `SNMPv2-MIB.sysUpTime == 274602`. The other reason behind this work is not to have a dependency on NET-SNMP which depends on the non-GPL compatible OpenSSL. We'll be using [libsmi](http://www.ibr.cs.tu-bs.de/projects/libsmi/) instead.

## TO DO

:one: MUST be done before the next release, :two: SHOULD be there, :three: MIGHT be there, :white\_check\_mark: It's being DONE already\!

  - SNMP
      - :one: testing
        
          - `OctetString` Indexes (both implied and not) -- Some RMON tables use them, capture files are welcome
        
          - :white\_check\_mark: Traps
        
          - :white\_check\_mark: fuzz testing
        
          - :white\_check\_mark: willfully malformed oids and stuff like that
            
              - :white\_check\_mark: review the PROTOS files in [SampleCaptures](/SampleCaptures)
    
      - :one: Fixing
        
          - It should only warn, (not inhibit decoding) if expects a different integer type (like Integer32 \[APPLICATION 2\], Timeticks \[APPLICATION 3\], or Counter32 \[APPLICATION 1\] and gets an Integer instead \[UNIVERSAL 2\] (and vice versa). Same for an Opaque,Nsap, [IpAddr](/IpAddr) vs Octetstring as far as the length allow decoding.
        
          - :white\_check\_mark: Implement other types off indexing (AGREGATE, ...) these show the following error: `The COLUMS's parent is not a ROW. This is a BUG! please contact the wireshark developers.`
        
          - :white\_check\_mark: Some OIds have a -2 hfid value, that means they are unregistered, do not use it.
    
      - :one: Document (Always remember C is understood by compilers and programmers, people prefers english) \!\!\!\!
        
          - the changes (where?)
          - and add the smi\_\* tables to the doocbook files
    
      - de-bugs
        
          - :white\_check\_mark: [new SNMP dissector shows convoluted tree](http://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1746) (now it is a little less convoluted :smiley: )
        
          - :x: [SNMP dissector shows a wrong Timestamp when the value is negative](http://bugs.wireshark.org/bugzilla/show_bug.cgi?id=664) (I Won't get it fixed)
        
          - :three: [SNMP Object Names not displayed in the info column](http://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1088) (see bellow)
    
      - :white\_check\_mark: regenerate the dissector with -T and -X
    
      - :white\_check\_mark: add trap oids to COL\_INFO
    
      - :three: add oids to COL\_INFO
    
      - :white\_check\_mark: get the `snmp.variable_oid` dissector table back to life.
    
      - :white\_check\_mark: manage columns as well as scalars
    
      - :white\_check\_mark: put complete information in the labels of the [VarBind](/VarBind) Items
  - COPS
      - :two: the mapping of OID-\>attribute in COPS is still incomplete
    
      - :white\_check\_mark: we are missing the PIBs (like MIBs but for COPS) in the libsmi zipfile
    
      - :one: testing
        
          - fuzz testing
          - willfully malformed oids and stuff like that
  - GENERAL
      - :white\_check\_mark: There are oids being registered with long names like "itu-t(0) identified-organization(4) etsi(0) mobileDomain(0) gsm-Network(1) map-ac(0) networkLocUp(1) version3(3)"
    
      - :white\_check\_mark: get "the whole thing"<sup>tm</sup> into nsis
        
          - :white\_check\_mark: get the mibs into nsis
        
          - :white\_check\_mark: get the pibs into nsis
    
      - :two: protect the code from re-loading MIBS for modules that were already loaded. A Hard one as it would need to "pre-parse" the modules before asking libsmi to load them. I think I'll Document the potential issues and their symptoms instead.
    
      - :white\_check\_mark: There are some OIDs that attempt to be registered with "funky" oid strings "dop.agreement.2.5.19.1" or "x411.extension-attribute.27" which are not resolvable (these are in \#.REGISTER sections in asn2wrs) (x411 and dop are resolved -- [StigBjørlykke](/StigBjørlykke))
    
      - :white\_check\_mark: Come up with a list of default MIBs and PIBs (there was a `/*comment*/` in the snmp code (now gone with the surrounding code) saying that we should not, should we?)
    
      - :white\_check\_mark: add libsmi to autoconf
        
          - :white\_check\_mark: `./configure`'s `--with-libsmi` does not take a location as argument, run like: `env LDFLAGS='-lsmi -L/base/lib' CFLAGS=-I/base/include ./configure [options]`
        
          - :white\_check\_mark: remove net-snmp from autoconf
    
      - :white\_check\_mark: add a menu item or preference setting for the smi\_modules UAT
        
          - :two: add a link (button) for the tables in SNMP and COPS preference tabs
    
      - :three: Some OIDs (not from explicitly included MIBs) are added more than once during protocol registration
    
      - :two: implement "ALL" modules, i.e. implement file-name globing and use it on libsmi's MIB/PIB path.
    
      - :white\_check\_mark: Some macros in oids.h are used to replace the obsoleted oid-related calls in oid\_resolv.h to\_str.h and format-oid.h, it would be nice to actually rewrite the invocations.
    
      - :white\_check\_mark: have other users of oid\_resolv.h get to use the new functions in oids.h
    
      - :one: add the following MIBs and PIBs to the zipfile
        
          - :three: H.335 <http://www.itu.int/rec/T-REC-H.341-199905-I/en>
        
          - :white\_check\_mark: PIBs included in libsmi

\-- [LuisOntanon](/LuisOntanon)

---

Imported from https://wiki.wireshark.org/Development/SNMP on 2020-08-11 23:13:06 UTC
