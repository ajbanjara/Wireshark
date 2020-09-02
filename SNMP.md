# Simple Network Management Protocol (SNMP)

SNMP is used to monitor and manage devices on networks.

## History

For an overview on SNMP, read this <http://en.wikipedia.org/wiki/Simple_Network_Management_Protocol>  
Next tackle [The Simple Times](https://www.simple-times.org/) newsletters which include articles from the RFC authors and Dr. SNMP.

## Protocol dependencies

Typically, SNMP uses [UDP](/UDP) as its transport protocol. The well known UDP ports for SNMP traffic are 161 (SNMP) and 162 (SNMPTRAP). It can also run over [TCP](/TCP), [Ethernet](/Ethernet), [IPX](/IPX), and other protocols. [ATM](/ATM) uses SNMP as its ILMI (Integrated Local Management Interface) protocol.

## Wireshark

The SNMP dissector is fully functional. If properly configured allows to decrypt encrypted SNMPv3 packets.

## MIB files

If built with the [libsmi](http://www.ibr.cs.tu-bs.de/projects/libsmi) libraries, Wireshark uses those libraries to resolve numeric [OIDs](http://www.pcwdld.com/what-is-snmp-and-tutorial#oid) (e.g. 1.3.6.1.2.1.2.2.1.6.1) into human readable format (e.g. IF-MIB::ifPhysAddress.1). The default installation only contains some common MIB files so Wireshark won't be able to resolve all possible OIDs.

You can configure which MIB files are loaded by using the preference setting mentioned below.

When specifying the MIB modules to load, use a colon separator. Note that the MIB module name is not necessarily the name of the file itself. The MIB name to use may be discovered by looking for the DEFINITIONS keyword in the MIB file.

For Unix systems, whether your version of Wireshark is built with the libsmi libraries can be determined by opening the "About Wireshark" window with the "Help ==\> About Wireshark" menu item. The third paragraph in the "Wireshark" tab of that window (which is the tab that is opened by default) will include the phrase "with SMI", followed by the version number of the libsmi libraries, if Wireshark is built with libsmi, and will include the phrase "without SMI" if Wireshark is built without libsmi. The macOS binaries available from the Wireshark Web site are built with the libsmi libraries. If Wireshark is built with libsmi, it assumes the MIB files are stored in directories under /usr/local/share/mibs.

For Windows, the binaries available from the Wireshark Web site are built with the libsmi libraries. The MIB files are stored e.g. in C:\\Program Files\\Wireshark\\snmp\\mibs.

In versions of Wireshark built with libsmi, in the the "Preferences" dialog opened by the "Edit ==\> Preferences" menu item, under the topic "Name resolution", you will find a checkbox "Enable OID resolution" and also a button "SMI (MIB amd PIB) Modules" which opens an editing window where you can add/remove modules. The name of the file you add to the "mibs" directory mentioned above must be the same as the module name itself (found in the MIB itself at the start, just before "DEFINITIONS ::=BEGIN").

XXX - are all MIB files in these dirs are inspected and only the "right" files loaded?

It is best to download MIB definition (ASN.1) files directly from the vendor/author of the SNMP agent.  
Many network-related MIBs definitions can be downloaded from <http://www.mibdepot.com>.  
Verify that the download matches the software running on the SNMP agent.

### Which MIB's do I need?

If you see any unresolved OID's you may need to add a MIB file to the Net-SNMP libs.

The following will give an example to add the missing information to display [SampleCaptures/b6300a.cap](uploads/__moin_import__/attachments/SampleCaptures/b6300a.cap) correctly.

In packet 7 you see: SNMPv2-SMI::enterprise.253.8.64.4.2.1.5.10.14150900 resp. 1.3.6.1.4.1.253.8.64.4.2.1.5.10.14150900.

What's missing now is the enterprise with the id 253. [The IANA Private Enterprise Numbers list](http://www.iana.org/assignments/enterprise-numbers) tells us that this is Xerox.

Get hold of the Xerox MIBs from one of the links above and place them in the mibs directory (you need the printer-MIB as well) and change the file ending from .mib to .txt.

When loading a specified MIB module failed a warning message like: *Cannot find module (IP-MIB): At line 0 in (none)* will be shown on the console at Wireshark startup. WIN32: To have a console window already open at that time, set the preference setting "Open a console window" to "Always", Save the Preferences and restart Wireshark. Otherwise the console will be open too late and you'll see nothing.

## Preference Settings

Wireshark's SNMP protocol preferences let you control the display of the OID in the Info column, desegmentation of SNMP over TCP, and which MIB modules to load (see above).

The USMuserTable file preference allows the user to choose a file with the engine-ids, usernames and passwords in order to allow decryption of encrypted packets. The file is formatted as follows:

Please note: the order of the parameters in the file will vary, depending on your version of wireshark\! If the sample below doesn't work for you, go into [WireShark](/WireShark) -\> Edit -\> Preferences -\> Protocols -\> SNMP, and add the settings through the GUI; afterwards, look at the created snmp\_users file to determine the order of the columns.

Recent versions of Wireshark seem to use the following format for SNMP decryption (\~/.wireshark/snmp\_users)

    # This file is automatically generated, DO NOT MODIFY.
    # Engine ID, Username, Authentication model, Password, Privacy Protocol, Privacy Password
    12abed,"admin","MD5","myauth","DES","mysecretkey"

where

  - the Engine ID is a hex string corresponding to the Engine ID in the snmp.msgAuthoritativeEngineID field of the SNMP PDU. If the Engine ID is left blank, all encrypted PDUs with the same username as the entry will attempt to be decrypted regardless of the Engine ID in the PDU. If the Engine ID contains a hex string, the credentials will only be applied to those SNMP PDUs that have that particular Engine ID. In previous Wireshark releases, a \* character had to be used instead of leaving the field blank, as described in the outdated example below.  

  - Authentication model can currently (2.0.2) be one of MD5 or SHA1.  

  - Privacy Protocol can currently be one of DES, AES, AES192 or AES256.

An example of encrypted SNMP PDUs can be found at the [SNMP section](/SampleCaptures#snmp) of the example captures page.

The following example seems to be outdated (fix me, I don't want to delete it in case it offers value to someone).

    # this is an example snmp_users_file (e.g. ~/.wireshark/snmp_users)
    
    # comments start with a # and finish at the end of line
    # empty lines are ignored
    
    # each record has the following fields
    # engine-id username auth_pass priv_pass auth_proto priv_proto
    # fields are separated by whitespace
    # engine-id, username and passwds can be either "double quoted" or hex
    # double quoted strings are c-style strings and take escape chars
    # a '*' as engine-id matches any any given engine-id
    # auth_proto can be either MD5 or SHA1 (or just SHA). Defaults to MD5 if not given.
    # priv_proto can be either DES or AES. Defaults to DES if not given.
    # protocols are case-insensitive (md5 == MD5)
    # first match wins (place localized entries before those for any engine)
    
    80001F888059DC486145A26322 "pippo" "plutoxxx" "PLUTOxxx" MD5 DES
    
    # pippo for any engine will use DES and MD5
    * "pippo" "plutoxxx" "PLUTOxxx"
    
    
    # SHA + DES
    80001F888059DC486145A26322 "pippo2" "plutoxxx" "PLUTOxxx" SHA
    
    # SHA + AES
    80001F888059DC486145A26322 "pippo3" "plutoxxx" "PLUTOxxx" SHA AES
    
    # MD5 + AES
    80001F888059DC486145A26322 "pippo4" "plutoxxx" "PLUTOxxx" AES

## Example traffic

[SampleCaptures/b6300a.cap](uploads/__moin_import__/attachments/SampleCaptures/b6300a.cap) A bunch of GETs and RESPONSEs

[encrypted SNMP example capture](/SampleCaptures#snmp)

## Display Filter

A complete list of SNMP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/s/snmp.html)

Show only the SNMP based traffic:

``` 
 snmp
```

## Capture Filter

You cannot directly filter SNMP protocols while capturing. However, if you know the [UDP](/UDP) ports used (see above), you can filter on that ones.

Capture SNMP traffic over the default ports (161 and 162):

``` 
 udp port 161 or udp port 162
```

## External links

SGMP (an ancestor of SNMP):

  - [RFC 1028](http://www.ietf.org/rfc/rfc1028.txt) *A Simple Gateway Monitoring Protocol*

SNMPv1

  - [RFC 1155](http://www.ietf.org/rfc/rfc1155.txt) *Structure and Identification of Management Information for TCP/IP-based Internets*

  - [RFC 1156](http://www.ietf.org/rfc/rfc1156.txt) *Management Information Base for Network Management of TCP/IP-based internets*

  - [RFC 1157](http://www.ietf.org/rfc/rfc1157.txt) *A Simple Network Management Protocol (SNMP)*

  - [RFC 1158](http://www.ietf.org/rfc/rfc1158.txt) *Management Information Base for Network Management of TCP/IP-based internets: MIB-II*

SNMPv2

  - [RFC 1441](http://www.ietf.org/rfc/rfc1441.txt) *Introduction to version 2 of the Internet-standard Network Management Framework*

  - [RFC 1442](http://www.ietf.org/rfc/rfc1442.txt) *Structure of Management Information for version 2 of the Simple Network Management Protocol (SNMPv2)*

  - [RFC 1443](http://www.ietf.org/rfc/rfc1443.txt) *Textual Conventions for version 2 of the Simple Network Management Protocol (SNMPv2)*

  - [RFC 1444](http://www.ietf.org/rfc/rfc1444.txt) *Conformance Statements for version 2 of the Simple Network Management Protocol (SNMPv2)*

  - [RFC 1445](http://www.ietf.org/rfc/rfc1445.txt) *Administrative Model for version 2 of the Simple Network Management Protocol (SNMPv2)*

  - [RFC 1446](http://www.ietf.org/rfc/rfc1446.txt) *Security Protocols for version 2 of the Simple Network Management Protocol (SNMPv2)*

  - [RFC 1447](http://www.ietf.org/rfc/rfc1447.txt) *Party MIB for version 2 of the Simple Network Management Protocol (SNMPv2)*

  - [RFC 1448](http://www.ietf.org/rfc/rfc1448.txt) *Protocol Operations for version 2 of the Simple Network Management Protocol (SNMPv2)*

  - [RFC 1449](http://www.ietf.org/rfc/rfc1449.txt) *Transport Mappings for version 2 of the Simple Network Management Protocol (SNMPv2)*

  - [RFC 1450](http://www.ietf.org/rfc/rfc1450.txt) *Management Information Base for version 2 of the Simple Network Management Protocol (SNMPv2)*

  - [RFC 1451](http://www.ietf.org/rfc/rfc1451.txt) *Manager-to-Manager Management Information Base*

  - [RFC 1452](http://www.ietf.org/rfc/rfc1452.txt) *Coexistence between version 1 and version 2 of the Internet-standard Network Management Framework*

SNMPv2 (Community based)

  - [RFC 1901](http://www.ietf.org/rfc/rfc1901.txt) *Introduction to Community-based SNMPv2*

  - [RFC 1902](http://www.ietf.org/rfc/rfc1902.txt) *Structure of Management Information for Version 2 of the Simple Network Management Protocol (SNMPv2)*

  - [RFC 1903](http://www.ietf.org/rfc/rfc1903.txt) *Textual Conventions for Version 2 of the Simple Network Management Protocol (SNMPv2)*

  - [RFC 1904](http://www.ietf.org/rfc/rfc1904.txt) *Conformance Statements for Version 2 of the Simple Network Management Protocol (SNMPv2)*

  - [RFC 1905](http://www.ietf.org/rfc/rfc1905.txt) *Protocol Operations for Version 2 of Simple Network Management Protocol (SNMPv2)*

  - [RFC 1906](http://www.ietf.org/rfc/rfc1906.txt) *Transport Mappings for Version 2 of the Simple Network Management Protocol (SNMPv2)*

  - [RFC 1907](http://www.ietf.org/rfc/rfc1907.txt) *Management Information Base for Version 2 of the Simple Network Management Protocol (SNMPv2)*

  - [RFC 1908](http://www.ietf.org/rfc/rfc1908.txt) *Coexistence between Version 1 and Version 2 of the Internet-standard Network Management Framework*

SNMPv3

  - [RFC 2271](http://www.ietf.org/rfc/rfc2271.txt) *An Architecture for Describing SNMP Management Frameworks*

  - [RFC 2272](http://www.ietf.org/rfc/rfc2272.txt) *Message Processing and Dispatching for the Simple Network Management Protocol (SNMP)*

  - [RFC 2273](http://www.ietf.org/rfc/rfc2273.txt) *SNMPv3 Applications*

  - [RFC 2275](http://www.ietf.org/rfc/rfc2275.txt) *View-based Access Control Model (VACM) for the Simple Network Management Protocol (SNMP)*

  - [RFC 3414](http://www.ietf.org/rfc/rfc3414.txt) *User-based Security Model (USM) for version 3 of the Simple Network Management Protocol (SNMPv3)*

  - [RFC 3826](http://www.ietf.org/rfc/rfc3826.txt) *The Advanced Encryption Standard (AES) Cipher Algorithm in the SNMP User-based Security Model*

RMON

  - [RFC 1271](http://www.ietf.org/rfc/rfc1271.txt) *Remote Network Monitoring Management Information Base*

  - [RFC 1513](http://www.ietf.org/rfc/rfc1513.txt) *Token Ring Extensions to the Remote Network Monitoring MIB*

  - [RFC 1757](http://www.ietf.org/rfc/rfc1513.txt) *Remote Network Monitoring Management Information Base* (obsoletes 1271)

  - [RFC 2021](http://www.ietf.org/rfc/rfc2021.txt) *Remote Network Monitoring Management Information Base - Version 2 - using SMIv2*

  - [RFC 2613](http://www.ietf.org/rfc/rfc2613.txt) *Remote Network Monitoring MIB Extensions for Switched Networks Version 1.0*

  - [RFC 2819](http://www.ietf.org/rfc/rfc2895.txt) *Remote Network Monitoring Management Information Base* (obsoletes 1757)

  - [RFC 2895](http://www.ietf.org/rfc/rfc2895.txt) *Remote Network Monitoring MIB Protocol Identifier Reference*

  - [RFC 2896](http://www.ietf.org/rfc/rfc2896.txt) *Remote Network Monitoring MIB Protocol Identifier Macros*

  - [RFC 3144](http://www.ietf.org/rfc/rfc3144.txt) *Remote Monitoring MIB Extensions for Interface Parameters Monitoring*

  - [RFC 3273](http://www.ietf.org/rfc/rfc3273.txt) *Remote Network Monitoring Management Information Base for High Capacity Networks*

  - [RFC 3287](http://www.ietf.org/rfc/rfc3287.txt) *Remote Monitoring MIB Extensions for Differentiated Services*

  - [RFC 3395](http://www.ietf.org/rfc/rfc3395.txt) *Remote Network Monitoring MIB Protocol Identifier Reference Extensions*

  - [RFC 3434](http://www.ietf.org/rfc/rfc3434.txt) *Remote Monitoring MIB Extensions for High Capacity Alarms*

SMI

  - [RFC 2578](http://tools.ietf.org/html/rfc2578) *Structure of Management Information Version 2 (SMIv2)*

  - [RFC 2579](http://tools.ietf.org/html/rfc2579) *Textual Conventions for SMIv2*

  - [RFC 2580](http://tools.ietf.org/html/rfc2580) *Conformance Statements for SMIv2*

## Discussion

Is there an easy way to find out, which MIB is really needed? From the example above: do I need all Xerox MIBs? Is there an online resource to find a map between the OID and the MIB? *<http://www.mibdepot.com> can help on this*

:smiley: After years thinking and reading RFCs and various other documents, today, I finally understood. "**Simple**" refers to "Network" not to "Management Protocol"\! So it is a Management Protocol for **Simple** Networks not a **Simple** Protocol for Management of Networks... That explains why it's called "**Simple**". It was that **Simple** but it took me years to understand it\! -- [LuisOntanon](/LuisOntanon)

---

Imported from https://wiki.wireshark.org/SNMP on 2020-08-11 23:25:45 UTC
