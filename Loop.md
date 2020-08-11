# Configuration Testing Protocol (Loop)

It's basically a layer two "ping" equivalent.

## History

Ethernet configuration testing protocol (CTP) is specified in chapter 8 of the [DEC/Intel/Xerox Ethernet v2.0 specification](http://decnet.ipv7.net/docs/dundas/aa-k759b-tk.pdf). It doesn't appear in any IEEE 802 specification.

## Protocol dependencies

  - [Ethernet](/Ethernet): Typically, Loop uses [Ethernet](/Ethernet) as its transport protocol. The well known Ethernet type for Loop is 0x9000.

## Example traffic

    Frame 2 (68 bytes on wire, 68 bytes captured)
        Arrival Time: Mar 21, 2006 03:02:44.202162000
        Time delta from previous packet: 0.000415000 seconds
        Time since reference or first frame: 0.000415000 seconds
        Frame Number: 2
        Packet Length: 68 bytes
        Capture Length: 68 bytes
        Protocols in frame: eth:loop:data
    Ethernet II, Src: aa:00:04:00:69:04 (aa:00:04:00:69:04), Dst: aa:00:04:00:1d:04 (aa:00:04:00:1d:04)
        Destination: aa:00:04:00:1d:04 (aa:00:04:00:1d:04)
        Source: aa:00:04:00:69:04 (aa:00:04:00:69:04)
        Type: Loopback (0x9000)
    Configuration Test Protocol (loopback)
        skipCount: 8
        Function: Forward Data (2)
        Forwarding address: aa:00:04:00:1d:04 (aa:00:04:00:1d:04)
        Relevant function:
        Function: Reply (1)
        Receipt number: 1
    Data (40 bytes)

## Wireshark

The Loop dissector is fully functional

## Preference Settings

(None)

## Example capture file

[SampleCaptures/configuration\_test\_protocol\_aka\_loop.pcap](uploads/__moin_import__/attachments/SampleCaptures/configuration_test_protocol_aka_loop.pcap)

## Display Filter

A complete list of Loop display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/l/loop.html)

Show only the Loop based traffic:

``` 
 loop 
```

## Capture Filter

You cannot directly filter Loop protocols while capturing. However, if you know the [Ethernet](/Ethernet) type used (see above), you can filter on that one.

## External links

  - <http://www.mit.edu/people/jhawk/ctp.html>

## Discussion

---

Imported from https://wiki.wireshark.org/Loop on 2020-08-11 23:16:04 UTC
