# ETHERNET Powerlink v2 (EPL)

ETHERNET Powerlink is an ISO/OSI level 2 protocol enabling deterministic, isochronous, real-time data exchange via standard Fast Ethernet (IEEE 802.3u). It allows high precision data communication with cycle times as low as 100µs and network jitter well below 1µs. Deterministic real-time data communication is specifically important for the automation industry.

## History

ETHERNET Powerlink was originally introduecd by the Austrian automation company Bernecker + Rainer Industrie-Elektronik in 2001.  
ETHERNET Powerlink V2 was developed and standardized by the open user- and producer-group EPSG (ETHERNET Powerlink Standardization Group) as a public standard.

## Protocol dependencies

EPL is based on the standard IEEE 802.3 layers according to ISO/OSI. The current physical layer is 100BASE-X (see IEEE 802.3).

## Example traffic

## Wireshark

The EPL dissector is fully functional. The protocol specification is based on the "ETHERNET Powerlink V2.0 Communication Profile Specification, Draft Standard Version 1.0.0"

## Preference Settings

  - **Show flags of SoC frame in Info column:** Useful when capturing in networks with multiplexed or slow nodes

  - **Show command-layer in duplicated frames:** For analysis purposes

  - **Show life times and origin PDO Tx/Rx params for PDO entries:** Shows the life time during which the PDO mapping was active. A frame number of 0 (i.e. before capture) means it was predefined by a XDC profile

  - **Use SDO ObjectMappings for PDO dissection:** Track object mapping SDO writes and use them to dissect future PDOs

  - **Use XDC ObjectMappings for PDO dissection:** Track object mapping embedded in XDC profiles and use them to dissect future PDOs

  - **Interpret short (\<64bit) data as little endian integers:** Instead of handing untyped bytes to the data dissector, interpret as little endian and display in hexadecimal and decimal bases

  - **EPL UDP port:** Used to detect EPL over UDP communication

### XDD/EDS Profiles

The object dictionary of nodes can be described by EPL's XDD or CANopen's EDS profiles. The dissector parses both formats to extract names, sizes, data types and, in case of XDC, default values. Following preferences control which profile is loaded for a CN (in ascending order of precedence):

  - **Default profile to use if no specific profiles exist:** Useful if many nodes share the same profile and the [IdentResponse](/IdentResponse) is missing

  - **Device-Specific Profiles:** Profile to load depending on DeviceType, VendorId and ProductCode. VendorId and ProductCode are optional when left empty (0)

  - **Node-Specific Profiles:** Profile to load depending on Node ID

## Example capture file

The following sample capture shows the bootup procedure for a simple EPL network with one [ManagingNode](/ManagingNode) (Master) and one [ControlledNode](/ControlledNode) (Slave).

  - [SampleCaptures/epl.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/epl.cap.gz)

## Display Filter

Show only the EPL based traffic:

``` 
 epl 
```

## Capture Filter

You can filter the EPL protocol while capturing. However, remember that an EPL network will normally be isolated from non-EPL clients so it's not necessary to restrict capturing.

Capture only the EPL traffic:

``` 
 ether proto 0x88ab 
```

## External links

More informations about EPL can be found on the website of the ETHERNET Powerlink Standardization Group EPSG: <http://www.ethernet-powerlink.org/>

## Discussion

---

Imported from https://wiki.wireshark.org/Protocols/epl on 2020-08-11 23:19:39 UTC
