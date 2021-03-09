## Introduction

sharkd is a program that makes the powerful dissection and analysis capabilities of Wireshark available via a programmatic interface.  A program can send simple JSON-format requests to sharkd to load, analyse and manipulate network packet files.

Many of the functions that we see in the standard Wireshark user interface are available via sharkd including packet protocol tree, packet bytes and display filters.

[[_TOC_]]

The wiki page [sharkd Request Syntax](sharkd-Request-Syntax) gives full details of the request types and their parameters.

## Installation

The sharkd executable is not included in the standard Wireshark binary package (Windows MSI, etc.) and so must be built from source.  Building sharkd under Windows results in a sharkd.exe executable.

sharkd will not work with just the sharkd.exe file; it uses Wireshark DLLs and preference files.  Therefore, we need to install everything that results from a build of sharkd.

## Running sharkd

We can run sharkd in two modes:

- Console Mode where we can send JSON requests via stdin and receive JSON responses from stdout
- Daemon Mode where sharkd starts as a service running on a socket, allowing us to send JSON requests and receive JSON responses via the socket

Multiple sessions can connect to sharkd running in Daemon Mode.  A dedicated sharkd.exe process is spun up for each connection.  Therefore, when there are no connections there is a single sharkd process, when there is one active session there are two sharkd processes, when a second connection is made there will be three sharkd processes, and so on.

There are two command line option formats; Classic (the original format) and POSIX.  The POSIX format attempts to follow the POSIX command line standard and offers more options.  We refer to the POSIX extended range of options as the Gold options.

### Classic

To start sharkd in Console Mode use the command:
```
  sharkd -
```  
To start sharkd in Daemon Mode running on a TCP port, use the command:
```
  sharkd tcp:127.0.0.1:4446
```
This will result in sharkd listening for TCP connections to localhost TCP port 4446.  You can change the TCP port number if necessary.

UNIX sockets are also supported:
```
  sharkd unix:/tmp/sharkd.sock
```
In this case, sharkd always uses the preferences set in the Default profile.  sharkd obeys other aspects of the Default profile such as disabled_protos, enabled_protos, etc.

### Gold
```
Gold (gold_options):
  -a <socket>, --api <socket>
                           listen on this socket
  -h, --help               show this help information
  -v, --version            show version information
  -C <config profile>, --config-profile <config profile>
                           start with specified configuration profile

  Examples:
    sharkd -C myprofile
    sharkd -a tcp:127.0.0.1:4446 -C myprofile
```
If you change any preferences in the selected profile (by editing the preferences file or using Wireshark Edit -> Preferences) the changes will not take effect in any current sharkd sessions.  You will need to start a new session.

sharkd obeys other aspects of the selected profile such as disabled_protos, enabled_protos, etc.

## sharkd Requests

### Request Syntax

sharkd service requests have the general format:
```
  {"jsonrpc":"2.0","id":_n_,"method":"_method_name_", "params":{"_option_":"_value_","_option_":"_value_",...}}
```
where _n_ is a non-zero integer value that can be used to correlate responses with requests.

Some method calls don't require a method, in which case the syntax is:
```
  {"jsonrpc":"2.0","id":_n_,"method":"_method_name_"}
```

The request processor uses a simple gets(...) function to read incoming requests.  This means that:
- The request may only contain printable characters
- Special characters must be escaped
- Numeric values must be unquoted
- Boolean values must be _true_ or _false_
- The entire requests must be on a single line
- The request must end with a line feed

The commands **must be in lower case** as shows below.  Quotes around keys and values **must be double quotes** - single quotes produce a JSON error.  Also note the use of the UK English spelling of analyse; analyze won't work.

This version of sharkd produces an error response for request syntax and value errors, such as these:

```
  {"jsonrpc":"2.0","id":1,"method":"status}
  {"jsonrpc":"2.0","id":0,"error":{"code":-32600,"message":"Invalid JSON(1)"}}

  {"jsonrpc":"2.0","id":1}
  {"jsonrpc":"2.0","id":1,"error":{"code":-32600,"message":"Mandatory member method is missing"}}

  {"jsonrpc":"2.0","id":1,"method":"setconf","params":{}}
  {"jsonrpc":"2.0","id":1,"error":{"code":-32600,"message":"Mandatory parameter name is missing"}}

  {"jsonrpc":"2.0","id":1,"method":"setconf","params":{"name":"tcp.desegment_tcp_streams"}}
  {"jsonrpc":"2.0","id":1,"error":{"code":-32600,"message":"Mandatory parameter value is missing"}}
```

