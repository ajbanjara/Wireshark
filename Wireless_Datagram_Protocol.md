# Wireless Datagram Protocol (WDP)

The Wireless Datagram Protocol provides a [UDP](/UDP)-like service to non-IP bearers. On IP-enabled bearers (like [IP](/IP) or GSM Circuit-Switched Data (CSD) or even [GPRS](/GPRS)) WDP is identical to [UDP](/UDP), hence people often talk about the "WDP-UDP" protocol.

WDP provides 16-bit port multiplexing and 8-bit data transport in the same way [UDP](/UDP) does.

Note that WDP is not a real dissector in Wireshark, but some dissectors (like the GSM SMS User Data dissector) will hand off protocol data to WAP dissectors as if it was handed off to a WDP dissector.

## History

WDP was added to the [WAP](http://www.wapforum.org/) specifications as at the time of writing the first [WAP](http://www.wapforum.org/) specifications there was a plethora of wireless datagram transfer protocols (TETRA, Mobitex, IDEN, GSM SMS and many others) but no-one could be used the same way for offering the [WAP](http://www.wapforum.org/) services.

As a result, WDP provides adaptation to the relevant protocols in order to enable them to convey the [WAP](http://www.wapforum.org/) protocols.

## Protocol dependencies

The WAP transport protocol stack is shown below:

![WapProtocolFamily/WAP\_Transport\_Protocol\_Stacks.jpg](uploads/__moin_import__/attachments/WapProtocolFamily/WAP_Transport_Protocol_Stacks.jpg "WapProtocolFamily/WAP_Transport_Protocol_Stacks.jpg")

Depending on the protocol stack, 4 different standard WDP ([UDP](/UDP)) ports have been defined: 9200, 9201, 9202 and 9203. [WSP](/WSP) can run on other ports too.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The WDP dissector does not really exist in Wireshark.

## Preference Settings

The WDP dissector does not exist (not needed) and consequently it has no preference settings.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

WDP traffic cannot be filtered directly with Wireshark. However, if the non-IP bearer is known, then filtering on that bearer and [WSP](/WSP) may show the traffic where WDP exists.

## Capture Filter

You cannot directly filter WDP while capturing. However, if you know the non-IP bearer used (see above), you might filter on that one (e.g., by using the [TCP](/TCP) port of the [SMPP](/SMPP) protocol in case of transport over [SMPP](/SMPP)).

## External links

  - See [WAP Forum](http://www.wapforum.org/)

## Discussion

---

Imported from https://wiki.wireshark.org/Wireless_Datagram_Protocol on 2020-08-11 23:27:33 UTC
