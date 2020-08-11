## RedBack Smartedge pcap format

The RedBack Smartedge is an Edge Subscriber Terminating router. It is designed around a powerpc based NetBSD and intelligent packet forwarding linecards. From the NetBSD the linecards appear as interfaces one can issue a tcpdump on. As the linecards do packet forwarding themselves one only sees traffic destined or originating from the Route Processor called XCRP. Typically you'll see Radius, ARP, PPPoE, L2TP Tunnel/Session Setup/Drop, Routing Protocols.

The packet processing is based on circuits and RedBack has extended the pcap format by additional informations concerning protocol and circuit informations. The linecards are able to do ethernet en-/decapsulation themselves so some packets are pure IP, some are Ethernet encapsulated etc.

Knowledge about this format has basically been gained by reverse engeneering the tcpdump output on the SEOS. It is not complete and there are messages which seem to be provider propritary and thus can not be displayed properly.

The wireshark loader has been tested with SEOS 2.6.5.2, 4.0.7.0 and 4.0.7.1

---

Imported from https://wiki.wireshark.org/RedBack on 2020-08-11 23:23:51 UTC
