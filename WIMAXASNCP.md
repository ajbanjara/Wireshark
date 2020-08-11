# WiMAX ASN Control Protocol (WIMAXASNCP)

## History

## Protocol dependencies

  - [UDP](/UDP): WIMAXASNCP uses UDP as its transport protocol. The well known UDP port for WIMAXASNCP traffic is 2231.

## Example traffic

![wimaxasncp1.png](uploads/__moin_import__/attachments/WIMAXASNCP/wimaxasncp1.png "wimaxasncp1.png")

## Wireshark

The WIMAXASNCP dissector is based on the WiMAX Forum Network Architecture (Stage 3: Detailed Protocols and Procedures), Release 1.0.0, March 28, 2007 specification and is mostly functional. Some TLVs are not fully decoded, but if the type is known to the dissector, the displayed value will default to hex.

### WiMAX Spec Deltas

#### Message Type Decoding

The spec defines the message types MS\_Attachment\_Req, MS\_Attachment\_Rsp, and MS\_Attachment\_Ack as having the function type Data Path Control:

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>WiMAX Forum Network Architecture</strong></p></td>
</tr>
<tr class="even">
<td><p><strong>Function: Data Path Control (3)</strong></p></td>
</tr>
<tr class="odd">
<td><p>MS_Attachment_Req (13)</p></td>
</tr>
<tr class="even">
<td><p>MS_Attachment_Rsp (14)</p></td>
</tr>
<tr class="odd">
<td><p>MS_Attachment_Ack (15)</p></td>
</tr>
</tbody>
</table>

</div>

The plugin additionally recognizes the message types MS\_Attachment\_Req, MS\_Attachment\_Rsp, and MS\_Attachment\_Ack as having the function type MS State:

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Wireshark WIMAXASNCP Plugin</strong></p></td>
</tr>
<tr class="even">
<td><p><strong>Function: MS State (9)</strong></p></td>
</tr>
<tr class="odd">
<td><p>MS_<a href="/PreAttachment" class="nonexistent">PreAttachment</a>_Req (6)</p></td>
</tr>
<tr class="even">
<td><p>MS_<a href="/PreAttachment" class="nonexistent">PreAttachment</a>_Rsp (7)</p></td>
</tr>
<tr class="odd">
<td><p>MS_<a href="/PreAttachment" class="nonexistent">PreAttachment</a>_Ack (8)</p></td>
</tr>
</tbody>
</table>

</div>

Furthermore, the dissector recognizes the function type Session. The additional message types are as follows:

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Wireshark WIMAXASNCP Plugin</strong></p></td>
</tr>
<tr class="even">
<td><p><strong>Function: Session (11)</strong></p></td>
</tr>
<tr class="odd">
<td><p>Session_Release_Req (1)</p></td>
</tr>
<tr class="even">
<td><p>Session_Release_Rsp (2)</p></td>
</tr>
<tr class="odd">
<td><p>Session_Release_Ack (3)</p></td>
</tr>
<tr class="even">
<td><p>Session_Failure_Rpt (4)</p></td>
</tr>
<tr class="odd">
<td><p>Session_Failure_Rsp (5)</p></td>
</tr>
</tbody>
</table>

</div>

#### Additional TLVs

The WIMAXASNCP dissector recognizes the following additional TLVs.

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Type</strong></p></td>
<td><p><strong>Name</strong></p></td>
<td><p><strong>Value</strong></p></td>
</tr>
<tr class="even">
<td><p>1136</p></td>
<td><p>Control Plane Indicator</p></td>
<td><p>0 = Success, 1 = Failure</p></td>
</tr>
<tr class="odd">
<td><p>1228</p></td>
<td><p>IM Auth Indication</p></td>
<td><p>0 = Success, 1 = Failure</p></td>
</tr>
</tbody>
</table>

</div>

### Limitations

#### 802.16e-2005 Related TLVs

