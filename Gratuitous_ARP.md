# Gratuitous ARP

**Gratuitous ARP** could mean both gratuitous ARP *request* or gratuitous ARP *reply*. Gratuitous in this case means a request/reply that is not normally needed according to the ARP specification (RFC 826) but could be used in some cases. A gratuitous ARP request is an [AddressResolutionProtocol](/AddressResolutionProtocol) request packet where the source and destination IP are both set to the IP of the machine issuing the packet and the destination MAC is the broadcast address `ff:ff:ff:ff:ff:ff`. Ordinarily, no reply packet will occur. A gratuitous ARP reply is a reply to which no request has been made.

Gratuitous ARPs are useful for four reasons:

  - They can help detect IP conflicts. When a machine receives an ARP request containing a source IP that matches its own, then it knows there is an IP conflict.

  - They assist in the updating of other machines' [ARP table](/ARP-table)s. [Clustering solutions](http://en.wikipedia.org/wiki/High-availability_cluster) utilize this when they move an IP from one NIC to another, or from one machine to another. Other machines maintain an ARP table that contains the MAC associated with an IP. When the cluster needs to move the IP to a different NIC, be it on the same machine or a different one, it reconfigures the NICs appropriately then broadcasts a gratuitous ARP reply to inform the neighboring machines about the change in MAC for the IP. Machines receiving the ARP packet then update their ARP tables with the new MAC.

  - They inform switches of the MAC address of the machine on a given switch port, so that the switch knows that it should transmit packets sent to that MAC address on that switch port.

  - Every time an IP interface or link goes up, the driver for that interface will typically send a gratuitous ARP to preload the ARP tables of all other local hosts. Thus, a gratuitous ARP will tell us that that host just has had a link up event, such as a link bounce, a machine just being rebooted or the user/sysadmin on that host just configuring the interface up. If we see multiple gratuitous ARPs from the same host frequently, it can be an indication of bad Ethernet hardware/cabling resulting in frequent link bounces.

