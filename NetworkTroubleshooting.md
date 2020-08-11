# Network Troubleshooting

This page contains a list of pages giving information about how to troubleshoot network problems.

For example, it could refer to pages saying "if you see a lot of ARP traffic, you might have machines infected with virus XXX on your network", or "if you are getting slow response for HTTP requests, you should look for this on the network".

## Beginner?

New to network troubleshooting? Read the [/Overview](/NetworkTroubleshooting/Overview).

## "Mysterious" traffic

  - Some networks might have a lot of what Wireshark identifies as "Intel ANS probe" traffic. ANS is Intel's "Advanced Networking Services," which provides load balancing, aggregation, and failover for their line of NICs:
    
    <http://www.intel.com/support/network/adapter/ans/>

## Virus behavior

  - Several viruses send a lot of ARP traffic in an attempt to discover hosts to infect; see the [ArpFlooding](/ArpFlooding) page.

## Other sources of network flooding

  - Broken/misconfigured software can also cause network or firewall to bleed; see "[NetworkFlooding](/NetworkFlooding)" page

## External links

Cisco's [Internetwork Troubleshooting Handbook](http://www.cisco.com/univercd/cc/td/doc/cisintwk/itg_v1/index.htm). The [Overview](http://www.cisco.com/univercd/cc/td/doc/cisintwk/itg_v1/tr1901.htm) section provides a good general problem-solving model. The [Principles of Troubleshooting](http://www.inetdaemon.com/tutorials/troubleshooting/index.shtml) at [InetDaemon.Com](http://www.inetdaemon.com) shows how to apply the scientific method to network troubleshooting.

---

Imported from https://wiki.wireshark.org/NetworkTroubleshooting on 2020-08-11 23:17:20 UTC
