# Dynamic Source Routing (DSR) protocol

DSR is a reactive ad-hoc routing protocol, it is a meant to be used in wireless and infracstructure-less networks.

When a route is needed, a node sends route request message that is relayed through the network to the destination. The destination then replies with a route response message using the shortest path. Once the source node receives the response, it uses the hop list as a header for each data packet. The nodes on the route use this route to select the next hop.

---

Imported from https://wiki.wireshark.org/DSR on 2020-08-11 23:13:38 UTC
