Oracle apparently has several inter-related protocols used for sending SQL over the wire. Wireshark at one point had a short dissector for a small subset of these, but the code was very buggy and without a protocol reference there was little we could do with it.

See mailing list discussion: <https://www.wireshark.org/lists/wireshark-dev/201303/msg00161.html>

The old dissector is attached below for reference: it may be useful when reverse-engineering the protocol, but should not be used as-is in any way -- the code style is terrible and buggy:

  - [Old SQL-Oracle Dissector](uploads/__moin_import__/attachments/Oracle/Old-SQL-Oracle-Dissector)

  - [Old SQL-Oracle Dissector Header](uploads/__moin_import__/attachments/Oracle/Old-SQL-Oracle-Dissector-Header)

Also perhaps worth noting: [PortReference/Ports0to99](/PortReference/Ports0to99) lists **Oracle SQL\*Net** on TCP/UDP port 66.

---

Imported from https://wiki.wireshark.org/Oracle on 2020-08-11 23:17:43 UTC
