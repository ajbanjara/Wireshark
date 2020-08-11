# Universal Computer Protocol (UCP)

This protocol is specifically targetted at transferring Short Messages between a Short Message Service Centre (SMSC) and an application using transport like [TCP](/TCP) or [X.25](/X.25).

With this you can thus, using plain [TCP](/TCP), indirectly submit Short Messages to a mobile (cell phone) or receive from them.

## History

Specifications for a standard digital cellular network were finalised in the late 80's by the [GSM](/GSM) association. It included provisionings for a Short Message Service. How these short messages were transported into and out-of the cellular network was not specified, a Short Message Service Centre was envisioned that could store-and-forward these messages.

Commercial companies started to build and sell these SMSC's and devised protocols to enable applications to submit and receive these messages over other networks like [IP](/IP) and [X.25](/X.25).

At the same time, an [ETSI](/ETSI)-standard (UCP) was out that dealt with the submission of messages over older (ERMES-) paging networks. Handling short messages was a lot like submitting pager networks so the first application interface for an SMSC of an Anglo-Dutch company called CMG was heavily based on this protocol.

Specific extensions were introduced to handle short message specifics, which became known as the External Machine Interface (EMI) specifications. These extensions were later incorporated back into the ETS 300 133-3 standard.

## Protocol dependencies

  - [TCP](/TCP): Typically, UCP uses [TCP](/TCP) as its transport protocol. No well known port is defined for this protocol. The dissector will use heuristics to determine from the packet(s) whether the captured data is UCP or not.

  - [WSP](/WSP): The WAP protocol stack can use short messages as a bearer.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The UCP dissector is mostly focussed on short message traffic. Therefore, operations like "roaming reset operation" are not dissected. It's mostly the 50- and 60-series of operations.

## Preference Settings

There are no UCP specific preference settings.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of UCP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/u/ucp.html)

Show only the UCP based traffic:

``` 
 ucp 
```

## Capture Filter

You cannot directly filter UCP protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

## External links

  - [ETSI](/ETSI) ETS 300 133-3

## Discussion

---

Imported from https://wiki.wireshark.org/UCP on 2020-08-11 23:26:58 UTC
