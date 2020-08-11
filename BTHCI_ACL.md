# Bluetooth Asynchronous Connectionless (bthci\_acl)

ACL frames are used to transfer non-realtime data between nodes in a [Bluetooth](/Bluetooth) network.

The purpose of ACL is to provide a connection between one node and another node(unicast) or a set or other nodes(multicast). ACL provides the mechanism to send large PDUs between the nodes by a fragmentation mechanism that supports transferring PDUs up to 64kbyte in size.

## Protocol dependencies

  - [HCI\_H4](/HCI_H4): BTHCI\_ACL is one of 4 [Bluetooth](/Bluetooth) frame types and are always encapsulated inside [HCI\_H4](/HCI_H4)

  - [BTL2CAP](/BTL2CAP): The only protocol running ontop of BTHCI\_ACL is L2CAP.

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

The BTHCI\_ACL dissector is fully functional and can reassemble fragmented PDUs.

## Preference Settings

There is a HCI\_ACL preference to control whether Wireshark shall reassemble PDUs spanning multiple fragments or not.

## Example capture file

  - [SampleCaptures/l2ping.cap](uploads/__moin_import__/attachments/SampleCaptures/l2ping.cap) (Linux BlueZ hcidump) Contains some [Bluetooth](/Bluetooth) packets captured using hcidump, the packets were from the l2ping command that's included with the Linux BlueZ stack.

  - [SampleCaptures/Bluetooth1.cap](uploads/__moin_import__/attachments/SampleCaptures/Bluetooth1.cap) (Linux BlueZ hcidump) Contains some [Bluetooth](/Bluetooth) packets captured using hcidump.

## Display Filter

A complete list of BTHCI\_ACK display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/b/bthci_acl.html)

Show only the BTHCI\_ACL based traffic:

``` 
 bthci_acl 
```

## Capture Filter

You cannot directly filter BTHCI\_ACL protocols while capturing since currently you cant capture at all.

## External links and Captures

See [Bluetooth](/Bluetooth) for example captures and links.

## Discussion

---

Imported from https://wiki.wireshark.org/BTHCI_ACL on 2020-08-11 23:11:38 UTC
