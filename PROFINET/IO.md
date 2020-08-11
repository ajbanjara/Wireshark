# PROFINET IO (PN-IO)

The PROFINET/IO (PN-IO) protocol is a field bus protocol related to decentralized periphery.

PROFINET/IO is based on connectionless [DCE/RPC](/DCE/RPC) and the "lightweight" [PROFINET/RT](/PROFINET/RT) (ethernet type 0x8892) protocols:

  - The context manager (CM) part is handling context information (like establishing, ...) and is using connectionless [DCE/RPC](/DCE/RPC) as it's underlying protocol.

  - The actual cyclic data transfer and acyclic notification uses the "lightweight" [PROFINET/RT](/PROFINET/RT) protocol.

  - There are some other related PROFINET protocols (e.g. [PROFINET/DCP](/PROFINET/DCP), which is handling addressing topics).

## History

XXX - add a brief description of PN-IO history

## Protocol dependencies

  - [DCE/RPC](/DCE/RPC): PN-IO uses connectionless [DCE/RPC](/DCE/RPC) as its transport protocol.

  - [PROFINET/RT](/PROFINET/RT): PN-IO uses [PROFINET/RT](/PROFINET/RT) for the actual user data transfer.

## Example traffic

    Frame 23 (64 bytes on wire, 64 bytes captured)
        Arrival Time: Mar 16, 2006 21:08:09.415475000
        Time delta from previous packet: 0.126966000 seconds
        Time since reference or first frame: 9.698024000 seconds
        Frame Number: 23
        Packet Length: 64 bytes
        Capture Length: 64 bytes
        Protocols in frame: eth:vlan:pn_rt:pn_io
    Ethernet II, Src: 192.168.0.100 (08:00:06:6b:a5:2d), Dst: 192.168.0.101 (08:00:06:6b:f9:81)
        Destination: 192.168.0.101 (08:00:06:6b:f9:81)
        Source: 192.168.0.100 (08:00:06:6b:a5:2d)
        Type: 802.1Q Virtual LAN (0x8100)
    802.1Q Virtual LAN
        110. .... .... .... = Priority: 6
        ...0 .... .... .... = CFI: 0
        .... 0000 0000 0000 = ID: 0
        Type: PROFInet (0x8892)
    PROFINET cyclic Real-Time, RTC1, ID:0xc000, Len:  40, Cycle:16384 (Valid,Primary,Ok,Stop)
        FrameID: 0xc000 (0xC000-0xFAFF: Real-Time(class=1): Cyclic)
        CycleCounter: 16384
        DataStatus: 0x25 (Frame: Valid and Primary, Provider: Ok and Stop)
            00.. .... = Reserved (should be zero): 0x00
            ..1. .... = StationProblemIndicator (1:Ok/0:Problem): 0x01
            ...0 .... = ProviderState (1:Run/0:Stop): 0x00
            .... 0... = Reserved (should be zero): 0x00
            .... .1.. = DataValid (1:Valid/0:Invalid): 0x01
            .... ..0. = Reserved (should be zero): 0x00
            .... ...1 = State (1:Primary/0:Backup): 0x01
        TransferStatus: 0x00 (OK)
    PROFINET IO Cyclic Service Data Unit: 40 bytes
        IOxS: 0x00 (bad)
            .... ...0 = Extension (1:another IOxS follows/0:no IOxS follows): 0x00
            ...0 000. = Reserved (should be zero): 0x00
            .00. .... = Instance (only valid, if DataState is bad): detected by subslot (0x00)
            0... .... = DataState (1:good/0:bad): 0x00
        Data: 39 bytes (including GAP and RTCPadding)
    0000  08 00 06 6b f9 81 08 00 06 6b a5 2d 81 00 c0 00   ...k.....k.-....
    0010  88 92 c0 00 00 00 00 00 00 00 00 00 00 00 00 00   ................
    0020  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00   ................
    0030  00 00 00 00 00 00 00 00 00 00 00 00 40 00 25 00   ............@.%.

## Wireshark

The PN-IO dissector is fully functional.

## Preference Settings

There are no PN-IO specific preference settings.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of PN-IO display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/p/pn_io.html)

  - Show only the PN-IO based traffic:
    
    ``` 
     pn_io 
    ```

  - Show the PN-IO based traffic without the cyclic PN-IO telegrams (to avoid a lot of "noise"):
    
    ``` 
     pn_io && !pn_io.ioxs 
    ```

## Capture Filter

You cannot directly filter PN-IO protocols while capturing.

## External links

  - add link to PN-IO specification and where to find additional info on the web about PN-IO

## Discussion

---

Imported from https://wiki.wireshark.org/PROFINET/IO on 2020-08-11 23:18:23 UTC
