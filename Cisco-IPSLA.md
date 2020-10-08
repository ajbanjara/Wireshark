# Cisco IP SLA 2 (message version 1) (Cisco IPSLA)

This protocol is used by cisco to measure latency and jitter between two devices. It is Cisco proprietary protocol, and not all aspects are yet fully reverse engineered. NB\! Most of this is some level of guesswork based on Cisco SLA RFC draft and some trial runs when testing things out.

## Protocol dependencies

  - [UDP](/UDP): Uses 1967/udp for control traffic

## Example traffic

### Initiating

A 52 byte long control package is sent to port 1967/udp which initiates the IP SLA session for jitter and latency measure for udp port 4243 on destination 213.157.91.235.

``` 
  Header = 01:0f:00:34:00:00:00:00:00
  Measure = 04:00:10:00:00:00:00:d5:9d:5b:eb:10:93:14:50:00
  Unknown data = 01:00:1c:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00
```

This can be dissected into following fields:

| Bit Offset | Purpose                 |
| :--------: | ----------------------- |
| 0-7        | Version (will be 1)     |
| 8-23       | Sequence number         |
| 24-55      | Total length of message |
| 56-71      | unknown field           |


After this you get some variable data. In the example packet, we receive measure request. Offsets relative to header.


| Bit Offset | Purpose             |
| :--------: | ------------------- |
| 0-15       | Message type        |
| 16-31      | Message length      |
| 32-39      | Unknown             |
| 40-71      | Target IPv4 address |
| 72-87      | Target port         |
| 88-111     | Unknown data        |


At the moment it would seem that, depending on something, you send either the received message back, as is, or you send 010f00080000000000000000 back to the other station. It is unclear when to do which.

### Measurement packets

For message type 4, there are two kinds of measures. Either millisecond or microsecond resolution measurement. The microsecond packet is yet to be analysed, but millisecond message format is as of follows:

| Bit Offset | Purpose                                                            |
| :--------: | ------------------------------------------------------------------ |
| 0-15       | Message type                                                       |
| 16-31      | Flags (we have observed values 00 02, 00 04, 00 06, 00 0d)         |
| 32-63      | 4 byte value, milliseconds from midnight, UTC. Sender sets this    |
| 64-95      | 4 byte value, milliseconds from midnight, UTC. Responder sets this |
| 96-111     | Sender sequence number                                             |
| 112-127    | Responder sequence number (copied from sender)                     |
| 128-255    | Payload                                                            |


Example request:

    00:02:00:00:03:94:51:d6:00:00:00:00:00:01:00:00:ab:cd:ab:cd:ab:cd:ab:cd:ab:cd:ab:cd:ab:cd:ab:cd

Example response:

    00:02:00:00:03:94:51:d6:03:94:4d:90:00:01:00:01:ab:cd:ab:cd:ab:cd:ab:cd:ab:cd:ab:cd:ab:cd:ab:cd

## Wireshark

There is currently no dissector for this protocol.

## Example capture file

Example of millisecond resolution jitter measure between two stations:

  - [SampleCaptures/Cisco-IPSLA.pcap](uploads/__moin_import__/attachments/SampleCaptures/Cisco-IPSLA.pcap)

## Discussion

---

Imported from https://wiki.wireshark.org/Cisco-IPSLA on 2020-08-11 23:12:16 UTC
