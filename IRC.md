# Internet Relay Chat (IRC)

(from [RFC 1459](http://www.ietf.org/rfc/rfc1459.txt)) The IRC (Internet Relay Chat) protocol has been designed over a number of years for use with text based conferencing.

The IRC protocol has been developed on systems using the TCP/IP network protocol, although there is no requirement that this remain the only sphere in which it operates.

IRC itself is a teleconferencing system, which (through the use of the client-server model) is well-suited to running on many machines in a distributed fashion. A typical setup involves a single process (the server) forming a central point for clients (or other servers) to connect to, performing the required message delivery/multiplexing and other functions.

## History

The IRC protocol began development in 1989 and was first implemented as a means for users on a BBS to chat amongst themselves. Now it supports a large number of world-wide network sof servers and clients, and is stringing to cope with growth. The average number of users connected to IRC networks has continuously grown since 1989 at an alarming rate.

## Protocol dependencies

  - [TCP](/TCP): Typically, IRC uses [TCP](/TCP) as its transport protocol. The well known TCP port for IRC traffic is 6667.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The IRC dissector is not in the latest public build. Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how IRC is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/irc.pcap](uploads/__moin_import__/attachments/SampleCaptures/irc.pcap "Upload new attachment \"irc.pcap\"")

## Display Filter

A complete list of IRC display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/i/irc.html)

Show only the IRC based traffic:

``` 
 irc 
```

## Capture Filter

You cannot directly filter IRC protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the IRC traffic over the default port (6667):

``` 
 tcp port 6667 
```

## External links

  - [RFC 1459](http://www.ietf.org/rfc/rfc1459.txt) *Internet Relay Chat Protocol*

  - [RFC 2810](http://www.ietf.org/rfc/rfc2810.txt) *Internet Relay Chat: Architecture*

  - [RFC 2811](http://www.ietf.org/rfc/rfc2811.txt) *Internet Relay Chat: Channel Management*

  - [RFC 2812](http://www.ietf.org/rfc/rfc2812.txt) *Internet Relay Chat: Client Protocol*

  - [RFC 2813](http://www.ietf.org/rfc/rfc2813.txt) *Internet Relay Chat: Server Protocol*

  - <http://www.irchelp.org/> *Great site about how irc works*

  - <http://www.irchelp.org/rfc/> *Sub section about the irc protocols, including ctcp*

## Discussion

Ctcp, subfilter or another filter? Dcc? Subfilter or normal filter? Irc over ssl needs a mention.

---

Imported from https://wiki.wireshark.org/IRC on 2020-08-11 23:15:21 UTC
