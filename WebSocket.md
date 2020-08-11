## WebSocket

WebSocket is a protocol providing full-duplex communication channels over a single [TCP](/TCP) connection. The WebSocket protocol was standardized by the [IETF](https://en.wikipedia.org/wiki/Internet_Engineering_Task_Force) as [RFC 6455](https://tools.ietf.org/html/rfc6455) in 2011, and the WebSocket API in Web IDL is being standardized by the [W3C](https://en.wikipedia.org/wiki/World_Wide_Web_Consortium).

WebSocket is designed to be implemented in web browsers and web servers, but it can be used by any client or server application. The WebSocket Protocol is an independent TCP-based protocol. Its only relationship to HTTP is that its handshake is interpreted by [HTTP](/HTTP) servers as an Upgrade request. The WebSocket protocol makes more interaction between a browser and a web server possible, facilitating the real-time data transfer from and to the server. This is made possible by providing a standardized way for the server to send content to the browser without being solicited by the client, and allowing for messages to be passed back and forth while keeping the connection open. In this way, a two-way (bi-directional) ongoing conversation can take place between a browser and the server. The communications are done over [TCP](/TCP) port number 80, which is of benefit for those environments which block non-web Internet connections using a firewall. Similar two-way browser-server communications have been achieved in non-standardized ways using stopgap technologies such as [Comet](https://en.wikipedia.org/wiki/Comet_\(programming\)).

The WebSocket protocol specification defines `ws` and `wss` as two new uniform resource identifier (URI) schemes that are used for unencrypted and encrypted connections, respectively. Apart from the scheme name and fragment (\# is not supported), the rest of the URI components are defined to use URI generic syntax.

The WebSocket protocol is currently supported in most major browsers including Microsoft Edge, Google Chrome, Internet Explorer, Firefox, Safari and Opera. WebSocket also requires web applications on the server to support it.

## History

WebSocket was first referenced as TCPConnection in the HTML5 specification, as a placeholder for a TCP-based socket API. In June 2008, a series of discussions were led by Michael Carter that resulted in the first version of the protocol known as WebSocket.

The name Websocket was coined by Ian Hickson and Michael Carter shortly thereafter through collaboration on the \#whatwg IRC chat room, and subsequently authored for inclusion in the HTML5 specification by Ian Hickson, and announced on the cometdaily blog by Michael Carter. In December 2009, Google Chrome was the first browser to ship full support for the standard, with WebSocket enabled by default. Development of the WebSocket protocol was subsequently moved from the W3C and whatwg group to the IETF in February 2010, and authored for two revisions under Ian Hickson.

After the protocol was shipped and enabled by default in multiple browsers, the RFC was finalized under Ian Fette in December 2011.

## Protocol dependencies

  - [TCP](/TCP): Typically, WebSocket uses [TCP](/TCP) as its transport protocol. The well known TCP port for WebSocket traffic is 80 and 443.

## Example traffic

### Connection setup

To establish a WebSocket connection, the client sends a WebSocket handshake request, for which the server returns a WebSocket handshake response, as shown in the example below.

Client request (just like in HTTP, each line ends with `\r\n` and there must be an extra blank line at the end):

    GET / HTTP/1.1
    Host: 192.168.43.135:12345
    Connection: Upgrade
    Pragma: no-cache
    Cache-Control: no-cache
    Upgrade: websocket
    Origin: file://
    Sec-WebSocket-Version: 13
    User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36
    Accept-Encoding: gzip, deflate, sdch
    Accept-Language: zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4
    Sec-WebSocket-Key: bKdPyn3u98cTfZJSh4TNeQ==
    Sec-WebSocket-Extensions: permessage-deflate; client_max_window_bits 

Server response:

    HTTP/1.1 101 Switching Protocols
    Upgrade: websocket
    Connection: Upgrade
    Sec-WebSocket-Accept: 4EaeSCkuOGBy+rjOSJSMV+VMoC0=
    WebSocket-Origin: file://
    WebSocket-Location: ws://192.168.43.135:12345/ 

### Data transmission

Here is an example of data transmission between a Python WebSocket Server and [JavaScript](/JavaScript) client.

An example from server to client:

    Frame 7: 79 bytes on wire (632 bits), 79 bytes captured (632 bits)
    Ethernet II, Src: Vmware_8a:3d:a7 (00:0c:29:8a:3d:a7), Dst: Vmware_c0:00:08 (00:50:56:c0:00:08)
    Internet Protocol Version 4, Src: 192.168.43.135, Dst: 192.168.43.1
    Transmission Control Protocol, Src Port: 12345, Dst Port: 50999, Seq: 205, Ack: 510, Len: 25
    WebSocket
        1... .... = Fin: True
        .000 .... = Reserved: 0x0
        .... 0001 = Opcode: Text (1)
        0... .... = Mask: False
        .001 0111 = Payload length: 23
        Payload
    JavaScript Object Notation
    Line-based text data
        Welcome, 192.168.43.1 ! 

An example from client to server:

    Frame 9: 72 bytes on wire (576 bits), 72 bytes captured (576 bits)
    Ethernet II, Src: Vmware_c0:00:08 (00:50:56:c0:00:08), Dst: Vmware_8a:3d:a7 (00:0c:29:8a:3d:a7)
    Internet Protocol Version 4, Src: 192.168.43.1, Dst: 192.168.43.135
    Transmission Control Protocol, Src Port: 50999, Dst Port: 12345, Seq: 510, Ack: 230, Len: 18
    WebSocket
        1... .... = Fin: True
        .000 .... = Reserved: 0x0
        .... 0001 = Opcode: Text (1)
        1... .... = Mask: True
        .000 1100 = Payload length: 12
        Masking-Key: e17e8eb9
        Masked payload
        Payload
    JavaScript Object Notation
    Line-based text data
        test message 

## Wireshark

The Wireshark dissector is fully functional with WebSocket protocol.

## Preference Settings

Since WebSocket is still pretty new, so there is not much preferences settings options in Wireshark.

## Example capture file

WebSocket

  - [websocket.pcap](uploads/__moin_import__/attachments/WebSocket/websocket.pcap)

## Display Filter

A complete list of WebSocket display filter fields can be found in the [display filter reference](https://www.wireshark.org/docs/dfref/w/websocket.html)

Show only the WebSocket based traffic:

``` 
 websocket 
```

## Capture Filter

You cannot directly filter WebSocket protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the WebSocket traffic over the default port (80):

``` 
 tcp port 80 
```

## External links

  - [W3C WebSocket API](https://html.spec.whatwg.org/multipage/comms.html#network) *WHATWG HTML Living Standard*

  - [RFC 6455](https://tools.ietf.org/html/rfc6455) *The WebSocket Protocol RFC standard*

  - <https://github.com/wencwan/networking> *A python WebSocket Server and javascript WebSocket Clinet example*

## Discussion

---

Imported from https://wiki.wireshark.org/WebSocket on 2020-08-11 23:27:24 UTC
