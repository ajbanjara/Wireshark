# PostgreSQL v3 Frontend/Backend Protocol (pgsql)

PostgreSQL versions 7.4 and above use this protocol for communications between the frontend (clients) and the backend (servers).

## History

...

## Protocol dependencies

  - PostgreSQL uses TCP port 5432 by default.

## Example traffic

...

## Wireshark

  - Abhijit Menon-Sen wrote a complete v3 dissector: <http://www.oryx.com/ams/packet-pgsql.c> ; this dissector has been checked into Wireshark. You can see the current source [here](http://anonsvn.wireshark.org/viewvc/index.py/trunk/epan/dissectors/packet-pgsql.c).

## Example capture files

  - [SampleCaptures/pgsql.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/pgsql.cap.gz)

  - [SampleCaptures/pgsql-jdbc.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/pgsql-jdbc.pcap.gz)

## Display Filter

...

## Capture Filter

...

## External links

  - <http://www.postgresql.org/docs/current/static/protocol.html>

## Discussion

This page was made in haste, and is thus incomplete. I intend to fill it in later. -- AMS, 20041220

---

Imported from https://wiki.wireshark.org/PostgresProtocol on 2020-08-11 23:18:15 UTC
