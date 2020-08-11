# Capturing from NfLog interface

Wireshark can capture from the nflog linux interface. Basically iptables is told to steer the traffic to a user-accessible queue that wireshark reads from. This is very useful and performing since the steering is done by the kernel as well as the filtering. Moreover, once the steering is configured (with high privileges) the capture can be done from unprivileged users.

The commands to steer all the traffic of the current machine (inbound and outbound) are

    # iptables -A OUTPUT -j NFLOG
    # iptables -A INPUT -j NFLOG

Then capture with wireshark as usual.

---

Imported from https://wiki.wireshark.org/dario/nflog-traffic on 2020-08-11 23:12:30 UTC