The dissector is currently unable to decode, beyond the default hex dump, the 802.16e-2005 related TLVs. For reference, they are as follows:

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Type</strong></p></td>
<td><p><strong>Name</strong></p></td>
<td><p><strong>Notes</strong></p></td>
</tr>
<tr class="even">
<td><p>49</p></td>
<td><p>DCD Setting</p></td>
<td><p>Compound, as specified in [802.16e-2005], section 11.1.7.</p></td>
</tr>
<tr class="odd">
<td><p>72</p></td>
<td><p>Full DCD Setting</p></td>
<td><p>Compound, as specified in [802.16e-2005], section 11.1.7.</p></td>
</tr>
<tr class="even">
<td><p>73</p></td>
<td><p>Full UCD Setting</p></td>
<td><p>Compound, as specified in [802.16e-2005], section 11.1.7.</p></td>
</tr>
<tr class="odd">
<td><p>195</p></td>
<td><p>UCD Setting</p></td>
<td><p>Compound, as specified in [802.16e-2005], section 11.1.7.</p></td>
</tr>
<tr class="even">
<td><p>74</p></td>
<td><p>Global Service Class Change</p></td>
<td><p>Global Service Class Name as defined in IEEE802.16e.</p></td>
</tr>
<tr class="odd">
<td><p>81</p></td>
<td><p>IDLE Mode Retain Info</p></td>
<td><p>Encoded as in 802.16e.</p></td>
</tr>
<tr class="even">
<td><p>118</p></td>
<td><p>Paging Cycle</p></td>
<td><p>Cycle in which the paging message is transmitted within the paging group (aligned with 802.16e).</p></td>
</tr>
<tr class="odd">
<td><p>169</p></td>
<td><p>SAID</p></td>
<td><p>SAID definition as per 802.16.</p></td>
</tr>
</tbody>
</table>

</div>

#### Unclearly Defined TLVs

These TLVs are not clearly defined by the spec and are decoded as a hex dump.

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Type</strong></p></td>
<td><p><strong>Name</strong></p></td>
<td><p><strong>Notes</strong></p></td>
</tr>
<tr class="even">
<td><p>41</p></td>
<td><p>Data Integrity Info</p></td>
<td><p>No length, value, or description.</p></td>
</tr>
<tr class="odd">
<td><p>78</p></td>
<td><p>HO Process Optimization</p></td>
<td><p>Value: 8-bit integer representing HO Process Optimization code, but no description.</p></td>
</tr>
<tr class="even">
<td><p>104</p></td>
<td><p>MS Mobility Mode</p></td>
<td><p>Numeric base is not defined. Values are given as 00, 01, 10, 11. I presume this is binary, but other TLVs clearly define binary (e.g. 0b11) or hex (0x11).</p></td>
</tr>
<tr class="odd">
<td><p>167</p></td>
<td><p>R3 Operation Status</p></td>
<td><p>Numeric base is not defined. See description above.</p></td>
</tr>
<tr class="even">
<td><p>121</p></td>
<td><p>Paging Start/Stop</p></td>
<td><p>Length is defined as 1, but no values are provided.</p></td>
</tr>
<tr class="odd">
<td><p>122</p></td>
<td><p>PC Relocation Indication</p></td>
<td><p>Length is defined as 1, but no values are provided.</p></td>
</tr>
<tr class="even">
<td><p>148</p></td>
<td><p>Relocation Response</p></td>
<td><p>Values defined as boolean, but boolean not defined in the spec. Two other boolean TLVs exist, but they differ on the definition of success and failure. See Anchor PC Relocation Request Response (14) which defines 0xFF for accept and 0x00 for refuse, and LU Result Indicator (90) which defines 0 as success and 1 as failure.</p></td>
</tr>
<tr class="odd">
<td><p>149</p></td>
<td><p>Relocation Success Indication</p></td>
<td><p>Values defined as boolean, but boolean not defined in the spec. See description above.</p></td>
</tr>
<tr class="even">
<td><p>155</p></td>
<td><p>ROHC/ECRTP Context ID</p></td>
<td><p>Length, value described as TBD.</p></td>
</tr>
<tr class="odd">
<td><p>181</p></td>
<td><p>Service Authorization Code</p></td>
<td><p>No length, value, or description.</p></td>
</tr>
</tbody>
</table>

