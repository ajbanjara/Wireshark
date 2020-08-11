# Skype

[Skype](http://www.skype.com) (a popular VoIP and IM application) uses a proprietary (and encrypted) protocol. So far Wireshark is not able to decode Skype traffic because no one has been able to reverse-engineer the protocol.

However, [an effort](https://github.com/matthiasbock/OpenSkype/wiki/Skype%27s-UDP-Format) to do so is underway and appears to be making some progress.

Another interesting link is a [2004 analysis of Skype's protocol](http://www.cs.columbia.edu/~library/TR-repository/reports/reports-2004/cucs-039-04.pdf). There's also [Silver Needle in the Skype](http://www.secdev.org/conf/skype_BHEU06.handout.pdf) from 2006 (for the networking part look at pages 40ff). Note that both papers may be outdated and that the protocol may have changed since then (the 2006 paper definitely describes things differently from the github description).

## History

Until August of 2014 the [Skype protocol](https://en.wikipedia.org/wiki/Skype_protocol) was used.

Starting in August of 2014 Skype uses [Microsoft Notification Protocol 24](https://en.wikipedia.org/wiki/Microsoft_Notification_Protocol#MSNP24)

## Protocol dependencies

  - Typically, Skype uses [UDP](/UDP) as its transport protocol.

Skype typically uses a wide range of ports in order to circumvent firewalls.

## Example traffic

Below is Wireshark's decoding of one frame from a capture on the [SampleCaptures](/SampleCaptures) page.

    Frame 215: 60 bytes on wire (480 bits), 60 bytes captured (480 bits)
    Ethernet II, Src: voyager.home (00:16:e3:19:27:15), Dst: 192.168.1.2 (00:04:76:96:7b:da)
    Internet Protocol Version 4, Src: engmanlab10.pathology.northwestern.edu (165.124.253.241), Dst: 192.168.1.2 (192.168.1.2)
    User Datagram Protocol, Src Port: 15294 (15294), Dst Port: 35990 (35990)
    SKYPE
        ID: 0x15f2
        0111 .... = Unknown: 0x07
        .... 0111 = Type: NAT repeat (0x07)
        Src IP: host86-128-245-115.range86-128.btcentralplus.com (86.128.245.115)
        Dst IP: 0x24499eb8

## Wireshark

Wireshark has a basic dissector for the old Skype protocol.

To use this dissector you must use the Decode-As interface to tell Wireshark to try to decode packets as Skype.

## Preference Settings

The Skype dissector has no preferences at this time. Use the Decode-As interface to select traffic to decode as Skype.

The Skype dissector also has a heuristic dissector (which causes it to examine UDP packets to guess whether they are Skype). These heuristics are disabled by default; to enable them use the Enabled Protocols interface to enable skype\_udp.

## Example capture file

The [SampleCaptures](/SampleCaptures) page has at least one Skype capture file:

  - [SampleCaptures/SkypeIRC.cap](uploads/__moin_import__/attachments/SampleCaptures/SkypeIRC.cap)

## Display Filter

The Skype dissector has a number of fields such as skype.som\_type (for the message type).

## Capture Filter

You cannot directly filter Skype while capturing. However, if you know the [UDP](/UDP) port used (see above), you can filter on that one.

Capture only the Skype traffic over port 1234:

``` 
 udp port 1234 
```

## External links

  - [A 2004 analysis of Skype's protocol](http://www.cs.columbia.edu/~library/TR-repository/reports/reports-2004/cucs-039-04.pdf)

  - [An attempt to reverse-engineer Skype's protocol](https://github.com/matthiasbock/OpenSkype/wiki/Skype%27s-UDP-Format)

  - [Wikipedia's page on the old Skype protocol](https://en.wikipedia.org/wiki/Skype_protocol)

## Discussion

---

Imported from https://wiki.wireshark.org/Skype on 2020-08-11 23:24:46 UTC
