# Trivial File Transfer Protocol (TFTP)

TFTP is used to transfer files in a very simple way.

Compared to other file transfer protcols (like: [FTP](/FTP) or [HTTP](/HTTP)), TFTP is much simpler (and much smaller in code size) and therefore easier to implement. Because of this, it's often used in embedded devices (e.g. thin clients) to get files from a server at bootup time (typically in conjunction with [BOOTP](/BOOTP)).

Sometimes TFTP is also used to upload firmware files from the user to an embedded device, but as these devices become more and more advanced, [HTTP](/HTTP) is more often used for this purpose today.

## History

XXX - add a brief description of TFTP history

## Protocol dependencies

  - [UDP](/UDP): Typically, TFTP uses [UDP](/UDP) as its transport protocol. The well known UDP port for TFTP traffic is 69.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The TFTP dissector is fully functional.

## Preference Settings

There are no TFTP specific preference settings.

## Example capture file

[SampleCaptures/tftp\_rrq.pcap](uploads/__moin_import__/attachments/SampleCaptures/tftp_rrq.pcap) Capture of a TFTP Read Request.

[SampleCaptures/tftp\_wrq.pcap](uploads/__moin_import__/attachments/SampleCaptures/tftp_wrq.pcap) Capture of a TFTP Write Request.

## Display Filter

A complete list of TFTP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/t/tftp.html)

Show only the TFTP based traffic:

``` 
 tftp 
```

## Capture Filter

You cannot directly filter TFTP protocols while capturing. However, if you know the [UDP](/UDP) port used (see above), you could filter on that one; however, as a TFTP server will choose a unique port number from which to send the reponse, and will send it to the port number from which the request came, which is not likely to be a well known port number, a filter checking for UDP port 69 will capture only the initial TFTP request, not the response to that request or any subsequent packets in that TFTP conversation.

## External links

  - [RFC 783](http://www.ietf.org/rfc/rfc783.txt) *THE TFTP PROTOCOL (REVISION 2)*

  - [RFC 1350](http://www.ietf.org/rfc/rfc1350.txt) *THE TFTP PROTOCOL (REVISION 2)* (obsoletes RFC 783)

  - [RFC 2090](http://www.ietf.org/rfc/rfc2090.txt) *TFTP Multicast Option*

  - [RFC 2347](http://www.ietf.org/rfc/rfc2347.txt) *TFTP Option Extension*

  - [RFC 2348](http://www.ietf.org/rfc/rfc2348.txt) *TFTP Blocksize Option*

  - [RFC 2349](http://www.ietf.org/rfc/rfc2349.txt) *TFTP Timeout Interval and Transfer Size Options*

## Discussion

---

Imported from https://wiki.wireshark.org/TFTP on 2020-08-11 23:26:37 UTC
