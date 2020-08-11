# Real-time Streaming Protocol (RTSP)

RTSP is used to set up real-time media streams, e.g. ones using [RTP](/RTP) and [RTCP](/RTCP).

## History

RTSP was first specified in [RFC2326](http://www.ietf.org/rfc/rfc2326.txt).

## Protocol dependencies

  - [TCP](/TCP): Typically, RTSP uses [TCP](/TCP) as its transport protocol. The well known TCP port for RTSP traffic is 554.

  - [UDP](/UDP): RTSP can also use [UDP](/UDP) as its transport protocol (is this ever done?). The well known UDP port for RTSP traffic is 554.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The RTSP dissector is fully functional over TCP, but currently doesn't handle RTSP-over-UDP.

## Preference Settings

There are four preference settings affecting RTSP.

### RTSP TCP Port:

This preference specifies the first of the TCP ports on which the RTSP dissector will check for traffic. The default is 554.

### Alternate RTSP TCP Port:

This preference specifies the second of the TCP ports on which the RTSP dissector will check for traffic. The default is 8554.

### Reassemble RTSP headers spanning multiple TCP segments:

When this preference is enabled, then the RTSP dissector will reassemble the RTSP header if it has been transmitted over more than one TCP segment. Although it is unusual for headers span multiple segments, it's not impossible, and this should be checked if you expect to view the contents of the RTSP conversation.

### Reassemble RTSP bodies spanning multiple TCP segments:

When this preference is enabled, then the RTSP dissector will reassemble the RTSP body if it has been transmitted over more than one TCP segment.

## Example capture file

## Display Filter

A complete list of RTSP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/r/rtsp.html)

Show only the RTSP based traffic:

``` 
 rtsp 
```

## Capture Filter

You cannot directly filter RTSP protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture RTSP traffic over the default port (554):

``` 
 tcp port 554 
```

Capture RTSP traffic over the alternate port (8554):

    tcp port 8554 

## External links

  - [RFC2326](http://www.ietf.org/rfc/rfc2326.txt) *Real Time Streaming Protocol (RTSP)*

## Discussion

---

Imported from https://wiki.wireshark.org/RTSP on 2020-08-11 23:24:15 UTC
