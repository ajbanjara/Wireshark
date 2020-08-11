# Microsoft Exchange New Mail Notification (NEWMAIL)

Microsoft Exchange e-mail servers use a protocol that Wireshark refers to as "NEWMAIL" to notify clients (such as Microsoft Outlook) that their mailbox has received a new e-mail message. The port is dynamically chosen by the client when logging in to the e-mail server and is transmitted in a MAPI Register Push Notification (mapi.opnum == 4) packet. Because the port is dynamically chosen, your packet capture must include the MAPI Register Push Notification packet in order to tie the newmail dissector to packets on that port. If you do not have the beginning of the connection in your capture file, you can right-click on the packet and choose "Decode As" and pick NEWMAIL from the list. NEWMAIL packets are always 8 bytes long with a destination UDP port \> 1023.

## Protocol dependencies

  - [UDP](/UDP): NEWMAIL uses [UDP](/UDP) as its transport protocol. The port is dynamically chosen by each client at start time. This port can be hard coded on the client system by changing the registry (see external links at the bottom of this page for details).

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The NEWMAIL dissector is partially functional. The notification payload in the packets is displayed, but there is no public documentation that explains what the data stands for.

## Preference Settings

The newmail protocol has one preference setting in Wireshark:

  - **Default UDP port (optional)** This setting allows you to specify a default port to dissect as newmail traffic. This is useful if you have modified the registry of client machines (see external links section below) to use a specific port for new mail notifications. If this port is not specified, then it will be determined dynamically through the MAPI Register Push Notification (mapi.opnum == 4) packet.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/PROTO.pcap](uploads/__moin_import__/attachments/SampleCaptures/PROTO.pcap)

## External links

  - <http://support.microsoft.com/kb/264035/> *Microsoft KB \#264035* - Explains how to modify the Windows registry to use a static notification port

## Discussion

---

Imported from https://wiki.wireshark.org/NEWMAIL on 2020-08-11 23:17:24 UTC
