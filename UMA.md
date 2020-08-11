# Unlicensed Mobile Access (UMA)

Unlicensed Mobile Access (UMA) technology provides access to GSM and GPRS mobile services over unlicensed spectrum technologies, including Bluetooth and 802.11.

## History

In order to promote the widespread adoption of UMA technology, a number of leading companies within the wireless industry have jointly developed a set of open specifications. <http://www.umatechnology.org/> now adopted as [3GPP TS 44.318](http://www.3gpp.org/ftp/Specs/html-info/44318.htm).

## Protocol dependencies

  - [TCP](/TCP): Typically, UMA uses [TCP](/TCP) as its transport protocol.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The UMA dissector is partially functional.

## Preference Settings

The TCP port for UMA call setup is configurable

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of UMA display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/UMA/UMA.html)

Show only the UMA based traffic:

``` 
 UMA 
```

## Capture Filter

You cannot directly filter UMA protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

## External links

  - [UMA technology](http://www.umatechnology.org/)

  - [UMA Today](http://www.umatoday.com/)

  - [UMA Today blog](http://umatoday.blogspot.com/)

## Discussion

---

Imported from https://wiki.wireshark.org/UMA on 2020-08-11 23:27:04 UTC