### Request Types

The request types are:

- [analyse](sharkd-Request-Syntax#analyse) - lists the protocols found in a packet file and its start and end times
  + e.g. `{"jsonrpc":"2.0","id":1,"method":"analyse"}`
- [bye](sharkd-Request-Syntax#bye) - end a startd session
  + e.g. `{"jsonrpc":"2.0","id":1,"method":"bye"}`
- [check](sharkd-Request-Syntax#check) - used to check the validity of a field or filter
  + e.g. `{{"jsonrpc":"2.0","id":1,"method":"check","params":{"field":"tcp.srcport"}}`
  + e.g. `{{"jsonrpc":"2.0","id":1,"method":"check","params":{"filter":"tcp.dstport==80"}}`
- [complete](sharkd-Request-Syntax#complete) - returns the properties of a field(s) or preference(s) based on a partial or complete reference
  + e.g. `{"jsonrpc":"2.0","id":1,"method":"complete","params":{"field":"http.request.method"}}`
  + e.g. `{"jsonrpc":"2.0","id":1,"method":"complete","params":{"field":"http.request"}}`
- [download](sharkd-Request-Syntax#download) - get decoded objects (exported objects, SSL secrets or rtp data); some downloaded data is base64 encoded
  + e.g. `{"jsonrpc":"2.0","id":1,"method":"download","params":{"token":"eo:http_0"}}`
  + See tshark --export-objects and the Export Objects function in Wireshark
- [dumpconf](sharkd-Request-Syntax#dumpconf) - list one, some or all configuration parameters
  + e.g. `{"jsonrpc":"2.0","id":1,"method":"dumpconf","params":{"pref":"tcp.desegment_tcp_streams"}}`
- [follow](sharkd-Request-Syntax#follow) - get client and server information for a particular protocol or stream plus the data payload which is JSON-Base64 encoded to accommodate binary content.
  + e.g. `{"jsonrpc":"2.0","id":1,"method":"follow","params":{"follow":"HTTP","filter":"tcp.stream==0"}}`
  + e.g. `{"jsonrpc":"2.0","id":1,"method":"follow","params":{"follow":"TCP","filter":"tcp.stream==1"}}`
- [frame](sharkd-Request-Syntax#frame) - get full information about a frame including the protocol tree
  + e.g. `{"jsonrpc":"2.0","id":1,"method":"frame","params":{"frame":4, "proto":"true"}}`
- [frames](sharkd-Request-Syntax#frames) - get Packet List information for a range of packets
  + e.g. `{"jsonrpc":"2.0","id":1,"method":"frames","params":{"filter":"frame.number<=20"}}`
- [info](sharkd-Request-Syntax#info) - get a list of format and statistics information types available to sharkd clients
  + e.g. `{"jsonrpc":"2.0","id":1,"method":"info"}`
  + Equivalent to the tshark -G option
- [intervals](sharkd-Request-Syntax#intervals) - generate basic capture statistics (total frames and total bytes) per requested interval (default is per second)
  + e.g. `{"jsonrpc":"2.0","id":1,"method":"intervals"}`
- [iograph](sharkd-Request-Syntax#iograph) - creates time sequenced list of values for graphing; default is second-by-second
  + e.g. `{"req":"iograph","graph0":"packets"}`
- [load](sharkd-Request-Syntax#load) - load a packet trace file for analysis
  + e.g. `{"jsonrpc":"2.0","id":1,"method":"load","params":{"file":"c:\\traces\\example.pcapng"}}`
  + e.g. `{"jsonrpc":"2.0","id":1,"method":"load","params":{"file":"c:/traces/example.pcapng"}}`
- [setcomment](sharkd-Request-Syntax#setcomment) - set the comment in a frame in the loaded trace - not saved to trace file
  + e.g. `{"jsonrpc":"2.0","id":1,"method":"setcomment","params":{"frame":1,"comment":"Hello world"}}`
- [setconf](sharkd-Request-Syntax#setconf) - set a configuration parameter
  + e.g. `{"jsonrpc":"2.0","id":1,"method":"setconf","params":{"name":"tcp.desegment_tcp_streams","value":"TRUE"}}`
- [status](sharkd-Request-Syntax#status) - get basic information about the loaded file (name, size, number of frames, etc.)
  + e.g. `{"jsonrpc":"2.0","id":1,"method":"status"}`
- [tap](sharkd-Request-Syntax#tap) - setup up to 16 statistics taps and get statistics from them; tap types are stats, nstat, conv, host, rtp-streams, rtp-analyse, eo, expert, rtd, srt and flow
  + e.g. `{"jsonrpc":"2.0","id":1,"method":"tap","params":{"tap0":"expert"}}`
  + e.g. `{"jsonrpc":"2.0","id":1,"method":"tap","params":{"tap0":"eo:http"}}`

Entering JSON requests through the Console Interface sometimes generates additional stdout messages as well as the JSON response, for example:
```
{"jsonrpc":"2.0","id":1,"method":"load","params":{"file":"c:/traces/Contoso_01/web01/web01_00001_20161012151754.pcapng"}}
load: filename=c:/traces/Contoso_01/web01/web01_00001_20161012151754.pcapng
{"jsonrpc":"2.0","id":1,"result":{"status":"OK"}}
```
The wiki page [sharkd Request Syntax](sharkd-Request-Syntax) gives full details of the request types and their parameters.

## Bugs

None noted at this time.

## Studying and Debugging sharkd

Many will want to use Visual Studio to study the way sharkd works or for debugging.  Remember that when running in Daemon Mode, the JSON requests will be processed by a dedicated sharkd process, and not the one you start executing in Visual Studio.  The simplest way to avoid this situation is to study or debug when running in Console Mode.

When a file is loaded into Wireshark, the protocol dissectors are called once for every packet in the PCAPNG file, and then called at least once more as the packets are displayed.  This is also true with sharkd:

- The dissectors are called once for each frame when the _load_ request is executed
- The dissectors are called again for an individual frame when a _frame_ request is executed

## Testing with Putty

Suitable putty settings are:

- Host Name (or IP address): localhost
- Port: 4446
- Connection Type: Raw

When you successfully connect, the daemon writes a stdout message:

``` 
  Hello in child.
```

## Simple Python Code Example

This program connects to sharkd running in Daemon mode, sends two commands, displays the response for each and then closes the connection.

```python
import socket

def get_json_bytes(json_string):
    return bytes((json_string + '\n'), 'utf-8')

def json_send_recv(s, json) -> str:
    s.sendall(get_json_bytes(json))
    data = s.recv(1024)
    return data[:-4].decode('utf-8')

host = socket.gethostbyname('localhost')
port = 4446  # The port used by sharkd
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print('c: Connecting to ' + host + ':' + str(port))
s.connect((host, port))

json_string = '{"jsonrpc":"2.0","id":1,"method":"load","params":{"file":"c:/traces/example.pcapng"}}'
print('s: ' + json_string)
recv_json = json_send_recv(s, json_string)
print('r: ' + recv_json)

json_string = '{"jsonrpc":"2.0","id":2,"method":"status"}'
print('s: ' + json_string)
rx_json = json_send_recv(s, json_string)
print('r: ' + rx_json)

print('c: Closing connection to ' + host + ':' + str(port))
s.close()

```

The output looks like this:

```
c: Connecting to 127.0.0.1:4446
s: {"req":"load","file":"c:/traces/Contoso_01/web01/web01_00001_20161012151754.pcapng"}
r: {"jsonrpc":"2.0","id":1,"result":{"status":"OK"}}
s: {"jsonrpc":"2.0","id":2,"method":"status"}
r: {"jsonrpc":"2.0","id":2,"result":{"frames":53882,"duration":1841.532335000,"filename":"web01_00001_20161012151754.pcapng","filesize":36433896}}
c: Closing connection to 127.0.0.1:4446
```

## Acknowledgement

Writing a feature like sharkd is a big task, and so we must acknowledge the work of Jakub Zawadzki who authored the code.
