# Remote Quota Protocol (RQUOTA)

XXX - add a brief RQUOTA description here

## History

XXX - add a brief description of RQUOTA history

## Protocol dependencies

  - [ONC-RPC](/ONC-RPC): RQUOTA uses [ONC-RPC](/ONC-RPC) as its transport mechanism. ONC-RPC program number is 100011.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The RQUOTA dissector is (fully functional, partially functional, not existing, ... whatever the current state is). Also add info of additional Wireshark features where appropriate, like special statistics of this protocol.

The RQUOTA dissector seems to be decoding V1 packets ok but is not decoding V2 packets as of Wireshark 0.99.6

## Preference Settings

(XXX add links to preference settings affecting how RQUOTA is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of RQUOTA display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/r/rquota.html)

Show only the RQUOTA based traffic:

``` 
 rquota 
```

## Capture Filter

You cannot directly filter RQUOTA protocols while capturing.

## External links

  - add link to RQUOTA specification and where to find additional info on the web about RQUOTA

## Discussion

---

Imported from https://wiki.wireshark.org/RemoteQuotaProtocol on 2020-08-11 23:23:52 UTC
