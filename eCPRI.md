# evolved Common Public Radio Interface (eCPRI)

evolved Common Public Radio Interface (eCPRI) is a protocol, which will be used in fronthaul transport network. It will be included in standard [Ethernet](/Ethernet) frames and [UDP](/UDP) frames. There are 8 Message Types to decode with [eCPRI Specification V1.2](http://www.cpri.info/downloads/eCPRI_v_1_2_2018_06_25.pdf).

## Packet format

<div>

<table>

<tbody>

<tr>

<td colspan="32" style="text-align: center">

eCPRI Common Header

</div>

</td>

<td colspan="1" rowspan="2" style="text-align: center">

eCPRI Payload

</td>

</tr>

<tr>

<td colspan="4" style="text-align: center">

eCPRI Protocol Revision

</td>

<td colspan="3" style="text-align: center">

Reserved

</td>

<td>

C

</td>

<td colspan="8" style="text-align: center">

eCPRI Message Type

</td>

<td colspan="16" style="text-align: center">

eCPRI Payload Size

</td>

</tr>

<tr>

<td colspan="4" style="text-align: center">

4 Bit

</td>

<td colspan="3" style="text-align: center">

3 Bit

</td>

<td>

1 Bit

</td>

<td colspan="8" style="text-align: center">

8 Bit = 1 Byte

</td>

<td colspan="16" style="text-align: center">

16 Bit = 2 Bytes

</td>

<td>

0 - 65535 Bytes

</td>

</tr>

</tbody>

</table>

</div>

### eCPRI Header fields

#### eCPRI Protocol Revision field

Available revison values:

<div>

<table>
<tbody>
<tr class="odd">
<td><p>0x1</p></td>
<td><p>shall follow specification V1.0</p></td>
</tr>
<tr class="even">
<td><p>0x2-0xF</p></td>
<td><p>reserved for future; temporarily vendor specific</p></td>
</tr>
</tbody>
</table>

</div>

#### Reserved field

Reserved field should be filled with 000b.

#### C field

The C field indicates a concatenation.

  - If C = 0, then is this the last eCPRI Message inside the eCPRI PDU.
  - If C = 1, then another eCPRI Message follows within the same PDU. Between this two messages are padding bits (0-3). The new message starts at a 4-Byte boundary.

#### eCPRI Message Type field

There are 255 Message Types. 0 - 7 is specified in the Specification, 8 - 63 is reserved and 64 - 255 vendor specific.

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Message Type</strong></p></td>
<td><p><strong>Name</strong></p></td>
</tr>
<tr class="even">
<td><p>0x00</p></td>
<td><p>IQ Data</p></td>
</tr>
<tr class="odd">
<td><p>0x01</p></td>
<td><p>Bit Sequence</p></td>
</tr>
<tr class="even">
<td><p>0x02</p></td>
<td><p>Real-Time Control Data</p></td>
</tr>
<tr class="odd">
<td><p>0x03</p></td>
<td><p>Generic Data Transfer</p></td>
</tr>
<tr class="even">
<td><p>0x04</p></td>
<td><p>Remote Memory Access</p></td>
</tr>
<tr class="odd">
<td><p>0x05</p></td>
<td><p>One-way Delay Measurement</p></td>
</tr>
<tr class="even">
<td><p>0x06</p></td>
<td><p>Remote Reset</p></td>
</tr>
<tr class="odd">
<td><p>0x07</p></td>
<td><p>Event Indication</p></td>
</tr>
<tr class="even">
<td><p>0x08 - 0x3F</p></td>
<td><p>Reserved</p></td>
</tr>
<tr class="odd">
<td><p>0x40 - 0xFF</p></td>
<td><p>Vendor Specific</p></td>
</tr>
</tbody>
</table>

</div>

#### eCPRI Payload Size field

It's the size of following payload. The eCPRI Payload doesn't include any padding bytes. The maximum payload size is 65535, but is limited by the transport network, e.g. [Ethernet](/Ethernet).

### eCPRI Payload field

The eCPRI Payload field depends on the message type used. See more in Specification.

## History

It starts with [CPRI](/CPRI) and with upcoming [5G](/5G) a new protocol was needed.

  - In August 2017 eCPRI Specification V1.0 was released.
  - In January 2018 eCPRI Specification V1.1 was released.
  - In June 2018 eCPRI Specification V1.2 (latest version) was released.

You find the latest versions [here](http://www.cpri.info/spec.html)

## Protocol dependencies

  - [Ethernet](/Ethernet): eCPRI uses [Ethernet](/Ethernet) with the Ethertype 0xAEFE

  - [UDP](/UDP): eCPRI uses [UDP](/UDP) as its transport protocol

## Example traffic

The example shows an eCPRI tree with Message Type 5 in wireshark.

    evolved Common Public Radio Interface
        eCPRI Common Header: 0x1005002a
            0001 .... = Protocol Revision: 1
            .... 000. = Reserved: 0
            .... ...0 = C-Bit: 0
            Message Type: One-Way Delay Measurement (0x05)
            Payload Size: 42
        eCPRI Payload: 11:00:00:00:45:b1:11:49:1c:41:78:f4:00:00:00:00:…
            Measurement ID: 0x11
            Action Type: Request (0x00)
            Time Stamp: 00:00:45:b1:11:49:1c:41:78:f4
                Seconds: 1169232201s
                Nanoseconds: 474052852ns
            Compensation Value: 12025856 = 183.500000ns
            User Data: dd:dd:dd:dd:dd:dd:dd:dd:dd:dd:dd:dd:dd:dd:dd:dd:…

## Wireshark

The eCPRI dissector is in Development Release 3.1.0 and fully functional with the latest packet format.

## Preference Settings

(XXX add links to preference settings affecting how PROTO is dissected).

## Example capture file

  - [SampleCaptures/ecpri.pcap](uploads/__moin_import__/attachments/SampleCaptures/ecpri.pcap)

## Display Filter

A complete list of eCPRI display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/protofirstletter/ecpri.html)

Show only the eCPRI based traffic:

``` 
 ecpri
```

Show only the eCPRI-messages with Message Type 0x00 (IQ Data):

``` 
 ecpri.type == 0x00 
```

## Capture Filter

Capture only the eCPRI based traffic:

``` 
 ecpri
```

## External links

  - [eCPRI](http://www.cpri.info/downloads/eCPRI_v_1_2_2018_06_25.pdf) *eCPRI Specification V1.2*

## Discussion

---

Imported from https://wiki.wireshark.org/eCPRI on 2020-08-11 23:13:43 UTC
