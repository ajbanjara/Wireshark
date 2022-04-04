# Microsoft Exchange MAPI (MAPI)

MAPI, the Microsoft Windows Messaging API, is not properly a protocol, nor an application, nor even a provider (since it is an API for plug-in providers). The distinction is notable because any "MAPI" documentation from Microsoft will be for the Windows API, rather than for wire protocols.

However, "MAPI" is is properly a name used to label or describe data and protocols commonly associated with MAPI, and is used in that sense by Wireshark. 

MAPI providers provide transport and/or storage: the API is opaque as to if storage or transport is being provided. The Win2K version of MS exchange used MAPI-like interfaces internally and externally, and three common MAPI consumers were Outlook, CDO, and CDC. The two providers provided by MS were the Exchange Message provider and the Address Book provider. These providers used the MSRPC protocol to encapsulate Remote OPerations (ROP) for Exchange and Outlook.


## Overview

1) Ping: MAPI traffic commences with identifying an End Point Mapper. On Win2K, this would be a ping or netbios sequence.

2) EPM: A request to the End Point Mapper for a MAPI endpoint (request includes the MAPI guid).

3) DCERPC 11: Bind request: Distributed Computing Environment RPC packet type 11, a request to bind the end point to MAPI (request includes the MAPI guid)

4) DCERPC 14: Alter_Context: packet type 14, alter (select/change) the security context for the conversation.

5) DCERPC 0,10: EcDoConnect: packet type 0, opnum 10: MAPI
    This is still DCERPC, but wireshark use the "MAPI" protocol label, because this kind of DCERPC is always gonna be MAPI RPC

6) DCERTP 0,11: : ROP: packet type 0, opnum 11: MAPI
    Encapsulated Remote Operations.
    This is still DCERPC, but wireshark use the "MAPI" protocol label, because this kind of DCERPC is always gonna be MAPI RPC.

7) DCERTP 0,14: EcDoDisconnect: packet type 0, opnum 14: MAPI
    This is still DCERPC, but wireshark use the "MAPI" protocol label, because this kind of DCERPC is always gonna be MAPI RPC


## History

Other MAPI providers were provided by third-party companies (in practice, to connect to other mail stores), and other MSRPC servers were provided by third-parties (to emulate exchange), but third party MAPI providers don't use MSRPC: an Exchange emulation doesn't need a custom MAPI provider, and a custom MAPI provider doesn't need an Exchange emulation.

Modern versions of MS Exchange don't need RPC: remote operations are encapsulated directly over HTTPs, and modern versions of Outlook don't need a MSRPC provider to communicate with Exchange.

## Protocol dependencies

  - [DCE/RPC](/DCE/RPC): Typically, MAPI uses [DCE/RPC](/DCE/RPC) as its transport protocol.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).
4
## Wireshark

The MAPI dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

## Preference Settings

(XXX add links to preference settings affecting how MAPI is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/mapi.cap](uploads/__moin_import__/attachments/SampleCaptures/mapi.cap)

## Display Filter

A complete list of MAPI display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/m/mapi.html)

Show only the MAPI based traffic:

``` 
 mapi 
```

## Capture Filter

You cannot directly filter MAPI protocols while capturing.

## External links

  - add link to MAPI specification and where to find additional info on the web about it, e.g.:

  - [RFC 123](http://www.ietf.org/rfc/rfc123.txt) *The RFC title* - explanation of the RFC content.

## Discussion

---

Imported from https://wiki.wireshark.org/MAPI on 2020-08-11 23:16:26 UTC
