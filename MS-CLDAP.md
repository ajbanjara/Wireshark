CLDAP is most commonly encountered on Microsoft Active Directory networks where clients use it to retrieve server information.

This particular operation is described in MS documentation as an "AD ping" but is perhaps more formally described as a RootDSE query for the [Netlogon](/RPCNetlogon) attribute. The [Netlogon](/RPCNetlogon) attribute value is not DER encoded. The operation is derived from an analogous SMB mailslot operation which is reflected in the encoding.

Windows 2000 Server requires UDP for the RootDSE [Netlogon](/RPCNetlogon) query (aka CLDAP "AD ping") whereas either TCP or UDP can be used with Windows 2003 Server.

The filter used by the RootDSE [Netlogon](/RPCNetlogon) query is (&([DnsDomain](/DnsDomain)=example.com)(Host=XP123)([NtVer](/NtVer)=\\06\\00\\00\\20)([DomainGuid](/DomainGuid)=\\01\\02\\03...) but the Host and [DomainGuid](/DomainGuid) are not required. It seems Wireshark may not display this filter correctly as the BER encoding does not reflect the nested & conditions displayed.

The [DomainGuid](/DomainGuid) is supplied in Little-Endian binary despite the fact that the BER encoding is otherwise Big-Endian.

The first 4 bits of the first byte of the [NtVer](/NtVer) value generates four different replies (\\01\\00\\00\\00, \\02\\00\\00\\00, \\04\\00\\00\\00, \\08\\00\\00\\00) but the author of this paragraph has only ever observed a value of \\06\\00\\00\\20. The mechanics behind these bits is not known but the structures seem to correspond to [Netlogon](/RPCNetlogon) mailslot operations.

Even though MS uses BER 1+4 byte length fields for non-primitive types, DER encoding works fine with both Windows 2000 Server and Windows 2003 Server.

# Specifications

Microsoft now has specifications available in the \[MS-ADTS\] document (<http://msdn.microsoft.com/en-us/library/cc223122%28PROT.10%29.aspx>).

---

Imported from https://wiki.wireshark.org/MS-CLDAP on 2020-08-11 23:16:56 UTC
