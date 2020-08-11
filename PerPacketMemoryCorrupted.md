## Debugging an "Per-packet memory corrupted" Error

The program will stop on a "Per-packet memory corrupted" Error when a buffer in per packet allocated memory has been overflown. As with every buffer overflow debugging it is not easy, however in this case it can be made less complicated.

The canary in emem blocks that checks for corruption can allow you to see with what the buffer overflow filled the memory.

### Example

    $ gdb tshark
    ...
    (gdb) run -r file.cap -V
    ...
    Simple Network Management Protocol
        version: version-1 (0)
        community: public
        data: get-request (0)
            get-request
                request-id: 2477
                error-status: noError (0)
                error-index: 0
                variable-bindings: 1 item
                    SNMPv2-MIB::sysDescr.2147483651 (1.3.6.1.2.1.1.1.2147483651): unSpecified
                        Object Name: 1.3.6.1.2.1.1.1.2147483651 (SNMPv2-MIB::sysDescr.2147483651)
                            Scalar Instance Index: 2147483651
                        unSpecified
    
    ** ERROR **: Per-packet memory corrupted.
    aborting...
    Program received signal SIGABRT, Aborted.
    0x900481ac in kill ()
    (gdb) bt
    #0  0x900481ac in kill ()
    #1  0x9012d7b4 in abort ()
    #2  0x005ba274 in g_logv ()
    #3  0x005ba5c8 in g_log ()
    #4  0x0310387c in ep_free_all () at ../../epan/emem.c:722
    #5  0x0310518c in epan_dissect_run (edt=0x8e23ca0, pseudo_header=0x8e21acc, data=0x681e200 "", fd=0xbffff7e8, cinfo=0x0) at ../../epan/epan.c:156
    #6  0x000187e4 in process_packet (cf=0x276c0, offset=2684371312, whdr=0x0, pseudo_header=0x8e21acc, pd=0x681e200 "") at ../tshark.c:2382
    #7  0x0001a80c in main (argc=161472, argv=0x8e21ab8) at ../tshark.c:2181
    (gdb) fr 4
    #4  0x0310387c in ep_free_all () at ../../epan/emem.c:722
    warning: Source file is more recent than executable.
    
    722                     }
    (gdb) p *npc
    $20 = {
      next = 0x6683000, 
      amount_free_init = 10477568, 
      amount_free = 10475656, 
      free_offset_init = 4096, 
      free_offset = 6008, 
      buf = 0x7008000 <Address 0x7008000 out of bounds>, 
      c_count = 48, 
      canary = {0x7009008, 0x7009022, 0x7009042, 0x7009062, 0x7009082, 0x70090a2, 0x70090c0, 0x70090d8, 0x70090f0, 0x7009108, 0x7009120, 0x7009138, 0x7009150, 0x7009168, 0x7009194, 0x70091e0, 0x7009228, 0x7009270, 0x70092b8, 0x70092c7, 0x70092dc, 0x700930c, 0x700937b, 0x7009393, 0x7009403, 0x700944e, 0x7009469, 0x7009498, 0x70094b6, 0x70094d6, 0x70094f6, 0x7009512, 0x7009532, 0x7009552, 0x7009572, 0x7009592, 0x70095b2, 0x70095d2, 0x70095f2, 0x7009610, 0x7009628, 0x7009640, 0x7009658, 0x7009684, 0x700969b, 0x70096c9, 0x70096fc, 0x700976b, 0x7009618, 0x7009638, 0x7009658, 0x7009678, 0x7009698, 0x70096b8, 0x70096d8, 0x70096f8, 0x7009718, 0x7009738, 0x7009758, 0x7009778, 0x7009798, 0x70097b8, 0x70097d8, 0x70097f8, 0x7009818, 0x7009838, 0x7009858, 0x7009878, 0x7009898, 0x70098b8, 0x70098d8, 0x7009900, 0x700990d, 0x7009924, 0x700993b, 0x7009950, 0x7009962, 0x700997b, 0x7009992, 0x70099ab, 0x70099c2, 0x70099db, 0x70099f2, 0x7009a0b, 0x7009a20, 0x7009a30, 0x7009a42, 0x7009a58, 0x7009a6a, 0x7009a84, 0x7009a9a, 0x7009ab4, 0x7009acb, 0x7009ae4, 0x7009b01, 0x7009b1c, 0x7009b39, 0x7009b55, 0x7009b6e, 0x7009b83, 0x7009b9e, 0x7009bad, 0x7009bc2, 0x7009bd5, 0x7009beb, 0x7009bfd, 0x7009c14, 0x7009c2c, 0x7009c44, 0x7009c5b, 0x7009c73, 0x7009c8b, 0x7009ca2, 0x7009cb8, 0x7009cca, 0x7009ce2, 0x7009cfa, 0x7009d19, 0x7009d34, 0x7009d51, 0x7009d71, 0x7009d91, 0x7009dad, 0x7009dc5, 0x7009ddd, 0x7009df6, 0x7009e0b, 0x7009e26, 0x7009e3e, 0x7009e56, 0x7009e77, 0x7009e8c, 0x7009ea4, 0x7009ebc, 0x7009edf, 0x7009ef2, 0x7009f0a, 0x7009f22, 0x7009f39, 0x7009f52, 0x7009f69, 0x7009f83, 0x7009f99, 0x7009fad, 0x7009fc1, 0x7009fdb, 0x7009ff2, 0x700a00b, 0x700a023, 0x700a03b, 0x700a051, 0x700a06a, 0x700a081, 0x700a09b, 0x700a0b1, 0x700a0c5, 0x700a0d9, 0x700a0ee, 0x700a103, 0x700a116, 0x700a12e, 0x700a13e, 0x700a152, 0x700a16a, 0x700a182, 0x700a196, 0x700a1ab, 0x700a1be, 0x700a1d6, 0x700a1e6, 0x700a1fa, 0x700a212, 0x700a22a, 0x700a243, 0x700a25a, 0x700a273, 0x700a28b, 0x700a2a3, 0x700a2b5, 0x700a2ca, 0x700a2dd, 0x700a2f3, 0x700a305, 0x700a315, 0x700a325, 0x700a33b, 0x700a352, 0x700a36b, 0x700a383, 0x700a39b, 0x700a3b3, 0x700a3cb, 0x700a3e2, 0x700a3fb, 0x700a413, 0x700a42b, 0x700a443, 0x700a45c, 0x700a472, 0x700a48c...}, 
      cmp_len = "\b\016\016\016\016\016\b\b\b\b\b\b\b\b\f\b\b\b\b\t\f\f\r\r\r\n\017\b\n\n\n\016\016\016\016\016\016\016\016\b\b\b\b\f\r\017\f\r", '\b' <repeats 24 times>, "\v\f\r\b\016\r\016\r\016\r\016\r\b\b\016\b\016\f\016\f\r\f\017\f\017\v\n\r\n\v\016\v\r\v\f\f\f\r\r\r\016\b\016\016\016\017\f\017\017\017\v\v\v\n\r\n\n\n\t\f\f\f\t\016\016\016\017\016\017\r\017\v\017\r\016\r\r\r\017\016\017\r\017\v\017\n\r\n\n\n\016\016\016\n\r\n\n\n\016\016\016\r\016\r\r\r\v\016\v\r\v\v\v\r\016\r\r\r\r\r\016\r\r\r\r\f\016\f\r\f\f\f\v\v\v\r\r\n\n\f\v\f"...
    }
    (gdb) p i
    $21 = 23
    (gdb)  p npc->canary[i]
    $22 = (void *) 0x7009393
    (gdb)  p (char*)(npc->canary[i])
    $23 = 0x7009393 ""     <<< a "" this means the end of a string!
    (gdb)  p ((char*)(npc->canary[i]))[-1]
    $27 = 0 '\0'
    (gdb)  p ((char*)(npc->canary[i]))[-2]
    $28 = 49 '1'
    (gdb)  p ((char*)(npc->canary[i]))[-3]
    $29 = 53 '5'
    (gdb)  p ((char*)(npc->canary[i]))[-4]
    $30 = 54 '6'
    (gdb)  p &(((char*)(npc->canary[i]))[-10])
    $62 = 0x7009389 "147483651"
    (gdb)  p &(((char*)(npc->canary[i]))[-11])
    $63 = 0x7009388 "2147483651" <<<= now we can know who over-wrote the canary

---

Imported from https://wiki.wireshark.org/PerPacketMemoryCorrupted on 2020-08-11 23:17:54 UTC
