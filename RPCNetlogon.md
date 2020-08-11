# Microsoft Network Logon (RPCNetlogon)

RPCNetlogon provides workstations, member servers and trusted domains with access to the centralised, shared authentication database in WinNT networks. This protocol also includes NT4 level synchronisation of user accounts between a PDC and BDC, as well as many other services.

## History

XXX - add a brief description of RPCNetlogon history

## Protocol dependencies

  - [DCE/RPC](/DCE/RPC): RPCNetlogon uses [DCE/RPC](/DCE/RPC) as its transport protocol.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The RPCNetlogon dissector is partially functional. There are still a number of unknown commands and feilds.

## Preference Settings

(XXX add links to preference settings affecting how RPCNetlogon is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of RPCNetlogon display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/r/rpc_netlogon.html)

Show only the RPCNetlogon based traffic:

``` 
 rpc_netlogon 
```

## Capture Filter

You cannot directly filter RPCNetlogon protocols while capturing.

## External links

  - [Samba4 IDL](http://samba.org/ftp/unpacked/samba4/source/librpc/idl/netlogon.idl) for RPCNetlogon

## Discussion

## Open Questions

We still don't entirely understand this protocol, and we have some of these on the [RPCNetlogon/OpenQuestions](/RPCNetlogon/OpenQuestions) page.

---

Imported from https://wiki.wireshark.org/RPCNetlogon on 2020-08-11 23:24:04 UTC
