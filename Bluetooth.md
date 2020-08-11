# Bluetooth

Bluetooth is a family of protocols that are popular for building wireless accessories. A common use for Bluetooth is for connecting mobile phone accessories, but other applications also exist, such as wireless mice and keyboards for computers; some of the applications for Bluetooth are:

1.  Handsfree headsets for mobile phones - for phone calls (not for music)
2.  A2DP Headsets - for good quality music (often have support for phone calls too)
3.  Carkit - multiprofiles device to be used in your car (various functionality, for example: phone calls, SMS/MMS/Email notifications...)
4.  Low Energy Devices - healthly, proximity...
5.  HID devices - mice, keyboards, gamepads...
6.  Network Access Point (aka tethering) - provide internet connection to device or to other device
7.  Serial port - there is a possibility to use RFCOMM profile to pass any type of data using bluetooth
8.  File sharing through OBEX - used in phones, tablets, computers

## History

XXX - add a brief description of Bluetooth history

## Protocol dependencies

  - [HCI\_H4](/HCI_H4): This is not a protocol but more an encapsulation format that wireshark implements.

At the lowest layer implemented in Wireshark, Bluetooth consists of 4 different types of frames:

  - [BTHCI\_ACL](/BTHCI_ACL): Asynchronous Connectionless traffic. (data)

  - [BTHCI\_SCO](/BTHCI_SCO): Synchronous Connection Oriented traffic. (voice)

  - [BTHCI\_CMD](/BTHCI_CMD): Commands

  - [BTHCI\_EVT](/BTHCI_EVT): Events

## Example traffic

    No.     Time        Source                Destination           Protocol Info
         11 5.731294                                                L2CAP    Sent Echo Request
    
    Frame 11 (57 bytes on wire, 57 bytes captured)
    Bluetooth HCI H4 Sent ACL Data
        Direction: Sent (0x00)
        HCI Packet Type: ACL Data (0x02)
    Bluetooth HCI ACL Packet
        .... 0000 0010 1001 = Connection Handle: 0x0029
        ..10 .... .... .... = PB Flag: Start Fragment (2)
        00.. .... .... .... = BC Flag: Point-To-Point (0)
        Data Total Length: 52
    Bluetooth L2CAP Packet
        Length: 48
        CID: 0x0001
        Command: Echo Request
            Command Code: Echo Request (0x08)
            Command Identifier: 0xc8
            Command Length: 44

## Wireshark

The Bluetooth stack is partially implemented and Wireshark can dissect several of the layers and protocols of the stack.

