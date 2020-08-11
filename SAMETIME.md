\= Sametime (TM) Community - Client Protocol (SAMETIME) =

This protocol is used by the IBM Sametime software.

## History

An initial draft was made available in 2000.

## Protocol dependencies

  - [TCP](/TCP): Typically, SAMETIME uses [TCP](/TCP) as its transport protocol. The well known TCP port for SAMETIME traffic is 1533.

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The SAMETIME dissector is partially functional.

## Preference Settings

(XXX add links to preference settings affecting how SAMETIME is dissected).

## Example capture file

  - [SampleCaptures/SAMETIME.pcap](uploads/__moin_import__/attachments/SampleCaptures/SAMETIME.pcap)

## Display Filter

A complete list of SAMETIME display filter fields can be found in the [http://www.wireshark.org/docs/dfref/s/sametime.html filter reference](http://www.wireshark.org/docs/dfref/s/sametime.html%20filter%20reference)

Show only the SAMETIME based traffic:

``` 
 sametime 
```

## Capture Filter

You cannot directly filter SAMETIME protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the SAMETIME traffic over the default port (1533):

``` 
 tcp port 1533 
```

## External links

  - <http://www-10.lotus.com/ldd/stwiki.nsf/dx/ports-used-by-the-sametime-server>

## Discussion

---

Imported from https://wiki.wireshark.org/SAMETIME on 2020-08-11 23:24:20 UTC
