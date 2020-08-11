# High bandwidth Digital Content Protection, Version 2 (HDCP2)

HDCP2 is a copy protection system to prevent copying of digital audio/video content as it is passed between two devices.

HDCP2 consists of three parts

1.  authentication between the devices
2.  encrypted transmission of content
3.  revocation

## History

HDCP2 was developed by Intel. The current version is HDCP 2.2.

There's also an HDCP version 1. It is based on interfaces like HDMI, DVI and Display Port and uses completely different protocols. Therefore, HDCP1 has its own Wireshark dissector.

## Protocol dependencies

HDCP2 supports a number of lower-layer protocols such as HDMI, USB or TCP/IP.

Wireshark only supports HDCP2 running on top of a TCP/IP connection. There's no fixed TCP port assigned to HDCP2, the endpoints must use an out-of-band mechanism to agree on a port.

## Example traffic

## Wireshark

The HDCP2 dissector is in beta state. It supports the most important messages of the HDCP2 authentication.

Since there's no well-known TCP port number for HDCP2, the dissector is an heuristic dissector on top of TCP.

## Preference Settings

There's one preference **enable the HDCP2 dissector**

HDCP2 messages are difficult to recognize (e.g. one byte message id, followed by some bytes of random data). If the dissector were active all the time, it would very likely generate false positives. Therefore, it's inactive by default and can be activated by setting the preference. This approach is similar to the hilscher dissector.

## Example capture file

[SampleCaptures/hdcp\_authentication\_sample.pcap](uploads/__moin_import__/attachments/SampleCaptures/hdcp_authentication_sample.pcap) - HDCP2 authentication between a DVB receiver and a handheld device

Everybody who has a chance to capture HDCP2 traces is encouraged to contribute them. Sample captures of HDCP2 over USB or HDMI are especially welcome.

## Display Filter

## Capture Filter

## External links

  - [HDCP specifications](http://www.digital-cp.com/hdcp_specifications)
    
    The *Interface Independent Adaptation* specification describes HDCP2 over TCP/IP.

  - [Wikipedia page about HDCP2](http://en.wikipedia.org/wiki/High-bandwidth_Digital_Content_Protection#HDCP_v2.x)

## Discussion

---

Imported from https://wiki.wireshark.org/HDCP2 on 2020-08-11 23:14:38 UTC
