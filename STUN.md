# Simple Traversal Underneath NAT (STUN)

Simple Traversal Underneath NATs (STUN) is a lightweight protocol that serves as a tool for application protocols in dealing with NAT traversal.

## History

STUN was originally an acronym for Simple Traversal of UDP Through NAT. It was a simple client/server protocol with two usages: Finding the binding IP address and port in a NAT, and discovering the NAT behavior. This was published as [RFC 3489](http://www.ietf.org/rfc/rfc3489.txt). After the publication of RFC 3489, the work restarted to fix the problems, and the NAT behavior discovery usage was removed. Also TURN was designed as a STUN extension to create a packet relay. There was some deployments in the field of implementations based on this draft (draft-ietf-rfc3489bis-02 and draft-rosenberg-midcom-turn-08) After this, the development of STUN was essentially rebooted, and TURN became a STUN usage. The current draft of STUN (draft-ietf-behave-rfc3489bis-05) is in WGLC in the Behave WG of the IETF, and the relay usage (formerly known as TURN) will be soon in WGLC.

## Protocol dependencies

  - [UDP](/UDP)/[TCP](/TCP)/[TLS](/TLS): Typically, STUN uses [UDP](/UDP), [TCP](/TCP) or [TLS](/TLS) as its transport protocol. The well known UDP/TCP port for STUN traffic is 3478. There is no well known port for TLS.

## Example traffic

Todo

## Wireshark

The STUN dissector is fully functional.

## Preference Settings

There is no preference setting for the STUN dissector.

## Example capture file

Todo

## Display Filter

Todo

## Capture Filter

Todo

## External links

  - [RFC 3489](http://www.ietf.org/rfc/rfc3489.txt) *STUN - Simple Traversal of User Datagram Protocol (UDP) Through Network Address Translators (NATs)* - the first version of STUN.

  - [rfc3489bis-05](ftp://ftp.rfc-editor.org/in-notes/internet-drafts/draft-ietf-behave-rfc3489bis-05.txt) *Simple Traversal Underneath Network Address Translators (NAT) (STUN)* - The current draft

## Discussion

---

Imported from https://wiki.wireshark.org/STUN on 2020-08-11 23:26:00 UTC
