# Memory

This page attempt to document the memory (de)allocation flow. Hopefully this makes it easier to understand the various places where memory can be deallocated to avoid memory leaks, but still ensure memory safety. WORK IN PROGRESS (since June 2015)\! Expect errors, please correct those\!

## Types for memory

The wmem memory allocator uses these packet scopes (see README.wmem in links):

  - packet scope: freed after dissection of a single packet (see callers of` wmem_enter_packet_scope`).
  - file scope: entered via `wmem_enter_file_scope` in` init_dissection`, freed via` cleanup_dissection`.
  - epan scope: freed at the end of the program (called via` epan_cleanup`).

## Callbacks

This section attempts to document various entry and exit points. The **register** column points to the function that can be used to register a `void (*callback)(void)`. The **caller** column points to the invocation site.

These callbacks are defined in packet.h:

| register                              | caller                                                                     | note |
| ------------------------------------- | -------------------------------------------------------------------------- | ---- |
| `register_final_registration_routine` | `final_registration_all_protocols` via `epan_init`                         |      |
| `register_postseq_cleanup_routine`    | `postseq_cleanup_all_protocols`                                            | called after fully reading a file, after calling `epan_dissect_cleanup` (`file.c#cf_read`, `file.c#cf_finish_tail`) |
| `register_init_routine`               | via `init_dissection` (and `cleanup_dissection` up until a 1.99.X version) |      |
| `register_cleanup_routine`            | via `cleanup_dissection` (since a 1.99.X version)                          | WIP  |

  - `epan_dissect_cleanup` is called via:
      - `epan_dissect_free` (`tshark.c#load_cap_file`)

I'm lost. Need call graph?

### Backtraces

Breaking on spx_cleanup_protocol, spx_postseq_cleanup, spx_init_protocol which has this code:

``` 
        register_init_routine(&spx_init_protocol);
        register_cleanup_routine(&spx_cleanup_protocol);
        register_postseq_cleanup_routine(&spx_postseq_cleanup);
```

Called when opening a capture file via clicking Recent files link (starting wireshark-gtk does not have other effects):

    #0  spx_init_protocol () at epan/dissectors/packet-ipx.c:513
    #1  0x00007fffea1c7b2b in call_routine (routine=<optimized out>, dummy=<optimized out>) at epan/packet.c:220
    #2  0x00007ffff541126d in g_slist_foreach (list=<optimized out>, func=func@entry=0x7fffea1c7b25 <call_routine>, user_data=user_data@entry=0x0) at gslist.c:878
    #3  0x00007fffea1ca3ea in init_dissection () at epan/packet.c:241
    #4  0x00007fffea1a06bf in epan_new () at epan/epan.c:160
    #5  0x000000000042f154 in ws_epan_new (cf=cf@entry=0xfa6780 <cfile>) at file.c:287
    #6  0x000000000043f538 in cf_open (cf=0xfa6780 <cfile>, fname=fname@entry=0x606000369b00 "/home/peter/projects/wireshark-notes/tls/smtp-ssl.pcapng", type=type@entry=0, is_tempfile=is_tempfile@entry=0, 
        err=err@entry=0x7fffffffd7b0) at file.c:321
    #7  0x0000000000480be6 in menu_open_filename (cf_name=cf_name@entry=0x606000369b00 "/home/peter/projects/wireshark-notes/tls/smtp-ssl.pcapng") at ui/gtk/main_menubar.c:3950
    ...

    #0  spx_postseq_cleanup () at epan/dissectors/packet-ipx.c:529
    #1  0x00007fffea1c7b33 in call_postseq_cleanup_routine (routine=<optimized out>, dummy=<optimized out>) at epan/packet.c:297
    #2  0x00007ffff541126d in g_slist_foreach (list=<optimized out>, func=func@entry=0x7fffea1c7b2d <call_postseq_cleanup_routine>, user_data=user_data@entry=0x0) at gslist.c:878
    #3  0x00007fffea1ca46a in postseq_cleanup_all_protocols () at epan/packet.c:303
    #4  0x0000000000436a5e in cf_read (cf=<optimized out>, reloading=reloading@entry=0) at file.c:699
    #5  0x0000000000480bfb in menu_open_filename (cf_name=cf_name@entry=0x606000369b00 "/home/peter/projects/wireshark-notes/tls/smtp-ssl.pcapng") at ui/gtk/main_menubar.c:3951
    #6  0x000000000048b928 in welcome_filename_link_press_cb (widget=widget@entry=0x61300007ab20, event=<optimized out>, data=data@entry=0x606000369b00) at ui/gtk/main_welcome.c:492
    ...

