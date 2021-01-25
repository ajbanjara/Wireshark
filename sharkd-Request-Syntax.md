The available sharkd request types are:

- [analyse](#analyse)
- [bye](#bye)
- [check](#check)
- [complete](#complete)
- [dumpconf](#dumpconf)
- [load](#load)

See the [sharkd wiki page](https://gitlab.com/wireshark/wireshark/-/wikis/Development/sharkd) for an overview.

# analyse

Lists the protocols found in a packet file and its start and end times.

### Request

| Name | Value | Type | M/O |
|------|-------|------|-----|
| req | "analyse" | string | M |

M/O: M = Mandatory, O = Optional

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

| Name | Value | Type | M/O |
|------|-------|------|-----|
| req | "bye" | string | M |

M/O: M = Mandatory, O = Optional

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

# check

Check the validity of a field name or filter expression.

### Request

| Name | Value | Type | M/O |
|------|-------|------|-----|
| req | "check" | string | M |
| field | A fully qualified field reference | string | O |
| filter | A display filter expression | string | O |

M/O: M = Mandatory, O = Optional

### Response

| Name | Value | Type |
|------|-------|------|
| err | Error code - always 0 | integer |
| field | Return message | string |
| filter | Return message | string |

Return Message:

| Return Message | Description |
|----------------|-------------|
| "ok" | The field or filter is valid |
| Other values | As described in the return message  |

### Examples
```
{"req":"check", "field":"tcp.srcport"}
{"err":0,"field":"ok"}

{"req":"check", "field":"transum.art"}
{"err":0,"field":"notfound"}

{"req":"check", "filter":"tcp.dstport==80"}
{"err":0,"filter":"ok"}

{"req":"check", "filter":"tcp.bad_field==80"}
{"err":0,"filter":"Neither \"tcp.bad_field\" nor \"80\" are field or protocol names."}

{"req":"check", "filter":"tcp.dstport==abc"}
{"err":0,"filter":"\"abc\" is not a valid number."}

{"req":"check", "filter":"tcp.dstport==80 &| tcp.srcport==45678"}
{"err":0,"filter":"Syntax error near \"tcp.srcport\"."}

{"req":"check", "filter":"tcp.dstport==80 && tcp.srcport==89000"}
{"err":0,"filter":"\"89000\" too big for this field, maximum 65535."}
```
---

# complete

Fetches the properties of a field(s) or preference(s).

### Request

| Name | Value | Type | M/O |
|------|-------|------|-----|
| req | "complete" | string | M |
| field | A fully qualified field reference | string | O |
| pref | A fully qualified preference reference | string | O |

M/O: M = Mandatory, O = Optional

The complete request assumes that the value specified for field or pref is the first part of its reference (i.e. prefix) and returns a list of every field that matches.  This is not a match based on the dotted hierarchy but a straightforward string match, e.g:

"field":"http.request" will return details for http.request_number as well as http.request.line, http.request.method, etc.

### Response

| Name | Value | Type |
|------|-------|------|
| err | Error code - always 0 | integer |
| field | "f":"_field_reference_"<br/>"t":_field_type_<br>"n":"_field_name_" | array of objects |
| pref| "f":"_preference_name_"<br/>"d":_preference_description_ | array of objects |

The field_type is a numeric value determined by an enumerated list - see [ftypes.h](https://gitlab.com/wireshark/wireshark/-/blob/master/epan/ftypes/ftypes.h) 

If the input field or pref values is incorrect, an empty array is returned.

### Examples
```
{"req":"complete", "field":"http.request.method"}
{"err":0,"field":[{"f":"http.request.method","t":26,"n":"Request Method"}]}

{"req":"complete", "field":"http.request"}
{"err":0,"field":[{"f":"http.request","t":2,"n":"Request"},{"f":"http.request_number","t":7,"n":"Request number"},{"f":"http.request.line","t":26,"n":"Request line"},{"f":"http.request.method","t":26,"n":"Request Method"},{"f":"http.request.uri","t":26,"n":"Request URI"},{"f":"http.request.uri.path","t":26,"n":"Request URI Path"},{"f":"http.request.uri.query","t":26,"n":"Request URI Query"},{"f":"http.request.uri.query.parameter","t":26,"n":"Request URI Query Parameter"},{"f":"http.request.version","t":26,"n":"Request Version"},{"f":"http.request.full_uri","t":26,"n":"Full request URI"},{"f":"http.request_in","t":35,"n":"Request in frame"}]}

{"req":"complete", "field":"http.bad_ref"}
{"err":0,"field":[]}

{"req":"complete", "pref":"tcp"}
{"err":0,"pref":[{"f":"tcp","d":"TCP"},{"f":"tcpencap","d":"TCPENCAP"},{"f":"tcpros","d":"TCPROS"}]}
```
---

# dumpconf

Lists one or all configuration parameters.

### Request

| Name | Value | Type | M/O |
|------|-------|------|-----|
| req | "dumpconf" | string | M |
| pref | A fully qualified preference reference | string | O |

M/O: M = Mandatory, O = Optional

If the pref value is not specified, all preferences are listed.

### Response

TBC

### Examples
```
{"req":"dumpconf","pref":"tcp.desegment_tcp_streams"}

{"req":"dumpconf"}
```
---

# load

Load a packet trace file for analysis.

### Request

| Name | Value | Type | M/O |
|------|-------|------|-----|
| req | "load" | string | M |
| file | Path and name of the file to be loaded | string | M |

M/O: M = Mandatory, O = Optional

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

