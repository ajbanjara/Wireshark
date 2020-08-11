# Multimedia Messaging Service Encapsulation (MMSE)

The Multimedia Messaging Service (MMS) allows a person to send and receive self-contained multimedia messages. The MMS service can be compared with the e-mail service where the message consists of a series of attachments. As a matter of fact, the MMS Encapsulation (MMSE) protocol uses [MIME](/MIME) headers similar to the message headers found in e-mail messages (From, To, Cc, Bcc, Subject) plus a series of headers dedicated to MMS.

The MMS messages are encoded with the help of [WAP](http://www.wapforum.org/) protocols: [WSP](/Wireless_Session_Protocol) provides the compact encoding mechanism for representing the MMS headers (such as To, Cc, From, Content-Type). Note that MMSE imposes certain restrictions on the usage of the [WSP](/Wireless_Session_Protocol) header encoding rules, in order to ease interoperability.

## History

The Multimedia Messaging Service (MMS) initiated from [3GPP](/3GPP), and until now the only implementation of MMS has been provided by the [WAP Forum](http://www.wapforum.org/) and continued by the [Open Mobile Alliance (OMA)](http://www.openmobilealliance.org/). There are 3 releases of MMS implementation:

  - MMS 1.0: WAP-205, WAP-206, WAP-209
  - MMS 1.1: OMA release for MMS 1.1
  - MMS 1.2: OMA release for MMS 1.2

## Protocol dependencies

  - [WSP](/Wireless_Session_Protocol): All MMSE headers (and the multipart encapsulation) are encoded according to the rules of [WSP](/Wireless_Session_Protocol), and MMSE is often transported over [WSP](/Wireless_Session_Protocol). Notifications even use the WSP Push channel.

  - [HTTP](/HTTP): The MMS messages can also be conveyed over [HTTP](/HTTP) between end-user and network. The MMS proxy/relay will also use [HTTP](/HTTP) when pushing the notifications to the network, according to the WAP Push framework ("PAP").

  - [SMPP](/SMPP): When a specific MMS message is delivered over the WSP Push channel (e.g. a MMS notification), and the recipient's device has no Internet connectivity, then the message can be delivered over the [GSM-SMS](/GSM-SMS) channel. In this case, an SMSC interworking protocol is used, e.g., [SMPP](/SMPP).

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The MMSE dissector fully dissects all MMSE 1.0 and MMSE 1.1 messages. Regarding the MMSE 1.2 messages, not all header values are fully dissected yet.

## Preference Settings

There are currently no preferences for the MMSE dissector.

## Example capture file

XXX - Add a simple example capture file. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of MMSE display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/m/mmse.html)

Show only the MMSE based traffic:

``` 
 mmse 
```

## Capture Filter

You cannot directly filter the MMSE protocol while capturing. You can still write a capture filter if you know the [UDP](/UDP) and [TCP](/TCP) ports over which the MMSE traffic will occur (e.g., the [WSP](/WSP) stack settings, the [HTTP](/HTTP) stack settings, the [PAP](/PAP) port of the Push Proxy Gateway (PPG) etc.).

## External links

  - MMSE 1.0: [WAP-209-MMSEncapsulation-20020105-a](http://www.openmobilealliance.org/tech/affiliates/LicenseAgreement.asp?DocName=/wap/wap-209-mmsencapsulation-20020105-a.pdf)

  - MMSE 1.1: OMA-MMS-ENC-v1.1

  - MMSE 1.2: [OMA-MMS-ENC-v1.2](http://www.openmobilealliance.org/release_program/docs/mms/v1_2-20050429-a/oma-mms-conf-v1_2-20050301-a.pdf)

## Discussion

---

Imported from https://wiki.wireshark.org/Multimedia_Messaging_Service_Encapsulation on 2020-08-11 23:17:04 UTC
