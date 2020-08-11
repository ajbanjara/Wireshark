# Intelligent Platform Management Interface Protocol. (IPMI)

The IPMI protocol define standardized, abstracted interfaces to the platform management subsystem. IPMI includes the definition of interfaces for extending platform management between board within the main chassis, and between multiple chassis.

The main IPMI features are:

  - IPMI isolates System Management Software from platform management Hardware
  - IPMI is scalable. An IPMI implementation can be cleanly and quickly extended with new functions, such as additionnal sensors, management controllers, or FRU inventory devices.
  - IPMI allows implementers to "plug in" their IPMI implementation to standard System Management Software (SMS) modules.

[IPMI specification](http://www.intel.com/design/servers/ipmi/)

## History

  - <http://en.wikipedia.org/wiki/Intelligent_Platform_Management_Interface>

## Protocols

The following protocols belong to this family

  - [IPMB](/IPMB_protocol): Intelligent Platform Management Bus protocol. The lowest level hardware management bus.

  - ICMB: Intelligent Chassis Management Bus protocol. A character-level transport for inter-chassis communications between intelligent chassis.

## External links

The following documents are companion and supporting specifications for IPMI and associated interfaces:

  - Advanced Configuration and Power Interface Specification, Revision 1.0b, February 8, 1999. ©1999,

Copyright © 1996, 1997, 1998, 1999 Intel Corporation, Microsoft Corporation, Toshiba Corp. <http://www.teleport.com/~acpi/>

  - [IPMB](/IPMB-Protocol) v1.0 Address Allocation, ©2001 Intel Corporation, Hewlett-Packard Company, NEC

Corporation, and Dell Computer Corporation. This document specifies the allocation of I2C addresses on the [IPMB](/IPMB_protocol). [http://developer.intel.com/design/servers/ipmi](http://developper.intel.com/design/servers/ipmi)

## Discussion

---

Imported from https://wiki.wireshark.org/IPMI on 2020-08-11 23:15:13 UTC
