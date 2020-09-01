# Fieldbus Protocol Family

A fieldbus is typically used to communicate between processors and remote I/O or other processors in systems controlling some physical process, such as in a factory or an automobile or other vehicle. Typical processors are Motion Controllers, PLCs (Programmable Logic Controller), and HMIs (Human-Machine Interface).

Historically, the fieldbusses run on a variety of serial hardware busses, some proprietary, with an emphasis on hardware simplicity and noise immunity. A common example is the differential RS-485 bus. As the name says, field busses are generally realized as point-to-point bus (or line) topologies. Because such topologies do not require then-expensive or unavailable routers or switches, they were easier and cheaper to realize than the star topology that is common practice in most Ethernet networks of today. Additionally, such protocols can run at low baud rates on what we now(2015) consider very simple and slow embedded CPUs with small amounts of memory.

Today, fieldbusses are migrating to software-only protocols atop the TCP/IP suite and standard [EthernetHardware](/EthernetHardware). Many historical serial protocols now offer UDP and/or TCP versions or encapsulation. This brings many advantages, including higher communication speed, easy implementation of multi master communication, end-programmer or user assistance, (e.g. numeric address-to-tag maps and machine-readable datasheets), and possibly sharing physical infrastructure for other protocols.

There are many fieldbus protocols, including

  - LON, [LONTalk](/FieldbusProtocolFamily#lontalk)

  - [BACnet](/FieldbusProtocolFamily#bacnet),(Lots of PHYs)

  - [PROFIBUS](/FieldbusProtocolFamily#profibus), [PROFINET](/FieldbusProtocolFamily#profinet)

  - Modbus/ASCII, Modbus/RTU, Modbus/TCP [www.Modbus.org](http://www.modbus.org)

  - CAN,

  - [EtherCAT](/FieldbusProtocolFamily#ethercat)

  - CIP, with Ethernet IP,

  - [Ethernet Powerlink](/FieldbusProtocolFamily#ethernet-powerlink)

  - [S-Bus](/FieldbusProtocolFamily#S-Bus), [Ether-S-Bus](/FieldbusProtocolFamily#ether-s-bus), [\#Ether-S-I/O](/FieldbusProtocolFamily#ether-s-io)

  - KNX(EIB), [KNXnet/IP](/FieldbusProtocolFamily#knxnetip) (EIBnet/IP)

  - HART, [HART-IP page](/HART-IP), HARTWireless, [www.hartcomm.org/](http://www.hartcomm.org/)

  - [OMRON-FINS page](/OMRON-FINS)

  - ...

## Wireshark and proprietary hardware busses

Currently Wireshark cannot capture from proprietary hardware busses directly, as there is no known capturing hardware available which is compatible with Wireshark. Captures on a [BACnet](/BACnet) MS/TP bus can, if written in pcap or pcapng format using the link-layer header type LINKTYPE\_BACNET\_MS\_TP, be read and dissected in Wireshark; captures from other proprietary hardware busses are not currently supported in Wireshark.

## BACnet

<span id="BACnet-1" class="anchor"></span> The [BACnet](/BACnet) protocol has been designed specifically to meet the communication needs of building automation and control systems for applications such as heating, ventilating, and air-conditioning control, lighting control, access control, and fire detection systems.

It is defined for several physical layers including:

  - BACnet MS/TP, based on RS-485;

  - BACnet Ethernet, based on [Ethernet](/Ethernet) and [LLC](/LLC);

  - BACnet ARCNET, based on [ARCNET](/ARCNET) and [LLC](/LLC);

  - BACnet/IP, based on UDP.

Wireshark dissectors for all of those physical layers exist.

## PROFIBUS

<span id="PROFIBUS-1" class="anchor"></span> PROFIBUS is a widely used fieldbus protocol and was introduced a long time ago (anyone got an exact date?). \[According to the book PROFIBUS, Edited by Klaus Bender, ISBN 13-012691-8, Copyright 1993, Prentice Hall publisher .. In the fall of 1987, the German Federal Minister for Research and Technology requested the collaborative project titled 'Field Bus'. 13 companies and 5 institutes worked together to develop an open field bus system under the name PROFIBUS, based upon the ISO model. April 1991 was when the PROFIBUS was standardized as the German standard DIN 19245.\]

It is based on [RS485](/RS485) (differential) bus hardware with a transfer rate of up to 12MBit/s.

There are several different PROFIBUS subprotocols existing, like PROFIBUS DP, PROFIBUS FMS and PROFIBUS PA.

## PROFINET

<span id="PROFINET-1" class="anchor"></span> The [PROFINET](/PROFINET) protocols are based on [Ethernet](/Ethernet). Dissectors for Wireshark exist.

## ETHERNET Powerlink

<span id="EthernetPowerlink" class="anchor"></span> The EPL protocol is based on [Ethernet](/Ethernet). Dissector for Wireshark exists ([Protocols/epl](/Protocols/epl)).

## Ether-S-Bus

<span id="Ether-S-Bus-1" class="anchor"></span> Ether-S-Bus is a successor of the S-Bus <span class="anchor" id="S-Bus"></span> protocol developed and introduced by the company Saia-Burgess Controls AG. Ether-S-Bus is used for the communication to and between PLCs (Programmable Logic Controller) manufactured by Saia-Burgess Controls Ltd. A dissector for [EtherSBus](/EtherSBus) exists. Note that there is no relation to the S-Bus common in the ISDN technology.

## Ether-S-I/O

<span id="Ether-S-IO" class="anchor"></span> Ether-S-I/O is a protocol developed by the company Saia-Burgess Controls AG. Ether-S-I/O is used for data transfer between PLCs (Programmable Logic Controller) and remote input/output devices (RIOs) manufactured by Saia-Burgess Controls Ltd. A dissector for [EtherSIO](/EtherSIO) is in preparation.

## EtherCAT

<span id="EtherCAT-1" class="anchor"></span> The EtherCAT protocol is based on [Ethernet](/Ethernet). Dissector for Wireshark exists ([Protocols/ethercat](/Protocols/ethercat)).

## KNXnet/IP

<span id="KNXnet" class="anchor"></span> KNXnet/IP (formerly EIBnet/IP) is a protocol for tunnelling KNX (EIB) communication over IP networks. The protocol is published in the[KNX Handbook](http://www.knx.org/knx-standard/how-to-order/) and in the European standard EN 13321-2:2006 (Open Data Communication in Building Automation, Controls and Building Management - Home and Building Electronic Systems - Part 2: KNXnet/IP Communication).

A dissector for Wireshark exists (<http://knxnetipdissect.sourceforge.net/>). Note that the plugin does **not** decode the cEMI frames embedded in the KNXnet/IP packets (i.e., the "non-IP" part such as the KNX destination address or the application layer control field). Neither does it decode datapoint types (e.g., dimmer setvalues).

## LONTalk

<span id="LONTalk-1" class="anchor"></span> The LONTalk protocol is a controller network used in a variety of places including building control, industrial automation, at railway stations, as on-train telemetry bus, in traffic management, and smart meters. The protocol was developed by [Echelon Inc.](http://echelon.com/) in 1988 and became an [ANSI](/ANSI)-approved standard in 1999 (ANSI/CEA-709.1). Different physical media are supported like power-line transmission, free-toplogy twisted-pair, fiber optics and encapsulation in UDP or TCP packets. The latter is specified in CEA-852 and known as CN/IP (Component Network over IP). A dissector for CN/IP exists ([Protocols/CEA-852](/Protocols/CEA-852)). A dissector for the LON frames (CEA-709.1) itself exists ([Protocols/CEA-709.1](/Protocols/CEA-709.1)) and is implemented as a subdissector of CN/IP.

---

Imported from https://wiki.wireshark.org/FieldbusProtocolFamily on 2020-08-11 23:14:04 UTC
