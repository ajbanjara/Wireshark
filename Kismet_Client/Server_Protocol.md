# Kismet Client/Server Protocol

Kismet is a wireless sniffer (and intrusion detection system) which is widely used to sniff Wireless LAN (e.g 802.11b, 802.11a, and 802.11g traffic). Kismet Client/Server protocol is used by Kismet Client (GUI) and Kismet server. It is used to control server, and it's capture sources.

Annother protocol ([Kismet Drone/Server Protocol](/Kismet-Drone/Server-Protocol)) is used by Kismet Server for communication with Kismet's remote drones.

## History

XXX - add a brief description of PROTO history

## Protocol dependencies

  - [TCP](/TCP): Kismet Client/Server uses [TCP](/TCP) as its transport protocol. The default port TCP port for Kismet C/S traffic is 2501.

## Example traffic

![wireshark-svn-rev-18731\_kismet\_dissector.png](uploads/__moin_import__/attachments/Kismet_Client/Server_Protocol/wireshark-svn-rev-18731_kismet_dissector.png "wireshark-svn-rev-18731_kismet_dissector.png")

Frame 4 form *kismet-client-server-dump-1.pcap*:

    Frame 4 (253 bytes on wire, 253 bytes captured)
        Arrival Time: Apr  2, 2006 20:59:45.285561000
    [...]
        Protocols in frame: eth:ip:tcp:kismet
    Ethernet II, Src: 00:00:00:00:00:00 (00:00:00:00:00:00), Dst: 00:00:00:00:00:00 (00:00:00:00:00:00)
    [...]
        Type: IP (0x0800)
    Internet Protocol, Src: 127.0.0.1 (127.0.0.1), Dst: 127.0.0.1 (127.0.0.1)
        Version: 4
    [...]
        Source: 127.0.0.1 (127.0.0.1)
        Destination: 127.0.0.1 (127.0.0.1)
    Transmission Control Protocol, Src Port: 2501 (2501), Dst Port: 34065 (34065), Seq: 1, Ack: 1, Len: 199
        Source port: 2501 (2501)
        Destination port: 34065 (34065)
    [...]
        Window size: 32768 (scaled)
        Checksum: 0xde77 [correct]
    Kismet Client/Server Protocol
        *KISMET: 0.0.0 1144004381 \001Kismet\001 20050815211952 0 2005.08.R1
            Kismet version: 0.0.0
            Start time: 1144004381
            Server name: Kismet
            Build revision: 20050815211952
            Extended version string: 2005.08.R1
        *PROTOCOLS: KISMET,ERROR,ACK,PROTOCOLS,CAPABILITY,TERMINATE,TIME,ALERT,NETWORK,CLIENT,GPS,INFO,REMOVE,STATUS,PACKET,STRING,WEPKEY,CARD 

## Wireshark

The Kismet C/S dissector is partially functional.

## Preference Settings

None.

## Example capture file

  - [SampleCaptures/kismet-client-server-dump-1.pcap](uploads/__moin_import__/attachments/SampleCaptures/kismet-client-server-dump-1.pcap)

  - [SampleCaptures/kismet-client-server-dump-2.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/kismet-client-server-dump-2.pcap.gz)

## Display Filter

A complete list of Kismet C/S display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/protofirstletter/proto.html)

Show only the Kismet C/S based traffic:

``` 
 kismet 
```

## Capture Filter

You cannot directly filter Kismet C/S protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the Kismet C/S traffic over the default port (2501):

``` 
 tcp port 2501 
```

## External links

  - [Kismet Homepage](http://www.kismetwireless.net) - Official Kismet Project Site

  - [Kismet protocol dissector for Ethereal](http://www.burghardt.pl/wiki/software/kismet_protocol_dissector_for_ethereal) - Krzysztof Burghardt's Kismet C/S dissector

  - [Kismet Client/Server Protocol](http://wiki.ethereal.com/Kismet_Client/Server_Protocol) - The Ethereal Wiki

## Discussion

---

Imported from https://wiki.wireshark.org/Kismet_Client/Server_Protocol on 2020-08-11 23:15:49 UTC
