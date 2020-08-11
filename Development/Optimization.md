# Wireshark Optimizations

The following patches try to optimize Wireshark a little.

### But how fast can Wireshark run?

A small test:

  - With all names resolution disable and colorization enable load a 'big' capture.
  - Disable colorization and reload, faster isn't it?
  - Remove all columns but the first and reload.
  - Last but not least disable all protocols and reload.

A faster Wireshark is easy: don't filter packets, don't display and don't decode them.

### What's in the patches?

I assume that Wireshark dissectors output is idempotent so:

  - Colorize (apply colors filter) only once.

  - Compute columns info only once by using a modified Gtk2 ethclist for the packets list.

  - keep a per packet protocols list and when filtering only decode relevant packets/protocols ex:  
    In a SMB capture:  
    
    packet 1 Protocols in frame: eth:ip:tcp  
    packet 2 Protocols in frame: eth:ip:tcp:nbss:smb  
      
    
    The filter **smb.file == "foo"** will not decode packet 1 at all and in packet 2 eth, ip, tcp and nbss dissectors will be called with tree == NULL.

### Speed improvements

On my computer with no names resolution enable for: [wiki SMB netbench sample](uploads/__moin_import__/attachments/SampleCaptures/netbench_1.cap)

  - load 10 times faster.

  - popup menu 'conversation filter -\> TCP' 10 times faster (return all packets).

  - filter **"smb.file == "\\\\clients\\\\client2"** 15 times faster (return 3 packets).

  - filter **arp** return 0 packets in zero second.

  - filter **smb || udp** return 10086 packets in 50 ms.

### Notes

Broken functionalities:

  - Capture if compiled for gtk2 with thread enable (but does it work with the svn version?).
  - Some stats because they always set a tap listener.
  - many others I don't know.

### Patches

Recent version but only for uncompressed files and may work only on Linux: [patch.29854.diff.gz](uploads/__moin_import__/attachments/Development/Optimization/patch.29854.diff.gz)

Older version:  
Patch against svn (version in file name): [patch.29079.diff.gz](uploads/__moin_import__/attachments/Development/Optimization/patch.29079.diff.gz)

Modified SAT solver cf. [http://wiki.wireshark.org/Development/FastFiltering](/Development/FastFiltering) [sat.29079.diff.gz](uploads/__moin_import__/attachments/Development/Optimization/sat.29079.diff.gz)

---

Imported from https://wiki.wireshark.org/Development/Optimization on 2020-08-11 23:12:55 UTC
