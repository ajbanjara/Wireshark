# DCE/RPC Endpoint Mapper (EPM)

This is the endpoint mapper for the [DCE/RPC](/DCE/RPC) protocol and an integral part of it.

A client will call the endpoint mapper at the server to ask for a "well known" service. The server will answer the client at which addresses this service is available (or if this service is not available at all).

## History

XXX - add a brief description of EPM history

## Protocol dependencies

  - [DCE/RPC](/DCE/RPC): EPM uses [DCE/RPC](/DCE/RPC) as its transport protocol.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The EPM dissector is fully functional.

## Preference Settings

There are no EPM specific preference settings.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of EPM display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/e/epm.html)

Show only the EPM based traffic:

``` 
 epm 
```

## Capture Filter

You cannot directly filter EPM protocols while capturing. See [DCE/RPC](/DCE/RPC) how to filter on that protocol.

## External links

  - EPM is part of the [DCE/RPC](/DCE/RPC) specification

## Discussion

---

Imported from https://wiki.wireshark.org/EPM on 2020-08-11 23:13:47 UTC
