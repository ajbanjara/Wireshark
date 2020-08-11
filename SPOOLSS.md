# Microsoft Spool Subsystem (SPOOLSS)

Wireshark dissector for the Microsoft Print System Remote Protocol.

## History

XXX - add a brief description of SPOOLSS history

## Protocol dependencies

  - [DCE/RPC](/DCE/RPC): Typically, SPOOLSS uses [DCE/RPC](/DCE/RPC) as its transport protocol.

  - [SMB](/SMB): SPOOLSS can also be transported over SMB.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The SPOOLSS dissector is fully functional.

## Preference Settings

(XXX add links to preference settings affecting how SPOOLSS is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of SPOOLSS display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/s/spoolss.html)

Show only the SPOOLSS based traffic:

``` 
 spoolss 
```

## Capture Filter

You cannot directly filter SPOOLSS protocols while capturing.

## External links

  - [\[MS-RPRN](http://msdn.microsoft.com/en-us/library/cc244528.aspx)\]

## Discussion

---

Imported from https://wiki.wireshark.org/SPOOLSS on 2020-08-11 23:25:48 UTC
