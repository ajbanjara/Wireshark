# Signalling System 7

For a definition of SS7, see: <http://en.wikipedia.org/wiki/SS7>

For more information on the use of SS7 in mobile telephony, check the [GSM](/GSM) standards/specifications.

## Capturing SS7 traffic in Wireshark

SS7 protocols are usually transported in two ways: via IP ([SIGTRAN](/SIGTRAN)) or via TDM links (E1/T1/T3/J1).

To capture SS7-over-IP, just capture on the appropriate network adapter; Wireshark supports the majority of SIGTRAN protocols used to transport SS7 over IP - SCTP, M2UA, M3UA, SUA - so capturing SS7 over IP is done the same way that as any other IP protocol capture is done.

To capture SS7-over-TDM, you would need special hardware and a version of libpcap/WinPcap modified to support that hardware. See the [CaptureSetup/SS7](/CaptureSetup/SS7) page for details.

## SS7 protocols

The SS7 stack consists of a group of related protocols:

<div>

<table>

<tbody>

<tr>

<td colspan="1" rowspan="4" style="background-color: #D0FFD0; text-align: center">

[ISUP](/ISUP)

</div>

</td>

<td colspan="1" rowspan="4" style="background-color: #D0FFD0; text-align: center">

[ALCAP](/ALCAP)

</td>

<td colspan="1" rowspan="4" style="background-color: #D0FFD0; text-align: center">

[H248](/H248)

</td>

<td colspan="1" rowspan="2" style="background-color: #D0FFD0; text-align: center">

[BSSAP](/BSSAP)

</td>

<td colspan="1" rowspan="2" style="background-color: #D0FFD0; text-align: center">

[RANAP](/RANAP)

</td>

<td style="background-color: #D0FFD0">

[MAP](/MAP)

</td>

<td style="background-color: #D0FFD0">

[INAP](/INAP)

</td>

<td style="background-color: #D0FFD0">

[CAMEL](/CAMEL)

</td>

</tr>

<tr>

<td colspan="3" style="background-color: #D0D0FF">

[TCAP](/TCAP)

</td>

</tr>

<tr>

<td colspan="5">

</td>

</tr>

<tr>

<td colspan="4" style="background-color: #D0D0FF">

[SCCP](/SCCP)

</td>

<td colspan="1" rowspan="4" style="background-color: #FFD0D0; text-align: center">

[SUA](/SUA)

</td>

</tr>

<tr>

<td colspan="7">

</td>

</tr>

<tr>

<td colspan="1" rowspan="4" style="text-align: center">

</td>

<td style="background-color: #D0D0FF">

[MTP3b](/MTP3b)

</td>

<td colspan="4" style="text-align: center; background-color: #D0D0FF">

[MTP3](/MTP3)

</td>

<td colspan="1" rowspan="2" style="background-color: #FFD0D0; text-align: center">

[M3UA](/M3UA)

</td>

</tr>

<tr>

<td colspan="1" rowspan="2" style="background-color: #D0D0FF; text-align: center">

[SSCF-NNI](/SSCF-NNI)

</td>

<td colspan="1" rowspan="2" style="background-color: #D0D0FF; text-align: center">

[MTP2](/MTP2)

</td>

<td colspan="3" style="background-color: #FFD0D0">

[M2UA](/M2UA)

</td>

</tr>

<tr>

<td colspan="5" style="text-align: center; background-color: #FFD0D0">

[SCTP](/SCTP)

</td>

</tr>

<tr>

<td>

[ATM](/ATM)

</td>

<td>

E1/T1/J1

</td>

<td colspan="5">

[IP](/IP)

</td>

</tr>

</tbody>

</table>

</div>

<div>

<table>

<tbody>

<tr>

<td colspan="1" rowspan="6" style="text-align: center">

</div>

</td>

<td colspan="3">

</td>

<td colspan="1" rowspan="6" style="text-align: center">

</td>

</tr>

<tr>

<td style="background-color: #D0D0FF">

</td>

<td colspan="2" style="text-align: center">

SS7

</td>

</tr>

<tr>

<td style="background-color: #FFD0D0">

</td>

<td colspan="2" style="text-align: center">

SIGTRAN

</td>

</tr>

<tr>

<td style="background-color: #D0FFD0">

</td>

<td colspan="2" style="text-align: center">

Application Protocols

</td>

</tr>

<tr>

<td>

</td>

<td colspan="2" style="text-align: center">

Transport

</td>

</tr>

<tr>

<td colspan="3">

</td>

</tr>

</tbody>

</table>

</div>

