# Simulcrypt (SimulCrypt)

A DVB protocol published by ETSI used in IPTV / broadcast TV head-ends to enable use of multiple key management systems.

The standardised SCS (Simulcrypt Synchroniser) to ECMG (Entitlement Control Message Generator) interface is used to allow multiple key management systems to operate in parallel, each generating its own (typically proprietary) ECMs (Entitlement Control Messages).

The EMMG (Entitlement Management Message Generator) to MUX interface allows the CAS (Conditional Access System), which provides the ECMs, to provide an EMM (Entitlement Management Message) to be associated to the streamed service.

The interface between EIS (Event Information Scheduler) and SCS is used by the EIS to provide Scrambling Control Group (SCG) definitions and Access Criteria (AC) transitions, to allow the management of different services sharing the same key.

The PSIG (Program Specific Information Generator) to MUX interface is used by the PSIG to provide MUXes of the head-end with the appropriate PSI/SI (Program Specific Information/Service Information) tables for their respective transport stream.

## History

XXX - add a brief description of PROTO history

## Protocol dependencies

  - SCS - ECMG: this interface uses [TCP](/TCP) as its transport protocol. There is no well known TCP port for SIMULCRYPT traffic as multiple TCP connections are possible (typically each TCP connection is associated to a given key management system for a particular TV channel).

  - EMMG - MUX: the head-end operator can choose between:
    
    \- [TCP](/TCP) based implementation for data provision and control;
    
    \- [UDP](/UDP) based implementation for data provision and [TCP](/TCP) based implementation for control;
    
    \- [UDP](/UDP) based implementation for data provision and [SIMF](/SIMF) based implementation for control.

  - EIS - SCS: this interface uses [TCP](/TCP) as its transport protocol.

  - PSIG - MUX: this interface may include the PSI/SI table carouselling performed by the PSIG and the PSI/SI table carouselling performed by the MUX. In the first case, the real implementation can be chosen between:
    
    \- [TCP](/TCP) based implementation for data and control;
    
    \- [ASI](/ASI) based implementation for data and [TCP](/TCP) based implementation for control.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The SIMULCRYPT dissector is fully functional for the following interfaces: ECMG - SCS, EMMG - MUX, EIS - SCS, PSIG - MUX (supported also MUX - CiM and (P) - CiP interfaces). It decodes the Simulcrypt syntax to analyse different Simulcrypt messages and associated TLV parameters.

## Preference Settings

There are some [SIMULCRYPT\_Preferences](/SIMULCRYPT_Preferences).

## Example capture file

  - [SampleCaptures/SIMULCRYPT.pcap](uploads/__moin_import__/attachments/SampleCaptures/SIMULCRYPT.pcap) - Simulcrypt traffic over [TCP](/TCP) on ports 8600, 8601 and 8602.

  - [SampleCaptures/ECMG-SCS.pcap](uploads/__moin_import__/attachments/SampleCaptures/ECMG-SCS.pcap) - Simulcrypt traffic on the ECMG - SCS interface over [TCP](/TCP).

  - [SampleCaptures/EMMG-MUX.pcap](uploads/__moin_import__/attachments/SampleCaptures/EMMG-MUX.pcap) - Simulcrypt traffic on the EMMG - MUX interface over [TCP](/TCP).

  - [SampleCaptures/EIS-SCS.pcap](uploads/__moin_import__/attachments/SampleCaptures/EIS-SCS.pcap) - Simulcrypt traffic on the EIS - SCS interface over [TCP](/TCP).

  - [SampleCaptures/PSIG-MUX.pcap](uploads/__moin_import__/attachments/SampleCaptures/PSIG-MUX.pcap) - Simulcrypt traffic on the PSIG - MUX interface (and the MUX - CiM interface) over [TCP](/TCP).

## Display Filter

A complete list of PROTO display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/protofirstletter/proto.html)

Show only the SIMULCRYPT based traffic:

``` 
 simulcrypt 
```

## Capture Filter

You can directly filter SIMULCRYPT protocols while capturing if you know the [TCP](/TCP) port used (see above).

Capture only the SIMULCRYPT traffic over the chosen port (\<port\>):

``` 
 tcp port <port> 
```

## External links

  - <http://pda.etsi.org/pda/queryform.asp> *ETSI TS 103 197 V1.5.1 (2008-10)* - Digital Video Broadcasting (DVB);Head-end implementation of DVB [SimulCrypt](/SimulCrypt), latest version.

  - <http://pda.etsi.org/pda/queryform.asp> *ETSI TS 101 197-1 V1.1.1 (1997-06)* - Digital Video Broadcasting (DVB);DVB [SimulCrypt](/SimulCrypt);Part 1: Head-end architecture and synchronization

  - <http://www.dvb.org/technology/standards/index.xml#conditional> *List of DVB standards relating to Conditional Access* - various standards

  - <http://fr.wikipedia.org/wiki/Simulcrypt> *Wikipedia entry* - currently only in French

## Discussion

---

Imported from https://wiki.wireshark.org/SIMULCRYPT on 2020-08-11 23:24:43 UTC