## Examples

  - The networking stack in many operating systems will issue a gratuitous ARP if the IP or MAC address of a network interface changes, to inform other machines on the network of the change so they can report IP address conflicts, to let other machines update their ARP tables, and to inform switches of the MAC address of the machine. The networking stack in many operating systems will also issue a gratuitous ARP on an interface every time the link to that interface has been brought to the up state. The gratuitous ARP then is used to preload the ARP table on all local hosts of the possibly new mapping between MAC and IP address (for failover clusters that do not take over the MAC address) or to let the switch relearn behind which port a certain MAC address resides (for failover clusters where you do pull the MAC address over as well or when you simply just move the network cable from one port to another on a normal nonclustered host)

  - The [High-Availability Linux Project](http://linux-ha.org/) utilizes a command-line tool called `send_arp` to perform the gratuitous ARP needed in their failover process. A typical clustering scenario might play out like the following:
    
      - Two nodes in a cluster are configured to share a common IP address 192.168.1.1. Node A has a hardware address of `01:01:01:01:01:01` and node B has a hardware address of `02:02:02:02:02:02`.
    
      - Assume that node A currently has IP address 192.168.1.1 already configured on its NIC. At this point, neighboring devices know to contact 192.168.1.1 using the MAC `01:01:01:01:01:01`.
    
      - Using the heartbeat protocol, node B determines that node A has died.
    
      - Node B configures a secondary IP on an interface with `ifconfig eth0:1 192.168.1.1`.
    
      - Node B issues a gratuitous ARP with `send_arp eth0 192.168.1.1 02:02:02:02:02:02 192.168.1.255`. All devices receiving this ARP update their table to point to `02:02:02:02:02:02` for the IP address 192.168.1.1.

## Example Traffic

    Ethernet II, Src: 02:02:02:02:02:02, Dst: ff:ff:ff:ff:ff:ff
        Destination: ff:ff:ff:ff:ff:ff (Broadcast)
        Source: 02:02:02:02:02:02 (02:02:02:02:02:02)
        Type: ARP (0x0806)
        Trailer: 000000000000000000000000000000000000
    Address Resolution Protocol (request/gratuitous ARP)
        Hardware type: Ethernet (0x0001)
        Protocol type: IP (0x0800)
        Hardware size: 6
        Protocol size: 4
        Opcode: request (0x0001)
        Sender MAC address: 02:02:02:02:02:02 (02:02:02:02:02:02)
        Sender IP address: 192.168.1.1 (192.168.1.1)
        Target MAC address: ff:ff:ff:ff:ff:ff (Broadcast)
        Target IP address: 192.168.1.1 (192.168.1.1)
    0000  ff ff ff ff ff ff 02 02 02 02 02 02 08 06 00 01   ................
    0010  08 00 06 04 00 01 02 02 02 02 02 02 c0 a8 01 01   ................
    0020  ff ff ff ff ff ff c0 a8 01 01 00 00 00 00 00 00   ................
    0030  00 00 00 00 00 00 00 00 00 00 00 00               ............

## Discussion

What's a good choice for example MACs? I picked `02:02:02:02:02:02`. Is there a better one? -- RandyMcEoin  
(201115 - [RFC7042](https://tools.ietf.org/html/rfc7042) - "IANA Considerations and IETF Protocol and Documentation Usage for IEEE 802 Parameters")  
&nbsp;&nbsp;&nbsp;&nbsp;`00-00-5E-00-53-00 through 00-00-5E-00-53-FF: assigned for use in documentation.`

\-The '02' byte at the start of the MAC indicates that this is a 'locally administered address' which has been set by the local user or system. Most normal ethernet devices are allocated a MAC with 00 as the most significant byte.

I updated the article to differentiate between gratuitous ARP *request* and *reply*.

Note that some devices will respond to the gratuitous *request* and some will respond to the gratuitous *reply*. If one is trying to write software for moving IP addresses around that works with all routers, switches and IP stacks, it is best to send both the *request* and the *reply*. These are documented by RFC 2002 and RFC 826. Software implementing the gratuitious ARP function can be found [in the Linux-HA source tree](http://hg.linux-ha.org/heartbeat?f=3ab12ab9dd26;file=heartbeat/libnet_util/send_arp.c;style=gitweb). A *request* may be preceded by a *probe* to avoid polluting the address space. For an ARP Probe the Sender IP address field is 0.0.0.0. ARP *probes* were not considered by the original ARP RFC.

\-Does the target MAC address ever matter in requests? I gather Solaris uses `ff:ff:ff:ff:ff:ff` in its standard ARP requests and most other OSes use `00:00:00:00:00:00` instead. Is the use of the `ff:ff:ff:ff:ff:ff` MAC in the target address above significant in any way? Obviously having a destination address of `ff:ff:ff:ff:ff:ff` is critical.yes

[RFC 3927](http://www.ietf.org/rfc/rfc3927.txt?number=3927), which is based on Gratuitous ARP, specifies `00:00:00:00:00:00` for the target MAC. However many simple TCP/IP stacks have an API which permits the specification of only one MAC value, and when the Ethernet Destination field is set to 'broadcast', the ARP target is also set 'broadcast'. Note: Normal ARP requests have the same value in the ARP Packet Target MAC address as in the Ethernet Destination field.

\- How can we explain if the source Ethernet MAC address is different from sender's MAC address in a GARP packet? The ARP packet value is for the ARP machine, the Ethernet value is for the Ethernet machine. Originally, they were intended to be redundant information, targeted at different layers. It is possible to consider a hypothetical network appliance that routes ARP packets, where the source Ethernet MAC address changes as the packet is routed, but normally ARP packets are not routed.

---

Imported from https://wiki.wireshark.org/Gratuitous_ARP on 2020-08-11 23:14:20 UTC
