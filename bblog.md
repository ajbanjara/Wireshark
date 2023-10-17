[[_TOC_]]

# BBLog

**Black Box Log**, **BBLog**, or (historically) **NFLX** or **Netflix log**, is a logging format that uses custom [PcapNG](/Development/PcapNg) blocks, and custom options on PcapNG packet blocks, to record logging data related to the network connection.

The Private Enterprise Number (PEN) for these blocks and options is 10949, the PEN for Netflix, the originator of the format. It has since been incorporated into FreeBSD Ports as the output format of [`tcplog_dumper`](https://cgit.freebsd.org/ports/tree/net/tcplog_dumper).

## Source Code

As of this writing, dedicated BBLog blocks are dissected by [`packet-bblog.c`](epan/dissectors/packet-bblog.c), and BBLog options on standard packet blocks are handled by [`packet-frame.c`](epan/dissectors/packet-frame.c).

## Relevant Links

* [!3990](wireshark!3990) - Initial support for BBLog files
* [!9838](wireshark!9838) - BBLog: Display BBLog information for IN/OUT events
* [All merge requests mentioning "bblog"](https://gitlab.com/wireshark/wireshark/-/merge_requests?scope=all&state=all&search=bblog)