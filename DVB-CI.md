# DVB Common-Interface (DVB-CI)

DVB-CI defines an interface between a DVB receiver (TV set, Set-Top-Box, Bluray recorder etc.) and a PC-Card module (Conditional Access Module, CAM). It consists of a *transport stream interface* and a *command interface*.

On the transport stream interface, a DVB Transport Stream can be routed through the module and optionally be descrambled. The command interface transfers commands like *start descrambling*. The DVB-CI dissector processes command interface traffic and some hardware events such as *module inserted/extracted*

## History

DVB-CI was defined by DVB in 1997. An extension document followed in 1999, but the extensions defined there were never implemented in practice.

*CI+* added content security and other features on top of DVB-CI. CI+ version 1.2 was published in May 2009, version 1.3 followed in January 2011 and version 1.3.1 in October 2011. **

### standards documents

  - 
</em>[DVB-CI standard EN50221](http://www.dvb.org/technology/standards/En50221.V1.pdf) **

<li>

</li>

</em>[DVB-CI extensions TS 101 699](http://broadcasting.ru/pdf-standard-specifications/interfacing/dvb-ci/ts101699-v1-1-1.pdf) **

<li>

</li>

</em>[CI+ version 1.2](http://www.ci-plus.com/data/ci-plus_specification_v1.2.pdf) **

<li>

</li>

</em>[CI+ version 1.3](http://www.ci-plus.com/data/ci-plus_specification_v1.3.pdf) **

<li>

</li>

</em>[CI+ version 1.3.1](http://www.ci-plus.com/data/ci-plus_specification_v1.3.1.pdf) **

## Example traffic

</em>The screenshot shows dissection of the application\_info() APDU. The capture contains no timestamps. If timestamps are available, the dissector can handle them. ** ![wiresharkDvbciPcap.png](uploads/__moin_import__/attachments/DVB-CI/wiresharkDvbciPcap.png "wiresharkDvbciPcap.png") **

## Wireshark

</em>The DVB-CI dissector was written by Martin Kaiser ( <wireshark@kaiser.cx> ). It is fully functional and has been tested with many capture files.

</p>

The following features of the DVB-CI standard EN50221 are supported **

  - 
</em>hardware events (module inserted/removed, power on/off, ...) **

<li>

</li>

</em>Card Information Structure (CIS) **

<li>

</li>

</em>link, transport, session layer **

<li>

</li>

</em>reassembly of fragmented TPDUs and SPDUs ** The table below summarizes the supported resources on the application layer **

<div>

<table>
<tbody>
<tr class="odd">
<td></td>
<td><p>DVB-CI</p></td>
<td><p>CI+ 1.2</p></td>
<td><p>CI+ 1.3.1</p></td>
</tr>
<tr class="even">
<td><p>Resource Manager</p></td>
<td><p>ok</p></td>
<td><p>ok</p></td>
<td><p>ok</p></td>
</tr>
<tr class="odd">
<td><p>Application Info</p></td>
<td><p>ok</p></td>
<td><p>ok</p></td>
<td><p>ok</p></td>
</tr>
<tr class="even">
<td><p>Conditional Access</p></td>
<td><p>ok</p></td>
<td><p>ok</p></td>
<td><p>ok</p></td>
</tr>
<tr class="odd">
<td><p>Date-Time</p></td>
<td><p>ok</p></td>
<td><p>ok</p></td>
<td><p>ok</p></td>
</tr>
<tr class="even">
<td><p>MMI (high level)</p></td>
<td><p>ok</p></td>
<td><p>ok</p></td>
<td><p>ok</p></td>
</tr>
<tr class="odd">
<td><p>Host Control</p></td>
<td><p>ok</p></td>
<td><p>ok</p></td>
<td><p>ok</p></td>
</tr>
<tr class="even">
<td><p>Low-Speed Communication</p></td>
<td><p>partly</p></td>
<td><p>ok</p></td>
<td><p>ok</p></td>
</tr>
<tr class="odd">
<td><p>Host Language and Country</p></td>
<td><p>not defined</p></td>
<td><p>ok</p></td>
<td><p>ok</p></td>
</tr>
<tr class="even">
<td><p>CAM upgrade</p></td>
<td><p>not defined</p></td>
<td><p>ok</p></td>
<td><p>ok</p></td>
</tr>
<tr class="odd">
<td><p>Content Control</p></td>
<td><p>not defined</p></td>
<td><p>ok</p></td>
<td><p>ok</p></td>
</tr>
<tr class="even">
<td><p>Application MMI</p></td>
<td><p>not defined</p></td>
<td><p>ok</p></td>
<td><p>ok</p></td>
</tr>
<tr class="odd">
<td><p>Specific Application Support</p></td>
<td><p>not defined</p></td>
<td><p>ok</p></td>
<td><p>ok</p></td>
</tr>
<tr class="even">
<td><p>Operator Profile</p></td>
<td><p>not defined</p></td>
<td><p>not defined</p></td>
<td><p>ok</p></td>
</tr>
</tbody>
</table>

</div>

</em>There's no plans to support the DVB-CI extensions (TS 101 699) or low-level MMI. For low-speed communication, only IP connections are supported. ** The dissector uses pcap files with datalink type 235. The corresponding format is documented at <http://www.kaiser.cx/pcap-dvbci.html> **

## Preference Settings

  - 
</em>SAC encryption key **

<li>

</li>

</em>SAC init vector ** If you provide these two values for your capture file, wireshark is able to decrypt SAC messages sent on the CC resource. This requires libgrypt. Both values consist of 32 hex digits (16 hex bytes). They must be typed in without leading 0x. **

  - 
</em>Dissect LSC messages ** When this setting is enabled, wireshark tries to dissect the payload of LSC APDUs. It calls the dissector that's registered for the protocol and port number given in the connect\_on\_channel command. ** DVB-CI uses length fields in ASN.1 BER format in many messages. To dissect these length fields, the DVB-CI dissector uses the existing BER code. To display details of each length field, select *Show internal BER encapsulation tokens* from the *Edit / Preferences / Protocols / BER preferences* menu. **

## Example capture files

</em>[SampleCaptures/dvb-ci\_1.pcap](uploads/__moin_import__/attachments/SampleCaptures/dvb-ci_1.pcap) startup, requests for descrambling, removal ** [SampleCaptures/dvb-ci\_2.pcap](uploads/__moin_import__/attachments/SampleCaptures/dvb-ci_2.pcap) fragmentation and reassembly on the link layer **

## Display Filter

## Capture Filter

## External links

  - 
</em>[http://www.kaiser.cx/wireshark.html: Info page about the wireshark DVB-CI dissector (obsolete)](http://www.kaiser.cx/wireshark.html) **

## Discussion

</em>

</p>

---

Imported from https://wiki.wireshark.org/DVB-CI on 2020-08-11 23:13:40 UTC
