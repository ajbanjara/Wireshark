# InsecureCalls

There are some functions in ANSI-C (and our own API's as well) which are known for continuous security problems.

We could use a static code analysis tool (e.g. [flawfinder](http://www.dwheeler.com/flawfinder/)) to find at least the insecure ANSI-C calls.

Wireshark's code (especially the dissectors) is checked using a custom Perl script (tools/checkAPIs.pl) that checks whether various APIs are called. Unsafe APIs are 'prohibited' which raises errors on the buildbot if anyone checks in code using those APIs.

## sprintf -\> g\_snprintf

The sprintf call is known to be insecure as no buffer length is given to this call, which often results in hard to find bugs when this function writes behind the given buffer.

As there are currently many places where sprintf is still used, a list of files currently doesn't make sense.

There is still a list of such calls in the EMEMification page since most of these calls should be replaces with g\_snprintf() to an emem buffer anyway.

## strcpy -\> strlcpy / strcat -\> strlcat

The stcpy/strcat functions can easily write behind the given buffer, see: <http://www.gratisoft.us/todd/papers/strlcpy.html>

## TLV routines

Introducing API routines to deal with TLVs (type, length, value) could eliminate a lot of hand-crafted dissector code with potential problems (like endless loops).

There will be some things to think about, as TLV can have a variety of differences: byte ordering, 8,16,32 or even esoteric bit lengths, ... - *[UlfLamping](/UlfLamping)*

## External Links

  - [Secure Programming](http://users.tkk.fi/~asuortti/secprog.html) related link collection

  - [15 Tips for Secure Win32 Programming](http://archive.devx.com/upload/free/features/zones/security/articles/2000/12dec00/mh1200/mh1200-1.asp)

---

Imported from https://wiki.wireshark.org/Development/SecureProgramming on 2020-08-11 23:13:04 UTC
