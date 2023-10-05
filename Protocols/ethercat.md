# EtherCAT

EtherCAT is an open, high performance Ethernet-based fieldbus system. The development goal of EtherCAT was to apply Ethernet to automation applications which require short data update times (also called cycle times) with low communication jitter (for synchronization purposes) and low hardware costs. The EtherCAT protocol is optimised for process data and is transported directly within the standard IEEE 802.3 Ethernet frame using Ethertype 0x88a4. It may consist of several sub-datagrams, each serving a particular memory area of the logical process images that can be up to 4 gigabytes in size. The data sequence is independent of the physical order of the nodes in the network; addressing can be in any order. Broadcast, multicast and communication between slaves are possible. If IP routing is required, the EtherCAT protocol can be inserted into UDP/IP or TCP/IP datagrams. This also enables any control with Ethernet protocol stack to address EtherCAT systems.

## History

## Protocol dependencies

  - [Ethernet](/Ethernet): EtherCAT can use [Ethernet](/Ethernet) as its transport mechanism. The assigned Ethernet type for EtherCAT traffic is 0x88A4.

  - [UDP](/UDP): EtherCAT protocol can be transported in [UDP](/UDP) datagrams. The assigned UDP port for EtherCAT is 0x88a4.

## Example traffic

    Frame 1 (128 bytes on wire, 128 bytes captured)
    Ethernet II, Src: MS-NLB-PhysServer-14_a6:c9:01:8e (02:0e:a6:c9:01:8e), Dst: Broadcast (ff:ff:ff:ff:ff:ff)
    EtherCAT frame header
        .... .000 0111 0000 = Length: 0x0070
        .... 0... .... .... = Reserved: Valid (0x0000)
        0001 .... .... .... = Type: EtherCAT command (0x0001)
    EtherCAT datagram(s): 'LRW': Len: 100, Adp 0x0, Ado 0x1, Wc 2
        EtherCAT datagram: Cmd: 'LRW' (12), Len: 100, Addr 0x10000, Cnt 2
            Header
                Command    : Logical memory read write (0x0c)
                Index      : 0x39
                Log Addr   : 0x00010000
                Length     : 100 (0x64) - No Roundtrip - Last Sub Command
                    .... .000 0110 0100 = Length: 100
                    ..00 0... .... .... = Reserved: Valid (0)
                    .0.. .... .... .... = Round trip: Frame is not circulating (0)
                    0... .... .... .... = Last indicator: Last EtherCAT datagram (0)
                Interrupt  : 0x0000
            Data      : 000000000000000000000000000000000000000000000000...
            Working Cnt: 2

## Wireshark

## Preference Settings

There are no EtherCAT specific preference settings. Allowing sub dissectors to handle data based on heuristic analysis is always enabled and cannot be turned off.

## Sub dissectors

Dissectors that are interested in dissecting the EtherCAT datagram portion of the EtherCAT frame (there may be multiple EtherCAT datagrams in each frame), may do so using heuristic analysis by registering themselves using the function *heur\_dissector\_add("ecat.data", ...).*

**'**

## Example capture file

Capture of startup sequence for some Beckhoff devices.

\* [SampleCaptures/ethercat.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/ethercat.cap.gz)

## Display Filter

A complete list of IP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/e/ethercat.html)

Show only the EtherCAT based traffic:

``` 
 ecat
```

Filter on a specific address offset (ado):

``` 
 ecat.ado == 0x130
```

Filter on a specific slave by its position or fixed EtherCAT address (adp):

``` 
 ecat.adp == 0x3e9
```

Filter on a specific cmd (here APRD):

``` 
 ecat.cmd == 0x1
```

Filter on a specific field of a sub command :

``` 
 ecat.sub1.idx < 0x80
```

Show only the EtherCAT mailbox traffic:

``` 
 ecat_mailbox
```

## Capture Filter

Capture Ethercat-over-Ethernet traffic only:

``` 
 ether proto 0x88a4 
```

Capture Ethercat-over-UDP traffic only:

``` 
 udp port 0x88a4 
```

## External links

More information about EtherCAT can be found on the website of the EtherCAT Technology Group: <http://www.ethercat.org/>

SOEM (Simple Open EtherCAT Master) can be found at <http://openethercatsociety.github.io/>

IgH EtherCAT Master for Linux can be found at <http://www.etherlab.org/en/ethercat/index.php>

An Introduction to EtherCAT®, EtherCAT P and the Microchip LAN925x family of Slave Controllers <https://mu.microchip.com/an-introduction-to-ethercat-ethercat-p-and-the-microchip-lan925x-family-of-slave-controllers>

## Discussion

</strong>

</p>

---

Imported from https://wiki.wireshark.org/Protocols/ethercat on 2020-08-11 23:19:43 UTC
