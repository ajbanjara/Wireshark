# Internet Message Format (imf)

The Internet Message Format is format in which text messages are transferred over the Internet. Where [SMTP](/SMTP) is equivalent to the message envelope, IMF is equivalent to the letter within the envelope. It contains the originator, recipients, subject and dates. Whilst IMF only handles text messages, it can be augmented with [MIME\_multipart](/MIME_multipart) to support multi-media messages.

## History

The Internet Message Format has been developed in parallel with the Simple Message Transfer Protocol [SMTP](/SMTP). Indeed IMF messages are often actually referred to as "SMTP Messages". IMF was originally published [RFC 822](http://www.ietf.org/rfc/rfc822.txt) in 1982 as "Standards for the Format of ARPA Internet Text Messages", which in turn had been developed from earlier RFCs beginning with [RFC 561](http://www.ietf.org/rfc/rfc561.txt) "Standardizing Network Mail Headers".

In 2001, a new RFC was published, [RFC 2822](http://www.ietf.org/rfc/rfc2822.txt), updating it to reflect current practice and incorporating incremental changes that were specified in other RFCs.

Additional IMF fields have been defined by other RFCs, including [RFC 2156](http://www.ietf.org/rfc/rfc2822.txt) which defines a mapping between X.400 message fields and IMF heading fields.

The Multipurpose Internet Mail Extensions (MIME) series of RFCS further enhanced the specification of the format of the body of the message to support complex structures and binary attachments.

## Protocol dependencies

  - [SMTP](/SMTP): Typically, IMF uses [SMTP](/SMTP) as its transport protocol

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The IMF dissector is fully functional though there are some IMF heading fields that may be in common use that have not yet been specifically detected. They will appear as unknown extensions.

## Preference Settings

In order to successfully dissect an IMF message, the message must be reconstructed from the fragments that are transferred over [SMTP](/SMTP). Therefore the [SMTP](/SMTP) Preference setting "Reassemble SMTP DATA commands spanning multiple TCP segments" must be enabled.

## Example capture file

An example IMF capture is included in the following capture file. The IMF message dissection is in frame 69 (or use the filter described below).

  - [SampleCaptures/IMF.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/IMF.pcap.gz)

You will need to "Decode As" port 587 as [SMTP](/SMTP), as the capture was not done on the standard port 25.

## Display Filter

A complete list of IMF display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/i/imf.html)

Show only the IMF based traffic:

``` 
 imf
```

## Capture Filter

You cannot directly filter IMF protocols while capturing. However, if you know the [TCP](/TCP) port used by the [SMTP](/SMTP) protocol, you can filter on that one.

Capture only the IMF traffic carried over SMTP on the default port (25):

``` 
 tcp port 25 
```

## External links

  - [RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) *Internet Message Format*

  - [RFC 2156](http://www.ietf.org/rfc/rfc2156.txt) *MIXER (Mime Internet X.400 Enhanced Relay): Mapping between X.400 and RFC 822/MIME*

## Discussion

---

Imported from https://wiki.wireshark.org/IMF on 2020-08-11 23:15:06 UTC
