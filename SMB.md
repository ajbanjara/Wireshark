# Server Message Block Protocol (SMB)

The Server Message Block protocol, or "SMB", is a remote file access protocol originally specified by Microsoft, IBM, and Intel. It's also referred to as the Common Internet File System, or "CIFS". It's one of the protocols most commonly used by DOS and Windows machines to access files on a file server.

Current versions of Windows, and some older versions of Windows, include both client and server code for SMB/CIFS; clients and servers were also available for older versions of DOS and Windows, and for OS/2. The [Samba](http://www.samba.org/) server is the most commonly used SMB/CIFS server on UN\*X systems; Linux, FreeBSD, and macOS include clients for SMB/CIFS allowing those systems to access files on SMB/CIFS servers as if they were local files.

Originally, it ran atop a protocol, sometimes called ["NetBEUI"](/NetBIOS/NetBIOS), that ran atop IEEE 802.2; that protocol implemented a networking API from IBM, and [the IBM "LAN Technical Reference: 802.2 and NetBIOS APIs document"](http://publibz.boulder.ibm.com/cgi-bin/bookmgr_OS390/BOOKS/BK8P7001/CCONTENTS) specifies the APIs and the protocol.

Specifications for implementations of the [NetBIOS](/NetBIOS) services, which are what the NetBEUI protocol implemented, also exist for UDP and TCP; the specifications for that are in [RFC 1001](http://www.ietf.org/rfc/rfc1001.txt) and [RFC 1002](http://www.ietf.org/rfc/rfc1002.txt), and the protocols specified by that are the NetBIOS Name Service ([NBNS](/NetBIOS/NBNS)), NetBIOS Datagram Service ([NBDS](/NetBIOS/NBDS)), and the NetBIOS Session Service ([NBSS](/NetBIOS/NBSS)) protocols. NetBIOS-over-TCP is probably now the most common form of NetBIOS used by SMB. Specifications for SMB over the MAP/TOP protocol suite, based on the [IsoProtocolFamily](/IsoProtocolFamily), also exist. NetBIOS is also supported in at least two forms over the [NovellProtocolFamily](/NovellProtocolFamily).

SMB can now run directly atop [TCP](/TCP) port 445, without using any of the NetBIOS services (other than a vestigial version of the session service, simplified to only provide packet boundaries over a TCP data stream). Windows 2000 might have been the first version of Windows to implement this.

At least at one point, a number of specifications for various dialects of SMB could be found in [a directory on the Microsoft FTP site](ftp://ftp.microsoft.com/developr/drg/CIFS). The closest thing to an "official" specification for the current version of SMB/CIFS is [the SNIA Common Internet File System Technical Reference](http://www.snia.org/tech_activities/CIFS/), but that doesn't describe all the protocol features used by Microsoft clients and supported by Microsoft servers.

## External Links

  - [Implementing CIFS: The Common Internet File System](http://ubiqx.org/cifs/Book.html) by Christopher Hertel

  - [Using Wireshark For Analysing CIFS Traffic](http://www.snia.org/sites/default/files2/sdc_archives/2008_presentations/monday/RonnieSahlberg_UsingWireshark.pdf) by Ronnie Sahlberg (at Storage Developer Conference 2008)

## Example Capture

Here is an [example capture](uploads/__moin_import__/attachments/SampleCaptures/smbtorture.cap.gz "example capture") showing a wide range of SMB features. The capture was made using the Samba4 smbtorture suite, against a Windows Vista beta2 server

## Open Questions

There is quite a bit we don't know about the SMB protocol. You can see a list of some of these open questions on the [SMB/OpenQuestions](/SMB/OpenQuestions) page.

---

Imported from https://wiki.wireshark.org/SMB on 2020-08-11 23:24:49 UTC
