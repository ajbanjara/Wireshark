# Microsoft Exchange MAPI (MAPI)

MAPI, the Microsoft Windows Messaging API, is not properly a protocol, nor an application, nor even a provider (since it is an API for plug-in providers). The distinction is notable because any "MAPI" documentation from Microsoft will be for the Windows API, rather than for wire protocols.

However, "MAPI" is properly a name used to label or describe data and protocols commonly associated with MAPI, and is used in that sense by Wireshark. 

MAPI providers provide transport and/or storage: the API is opaque as to if storage or transport is being provided. The Win2K version of MS Exchange used MAPI-like interfaces internally and externally, and three common MAPI consumers were Outlook, CDO, and CDC. The two providers provided by MS were the Exchange Message provider and the Address Book provider. The Message provider used the MSRPC protocol to encapsulate Remote OPerations (ROP) for Exchange and Outlook: the Address Book provider used NSPI. ROP is also the protocol for MAPIHTTP.


## Overview

1) Ping: MAPI traffic commences with identifying an End Point Mapper. On Win2K, this would be a ping or netbios sequence.

2) EPM: A request to the End Point Mapper for a MAPI endpoint (request includes the MAPI uuid).

3) DCERPC 11: Bind request: Distributed Computing Environment RPC packet type 11, a request to bind the end point to MAPI (request includes the MAPI uuid)

4) DCERPC 14: Alter_Context: packet type 14, alter (create/select/change) the security context for the conversation (request includes the MAPI uuid). 

5) DCERPC 0,10: EcDoConnect: packet type 0, opnum 10: (MAPI),
    This is still DCERPC, but wireshark use the "MAPI" protocol label, because this kind of DCERPC is always gonna be MAPI RPC. Wireshark 3.6.3 calls this "Unknown operation 10"

6) DCERTP 0,11: EcDoRpcExt2 : ROP: packet type 0, opnum 11: (MAPI),
    Encapsulated Remote Operations.
    This is still DCERPC, but wireshark use the "MAPI" protocol label, because this kind of DCERPC is always gonna be MAPI RPC. Wireshark 3.6.3 calls this "Unknown operation 11"

7) DCERTP 0,1: EcDoDisconnect: packet type 0, opnum 1: (MAPI),
    This is still DCERPC, but wireshark use the "MAPI" protocol label, because this kind of DCERPC is always gonna be MAPI RPC. Wireshark 3.6.3 calls this "EcDoDisconnect"


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
This is a short (failed) MAPI conversation, showing connect, ROP, and disconnect:
[ShortMAPI.pcapng](uploads/53dc45c557cf877642381b8e9b964671/ShortMAPI.pcapng)
(The conversation fails because of an authentication/encryption mismatch)


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

  - [Exchange Protocols](https://interopevents.blob.core.windows.net/uploads/PDFs/2021/china/day2/Exchange%20Server%20Protocols%20Overview_AndrewDavidoff.pdf)

  - [OXCRPC](https://interoperability.blob.core.windows.net/files/MS-OXCRPC/%5bMS-OXCRPC%5d.pdf) *Wire Format Protocol*. ("This protocol 
extends DCE 1.1: Remote Procedure Call//") 

  - [OXCROPS](https://interoperability.blob.core.windows.net/files/MS-OXCROPS/%5bMS-OXCROPS%5d.pdf) *Remote Operations (ROP) List and Encoding Protocol*

  - [OXCMSG](https://interoperability.blob.core.windows.net/files/MS-OXCMSG/%5bMS-OXCMSG%5d.pdf) *Message and Attachment Object Protocol*
"Message object: A set of properties that represents an email message [...]"

## Discussion

EcDoConnectEx "Creates a session context handle on the server to be used in subsequent calls to the EcDoDisconnect, EcDoRpcExt2 and EcDoAsyncConnectEx methods. Because the RPC connection and security context has already been established, this no longer contains information (uuid) identifying it as MAPI.

EcDoRpcExt2 "Passes generic ROP commands to the server for processing within a Session Context. The method requires an active session context handle to be returned from the EcDoConnectEx method."

EcDoDisconnect "Closes a Session Context with the server. The Session Context is destroyed and all associated server state, objects, and resources that are associated with the Session Context are released. The method requires an active session context handle to be returned from the EcDoConnectEx method"

[edc-dbcc](https://docs.microsoft.com/en-us/openspecs/exchange_server_protocols/ms-oxcrpc/29977edc-dbcc-48c3-891f-bdd8199b1dc5) *Exchange Server Protocols*

---

Imported from https://wiki.wireshark.org/MAPI on 2020-08-11 23:16:26 UTC
