## Introduction

sharkd is a program that makes the powerful dissection and analysis capabilities of Wireshark available via a programmatic interface.  A program can send simple JSON-format requests to sharkd to load, analyse and manipulate network packet files.

Many of the functions that we see in the standard Wireshark user interface are available via sharkd including packet protocol tree, packet bytes and display filters.

[[_TOC_]]

## Installation

The sharkd executable is not included in the standard Wireshark binary package (Windows MSI, etc.) and so must be built from source.  Building sharkd under Windows results in a sharkd.exe executable.

sharkd will not work with just the sharkd.exe file; it uses Wireshark DLLs and preference files.  Therefore, we need to install everything that results from a build of sharkd.

## Running sharkd

We can run sharkd in two modes:

- Console Mode where we can send JSON requests via stdin and receive JSON responses from stdout
- Daemon Mode where sharkd starts as a service running on a socket, allowing us to send JSON requests and receive JSON responses via the socket

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
Multiple sessions can connect to JSON running in Daemon Mode.  A dedicated sharkd.exe process is spun up for each connection.  Therefore, when there are no connections there is a single sharkd process, when there is one active session there are two sharkd processes, when a second connection is made there will be three sharkd processes, and so on.

## sharkd Requests

sharkd service requests have the general format:
```
  {"req":"command","_option_":"_value_","_option_":"_value_",...}
```
The request processor uses a simple gets(...) function to read incoming requests.  This means that:
- The request may only contain printable characters
- Special characters must be escaped
- Numeric values can be quoted or not quoted - not quoted is the norm and response numerics are not quoted
  + e.g. `{"req":"frame", "frame":4, "proto":"true"}`
  + e.g. `{"req":"frame", "frame":"4", "proto":"true"}`
  + e.g. response - `{"frames":53882,"duration":1841.532335000,"filename":"web01_00001_20161012151754.pcapng","filesize":36433896}`
- The entire requests must be on a single line
- The request must end with a line feed
  
The commands **must be in lower case** as shows below.  Quotes around keys and values **must be double quotes** - single quotes produce a JSON error.  Also note the use of the UK English spelling of analyse; analyze won't work.

The commands are:

- [analyse](sharkd-Request-Syntax#analyse) - lists the protocols found in a packet file and its start and end times
  + e.g. `{"req":"analyse"}`
- [bye](sharkd-Request-Syntax#bye) - end a startd session
  + e.g. `{"req":"bye"}`
- [check](sharkd-Request-Syntax#check) - used to check the validity of a field or filter
  + e.g. `{"req":"check", "field":"tcp.srcport"}`
  + e.g. `{"req":"check", "filter":"tcp.dstport==80"}`
- [complete](sharkd-Request-Syntax#complete) - returns the properties of a field(s) or preference(s) based on a partial or complete reference
- download - get decoded objects (exported objects, SSL secrets or rtp data); some downloaded data is base64 encoded
  + e.g. `{"req":"download","token":"eo:http_0"}`
  + See tshark --export-objects and the Export Objects function in Wireshark
- dumpconf - list one, some or all configuration parameters
  + e.g. `{"req":"dumpconf","pref":"tcp.desegment_tcp_streams"}`
- follow - get client and server information for a particular protocol or stream plus the data payload being carried by the protocol specified (protocol payload is UTF-8 (ASCII) obfuscated with base64 encoding)
  + e.g. `{"req":"follow","follow":"HTTP","filter":"tcp.stream==0"}`
  + e.g. `{"req":"follow","follow":"TCP","filter":"tcp.stream==1"}`
- frame - get full information about a frame including the protocol tree
  + e.g. `{"req":"frame", "frame":"4", "proto":"true"}`
- frames - get Packet List information for a range of packets
  + e.g. `{"req":"frames","filter":"frame.number<=20"}`
- info - get a list of format and statistics information types available to sharkd clients
  + e.g. `{"req":"info"}`
  + Equivalent to the tshark -G option
- intervals - generate basic capture statistics (total frames and total bytes) per requested interval (default is per second)
  + e.g. `{"req":"intervals"}`
- iograph - creates time sequenced list of values for graphing; default is second-by-second
  + e.g. `{"req":"iograph","graph0":"packets"}`
- [load](sharkd-Request-Syntax#load) - load a packet trace file for analysis
  + e.g. `{"req":"load","file":"c:\\traces\\example.pcapng"}`
  + e.g. `{"req":"load","file":"c:/traces/example.pcapng"}`
- setcomment - set the comment in a frame in the loaded trace - not saved to trace file
  + e.g. `{"req":"setcomment","frame":1,"comment":"Hello world"}`
- setconf - set a configuration parameter
  + e.g. `{"req":"setconf","name":"tcp.desegment_tcp_streams","value":"TRUE"}`
- status - get basic information about the loaded file (name, size, number of frames, etc.)
  + e.g. `{"req":"status"}`
- tap - setup up to 16 statistics taps and get statistics from them; tap types are stats, nstat, conv, host, rtp-streams, rtp-analyse, eo, expert, rtd, srt and flow
  + e.g. `{"req":"tap","tap0":"expert"}`
  + e.g. `{"req":"tap","tap0":"eo:http"}`

Entering JSON requests through the Console Interface sometimes generates additional stdout messages as well as the JSON response, for example:
```
{"req":"load","file":"c:/traces/Contoso_01/web01/web01_00001_20161012151754.pcapng"}
load: filename=c:/traces/Contoso_01/web01/web01_00001_20161012151754.pcapng
{"err":0}
```
  
## Bugs

During experimentation with sharkd, a few bugs were discovered that are noteworthy.

Issuing commands to interrogate or modify a packet file before loading any file often results in a program exception.

The Windows file path backslash (\\) separator must be escaped, and if they are not, this too results in a program exception.  Alternatively, forward slashes can be used as shown in the load request example above.

## Studying and Debugging sharkd

Many will want to use Visual Studio to study the way sharkd works or for debugging.  Remember that when running in Daemon Mode, the JSON requests will be processed by a dedicated sharkd process, and not the one you start executing in Visual Studio.  The simplest way to avoid this situation is to study or debug when running in Console Mode.

## Testing with Putty

Suitable putty settings are:

- Host Name (or IP address): localhost
- Port: 4446
- Connection Type: Raw

When you successfully connect, the daemon writes a stdout message:

``` 
  Hello in child.
```

If you send invalid JSON on the connection, sharkd writes the stdout message:

``` 
  invalid JSON -> closing
```

and closes the putty session.

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

json_string = '{"req":"load","file":"c:/traces/Contoso_01/web01/web01_00001_20161012151754.pcapng"}'
print('s: ' + json_string)
recv_json = json_send_recv(s, json_string)
print('r: ' + recv_json)

json_string = '{"req":"status"}'
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
r: {"err":0}
s: {"req":"status"}
r: {"frames":53882,"duration":1841.532335000,"filename":"web01_00001_20161012151754.pcapng","filesize":36433896}
c: Closing connection to 127.0.0.1:4446
```
