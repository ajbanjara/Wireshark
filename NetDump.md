# NetDump

Netdump is a simple protocol running over UDP which is used to transport kernel core memory images to a remote server during a crash. It is used primarily in systems including and prior to Red Hat Enterprise Linux 4, although several other distributions have made use of the protocol.

## History

Used prior to the advent of kexec technology, NetDump has been used to capture kernel core memory images remotely during a system crash, for post-mortem analysis

## Protocol dependencies

  - [UDP](/UDP)

## Example traffic

Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The NetDump dissector is fully functional. Nominally NetDump runs over UDP port 6666, which conflicts with the [SigComp](/SigComp) protocol, so manual specification to wireshark to decode frames as NetDump data is required when using this dissector.

## Example capture file

  - [SampleCaptures/NetDump.pcap](uploads/__moin_import__/attachments/SampleCaptures/NetDump.pcap)

## External links

  - <http://www.redhat.com/support/wpapers/redhat/netdump/>

---

Imported from https://wiki.wireshark.org/NetDump on 2020-08-11 23:17:14 UTC
