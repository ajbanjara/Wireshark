# snoop

A packet capturing tool similar to TShark and [TcpDump](/TcpDump) for Solaris. Snoop comes standard with SunOS 5.x, the OS component of Solaris 2.x, Solaris 7, and later versions of Solaris. Wireshark and TShark can read capture files written in snoop's binary file format.

## Example command

Capture network packets, do not do name resolution (`-r`), save packets in a file named `arp11.snoop`, do not display progress counter (`-q`), use network interface device `nxge0`, capture 15,000 packets:

``` 
 snoop -r -o arp11.snoop -q -d nxge0 -c 150000
```

## External links

  - [snoop](http://download.oracle.com/docs/cd/E19253-01/816-5166/snoop-1m/index.html) man page

---

Imported from https://wiki.wireshark.org/snoop on 2020-08-11 23:25:46 UTC
