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

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>bit offset</strong></p></td>
<td><p><strong>Purpose</strong></p></td>
</tr>
<tr class="even">
<td><p>0-7</p></td>
<td><p>Version (will be 1)</p></td>
</tr>
<tr class="odd">
<td><p>8-23</p></td>
<td><p>Sequence number</p></td>
</tr>
<tr class="even">
<td><p>24-55</p></td>
<td><p>Total length of message</p></td>
</tr>
<tr class="odd">
<td><p>56-71</p></td>
<td><p>unknown field</p></td>
</tr>
</tbody>
</table>

</div>

After this you get some variable data. In the example packet, we receive measure request. Offsets relative to header.

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>bit offset</strong></p></td>
<td><p><strong>Purpose</strong></p></td>
</tr>
<tr class="even">
<td><p>0-15</p></td>
<td><p>Message type</p></td>
</tr>
<tr class="odd">
<td><p>16-31</p></td>
<td><p>Message length</p></td>
</tr>
<tr class="even">
<td><p>32-39</p></td>
<td><p>Unknown</p></td>
</tr>
<tr class="odd">
<td><p>40-71</p></td>
<td><p>Target IPv4 address</p></td>
</tr>
<tr class="even">
<td><p>72-87</p></td>
<td><p>Target port</p></td>
</tr>
<tr class="odd">
<td><p>88-111</p></td>
<td><p>Unknown data</p></td>
</tr>
</tbody>
</table>

</div>

At the moment it would seem that, depending on something, you send either the received message back, as is, or you send 010f00080000000000000000 back to the other station. It is unclear when to do which.

### Measurement packets

For message type 4, there are two kinds of measures. Either millisecond or microsecond resolution measurement. The microsecond packet is yet to be analysed, but millisecond message format is as of follows:

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>bit offset</strong></p></td>
<td><p><strong>Purpose</strong></p></td>
</tr>
<tr class="even">
<td><p>0-15</p></td>
<td><p>Message type</p></td>
</tr>
<tr class="odd">
<td><p>16-31</p></td>
<td><p>Flags (we have observed values 00 02, 00 04, 00 06, 00 0d)</p></td>
</tr>
<tr class="even">
<td><p>32-63</p></td>
<td><p>4 byte value, milliseconds from midnight, UTC. Sender sets this</p></td>
</tr>
<tr class="odd">
<td><p>64-95</p></td>
<td><p>4 byte value, milliseconds from midnight, UTC. Responder sets this</p></td>
</tr>
<tr class="even">
<td><p>96-111</p></td>
<td><p>Sender sequence number</p></td>
</tr>
<tr class="odd">
<td><p>112-127</p></td>
<td><p>Responder sequence number (copied from sender)</p></td>
</tr>
<tr class="even">
<td><p>128-255</p></td>
<td><p>Payload</p></td>
</tr>
</tbody>
</table>

</div>

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