As for the "Reload this capture file" button:

    #0  spx_cleanup_protocol () at epan/dissectors/packet-ipx.c:519
    #1  0x00007fffea1c7b2b in call_routine (routine=<optimized out>, dummy=<optimized out>) at epan/packet.c:220
    #2  0x00007ffff541126d in g_slist_foreach (list=<optimized out>, func=func@entry=0x7fffea1c7b25 <call_routine>, user_data=user_data@entry=0x0) at gslist.c:878
    #3  0x00007fffea1ca41c in cleanup_dissection () at epan/packet.c:262
    #4  0x00007fffea1a0924 in epan_free (session=0x603003c90250) at epan/epan.c:202
    #5  0x000000000043f3a9 in cf_close (cf=cf@entry=0xfa6780 <cfile>) at file.c:489
    #6  0x000000000043f513 in cf_open (cf=cf@entry=0xfa6780 <cfile>, fname=fname@entry=0x6060000b43e0 "/home/peter/projects/wireshark-notes/tls/smtp-ssl.pcapng", type=<optimized out>, is_tempfile=is_tempfile@entry=0, 
        err=err@entry=0x7fffffffc340) at file.c:309
    #7  0x000000000044479c in cf_reload (cf=0xfa6780 <cfile>) at file.c:5242
    #8  0x00000000005c3b8e in file_reload_cmd_cb (w=<optimized out>, data=<optimized out>) at ui/gtk/capture_file_dlg.c:2215
    ...

    #0  spx_init_protocol () at epan/dissectors/packet-ipx.c:513
    #1  0x00007fffea1c7b2b in call_routine (routine=<optimized out>, dummy=<optimized out>) at epan/packet.c:220
    #2  0x00007ffff541126d in g_slist_foreach (list=<optimized out>, func=func@entry=0x7fffea1c7b25 <call_routine>, user_data=user_data@entry=0x0) at gslist.c:878
    #3  0x00007fffea1ca3ea in init_dissection () at epan/packet.c:241
    #4  0x00007fffea1a06bf in epan_new () at epan/epan.c:160
    #5  0x000000000042f154 in ws_epan_new (cf=cf@entry=0xfa6780 <cfile>) at file.c:287
    #6  0x000000000043f538 in cf_open (cf=cf@entry=0xfa6780 <cfile>, fname=fname@entry=0x6060000b43e0 "/home/peter/projects/wireshark-notes/tls/smtp-ssl.pcapng", type=<optimized out>, is_tempfile=is_tempfile@entry=0, 
        err=err@entry=0x7fffffffc340) at file.c:321
    #7  0x000000000044479c in cf_reload (cf=0xfa6780 <cfile>) at file.c:5242
    #8  0x00000000005c3b8e in file_reload_cmd_cb (w=<optimized out>, data=<optimized out>) at ui/gtk/capture_file_dlg.c:2215
    ...

    #0  spx_postseq_cleanup () at epan/dissectors/packet-ipx.c:529
    #1  0x00007fffea1c7b33 in call_postseq_cleanup_routine (routine=<optimized out>, dummy=<optimized out>) at epan/packet.c:297
    #2  0x00007ffff541126d in g_slist_foreach (list=<optimized out>, func=func@entry=0x7fffea1c7b2d <call_postseq_cleanup_routine>, user_data=user_data@entry=0x0) at gslist.c:878
    #3  0x00007fffea1ca46a in postseq_cleanup_all_protocols () at epan/packet.c:303
    #4  0x0000000000436a5e in cf_read (cf=cf@entry=0xfa6780 <cfile>, reloading=reloading@entry=1) at file.c:699
    #5  0x00000000004447ad in cf_reload (cf=0xfa6780 <cfile>) at file.c:5243
    #6  0x00000000005c3b8e in file_reload_cmd_cb (w=<optimized out>, data=<optimized out>) at ui/gtk/capture_file_dlg.c:2215
    ...

As for the "Close this capture file" button:

    #0  spx_cleanup_protocol () at epan/dissectors/packet-ipx.c:519
    #1  0x00007fffea1c7b2b in call_routine (routine=<optimized out>, dummy=<optimized out>) at epan/packet.c:220
    #2  0x00007ffff541126d in g_slist_foreach (list=<optimized out>, func=func@entry=0x7fffea1c7b25 <call_routine>, user_data=user_data@entry=0x0) at gslist.c:878
    #3  0x00007fffea1ca41c in cleanup_dissection () at epan/packet.c:262
    #4  0x00007fffea1a0924 in epan_free (session=0x603000dc9630) at epan/epan.c:202
    #5  0x000000000043f3a9 in cf_close (cf=cf@entry=0xfa6780 <cfile>) at file.c:489
    #6  0x00000000005c3376 in do_file_close (cf=0xfa6780 <cfile>, from_quit=from_quit@entry=0, before_what=before_what@entry=0x7efe60 "") at ui/gtk/capture_file_dlg.c:1286
    #7  0x00000000005c339e in file_close_cmd_cb (widget=<optimized out>, data=<optimized out>) at ui/gtk/capture_file_dlg.c:1295
    ...

## Links

  - <https://gitlab.com/wireshark/wireshark/-/blob/master/doc/README.wmem>

---

Imported from https://wiki.wireshark.org/Development/Memory on 2020-08-11 23:12:53 UTC
