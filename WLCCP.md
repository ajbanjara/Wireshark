# Cisco Wireless LAN Context Control Protocol (WLCCP)

The WLCCP protocol is used by Cisco wireless access points and servers to manage a multiple access point wireless infrastructure called Wireless Domain Services (WDS)

## Wireshark

The WLCCP dissector is mostly functional. The main thing missing is TLV processing at the end of messages.

## Example capture file

[SampleCaptures/ciscowl.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/ciscowl.pcap.gz)

[SampleCaptures/ciscowl\_version\_0xc1.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/ciscowl_version_0xc1.pcap.gz)

## Display Filter

A complete list of WLCCP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/w/wlccp.html)

Show only the WLCCP based traffic:

``` 
 wlccp 
```

## External links

[Wireless Domain Services FAQ](http://cisco.com/en/US/tech/tk722/tk809/technologies_q_and_a_item09186a00804d4421.shtml)

[US Patent Application 20050220054](http://appft1.uspto.gov/netacgi/nph-Parser?Sect1=PTO2&Sect2=HITOFF&p=1&u=%2Fnetahtml%2FPTO%2Fsearch-bool.html&r=4&f=G&l=50&co1=AND&d=PG01&s1=wlccp&OS=wlccp&RS=wlccp) *Wireless local area network context control protocol* - US Patent application that describes the WLCCP protocol.

## Discussion

---

Imported from https://wiki.wireshark.org/WLCCP on 2020-08-11 23:27:40 UTC
