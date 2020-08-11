# Ventrilo Protocol

VP - The ventrilo protocol is the one used by Ventrilo to encrypt and decrypt VoIP chatting.

## Protocol dependencies

  - [TCP](/TCP): Typically, VP uses [TCP](/TCP) as its transport protocol. The TCP port for VP traffic is 3784 (Depending on server).

## Example traffic

v2.3.0 [HERE](http://pastebin.ca/71370) (Long text pasted on pastebin.ca)

## v3.0.0

The preshared encryption key is the same as the one for 2.3.0 and the key exchange and encryption method seem to be the same. However, a type 0x34 packet now siganls a change in encryption sometime shortly after connecting and displaying the server status.

The login packet has also changed to type 0x48 and has an additional 16 bytes of data immediately before the client version string.

The client has a quirk of its own that makes running it through the decryption proxy somewhat of a pain. It first connects and gets the server status via UDP before it will even attempt to connect. If you proxy it through a port that does not match what the remote server claims to be it will also not connect. Either the packet must be modified with the redirected UDP port or they must be changed to match the remote end. This means you may no longer block the UDP port to prevent people from checking to see who's on.

## Wireshark

The VP dissector is non-existing.

## Example capture file

[ExampleVP.pcap](uploads/__moin_import__/attachments/Ventrilo/ExampleVP.pcap): This file contains a capture of the Ventrilo protocol, however the packets are encrypted.

See [Luigi's page](http://aluigi.altervista.org/papers.htm#ventrilo) for decryption algorithm and [this](http://pastebin.ca/71370) for a decrypted capture.

## External links

  - [Luigi's page](http://aluigi.altervista.org/papers.htm#ventrilo) - The one and only recource on the VP protocol.

---

Imported from https://wiki.wireshark.org/Ventrilo on 2020-08-11 23:27:10 UTC
