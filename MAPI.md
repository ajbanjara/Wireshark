# Microsoft Exchange MAPI (MAPI)

XXX - add a brief MAPI description here

## History

XXX - add a brief description of MAPI history

## Protocol dependencies

  - [DCE/RPC](/DCE/RPC): Typically, MAPI uses [DCE/RPC](/DCE/RPC) as its transport protocol.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

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
