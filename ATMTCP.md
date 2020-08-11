# ATM over TCP (ATMTCP)

It is use by Linux to set-up a ATM over TCP connections

## History

## Protocol dependencies

  - [TCP](/TCP): Typically, ATMTCP uses [TCP](/TCP) as its transport protocol. The well known TCP port for ATMTCP traffic is 2812.

## Wireshark

The ATM over TCP dissector is partially functional. The dissector dissect only the ATMTCP header (VCI, VPI, Payload Length)

The data are not yet dissect, it is necessary to add a "UAT" (As with the K12 dissector) to indicate the type (ILMI, AAL, ATM...) of data (based on VCI/VPI)

## Preference Settings

(XXX add links to preference settings affecting how PROTO is dissected).

## Example capture file

## Display Filter

A complete list of ATMTCP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/a/atmtcp.html)

Show only the ATMTCP based traffic:

``` 
 atmtcp
```

## Capture Filter

You cannot directly filter Aprotocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the ATMTCP traffic over the default port (2158):

``` 
 tcp port 2158 
```

## External links

  - add link to PROTO specification and where to find additional info on the web about it, e.g.:

  - [atm\_tcp.h](http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/include/uapi/linux/atm_tcp.h?id=HEAD) *atm\_tcp.h source code* Specification of ATMTCP.

## Discussion

---

Imported from https://wiki.wireshark.org/ATMTCP on 2020-08-11 23:11:25 UTC