There is a libpcap format defined for Bluetooth frames, and support in libpcap 1.0.0 and later for capturing on Bluetooth devices in Linux; Wireshark, if linked with that version of libpcap, is able to capture on Bluetooth devices. (In Linux distributions that come with pre-1.0.0 versions of libpcap, libpcap doesn't support capturing on Bluetooth devices, so you would have to get libpcap 1.0.0 or later from tcpdump.org, install it, and build Wireshark with that version of libpcap in order to capture on Bluetooth devices. As of 2009-01-27, Gentoo Linux has libpcap with Bluetooth support in its mainline repository (portage).) Wireshark can also read captures in that format.

The original pcap format didn't store whether the packet was being sent or received ([bug 1751](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=1751)). A newer file format includes the direction information as a 4-byte field where bit0 is set if the packet was 'received', see LINKTYPE\_BLUETOOTH\_HCI\_H4\_WITH\_PHDR at [LINK-LAYER HEADER TYPES](http://www.tcpdump.org/linktypes.html). Note that this field is big-endian even if the pcap file has been written in little-endian everywhere else ([Development/LibpcapFileFormat](/Development/LibpcapFileFormat)). The original format uses protocol id LINKTYPE\_BLUETOOTH\_HCI\_H4 and the new format uses LINKTYPE\_BLUETOOTH\_HCI\_H4\_WITH\_PHDR ([LINK-LAYER HEADER TYPES](http://www.tcpdump.org/linktypes.html)).

In addition, Wireshark can read capture files created by the HCIDUMP utility that is available with the Linux and (I think) the BSD Bluetooth stack, and can also read capture files from the macOS PacketLogger Bluetooth logger application. Other platforms that can create capture files include the following. The .NET library 32feet.NET produces libpcap captures when using the Stonestreet One Bluetopia stack on Windows Mobile, see the Diagnostics section in its documentation at [32feet.NET: Stonestreet One Bluetopia stack](http://32feet.codeplex.com/wikipage?title=Stonestreet%20One%20Bluetopia).

### Supported profiles and protocols

In version 1.10, Wireshark supports most Bluetooth profiles and protocols. The development version 1.11 (or later), is quite stable and can be used for Bluetooth purposes. It contains better Bluetooth support.

<div>

<table>

<tbody>

<tr>

<td>

**Profile/Protocol**

</div>

</td>

<td>

**Filter name**

</td>

</tr>

<tr>

<td>

Bluetooth HCI H1

</td>

<td>

hci\_h1

</td>

</tr>

<tr>

<td>

Bluetooth HCI H4

</td>

<td>

hci\_h4

</td>

</tr>

<tr>

<td>

Bluetooth HCI USB Transport

</td>

<td>

hci\_usb

</td>

</tr>

<tr>

<td>

Bluetooth Linux Monitor Transport

</td>

<td>

hci\_mon

</td>

</tr>

<tr>

<td>

Bluetooth 3DS Profile

</td>

<td>

bt3ds

</td>

</tr>

<tr>

<td>

Bluetooth AMP Packet

</td>

<td>

btamp

</td>

</tr>

<tr>

<td>

Bluetooth Attribute Protocol

</td>

<td>

btatt

</td>

</tr>

<tr>

<td>

Bluetooth AVCTP Protocol

</td>

<td>

btavctp

</td>

</tr>

<tr>

<td>

Bluetooth AVDTP Protocol

</td>

<td>

btavdtp

</td>

</tr>

<tr>

<td>

Bluetooth A2DP Profile

</td>

<td>

bta2dp

</td>

</tr>

<tr>

<td>

Bluetooth VDP Profile

</td>

<td>

btvdp

</td>

</tr>

<tr>

<td>

Bluetooth AVRCP Profile

</td>

<td>

btavrcp

</td>

</tr>

<tr>

<td>

Bluetooth BNEP Protocol

</td>

<td>

btbnep

</td>

</tr>

<tr>

<td>

Bluetooth HCI ACL Packet

</td>

<td>

bthci\_acl

</td>

</tr>

<tr>

<td>

Bluetooth HCI Command

</td>

<td>

bthci\_cmd

</td>

</tr>

<tr>

<td>

Bluetooth HCI Event

</td>

<td>

bthci\_evt

</td>

</tr>

<tr>

<td>

Bluetooth HCI SCO Packet

</td>

<td>

bthci\_sco

</td>

</tr>

<tr>

<td>

Bluetooth HCRP Profile

</td>

<td>

bthcrp

</td>

</tr>

<tr>

<td>

Bluetooth HFP Profile

</td>

<td>

bthfp

</td>

</tr>

<tr>

<td>

Bluetooth HID Profile

</td>

<td>

bthid

</td>

</tr>

<tr>

<td>

Bluetooth HSP Profile

</td>

<td>

bthsp

</td>

</tr>

<tr>

<td>

Bluetooth L2CAP Protocol

</td>

<td>

btl2cap

</td>

</tr>

<tr>

<td>

Bluetooth Low Energy Link Layer

</td>

<td>

btle

</td>

</tr>

<tr>

<td>

Bluetooth Low Energy RF Info

</td>

<td>

btle\_rf

</td>

</tr>

<tr>

<td>

Bluetooth MCAP Protocol

</td>

<td>

btmcap

</td>

</tr>

<tr>

<td>

Bluetooth OBEX Protocol

</td>

<td>

btobex

</td>

</tr>

<tr>

<td>

Bluetooth RFCOMM Protocol

</td>

<td>

btrfcomm

</td>

</tr>

<tr>

<td>

Bluetooth DUN Packet

</td>

<td>

btdun

</td>

</tr>

<tr>

<td>

Bluetooth SPP Packet

</td>

<td>

btspp

</td>

</tr>

<tr>

<td>

Bluetooth GNSS Profile

</td>

<td>

btgnss

</td>

</tr>

<tr>

<td>

Bluetooth SAP Profile

</td>

<td>

btsap

</td>

</tr>

<tr>

<td>

Bluetooth SDP Protocol

</td>

<td>

btsdp

</td>

</tr>

<tr>

<td>

Bluetooth Security Manager Protocol

</td>

<td>

btsmp

</td>

</tr>

<tr>

<td colspan="2" style="text-align: center">

**Related dissectors**

</td>

</tr>

<tr>

<td>

Bluetooth Common

</td>

<td>

btcommon

</td>

</tr>

<tr>

<td>

Bluetooth SBC Codec

</td>

<td>

sbc

</td>

</tr>

<tr>

<td>

APT-X Codec

</td>

<td>

aptx

</td>

</tr>

<tr>

<td>

Bluetooth A2DP Content Protection Header SCMS-T

</td>

<td>

bta2dp\_content\_protection\_header\_scms\_t

</td>

</tr>

<tr>

<td>

Bluetooth VDP Content Protection Header SCMS-T

</td>

<td>

btvdp\_content\_protection\_header\_scms\_t

</td>

</tr>

<tr>

<td>

Ubertooth

</td>

<td>

ubertooth

</td>

</tr>

</tbody>

</table>

</div>

## Example capture file

  - [SampleCaptures/l2ping.cap](uploads/__moin_import__/attachments/SampleCaptures/l2ping.cap) (Linux BlueZ hcidump) Contains some [Bluetooth](/Bluetooth) packets captured using hcidump, the packets were from the l2ping command that's included with the Linux BlueZ stack.

  - [SampleCaptures/Bluetooth1.cap](uploads/__moin_import__/attachments/SampleCaptures/Bluetooth1.cap) (Linux BlueZ hcidump) Contains some [Bluetooth](/Bluetooth) packets captured using hcidump.

  - [tcpdumpBluetooth.pcap](uploads/__moin_import__/attachments/Bluetooth/tcpdumpBluetooth.pcap) (libpcap) Capture created by the [Bluetooth](/Bluetooth)-sniffing feature in the latest libpcap/tcpdump CVS.

## External links

  - <https://www.bluetooth.com/specifications> Specifications

  - <https://www.bluetooth.com> the Official Bluetooth Membership Site

  - <http://www.bluetooth.com/bluetooth/> The Official Bluetooth Wireless Info Site

  - <http://en.wikipedia.org/wiki/Bluetooth> A very good Wikipedia article about Bluetooth

  - <http://www.bluez.org/> Linux Bluetooth implementation

---

Imported from https://wiki.wireshark.org/Bluetooth on 2020-08-11 23:11:34 UTC
