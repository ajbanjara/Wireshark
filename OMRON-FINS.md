# OMRON-FINS (FINS)

OMRON Global builds machines for industrial and manufacturing work. FINS is used to control some of those machines over the network.

<http://www.omron.com/>

## History

Don't know much about the history of the protocol other than locating the manual for this was a major PITA. I would assume that this protocol was originally just a serial connection and has now been overlaid onto [UDP](/UDP).

## Protocol dependencies

  - [UDP](/UDP): Typically, FINS uses [UDP](/UDP) as its transport protocol. The well known UDP port for PROTO traffic is 9600.

## Example traffic

OMRON FINS Protocol

Omron Header

  - OMRON ICF Field: 0xc1, Gateway bit: Use Gateway, Data Type bit: Response, Response setting bit: Response Not Required
      - 1... .... = Gateway bit: Use Gateway (0x01)
      - 1.. .... = Data Type bit: Response (0x01)
      - .0. .... = Reserved bit 0: 0x00
      - ..0 .... = Reserved bit 1: 0x00
      - ... 0... = Reserved bit 2: 0x00
      - ... .0.. = Reserved bit 3: 0x00
      - ... ..0. = Reserved bit 4: 0x00
      - ... ...1 = Response setting bit: Response Not Required (0x01)
    Reserved: 0x00 Gateway Count: 0x02 Destination network address: Local network (0x00) Destination node number: SYSMAC NET / LINK (0x00) Destination unit address: PC (CPU) (0x00) Source network address: Local network (0x00) Source node number: SYSMAC NET / LINK (0x00) Source unit address: PC (CPU) (0x00) Service ID: 0x7a Command CODE: Name Delete (0x2602)

Command Data

## Wireshark

The OMRON-FINS protocol dissector is fully functional to the specification listed in bug 3226. There are a couple things that one might encounter that I know are not supported, but don't have any good documentation on.

1\. There is some magic way to encode things using some type of ASCII encoding, but this shouldn't happen when the protocol use UDP. 2. If a PLC implements a command or response code that is outside of the command reference it won't be decoded. 3. If a device specific setting is used for a particular PLC it won't be decoded correctly as those are PLC specific and not documented in the base command reference 4. I'll fix it if anyone can point me to more manuals.

## Preference Settings

Currently no preference settings are support or needed. If there are device specific problems found this is probably what needs to be implemented to fix the decoding.

## Example capture file

  - [SampleCaptures/omron.pcap](uploads/__moin_import__/attachments/SampleCaptures/omron.pcap)

## Display Filter

A complete list of PROTO display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/protofirstletter/proto.html)

Show only the OMRON-FINS based traffic:

``` 
 OMRON-FINS 
```

## Capture Filter

N/A

## External links

  - See bug for reference manual wireshark bug 3226

## Discussion

OMRON-FINS is a funny little protocol, I needed this decoder for some specific SCADA work I was doing, so I'm guessing no one will ever need this decoder. But if you do its now here. Also if you ever come across some FINS traffic that isn't decoded correctly please open bugs or point me to pcaps/manuals and I'll update the dissector.

---

Imported from https://wiki.wireshark.org/OMRON-FINS on 2020-08-11 23:17:38 UTC
