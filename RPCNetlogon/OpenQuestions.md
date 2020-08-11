# Open Questions about RPCNetlogon

Windows servers repond to 46 functions on the RPCNetlogon interface, of which we names and at least paritial decoding information for 30 in Samba4's [IDL](http://samba.org/ftp/unpacked/samba4/source/librpc/idl/netlogon.idl).

## Padding fields

A number of the calls on this pipe have a series of 32-bit fields and strings as 'expansion room' in a way not seen on other similar [DCE/RPC](/DCE/RPC) interfaces. While we know these exist, we do not know if they have some as-yet unknown meaning.

For example, in the calls [DatabaseDeltas](/DatabaseDeltas) (op 0x07) and [DatabaseDeltas](/DatabaseDeltas) (op 0x08), we are returned a list of deltas. Many of the delta levels (such as DELTA\_USER, switch level 0x5) contain 4 strings and 4 integers as apparent 'padding'.

## ServerAuthenticate2/3 flags

The [ServerAuthenticate2](/ServerAuthenticate2) (op 0x0f) and [ServerAuthencate3](/ServerAuthencate3) (op 0x1a) functions on this [DCE/RPC](/DCE/RPC) interface have an in/out negotiate\_flags field. We know of only 3 valid flags:

<div>

<table>
<tbody>
<tr class="odd">
<td><p>const int NETLOGON_NEG_ARCFOUR</p></td>
<td><p>0x00000004</p></td>
</tr>
<tr class="even">
<td><p>const int NETLOGON_NEG_128BIT</p></td>
<td><p>0x00004000</p></td>
</tr>
<tr class="odd">
<td><p>const int NETLOGON_NEG_SCHANNEL</p></td>
<td><p>0x40000000</p></td>
</tr>
</tbody>
</table>

</div>

While the pattern is interesting, it is unclear if these are the only valid flags, as others are sent. The other oddity with this feild is that the server uses it to detect 'NT4' clients. Which bit Win2k client set to indicate 'not NT4' is unclear, but an overall pattern of 0x0701ff seems to be 'not NT4'.

## SamLogon parameters

The [SamLogon](/SamLogon) call is used to log users onto a client workstation, or for the validation of an attempted network access. It has 3 variations: [SamLogon](/SamLogon) (op 0x02), [SamLogonEx](/SamLogonEx) (op 0x27) and [SamLogonWithFlags](/SamLogonWithFlags) (op 0x2d). All permit multiple logon levels, but we do not know how to perform some things:

  - How do we do a Kerberos PAC validation (validate that a PAC cannot have been manufactured locally, by validation to the KDC over RPCNetlogon)?

  - How do we validate a HTTP-Digest password against the plaintext password stored in AD (if available).

  - All the known levels include a [IdentityInfo](/IdentityInfo) structure, containing a domain name, account name, and workstation. It also contains a parameter\_control or flags field. We have a definition for only 3 of the 32 bits in this field:
    
    <div>
    
    <table>
    <tbody>
    <tr class="odd">
    <td><p>const int MSV1_0_CLEARTEXT_PASSWORD_ALLOWED</p></td>
    <td><p>0x002</p></td>
    </tr>
    <tr class="even">
    <td><p>const int MSV1_0_ALLOW_SERVER_TRUST_ACCOUNT</p></td>
    <td><p>0x020</p></td>
    </tr>
    <tr class="odd">
    <td><p>const int MSV1_0_ALLOW_WORKSTATION_TRUST_ACCOUNT</p></td>
    <td><p>0x800</p></td>
    </tr>
    </tbody>
    </table>
    
    </div>

---

Imported from https://wiki.wireshark.org/RPCNetlogon/OpenQuestions on 2020-08-11 23:24:04 UTC
