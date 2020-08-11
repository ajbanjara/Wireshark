# Reliable Transfer Service Element (RTSE)

The Reliable Transfer Service Element supports application that which to transfer large amounts of data and do not wish to restart the transfer from scratch if the connection fails before the transfer is complete.

[X411](/X411) always runs over RTSE, whilst [DISP](/DISP) can optionally be run over RTSE.

## History

RTSE was originally developed as part of the X.400 standards (X.410), which oftens transmits large messages. It was then extracted as a common core application service.

## Protocol dependencies

  - [ACSE](/ACSE): Typically, RTSE is called from [ACSE](/ACSE) during connection establishment and teardown.

  - [PRES](/PRES): Typically, RTSE is called from [PRES](/PRES) for remote operations.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The RTSE dissector is fully functional though it is has only been exercised with the [X411](/X411) dissector to date.

## Preference Settings

There are no preference settings specific to RTSE but you might want to enable reassembly of those transport protocols that are used below RTSE. Specifically, COTP reassembly.

## Example capture file

The following sample capture files show show RTSE being used by X.400 ([X411](/X411)).

  - [SampleCaptures/x400-ping-refuse.pcap](uploads/__moin_import__/attachments/SampleCaptures/x400-ping-refuse.pcap)

  - [SampleCaptures/p772-transfer-success.pcap](uploads/__moin_import__/attachments/SampleCaptures/p772-transfer-success.pcap)

## Display Filter

A complete list of RTSE display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/r/rtse.html)

Show only the RTSE based traffic:

``` 
 rtse
```

## Capture Filter

You cannot directly filter PROTO protocols while capturing. However, if you know the [COTP](/COTP) port used, you can filter on that one.

Capture only the RTSE traffic over the default port (102):

``` 
 tcp port 102
```

## External links

  - <http://www.itu.int/ITU-T/asn1/database/itu-t/x/x228/1988/> ITU X.228

## Discussion

---

Imported from https://wiki.wireshark.org/RTSE on 2020-08-11 23:24:15 UTC
