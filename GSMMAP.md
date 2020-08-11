# Mobile Application Part (MAP) (GSM MAP)

Transfers between entities of a Public Land Mobile Network (PLMN) information specific to the PLMN in order to deal with the specific behaviour of roaming Mobile Stations (MS)s.

## History

XXX - add a brief description of PROTO history

## Protocol dependencies

  - [TCAP](/TCAP): Typically, GSM MAP uses [TCAP](/TCAP) as its transport protocol. The Subsystem number (ssn) is used to identify GSM MAP

## Example traffic

    No.     Time        Source                Destination           Protocol Info
          1 0.000000    1041                  8744                  GSM MAP  invoke processUnstructuredSS-Request
    
    map-open
        destinationReference: 9656051124006913F6
        1... .... = Extension: No Extension
        .001 .... = Nature of number: International Number (0x01)
        .... 0110 = Number plan: Land Mobile Numbering (ITU-T Rec. E.212) (0x06)
        Address digits: 655011420096316
    GSM Mobile Application
        Component: invoke (1)
            invoke
                invokeID: 1
                opCode: localValue (0)
                    localValue: processUnstructuredSS-Request (59)
                Data coding: 0x0f
                    SMPP Data Coding Scheme: Unknown (0x0f)
                    GSM SMS Data Coding
                    0000 .... = DCS Coding Group for SMS: SMS DCS: General Data Coding indication - Uncompressed text, no message class (0x00)
                    ..0. .... = DCS Text compression: Uncompressed text
                    ...0 .... = DCS Class present: No message class
                    .... 11.. = DCS Character set: Reserved (0x03)
                    GSM CBS Data Coding
                    0000 .... = DCS Coding Group for CBS: CBS DCS: Language using the GSM 7-bit default alphabet (0x00)
                    ..00 1111 = DCS CBS Message language: Language not specified (0x0f)
                USSD String: *140*0761241377#
                msisdn: 917267415827F2
                1... .... = Extension: No Extension
                .001 .... = Nature of number: International Number (0x01)
                .... 0001 = Number plan: ISDN/Telephony Numbering (Rec ITU-T E.164) (0x01)
                ISDN Address digits: 27761485722

## Wireshark

The GSM MAP dissector is fully functional.

## Preference Settings

The only preference is "TCAP SSNs" which is a range of SSNs on which gsm\_map dissector is triggered.

## Example capture file

  - [SampleCaptures/gsm\_map\_with\_ussd\_string.pcap](uploads/__moin_import__/attachments/SampleCaptures/gsm_map_with_ussd_string.pcap)

## Display Filter

A complete list of GSM MAP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/g/gsm_map.html)

Show only the GSM MAP based traffic:

``` 
 gsm_map 
```

## Capture Filter

## External links

  - [3GPP TS 29.002](http://www.3gpp.org/ftp/Specs/html-info/29002.htm) Mobile Application Part (MAP) specification **

## Discussion

---

Imported from https://wiki.wireshark.org/GSMMAP on 2020-08-11 23:14:24 UTC
