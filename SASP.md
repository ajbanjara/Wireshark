# Server/Application State Protocol (SASP)

Server/Application State Protocol (SASP) provides a mechanism for load balancers and workload management systems to communicate better ways of distributing the existing workload to the group members.

## Protocol dependencies

  - [TCP](/TCP): Typically, SASP uses [TCP](/TCP) as its transport protocol. The well known TCP port for SASP traffic is 3860.

## Wireshark

The SASP dissector is fully functional.

## Preference Settings

Unsetting Reassemble SASP Packets over multiple TCP segments will throw Error (Expert Info (Error/Malformed): Malformed Packet (Exception occurred)) for SASP packets spread across multiple tcp segments. By Default, the preference is set to TRUE.

## Example capture file

  - [SampleCaptures/SASP.pcap](uploads/__moin_import__/attachments/SampleCaptures/SASP.pcap)

## Display Filter

Show only the PROTO based traffic:

``` 
 SASP 
```

## Capture Filter

You cannot directly filter SASP protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the SASP traffic over the default port (3860):

``` 
 tcp port 3860 
```

## External links

  - [RFC 4678](http://tools.ietf.org/html/rfc4678) *Server/Application State Protocol v1*

## Discussion

---

Imported from https://wiki.wireshark.org/SASP on 2020-08-11 23:24:26 UTC
