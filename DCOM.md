# Microsoft Distributed Component Object Model (DCOM)

The distributed object protocol from Microsoft (similar to [CORBA](/CORBA) but less powerful). As Microsoft is preferring [SOAP](/SOAP) for this kind of purpose now, you might call it a kind of obsolete.

## Interfaces

DCOM uses interfaces and an interface description language (IDL) to define the interfaces/procedures available (it's all much like CORBA).

DCOM defines some common interfaces:

  - IDispatch:
  - IOxidResolver:
  - IRemoteActivation:
  - IRemoteUnknown/IRemoteUnknown2:
  - ISystemActivator:

In addition to this, users can define and register their own interfaces.

## History

Microsoft started DCOM with the name ORPC, an abbreviation of Object RPC, as you might find it in some documentation. XXX - add some more description of DCOM history

## Protocol dependencies

  - [DCE/RPC](/DCE/RPC): DCOM uses [DCE/RPC](/DCE/RPC) as its transport protocol.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The DCOM dissector is partially implemented and a lot of dissection it still incomplete / buggy. However, often used methods are implemented, so the dissector should be useful.

## Preference Settings

(XXX add links to preference settings affecting how DCOM is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of DCOM display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/d/dcom.html).

Show only the DCOM based traffic:

``` 
 dcom
```

## Capture Filter

You cannot filter DCOM protocols while capturing.

## External links

  - [\[MS-DCOM\]: Distributed Component Object Model (DCOM) Remote Protocol](http://msdn.microsoft.com/en-us/library/cc226801.aspx) - Recent DCOM specification (part of Microsoft's Open Specification)
    
      - [DCE 1.1: Remote Procedure Call (C706)](http://pubs.opengroup.org/onlinepubs/9629399/) - DCE/RPC specification
    
      - [\[MS-RPCE\]: Remote Procedure Call Protocol Extensions](http://msdn.microsoft.com/en-us/library/cc243560.aspx) - MSRPC specification - Microsoft extensions to DCE/RPC

  - [Distributed Component Object Model Protocol -- DCOM/1.0](http://tools.ietf.org/html/draft-brown-dcom-v1-spec-03) 1998 version of DCOM/1.0 specification (internet draft)

  - [Understanding the DCOM Wire Protocol by Analyzing Network Data Packets](http://www.microsoft.com/msj/0398/dcom.aspx)

## Discussion

---

Imported from https://wiki.wireshark.org/DCOM on 2020-08-11 23:12:34 UTC
