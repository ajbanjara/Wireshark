## Canary and Guard Pages in Wireshark

In order to help detect memory over- and under-flows in ([~~se\_ and ep\_~~](https://web.archive.org/web/20100712195305/wiki.wireshark.org/EMEMification)) ([emem is dead!](https://www.wireshark.org/lists/wireshark-dev/201502/msg00029.html)) ([ememify](https://www.wireshark.org/lists/ethereal-dev/200507/msg00516.html)) allocated memory, Wireshark now places canary values (e.g., a gap or no-mans-land) after each allocation. When the memory is later freed, the canary values are checked to make sure that they haven't been changed. If they have, then someone has written past the memory that they allocated. See also [stackguard](http://gcc.fyxm.net/summit/2003/Stackguard.pdf).

In addition, guard pages are placed before and after each block of memory. These are entire pages of memory that are mprotect()'d against writes so that if the page is written to (because someone went **way** beyond the end of their allocated memory), Wireshark will get a memory access violation (and hopefully dump core for post-mortem analysis).

With the guard pages in place, memory allocations now look like:

``` 
  +----+--------+---+--------+---+--------+---+-------+----+
  | gp | alloc1 | c | alloc2 | c | alloc3 | c |  ...  | gp |
  +----+--------+---+--------+---+--------+---+-------+----+
```

("gp" = guard page, "allocn" = allocated memory, "c" = canary).

### What should I do if Wireshark detects such a canary violation?

If Wireshark exits stating "Per-packet memory corrupted." and exits (possibly leaving a core file (on \*NIX, anyway) that points to epan/emem.c around line 600), then Wireshark detected a canary violation. If you're not a developer, you're not compiling Wireshark yourself, or you don't have the time to debug the issue yourself, please [open a bug](/ReportingBugs) and attach a (preferrably small) capture file that exhibits the problem.

If you can debug the issue yourself, the best thing to do (again, on Linux, anyway) is to:

  - first update your source to see if the bug has already been fixed :smiley:

  - in epan/emem.c, uncomment the \#defines of EP\_DEBUG\_FREE and SE\_DEBUG\_FREE

  - recompile

  - run wireshark/tshark under [Valgrind](http://www.valgrind.org)
    
      - unless you did a make install (to get the libtool stuff out of the way), this probably means doing something like:
          - libtool --mode=execute valgrind tshark -Vnxr /some/file \> /dev/null 2\> valgrind.out

### Intense Canary Checking

Intense Canary Checking is a feature in emem that checks often for canary corruption to pinpoint where it was and crash earlier. Hopefully while the corruptor is still in the stack. To enable it:

  - in epan/emem.h uncomment ` /* #define DEBUG_INTENSE_CANARY_CHECKS */ `

  - recompile (at least epan/packet.c and epan/emem.c)

  - set the environment variable WIRESHARK\_DEBUG\_EP\_CANARY

  - run

If corruption is found Wireshark aborts printing the prior and the failing check locations. Hopefully when this checks fail it stops running while the corruptor is still in the stack.

To place checks in the code just add ` EP_CHECK_CANARY("my location: %s",location_string); ` where adequate.

Enjoy Hunting\!

---

Imported from https://wiki.wireshark.org/Development/Canary on 2020-08-11 23:12:41 UTC
