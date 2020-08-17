# Creating Patches

:warning: **We're migrating to GitLab on August 23rd**

If you're working on a code contribution, you might want to hold off on uploading it until then.
Source code contributions prior to the August 23rd migration should be uploaded to our [Gerrit code review site](https://code.wireshark.org/review/).
After the migration they should be uploaded to our [GitLab repository](https://gitlab.com/wireshark/wireshark/-/tree/master).

The [Development/SubmittingPatches](/Development/SubmittingPatches) wiki page and [contribution section of the Developer's Guide](https://www.wireshark.org/docs/wsdg_html_chunked/ChSrcContribute.html) have complete information on the patch submission process.

:warning: **Before submitting your changes:**

  - **Fuzz test them\!** See [FuzzTesting](/FuzzTesting) for more details.

  - Verify you are using only approved function calls by running `tools/checkAPIs.pl <file>`

  - Verify header fields using `tools/checkhf.pl <file>`

  - Verify properly named display filter fields by running `tools/checkfiltername.pl <file>`

  - If your changes are anything more than a trivial bugfix, then it would be a good idea to add a capture file for the protocol being modified so that others can test.

The capture file can be added to the Wireshark ecosystem via either a [Bugzilla](https://bugs.wireshark.org) item (which can then be referenced in the commit message using [Bug: or Ping-Bug: entries](/Development/SubmittingPatches#Writing_a_Good_Commit_Message)), or as an addition to the wiki [SampleCaptures](/SampleCaptures) page. By attaching the capture file it will automatically become part of the regression suite and will be tested regularly.

If the changes fix a bug, the bug filed should report the problem that they fix (don't rely on the commit message to do so); if they add support for a new protocol or enhanced support for an existing protocol, the bug filed should describe the new protocol or enhancement. Don't just file a place-holder bug with a title such as "Capture file for change XXX". Also change the bug state to **IN\_PROGRESS** so its clear you are already working on it.

If your changes are multifaceted, e.g. if you're updating multiple dissectors or your changes include a new feature plus a minor bug fix plus a crash fix, you should send multiple patches.

Before submitting your changes, please read the "Code style" section of [doc/README.developer](https://code.wireshark.org/review/gitweb?p=wireshark.git;a=blob_plain;f=doc/README.developer). That section has two important subsections, "Portability" and "Robustness".

The "Portability" section notes:

    Wireshark runs on many platforms, and can be compiled with a number of different compilers;
    here are some rules for writing code that will work on multiple platforms.

Code submitted to Wireshark should work on many types of processors (both big-endian and little-endian processors, and even processors that trap when accessing unaligned quantities), should work on many different operating systems, and should be compilable with many different compilers.

Just because something compiles on your platform doesn't mean it'll compile or run correctly on all of the other platforms for which Wireshark is built. Note especially that Wireshark can be compiled with non-GCC compilers and run on big-endian processors. Just because code works on your developer machine, doesn't mean it'll work on, for example:

  - Linux or one of the BSDs on a PC (little-endian processor, and probably using GCC or Clang)
  - a Macintosh (big-endian PowerPC processor or little-endian Intel processor, and probably using GCC or Clang)
  - Windows on a PC (little-endian processor, and probably using Microsoft Visual C++)
  - Solaris on a SPARC machine (a big-endian processor that traps on unaligned accesses, and on which the compiler might be Sun C).

The "Robustness" section notes:

    Wireshark is not guaranteed to read only network traces that contain correctly-
    formed packets. Wireshark is commonly used is to track down networking problems,
    and the problems might be due to a buggy protocol implementation sending out
    bad packets.
    
    Therefore, protocol dissectors not only have to be able to handle
    correctly-formed packets without, for example, crashing or looping
    infinitely, they also have to be able to handle *incorrectly*-formed
    packets without crashing or looping infinitely.

For example, it's a common mistake to implement an infinite loop while processing TLV (Type, Length, Value) protocol headers. Handle the case where the length is less than the length of the type and length fields; in particular, the code must not attempt to continue the loop processing TLVs if the length is zero, as the loop would then process the same TLV over and over again, forever.

---

Imported from https://wiki.wireshark.org/CreatingPatches on 2020-08-11 23:12:24 UTC
