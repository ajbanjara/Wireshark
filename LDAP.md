# Lightweight Directory Access Protocol (LDAP)

The Lightweight Directory Access Protocol: The protocol accessing data from directory services like [OpenLDAP](http://www.openldap.org/), [Microsoft Active Directory](http://www.microsoft.com/windowsserver2003/technologies/directory/activedirectory/default.mspx), [Netscape Directory Server](http://enterprise.netscape.com/) or [Novell eDirectory](http://www.novell.com/products/edirectory/).

## History

LDAP was developed as simple access protocol for [X.500](/X.500) databases.

## Protocol dependencies

  - [TCP](/TCP)/[UDP](/UDP): Typically, LDAP uses [TCP](/TCP) or [UDP](/UDP) (aka [CLDAP](/CLDAP)) as its transport protocol. The well known TCP and UDP port for LDAP traffic is 389.

  - [SSL](/SSL)/[TLS](/TLS): LDAP can also be tunneled through [SSL](/SSL)/[TLS](/TLS) encrypted connections. The well known TCP port for [SSL](/SSL) is 636 while [TLS](/TLS) is negotiated within a plain [TCP](/TCP) connection on port 389.

## Example traffic

TODO: - Add example traffic here (as plain text or Wireshark screenshot).  
  
Windows - generate traffic with [LDP.exe](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/cc771022(v=ws.11)) which is available by loading [Remote Server Administration Tools (RSAT) for Windows](https://docs.microsoft.com/en-us/troubleshoot/windows-server/system-management-components/remote-server-administration-tools)  
  
Linux - [OpenLDAP](https://www.openldap.org/) daemon [slapd](https://www.openldap.org/software/man.cgi?query=slapd) - Ubuntu setup [here](https://ubuntu.com/server/docs/service-ldap)

## Wireshark

The LDAP dissector is (fully functional).

## Preference Settings

TODO: - Add links to preference settings affecting how LDAP is dissected.

## Example capture file

[SampleCaptures/ldap-controls-dirsync-01.cap](uploads/__moin_import__/attachments/SampleCaptures/ldap-controls-dirsync-01.cap) Sample LDAP PDU with DIRSYNC CONTROLS

[SampleCaptures/ldap-krb5-sign-seal-01.cap](uploads/__moin_import__/attachments/SampleCaptures/ldap-krb5-sign-seal-01.cap) Sample GSSAPI-KRB5 signed and sealed LDAP PDU

## Display Filter

A complete list of LDAP display filter fields can be found in the [LDAP display filter reference](http://www.wireshark.org/docs/dfref/l/ldap.html)

Show only the LDAP based traffic:

``` 
 ldap 
```

## Capture Filter

You cannot directly filter LDAP protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture LDAP traffic over the default port (389):

``` 
 tcp port 389 
```

## External links

  - [LDAPv2 - RFC 1777](http://www.ietf.org/rfc/rfc1777.txt)

  - [LDAPv3 - RFC 2251](http://www.ietf.org/rfc/rfc2251.txt)

  - [LDAPv3 current - RFC 4510](http://www.ietf.org/rfc/rfc4510.txt) and following

  - Additional links can be found here: <http://www.mozilla.org/directory/standards.html>

## Discussion

---

Imported from https://wiki.wireshark.org/LDAP on 2020-08-11 23:15:56 UTC
