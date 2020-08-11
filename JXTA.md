# JXTA

JXTA is a P2P protocol which forms an overlay network.

## History

The JXTA project was started by Bill Joy of Sun Microsystems Inc. in 1999 and was released as open source in 2001. JXTA continues to be actively developed and implementations are available for [JXTA Java Standard Edition/Enterprise Edition (JXSE)](https://jxta-jxse.dev.java.net), [JXTA Java Mobile Edition (JXME)](https://jxta-jxse.dev.java.net) and [JXTA-C](https://jxta-c.dev.java.net)

## Protocol dependencies

  - [UDP](/UDP)/[TCP](/TCP)/[HTTP](/HTTP) : JXTA commonly uses [UDP](/UDP), [TCP](/TCP) and [HTTP](/HTTP) as its transport protocols.

## Example traffic

Available from the [Sample Captures](/Sample-Captures) page.  

## Wireshark

The JXTA dissector is fully functional and enables dissection of JXTA messages transmitted on [UDP](/UDP), [TCP](/TCP) and [HTTP](/HTTP). Support for connections and endpoints is also available.

## Preference settings

  - **Reassemble JXTA messages spanning multiple UDP/HTTP/TCP segments:**
    
    When this preference is enabled, then the JXTA dissector will reassemble the JXTA conversation if it has been transmitted over more than one segment. This should be checked if you expect to view the contents of the JXTA conversation. To use this option you must also enable "**Allow subdissectors to reassemble TCP streams**" in the [TCP](/TCP) protocol settings and enable "**Reassemble fragmented IP datagrams**" in the [IP](/IP) protocol settings.

  - **Try to discover JXTA in UDP datagrams:** When this preference is enabled the JXTA dissector will inspect UDP datagrams to heuristically determine if the datagram contains JXTA related data.

  - **Try to discover JXTA in UDP datagrams:** When this preference is enabled the JXTA dissector will inspect TCP connections to heuristically determine if the connection contains JXTA related data.

## Example capture files

  - [SampleCaptures/jxta-sample.pcap](uploads/__moin_import__/attachments/SampleCaptures/jxta-sample.pcap) (libpcap) A trace of a JXTA client and rendezvous doing some chatting using several JXTA pipes.

  - [SampleCaptures/jxta-mcast-sample.pcap](uploads/__moin_import__/attachments/SampleCaptures/jxta-mcast-sample.pcap) (libpcap) A trace of a JXTA client and rendezvous doing some chatting using several JXTA pipes with UDP Multicast enabled.

## Display Filter

A complete list of PROTO display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/j/jxta.html)

Show only the JXTA based traffic:

``` 
 jxta 
```

## Capture Filter

You cannot directly filter JXTA protocols while capturing. However, if you know the port used, you can filter on that one.

Capture only the JXTA traffic over the default port (9700):

``` 
 tcp port 9700 
```

## External links

  - JXTA Project Web Site : <https://jxta.dev.java.net>

  - JXTA Specification Web Site : <https://jxta-spec.dev.java.net/>

  - JXTA Specification : [HTML](https://jxta-spec.dev.java.net/nonav/JXTAProtocols.html) [PDF](https://jxta-spec.dev.java.net/JXTAProtocols.pdf)

## Discussion

---

Imported from https://wiki.wireshark.org/JXTA on 2020-08-11 23:15:42 UTC
