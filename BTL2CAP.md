# Bluetooth Logical Link Control and Adaptation Protocol (btl2cap)

BTL2CAP is a protocol that sits directly ontop of [BTHCI\_ACL](/BTHCI_ACL) and which prodives signalling and sessions between applications on two [Bluetooth](/Bluetooth) devices.

## Protocol dependencies

  - [BTHCI\_ACL](/BTHCI_ACL): BTL2CAP is always transported ontop of ACL.

Some protocols implemented ontop of BTL2CAP are. These protocols are called "profiles"

  - [BTSDP](/BTSDP): [Bluetooth](/Bluetooth) Service Discovery Protocol.

  - [RFCOMM](/RFCOMM): Serial port profile ontop of which PPP and other serial port protocols may be transported.

  - [BNEP](/BNEP): Profile for transporting [Ethernet](/Ethernet) frames ontop of [Bluetooth](/Bluetooth).

## Example traffic

    No.     Time        Source                Destination           Protocol Info
         77 146.955458                                              SDP      Rcvd SDP_ServiceSearchAttributeRequest
    
    Frame 77 (13 bytes on wire, 13 bytes captured)
    Bluetooth HCI H4 Rcvd ACL Data
    Bluetooth HCI ACL Packet
        .... 0000 0010 1010 = Connection Handle: 0x002a
        ..01 .... .... .... = PB Flag: Continuing Fragment (1)
        00.. .... .... .... = BC Flag: Point-To-Point (0)
        Data Total Length: 8
        This is a continuation to the PDU in frame: 76
    Bluetooth L2CAP Packet
        Length: 21
        CID: 0x0040
        PSM: SDP (0x0001)
    Bluetooth SDP: SDP_ServiceSearchAttributeRequest (0x6)
        PDU: SDP_ServiceSearchAttributeRequest (0x06)
        TransactionID: 0x0001
        ParameterLength: 16
        ServiceSearchPattern UUID:Headset (0x1108)
            Headset(0x1108)
        MaximumAttributeByteCount: 672
        AttributeIDList
            0x0000 - 0xffff
        ContinuationState

## Wireshark

The BTL2CAP dissector is fully functional and supports fragment reassembly through the [BTHCI\_ACL](/BTHCI_ACL) layer.

## Preference Settings

There are no preference settings for BTL2CAP.

## Example capture file

  - [SampleCaptures/l2ping.cap](uploads/__moin_import__/attachments/SampleCaptures/l2ping.cap) (Linux BlueZ hcidump) Contains some [Bluetooth](/Bluetooth) packets captured using hcidump, the packets were from the l2ping command that's included with the Linux BlueZ stack.

  - [SampleCaptures/Bluetooth1.cap](uploads/__moin_import__/attachments/SampleCaptures/Bluetooth1.cap) (Linux BlueZ hcidump) Contains some [Bluetooth](/Bluetooth) packets captured using hcidump.

## Display Filter

A complete list of BTL2CAP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/b/btl2cap.html)

Show only the PROTO based traffic:

``` 
 btl2cap 
```

## Capture Filter

You cannot directly filter BTL2CAP protocols during capturing since captureing is not yet possible.

## External links

See [Bluetooth](/Bluetooth) for example captures and links.

## Discussion

---

Imported from https://wiki.wireshark.org/BTL2CAP on 2020-08-11 23:11:39 UTC
