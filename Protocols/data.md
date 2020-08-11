# data "protocol"

When Wireshark can't determine how part of a packet should be formatted, it marks that chunk as "Data". This can be caused by the following:

  - The "Data" is a protocol that Wireshark doesn't support.

  - The "Data" is a protocol that has been disabled using Wireshark's [Enabled Protocols](http://www.wireshark.org/docs/wsug_html_chunked/ChAdvProtocolDissectionSection.html#ChAdvEnabledProtocols) feature

  - The "Data" is a protocol that Wireshark supports, but doesn't recognize. If this is the case, you can use Wireshark's [User Specified Decodes](http://www.wireshark.org/docs/wsug_html_chunked/ChAdvProtocolDissectionSection.html#ChAdvDecodeAs) feature or its protocol preferences to force the decoding of a protocol.

  - The "Data" is just that - the normal data payload of a protocol.

## History

The concept of "data" predates networking protocols and is outside the scope of this page. For a complete discussion, see the [the Wikipedia entry on data](http://en.wikipedia.org/wiki/Data).

## Protocol dependencies

The data dissector doesn't directly depend on any protocol, but it can show up in any packet.

## Example traffic

![data.png](uploads/__moin_import__/attachments/Protocols/data/data.png "data.png")

## Wireshark

The data dissector is fully functional.

## Preference Settings

There are no preferences for the data dissector. However, protocol preferences and other settings described above can affect its display.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of Data display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/d/data.html)

Show only packets where un-decoded data is present:

``` 
 data 
```

Look for a specific URL in HTTP data:

``` 
  frame.protocols contains "http:data" and data contains "<a href=\"http://www.example.com\"" 
```

## Capture Filter

You cannot directly filter data while capturing.

## External links

## Discussion

---

Imported from https://wiki.wireshark.org/Protocols/data on 2020-08-11 23:19:19 UTC