[SIGTRAN](/SIGTRAN) is a group of protocols for transporting signaling (SS7) over IP networks. Each protocol in [SIGTRAN](/SIGTRAN) logically replaces a protocol in the SS7 stack (for example [M3UA](/M3UA) replaces [MTP3](/MTP3)).

## Example capture file

Example of GSM MAP packet captured on a TDM link.

    No.     Time        Source                Destination           Protocol Info
       2698 0.022371    7                     2                     GSM MAP  Invoke processUnstructuredSS-Request
    
    Frame 2698 (99 bytes on wire, 99 bytes captured)
        Arrival Time: Aug 12, 2005 14:39:35.572690000
        Time delta from previous packet: 0.022371000 seconds
        Time since reference or first frame: 41.288610000 seconds
        Frame Number: 2698
        Packet Length: 99 bytes
        Capture Length: 99 bytes
        Protocols in frame: mtp2:mtp3:sccp:tcap:gsm_map
    Message Transfer Part Level 2
        .101 0101 = Backward sequence number: 85
        1... .... = Backward indicator bit: 1
        .101 1000 = Forward sequence number: 88
        1... .... = Forward indicator bit: 1
        ..11 1111 = Length Indicator: 63
        00.. .... = Spare: 0
    Message Transfer Part Level 3
        Service information octet
            10.. .... = Network indicator: National network (0x02)
            ..00 .... = Spare: 0x00
            .... 0011 = Service indicator: SCCP (0x03)
        Routing label
            .... .... .... .... ..00 0000 0000 0010 = DPC: 2
            .... 0000 0000 0001 11.. .... .... .... = OPC: 7
            0001 .... .... .... .... .... .... .... = Signalling Link Selector: 1
    Signalling Connection Control Part
        Message Type: Unitdata (0x09)
        .... 0000 = Class: 0x00
        0000 .... = Message handling: No special options (0x00)
        Pointer to first Mandatory Variable parameter: 3
        Pointer to second Mandatory Variable parameter: 5
        Pointer to third Mandatory Variable parameter: 9
        Called Party address (2 bytes)
            Address Indicator
                .1.. .... = Routing Indicator: Route on SSN (0x01)
                ..00 00.. = Global Title Indicator: No Global Title (0x00)
                .... ..1. = SubSystem Number Indicator: SSN present (0x01)
                .... ...0 = Point Code Indicator: Point Code not present (0x00)
            SubSystem Number: MSC (Mobile Switching Center) (8)
        Calling Party address (4 bytes)
            Address Indicator
                .1.. .... = Routing Indicator: Route on SSN (0x01)
                ..00 00.. = Global Title Indicator: No Global Title (0x00)
                .... ..1. = SubSystem Number Indicator: SSN present (0x01)
                .... ...1 = Point Code Indicator: Point Code present (0x01)
            ..00 0000 0000 0111 = PC: 7
            SubSystem Number: ISDN User Part (3)
    Transaction Capabilities Application Part
        begin
            otid: 03C30300
            dialoguePortion: 281C060700118605010101A011600F80020780A109060704...
            oid: 0.0.17.773.1.1.1 (itu-t(0) recommendation(0) q(17) 773 as(1) dialogue-as(1) version1(1))
            dialog: 600F80020780A109060704000001001302
            dialogueRequest
                Padding: 7
                protocol-versionrq: 80 (version1)
                    1... .... = version1: True
                application-context-name: 0.4.0.0.1.0.19.2
            components:
    GSM Mobile Application
        invoke
            invokeId: invokeid (0)
                invokeid: 1
            invokeCmd: processUnstructuredSS-Request (59)
            ussd-DataCodingScheme: 00
            ussd-String: AA182C368AC966B49A6D74C3E560
            msisdn: 91030000
            1... .... = Extension: No Extension
            .001 .... = Nature of number: International Number (0x01)
            .... 0001 = Number plan: ISDN/Telephony Numbering (Rec ITU-T E.164) (0x01)
            ISDN Address digits: 3000

## SS7 point codes in display columns

In SS7, the equivalent of source and destination addresses are "point codes". Wireshark allows to display point codes in place of IP address in the source and destination address. To do so, go in Edit/Preferences menu and select User Interface/Columns entry. For Source column, select in the drop down list "Net Src addr" and for the Destination column, select "Net dest addr".

## External links

  - [SS7/C7 tutorial/overview](http://www.telecomspace.com/ss7.html)

  - [SS7/C7 Discussion Forum](http://www.telecomspace.com/forum/telecom/ss7)

## Discussion

---

Imported from https://wiki.wireshark.org/SS7 on 2020-08-11 23:25:49 UTC
