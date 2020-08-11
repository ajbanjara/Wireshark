# Object Management API (OMAPI)

The Object Management API is an interface on the [ISC](http://www.isc.org) [DHCP](http://www.isc.org/index.pl?/sw/dhcp/) server. It provides access to the objects (leases, hosts or groups) stored in its database.

## History

The API was introduced by the ISC in version 3 of the DHCP software.

## Protocol dependencies

  - [TCP](/TCP): Typically, OMAPI uses [TCP](/TCP) as its transport protocol. The well known TCP port for OMAPI traffic is 7911.

## Example traffic

    Frame 755 (129 bytes on wire, 129 bytes captured)
    Ethernet II, Src: Intel_bf:3b:59 (00:90:27:bf:3b:59), Dst: Cisco_f2:03:78 (00:d0:bc:f2:03:78)
    Internet Protocol, Src: 192.168.21.229 (192.168.21.229), Dst: 192.168.1.251 (192.168.1.251)
    Transmission Control Protocol, Src Port: 33156 (33156), Dst Port: 7911 (7911), Seq: 3915, Ack: 12060, Len: 63
    ISC Object Management API, Opcode: Open
        Authentication ID: 0
        Authentication length: 0
        Opcode: Open (1)
        Handle: 0
        ID: 1804289445
        Response ID: 0
        Message name length: 4
        Message name: type
        Message value length: 5
        Message value: lease
        Message end tag
        Object name length: 10
        Object name: ip-address
        Object value length: 4
        Object value: C0A8093F
        Message end tag

## Wireshark

The OMAPI dissector is fully functional.

## Preference Settings

There are no preferences for this protocol dissector

## Example capture file

  - [SampleCaptures/OMAPI.pcap](uploads/__moin_import__/attachments/SampleCaptures/OMAPI.pcap)

## Display Filter

A complete list of OMAPI display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/o/omapi.html)

Show only the OMAPI based traffic:

``` 
 omapi 
```

## Capture Filter

You cannot directly filter OMAPI protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the OMAPI traffic over the default port (7911):

``` 
 tcp port 7911 
```

## External links

  - [DHCP source code](http://ftp.isc.org/isc/dhcp/) - contains api+protocol description.

  - [man omapi](http://www.google.com/search?q=man%20omapi) - A OMAPI man page.

  - [man omshell](http://www.google.com/search?q=man%20omshell) - The simple CLI interface for OMAPI.

## Discussion

---

Imported from https://wiki.wireshark.org/Object_Management_API on 2020-08-11 23:17:37 UTC
