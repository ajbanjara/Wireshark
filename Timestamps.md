# Timestamps

Wireshark just gets its timestamp from libpcap/Npcap, and libpcap/Npcap gets it from the packet capture mechanism it uses; Wireshark itself doesn't generate the timestamp so there's nothing Wireshark can do about it.

How the timestamp works is OS dependent. In some UNIXes that code is in the network drivers; it's higher up in the networking code path in other UNIXes. In Windows, with [Npcap](/Npcap), timestamping is done by the [Npcap](/Npcap) driver.

Another issue might be if the OS delivers multiple packets per interrupt. This can be because the OS does "polling" or otherwise arranges that one interrupt be delivered for a batch of packets to reduce interrupt-handling overhead. If that's the case, the timestamps might be the same for multiple packets, at least to the resolution of the timestamping routine.

Note also that the timestamp on a packet isn't a high-accuracy measurement of when the first bit or the last bit of the packet arrived at the network adapter; there's a delay between the arrival of that last bit and the interrupt for the packet and a delay between the start of interrupt handling and the point in the code path where the timestamp is attached to the packet.

## Resolution

The timestamp has the resolution of whatever clock is being used. The clock might not be the "PC clock" because it might not be running on a "PC", either in the sense of machines sold as "personal computers" or in the sense of "IBM-compatible personal computer". Some of those machines might have better high-resolution timers than IBM-compatible PCs do - at least some OSes on more modern IBM-compatible PC's use the RDTSC instruction, if present on the processor, to get higher-precision timestamps.

There's precision and accuracy; a clock with picosecond resolution, set to a time that's 1 1/2 hours off, is very precise and very inaccurate.

## Discussion

That's the usual discussion about this might be / this could be / this will be / and so on.

Please put some hard facts here ...

Just simply add measurement values (and the hard facts on the environment) on a specific platform so others can participate ...

OS level explanation of timestamps: [Frame Arrival Time drift](https://ask.wireshark.org/question/6330/frame-arrival-time-drift/)

---

Imported from https://wiki.wireshark.org/Timestamps on 2020-08-11 23:26:39 UTC