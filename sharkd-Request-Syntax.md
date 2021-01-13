## analyse

Lists the protocols found in a packet file and its start and end times.

### Syntax
```
{"req":"analyse"}
```

### Parameters

This request type has no other parameters.

### Examples
```
{"req":"analyse"}
{"frames":53882,"protocols":["frame","eth","ethertype","ip","tcp","http","tds","data-text-lines","data","arp","udp","dns","dcerpc","cldap","spnego","spnego-krb5","ldap","gss-api","ipv6","dhcpv6","kerberos","nbdgm","smb","browser","nbss","smb2","urlencoded-form"],"first":1476281874.317326069,"last":1476283715.849661112}
```