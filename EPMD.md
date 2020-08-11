# Erlang Port Mapper Daemon (EPMD)

EPMD (Erlang Port Mapper Daemon) messages are the messages sent between Erlang nodes and the empd process. The message formats are derived from the \* lib/kernel/src/erl\_epmd.\* files as part of the Erlang distribution available from <http://www.erlang.org/>

Erlang is a functional programming language.

## Protocol dependencies

  - [TCP](/TCP): Typically, EPMD uses [TCP](/TCP) as its transport protocol. The well known TCP port for EPMD traffic is 4369.

## Wireshark

The EPMD dissector is fully functional, except that the names part of the Names message are not dissected. The dissector uses a simple heuristic to decide if a packet is really an EPMD message: it tries to find the message type code at the correct byte in the message.

## Example capture file

  - [SampleCaptures/epmd.pcap](uploads/__moin_import__/attachments/SampleCaptures/epmd.pcap)

## Display Filter

A complete list of EPMD display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/e/epmd.html)

---

Imported from https://wiki.wireshark.org/EPMD on 2020-08-11 23:13:48 UTC
