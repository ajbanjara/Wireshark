If you see a lot of ARP traffic from a single machine, looking for MAC addresses for many of the IP addresses on your local network, there might be a virus on your network that's scanning your network for machines to infect. It's been claimed that the Wootbot virus does this.

This is not limited to Wootbot - i have observed during nachi outbreak networks very flooded with random arp and icmp requests which was very hard on L2/L3 devices - *Anith Anand*

\-updated 6th Mar 05 ([NetworkFlooding](/NetworkFlooding))

It is not just worms and viruses that can bring down the network or firewall - recently i was troubleshooting slow production network problem for a large organisation - intially i suspected it as some kinda virus outbreak or ddos attacks ..however thanks to wireshark - when i port spanned the firewall interfaces i noticed as much as 300,000 packets per min (5000 udp packets per second) in addition to the regular traffic was traversing through firewall (checkpoint) on single interface ( double it for exit interface) which made it bleed badly - even simple ping across f/w interface will timeout during this event - the above traffic was created by faulty (or mis configured) syslog listenter service which was pumping those error messages - however i should also thank "pathping" utility found in XP as it helped me in zooming into the problem by providing RTT and Packet Drop rate across network use pathping with -n option to make it work for you faster - "Anith Anand"

---

Imported from https://wiki.wireshark.org/ArpFlooding on 2020-08-11 23:11:18 UTC
