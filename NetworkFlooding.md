# NetworkFlooding (TCP / UDP / ICMP Flooding) by Anith Anand

Network flooding can be caused by Worms, Viruses and D(D)OS Attacks primarily

However it is not just Worms and viruses that can bring down the network or firewall - recently I was troubleshooting slow production network problem for a large organisation - intially i suspected it as some kinda virus outbreak or DDOS attacks. However thanks to Wireshark - when I port spanned the firewall interfaces I noticed as many as 300,000 packets per min (5000 UDP packets per second) in addition to the regular traffic was traversing through firewall (checkpoint) on single interface (double it for exit interface) which made it bleed badly - even simple ping across f/w interface will timeout during this event - the above traffic was created by faulty (or mis configured) syslog listener service which was pumping those error messages - however i should also thank "pathping" utility found in XP as it helped me in zooming into the problem by providing RTT and Packet Drop rate across network use pathping with -n option to make it work for you faster - *Anith Anand*

# NetworkFlooding by Henk van Asselt

Another reason of network flooding is a loop in the network. Such a loop can be caused by having 2 bridges, bridging two segments of the same network networks, but which are not set up properly (by means of Spanning Tree), so the same frame can circle around the segment virtually forever. - *Henk van Asselt*

---

Imported from https://wiki.wireshark.org/NetworkFlooding on 2020-08-11 23:17:18 UTC