</div>

These TLVs are not clearly defined by the spec, but some attempt has been made to decode them.

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Type</strong></p></td>
<td><p><strong>Name</strong></p></td>
<td><p><strong>Notes</strong></p></td>
<td><p><strong>Dissector Behavior</strong></p></td>
</tr>
<tr class="even">
<td><p>82</p></td>
<td><p>IP Destination Address and Mask</p></td>
<td><p>Ambiguous. The length in octets is described as Nx8 (IPv4) or Nx32 (IPv6), but this function cannot always differentiate between IPv4 and IPv6. For example, if length = 32, then is it IPv4 where N=4 (4x8) or IPv6 where N=1 (1x32)?</p></td>
<td><p>Presume lengths that *can* indicate an IPv6 address and mask list *do* denote an IPv6 address and mask list.</p></td>
</tr>
<tr class="odd">
<td><p>84</p></td>
<td><p>IP Source Address and Mask</p></td>
<td><p>Ambiguous. See description above.</p></td>
<td><p>Same as above.</p></td>
</tr>
<tr class="even">
<td><p>0xFFFF</p></td>
<td><p>Vendor Specific TLV</p></td>
<td><p>The format of the vendor specific information field (VSIF) is not clearly defined. It appears to be compound as the spec states that the vendor ID field shall be the first TLV embedded inside the VSIF. However, the vendor ID is shown as a 24-bit value. Does this mean the field is 24-bits? If so, how is alignment/padding handled?</p></td>
<td><p>Decodes the vendor ID as a non-padded 24-bit value and dumps the rest as hex.</p></td>
</tr>
</tbody>
</table>

</div>

#### Other TLVs

The following TLVs simply haven't been implemented yet. All should be reasonably straightforward to dissect, except possibly the EAP payload.

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Type</strong></p></td>
<td><p><strong>Name</strong></p></td>
<td><p><strong>Notes</strong></p></td>
</tr>
<tr class="even">
<td><p>48</p></td>
<td><p>DCD/UCD Configuration Change Count</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>60</p></td>
<td><p>DL PHY Quality Info</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>61</p></td>
<td><p>DL PHY Service Level</p></td>
<td><p>Display in hex or decimal (or other)?</p></td>
</tr>
<tr class="odd">
<td><p>62</p></td>
<td><p>EAP Payload</p></td>
<td><p>Hard? Might be able to borrow the RADIUS version.</p></td>
</tr>
<tr class="even">
<td><p>85</p></td>
<td><p>IP TOS/DSCP Range and Mask</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>94</p></td>
<td><p>Media Flow Type</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>174</p></td>
<td><p>SBC Context</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>197</p></td>
<td><p>UL PHY Quality Info</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>198</p></td>
<td><p>UL PHY Service Level</p></td>
<td><p>Display in hex or decimal (or other)?</p></td>
</tr>
</tbody>
</table>

</div>

## Preference Settings

(XXX add links to preference settings affecting how PROTO is dissected).

## Example capture file

## Display Filter

A complete list of WIMAXASNCP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/protofirstletter/proto.html)

Show only the WIMAXASNCP based traffic:

``` 
 wimaxasncp 
```

## Capture Filter

You cannot directly filter WIMAXASNCP protocols while capturing. However, if you know the [UDP](/UDP) port used (see above), you can filter on that one.

Capture only the WIMAXASNCP traffic over the default port (2231):

``` 
 udp port 2231 
```

## External links

  - WiMAX Forum <http://wimaxforum.org>

## Discussion

---

Imported from https://wiki.wireshark.org/WIMAXASNCP on 2020-08-11 23:27:26 UTC
