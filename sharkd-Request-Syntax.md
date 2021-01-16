The available statd request types are:

- [analyse](#analyse)
- [bye](#bye)
- [load](#load)

See the [sharkd wiki page](https://gitlab.com/wireshark/wireshark/-/wikis/Development/sharkd) for an overview.

# analyse

Lists the protocols found in a packet file and its start and end times.

### Request

| Name | Value | Type |
|------|-------|------|
| req | "analyse" | string |

NB: The request values is _analyse_ spelt in the UK English way - _analyze_ will not work.

### Response

| Name | Value | Type |
|------|-------|------|
| frames | Number of frames in the loaded file | integer |
| protocols | List of the protocol found in the loaded file | list of strings |
| first | Time of first entry in the capture | float representing epoch time and fractions of seconds |
| last | Time of last entry in the capture | float representing epoch time and fractions of seconds |

### Parameters

This request type has no other parameters.

### Examples
```
{"req":"analyse"}
{"frames":53882,"protocols":["frame","eth","ethertype","ip","tcp","http","tds","data-text-lines","data","arp","udp","dns","dcerpc","cldap","spnego","spnego-krb5","ldap","gss-api","ipv6","dhcpv6","kerberos","nbdgm","smb","browser","nbss","smb2","urlencoded-form"],"first":1476281874.317326069,"last":1476283715.849661112}
```
---

# bye

Ends the startd session.

If the request is sent in a Daemon Mode session connecting to sharkd, the connection terminates and the process for that session exits.  The daemon process continues to run and accept new connections.  Other existing sessions continues as normal.

If the request is sent in a Console Mode session, the sharkd process exits.

### Request

| Name | Value | Type |
|------|-------|------|
| req | "bye" | string |

### Response

There is no response to this request.

### Examples
```
{"req":"bye"}

C:\Development\wsbuild64\run\Debug\sharkd.exe (process 10396) exited with code 0.
To automatically close the console when debugging stops, enable Tools->Options->Debugging->Automatically close the console when debugging stops.
Press any key to close this window . . .
```
---

# load

Load a packet trace file for analysis.

### Request

| Name | Value | Type |
|------|-------|------|
| req | "load" | string |
| file | Path and name of the file to be loaded | string |

### Response

| Name | Value | Type |
|------|-------|------|
| err | Error code | integer |

Error Codes:

| Error Code | Description |
|------|-------------------|
| 0 | The operation was successful |
| 2 | The file doesn't exist |

### Examples
```
{"req":"load","file":"c:/traces/Contoso_01/web01/web01_00001_20161012151754.pcapng"}
{"err":0}

{"req":"load","file":"c:/traces/Contoso_01/web01/wrong_name.pcapng"}
{"err":2}
```
---

