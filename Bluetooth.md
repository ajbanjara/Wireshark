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

| Profile/Protocol                                | Filter name                               |
|-------------------------------------------------|-------------------------------------------|
| Bluetooth HCI H1                                | `hci_h1`                                  |
| Bluetooth HCI H4                                | `hci_h4`                                  |
| Bluetooth HCI USB Transport                     | `hci_usb`                                 |
| Bluetooth Linux Monitor Transport               | `hci_mon`                                 |
| Bluetooth 3DS Profile                           | `bt3ds`                                   |
| Bluetooth AMP Packet                            | `btamp`                                   |
| Bluetooth Attribute Protocol                    | `btatt`                                   |
| Bluetooth AVCTP Protocol                        | `btavctp`                                 |
| Bluetooth AVDTP Protocol                        | `btavdtp`                                 |
| Bluetooth A2DP Profile                          | `bta2dp`                                  |
| Bluetooth VDP Profile                           | `btvdp`                                   |
| Bluetooth AVRCP Profile                         | `btavrcp`                                 |
| Bluetooth BNEP Protocol                         | `btbnep`                                  |
| Bluetooth HCI ACL Packet                        | `bthci_acl`                               |
| Bluetooth HCI Command                           | `bthci_cmd`                               |
| Bluetooth HCI Event                             | `bthci_evt`                               |
| Bluetooth HCI SCO Packet                        | `bthci_sco`                               |
| Bluetooth HCRP Profile                          | `bthcrp`                                  |
| Bluetooth HFP Profile                           | `bthfp`                                   |
| Bluetooth HID Profile                           | `bthid`                                   |
| Bluetooth HSP Profile                           | `bthsp`                                   |
| Bluetooth L2CAP Protocol                        | `btl2cap`                                 |
| Bluetooth Low Energy Link Layer                 | `btle`                                    |
| Bluetooth Low Energy RF Info                    | `btle_rf`                                 |
| Bluetooth MCAP Protocol                         | `btmcap`                                  |
| Bluetooth OBEX Protocol                         | `btobex`                                  |
| Bluetooth RFCOMM Protocol                       | `btrfcomm`                                |
| Bluetooth DUN Packet                            | `btdun`                                   |
| Bluetooth SPP Packet                            | `btspp`                                   |
| Bluetooth GNSS Profile                          | `btgnss`                                  |
| Bluetooth SAP Profile                           | `btsap`                                   |
| Bluetooth SDP Protocol                          | `btsdp`                                   |
| Bluetooth Security Manager Protocol             | `btsmp`                                   |

| Related dissectors                              | Filter name                               |
|-------------------------------------------------|-------------------------------------------|
| Bluetooth Common                                | `btcommon`                                |
| Bluetooth SBC Codec                             | `sbc`                                     |
| APT-X Codec                                     | `aptx`                                    |
| Bluetooth A2DP Content Protection Header SCMS-T | `bta2dp_content_protection_header_scms_t` |
| Bluetooth VDP Content Protection Header SCMS-T  | `btvdp_content_protection_header_scms_t`  |
| Ubertooth                                       | `ubertooth`                               |

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
