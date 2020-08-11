# BitTorrent

BitTorrent is a protocol designed for transferring files. It is peer-to-peer in nature, as users connect to each other directly to send and receive portions of the file. However, there is a central server (called a tracker) which coordinates the action of all such peers. The tracker only manages connections, it does not have any knowledge of the contents of the files being distributed, and therefore a large number of users can be supported with relatively limited tracker bandwidth.

A recent extension to BitTorrent is the [DHT](http://www.bittorrent.org/beps/bep_0005.html) ("distributed sloppy hash table" or simply called UDP tracker) protocol. A UDP based peer to peer tracker protocol. And the uTorrent imports another UDP based Micro Transport Protocol, called [uTP](http://www.bittorrent.org/beps/bep_0029.html).

## History

In April 2001 Bram Cohen designed the BitTorrent protocol, which he implemented summer 2002. The first program to use the protocol was the original [BitTorrent client](http://www.bittorrent.com/download). Today many applications are availiable, and the protocol is widely used.

## Protocol dependencies

  - [TCP](/TCP): Typically, BitTorrent uses [TCP](/TCP) as its transport protocol. The well known TCP port for BitTorrent traffic is 6881-6889 (and 6969 for the tracker port). The DHT extension (peer2peer tracker) uses various UDP ports negotiated by the peers.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The BitTorrent dissector is (fully functional, partially functional, not existing, ... whatever the current state is). The DHT extension has been supported since r39653. The uTP extension has been supported since r36716.

## Preference Settings

  - [Reassemble BitTorrent messages spanning multiple TCP segments](/Reassemble-BitTorrent-messages-spanning-multiple-TCP-segments)

  - [Decode the peer\_id of the handshake messages](/Decode-the-peer_id-of-the-handshake-messages)

## Example capture files

[SampleCaptures/BitTorrent.Transfer1.cap](uploads/__moin_import__/attachments/SampleCaptures/BitTorrent.Transfer1.cap) (Microsoft Network Monitor) Here's a capture with a few BitTorrent packets; it contains some small packets I got whilst downloading something on BitTorrent.

[SampleCaptures/BITTORRENT.pcap](uploads/__moin_import__/attachments/SampleCaptures/BITTORRENT.pcap) (libpcap) Capture file of two torrent clients communicationg without DHT or peer exch.

## Display Filter

A complete list of BitTorrent display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/b/bittorrent.html)

Show only the BitTorrent based traffic:

``` 
 bittorrent
```

Note: implemented in Wireshark post 0.10.12\!

## Capture Filter

You cannot directly filter BitTorrent protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the BitTorrent tracker traffic over one of the default ports (e.g. 6881):

``` 
 tcp port 6881
```

Capture the BitTorrent tracker traffic over the range of default ports (e.g. 6881-6889):

``` 
 tcp portrange 6881-6889
```

when using libpcap 0.9.1 or later or [WinPcap](/WinPcap) 3.1 or later; that expression won't work with older versions of libpcap or [WinPcap](/WinPcap), so, on Windows, upgrade to [WinPcap](/WinPcap) 3.1 or later and, on UN\*X, upgrade to libpcap 0.9.x if possible and, if not possible and you have a version of libpcap prior to 0.8.1, use

``` 
 (tcp[0:2] >= 6881 and tcp[0:2] <= 6889) or (tcp[2:2] >= 6881 and tcp[2:2] <= 6889)
```

(a bug in the libpcap optimizer in libpcap 0.8.x means this won't work with libpcap 0.8.x, although you might be able to use tcpdump with the "-O" flag).

## External links

  - <http://www.bittorrent.com/> the official BitTorrent page

  - [Wikipedia Bittorrent page](http://en.wikipedia.org/wiki/Bittorrent)

  - [How BitTorrent Works](http://userpages.umbc.edu/~hamilton/btclientconfig.html) about P2P in general, BitTorrent and firewall settings

  - [DHT Protocol (BEP 5)](http://www.bittorrent.org/beps/bep_0005.html), the UDP-based BitTorrent extension for distributed trackers (the UDP port number is negotiated). Also: [link to draft DHT protocol](http://www.bittorrent.org/Draft_DHT_protocol.html) (dead link), [Web Archive Copy (2007-12-21) of draft DHT protocol](http://web.archive.org/web/20071221023758/http://www.bittorrent.org/Draft_DHT_protocol.html).

  - [Hippie protocol signature description](http://hippie.oofle.com/protocols/bittorrent) the TCP and UDP protocol signatures which might be used to heuristically identify the BitTorrent protocol [Web Archive Link](http://web.archive.org/web/20081120183021/http://hippie.oofle.com/protocols/bittorrent)

  - [More on BitTorrent](http://blog.eukhost.com/2006/09/22/bittorrent)

---

Imported from https://wiki.wireshark.org/BitTorrent on 2020-08-11 23:11:33 UTC
