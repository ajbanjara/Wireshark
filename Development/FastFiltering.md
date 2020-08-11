# Fast Packet Filtering

This patch [fastfilter\_rev27811.patch](uploads/__moin_import__/attachments/Development/FastFiltering/fastfilter_rev27811.patch) (compiled and tested on Linux) illustrates one possible way to speed up interactive packet filtering in Wireshark. The following sections will describe the problem, solution and implementation notes.

**Correct me if I'm wrong in describing current Wireshark implementation.**

## How Does Wireshark Filter Packets Interactively?

  - First Wireshark gets filter string from tool bar. Then Wireshark compiles this filter string to a syntax tree. Later this syntax tree is translated to Display Filter Virtual Machine instructions.
  - After that, Wireshark iterates over each packet, and call dissectors to dissect it. With information obtained from dissection, Wireshark applies the filter on the packet. If the packet passed the filter, it will be displayed in the GUI.
  - The above process should be gone through each time a filter is applied by users, even if the same filter has been applied twice.

## How Can We Improve the Filtering Speed?

Current Wireshark implementation does not use *history of filtering* in sense of two filtering do not share knowledge of filtering string.

The below example shows how *history of filtering* can help us speed up filtering:

1.  Assume a capture containing 100 packets, among which there are 80 TCP packets, 20 UDP packets. And there are 10 DNS packets among the 20 UDP packets. In this case, we also assume these DNS packets are all on top of UDP packets (Note it is possible that DNS is on TCP).

2.  The first filter is 'udp', thus 20 UDP packets are displayed. We save this information in some cheap way.

3.  The second filter is 'tcp', thus 80 TCP packets are displayed. We also save this information.

4.  The third filter is 'udp && dns'. Since we know only 20 packets has been passed 'udp', we need only dissect these 20 packets, and apply the filter, i.e. 'udp && dns' to find out the 10 DNS packets. The other 80 packets are simply skipped.

5.  The forth filter is 'tcp'. Since we saved the display history, we only need to dissect the 80 TCP packets.

In short, we may save considerable time by dissecting only part of packets with knowledge of previous applied filters. In the above example, 'udp && dns' filter can save 80% time roughly.

## The Solution

In this section, we will describe the solution to this problem in a more abstract way.

1.  Assume a new display filter, say F, contains previous applied filters F1, ..., Fn. In the other words, F1, ..., Fn are subtrees of F. There are also parts of F that are not F1, ..., Fn.
2.  Each display filter is translated to a syntax tree, and F's syntax tree is S, Fi's is Si (which is a subtree in F). Syntax tree nodes that are not Fi, but in F are denoted as N1, ..., Nm.
3.  For a packet, if it passed Fi, we set value of subtree Si to 1; otherwise set it to 0. Then we translate modified F to a boolean expression, say it is EXP, which treats N1, ..., Nm as boolean variables. So that we can solve it as a Boolean Satisfiability \[1\] problem (a.k.a SAT problem):
      - This packet will never pass F, if EXP can NOT be true with any assignment of values of N1, ..., Nm. So we need not to dissect the packet.
      - This packet will always pass F, if (\!EXP) can NOT be true with any assignment of values of N1, ..., Nm. So we need to dissect the packet, but no need to apply the filter F.
      - In remaining cases, we do not know if the packet will pass F or not with current information, so we should dissect it and apply F to it.

## The Implementation

Here are some implementation notes:

  - History of filtering is saved in each packet's frame data, which is a 64 bits integer. If i th bit is 1, it means this packet passed i th saved filter.
  - Previous applied filters are saved as syntax trees.
  - We use limmat\[2\] SAT solver, and limboole front end. The main reason is that they are lightweight.

\[1\] <http://en.wikipedia.org/wiki/Boolean_satisfiability_problem>

\[2\] <http://fmv.jku.at/limmat/>

---

Imported from https://wiki.wireshark.org/Development/FastFiltering on 2020-08-11 23:12:47 UTC
