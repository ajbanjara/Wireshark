## Ports 0 through 99


| Port | Protocol | Name                      | Description |
| ---- | -------- | ------------------------- | ----------- |
| 0    | None     | None                      | Port 0 is marked "reserved" by IANA. On most (all?) operating systems, trying to bind to port 0 will actually bind to a random ephemeral port. Port 0 should not be seen in normal traffic. |
| 1    | TCP      | tcpmux                    | TCP Port Service Multiplexer ([RFC 1078](http://www.ietf.org/rfc/rfc1078.txt)). |
| 2    | TCP, UDP | compressnet               | Management Utility |
| 3    | TCP, UDP | compressnet               | Compression Process |
| 4    |          | Unassigned                | |
| 5    | TCP, UDP | rje                       | Remote Job Entry |
| 6    |          | Unassigned                | Unassigned |
| 7    | TCP, UDP | echo                      | [EchoProtocol](/EchoProtocol) ([RFC 862](http://www.ietf.org/rfc/rfc862.txt)) |
| 8    |          | Unassigned                | Unassigned |
| 9    | TCP, UDP | discard, sink, null       | [DiscardProtocol](/DiscardProtocol) ([RFC 863](http://www.ietf.org/rfc/rfc863.txt)) |
| 10   |          | Unassigned                | Unassigned |
| 11   | TCP, UDP | systat, users             | [ActiveUsersProtocol](/ActiveUsersProtocol) ([RFC 866](http://www.ietf.org/rfc/rfc866.txt)) |
| 12   |          | Unassigned                | Unassigned |
| 13   | TCP, UDP | daytime                   | [DaytimeProtocol](/DaytimeProtocol) ([RFC 867](http://www.ietf.org/rfc/rfc867.txt)) *(This is **not** the same thing as [NetworkTimeProtocol](/NetworkTimeProtocol))* |
| 14   |          | Unassigned                | Unassigned |
| 15   |          | Unassigned                | Was netstat |
| 16   |          | Unassigned                | Unassigned |
| 17   | TCP, UDP | qotd, quote               | [QuoteOfTheDayProtocol](/QuoteOfTheDayProtocol) ([RFC 865](http://www.ietf.org/rfc/rfc865.txt)) |
| 18   | TCP, UDP | msp                       | [MessageSendProtocol](/MessageSendProtocol) ([RFC 1159](http://www.ietf.org/rfc/rfc1159.txt), [RFC 1312](http://www.ietf.org/rfc/rfc1312.txt)) |
| 19   | TCP, UDP | chargen, ttytst, source   | [CharacterGeneratorProtocol](/CharacterGeneratorProtocol) ([RFC 864](http://www.ietf.org/rfc/rfc864.txt)) |
| 20   | TCP      | ftp-data                  | Default [FTP](/FTP) data port |
| 21   | TCP      | ftp                       | [FileTransferProtocol](/FileTransferProtocol) ([RFC 959](http://www.ietf.org/rfc/rfc959.txt)) |
| 22   | TCP      | ssh                       | [SecureShell](/SecureShell) ([draft](http://www.ietf.org/ids.by.wg/secsh.html)) |
| 23   | TCP      | telnet                    | [Telnet](/Telnet) ([RFC 854](http://www.ietf.org/rfc/rfc854.txt)) |
| 24   | TCP, UDP | Reserved                  | Any private mail system |
| 25   | TCP      | smtp                      | [SimpleMailTransferProtocol](/SimpleMailTransferProtocol) ([RFC 2821](http://www.ietf.org/rfc/rfc2821.txt)) |
| 26   |          | Unassigned                | Unassigned |
| 27   | TCP, UDP | nsw-fe                    | NSW User System FE |
| 28   |          | Unassigned                | Unassigned |
| 29   | TCP, UDP | msg-icp                   | MSG ICP |
| 30   |          | Unassigned                | Unassigned |
| 31   | TCP, UDP | msg-auth                  | MSG Authentication |
| 32   |          | Unassigned                | Unassigned |
| 33   | TCP, UDP | dsp                       | Display Support Protocol |
| 34   |          | Unassigned                | Unassigned |
| 35   | TCP, UDP | Reserved                  | Any private printer server |
| 36   |          | Unassigned                | Unassigned |
| 37   | TCP, UDP | time, timeserver          | [TimeProtocol](/TimeProtocol) ([RFC 868](http://www.ietf.org/rfc/rfc868.txt)) *(This is **not** the same thing as [NetworkTimeProtocol](/NetworkTimeProtocol))* |
| 38   | TCP, UDP | rap                       | [RouteAccessProtocol](/RouteAccessProtocol) ([RFC 1476](http://www.ietf.org/rfc/rfc1476.txt)) |
| 39   | UDP      | rlp                       | [ResourceLocationProtocol](/ResourceLocationProtocol) ([RFC 887](http://www.ietf.org/rfc/rfc887.txt)) |
| 40   |          | Unassigned                | Unassigned |
| 41   | TCP, UDP | grapics                   | Graphics |
| 42   | UDP      | nameserver                | Internet Name Server ([IEN 116](http://www.isi.edu/in-notes/ien/ien116.txt)) |
| 43   | TCP      | whois, nicname            | [WhoisProtocol](/WhoisProtocol) ([RFC 954](http://www.ietf.org/rfc/rfc954.txt)) |
| 44   | TCP, UDP | mpm-flags                 | MPM FLAGS Protocol |
| 45   | TCP, UDP | mpm                       | Message Processing Module \[recv\] |
| 46   | TCP, UDP | mpm-snd                   | MPM \[default send\] |
| 47   | TCP, UDP | ni-ftp                    | NI FTP |
| 48   | TCP, UDP | auditd                    | Digital Audit Daemon |
| 49   | TCP, UDP | tacacs                    | [TacacsProtocol](/TacacsProtocol) ([RFC 1492](http://www.ietf.org/rfc/rfc1492.txt)) |
| 50   | TCP, UDP | re-mail-ck                | Remote Mail Checking Protocol ([RFC 1339](http://www.ietf.org/rfc/rfc1492.txt)) |
| 51   | TCP, UDP | la-maint                  | IMP Logical Address Maintenance |
| 52   | TCP, UDP | xns-time                  | XNS Time Protocol |
| 53   | TCP, UDP | domain, nameserver        | [DomainNameSystem](/DomainNameSystem) ([many RFCs](http://www.dns.net/dnsrd/rfc/)) |
| 54   | TCP, UDP | xns-ch                    | XNS Clearinghouse |
| 55   | TCP, UDP | isi-gl                    | ISI Graphics Language |
| 56   | TCP, UDP | xns-auth                  | XNS Authentication |
| 57   | TCP, UDP | Reserved                  | Any private terminal access |
| 58   | TCP, UDP | xns-mail                  | XNS Mail |
| 59   | TCP, UDP | Reserved                  | Any private file service |
| 60   |          | Unassigned                | Unassigned |
| 61   | TCP, UDP | ni-mail                   | NI MAIL |
| 62   | TCP, UDP | acas                      | ACA Services <http://h18000.www1.hp.com/info/SP4708/SP4708PF.PDF> |
| 63   | TCP, UDP | whois++                   | WHOIS++ ([RFC 1835](http://www.ietf.org/rfc/rfc1835.txt)) |
| 64   | TCP, UDP | covia                     | Communications Integrator |
| 65   | TCP, UDP | tacacs-ds                 | TACACS Database Service |
| 66   | TCP, UDP | sql\*net                  | Oracle SQL\*Net |
| 67   | TCP, UDP | bootps                    | [BootstrapProtocol](/BootstrapProtocol) Server (often used by [DHCP](/DHCP)) |
| 68   | TCP, UDP | bootpc                    | [BootstrapProtocol](/BootstrapProtocol) Client (often used by [DHCP](/DHCP)) |
| 69   | TCP, UDP | tftp                      | [TrivialFileTransferProtocol](/TrivialFileTransferProtocol) ([RFC 1350](http://www.ietf.org/rfc/rfc1350.txt)) |
| 70   | TCP, UDP | gopher                    | [GopherProtocol](/GopherProtocol) ([RFC 1436](http://www.ietf.org/rfc/rfc1436.txt)) |
| 71   | TCP, UDP | netrjs-1                  | Remote Job Service |
| 72   | TCP, UDP | netrjs-2                  | Remote Job Service |
| 73   | TCP, UDP | netrjs-3                  | Remote Job Service |
| 74   | TCP, UDP | netrjs-4                  | Remote Job Service |
| 75   | TCP, UDP | Reserved                  | Any private dial out service |
| 76   | TCP, UDP | deos                      | Distributed External Object Store |
| 77   | TCP, UDP | Reserved                  | Any private RJE service |
| 78   | TCP, UDP | vettcp                    | vettcp |
| 79   | TCP, UDP | finger                    | [FingerProtocol](/FingerProtocol) ([RFC 1288](http://www.ietf.org/rfc/rfc1288.txt)) |
| 80   | TCP, UDP | www, http                 | [Hyper\_Text\_Transfer\_Protocol](/Hyper_Text_Transfer_Protocol) |
| 81   | TCP, UDP | hosts2-ns                 | HOSTS2 Name Server (More commonly used as an alternate HTTP port) |
| 82   | TCP, UDP | xfer                      | XFER Utility |
| 83   | TCP, UDP | mit-ml-dev                | MIT ML Device |
| 84   | TCP, UDP | ctf                       | Common Trace Facility |
| 85   | TCP, UDP | mit-ml-dev                | MIT ML Device |
| 86   | TCP, UDP | mfcobol                   | Micro Focus Cobol |
| 87   | TCP, UDP | Reserved                  | Any private terminal link |
| 88   | TCP, UDP | kerberos, kerberos5, krb5 | [KerberosProtocol](/KerberosProtocol) ([RFC 1510](http://www.ietf.org/rfc/rfc1510.txt) plus many [drafts](http://www.ietf.org/html.charters/krb-wg-charter.html)) |
| 89   | TCP, UDP | su-mit-tg                 | SU/MIT Telnet Gateway |
| 90   | TCP, UDP | dnsix                     | DNSIX Security Attribute Token Map (More commonly used by PointCast) |
| 91   | TCP, UDP | mit-dov                   | MIT Dover Spooler |
| 92   | TCP, UDP | npp                       | Network Printing Protocol ([RFC 1486](http://www.ietf.org/rfc/rfc1486.txt)?) |
| 93   | TCP, UDP | dcp                       | Device Control Protocol |
| 94   | TCP, UDP | objcall                   | Tivoli Object Dispatcher |
| 95   | TCP, UDP | supdup                    | SUPDUP |
| 96   | TCP, UDP | dixie                     | DIXIE Protocol Specification |
| 97   | TCP, UDP | swift-rvf                 | Swift Remote Virtural File Protocol |
| 98   | TCP, UDP | tacnews                   | TAC News |
| 99   | TCP, UDP | metagram                  | Metagram Relay |


---

Imported from https://wiki.wireshark.org/PortReference/Ports0to99 on 2020-08-11 23:18:02 UTC
