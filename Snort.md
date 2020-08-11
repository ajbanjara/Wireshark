# Snort (post-dissector)

The Snort post-dissector can show which packets from a pcap file match snort alerts, and where content or pcre fields match within the payload.

It does this by parsing the rules from the snort config, then running each packet from a pcap file (or pcapng if snort is build with a recent version of libpcap) through Snort and recording the alerts emitted. There is also support for reading alerts that have been written to packet comments in the format used by [TraceWrangler](/TraceWrangler) (see [this blog post](https://blog.packet-foo.com/2015/08/verifying-iocs-with-snort-and-tracewrangler)).

## History

The post-dissector began as a 2011 Google Summer of Code project - see <https://honeynet.org/node/790>

This [presentation](https://sharkfesteurope.wireshark.org/assets/presentations16eu/14.pptx), from Sharkfest EU 2016, discusses the post-dissector, and how it may be used. Some portions of it are now out of date.

## Protocol dependencies

Snort rules often specify that they should only match over [TCP](/TCP), [UDP](/UDP) or [ICMP](/ICMP).

## Wireshark

The Snort dissector is functional, and has been tested with various versions of Snort 2.9.x.y. It has been tested under linux (where it works, but may need to be run as root). It does not currently work under Windows (see note in Discussion section below). The author has not tried running it on a Mac.

## Preference Settings

  - Source of Snort alerts. Defaults to "From Nowhere". Also available are "From running Snort", and "From User Comments" (as written by [TraceWrangler](/TraceWrangler)).

  - The name of the Snort binary file to run. This includes the path, and defaults to usual Unix or Windows default.

  - Configuration filename. The path and configuration file loaded by Snort using the -c option. Defaults to usual platform defaults. Filename is usually snort.conf

  - Show rule stats in protocol tree. When enabled, will show as generated fields stats for rules and alerts found inside any Snort subtrees. Default FALSE.

  - Show alerts in expert info. Default FALSE.

  - Try to show alerts in reassembled frames. Rather than showing the alert in the frame where it was detected, if it was a TCP segment that is later reassembled into an upper-level PDU, show the alert in that frame instead. Default FALSE.

## Example capture file

Capture files will only result in Snort alerts if the configuration and rules will result in alert signatures matching the packets.

However, if the freely available Emerging-threats or Talos rules are used, there are some capture files that result in alerts being detected.

TODO: find examples from Laura's lab kit and wiki captures that result in interesting alerts.

It is also possible to create artificial alerts from configuration and rules - this was done using rule2alert.py. TODO: give links to example capture files created from free rule sets.

## Display Filter

A complete list of Snort display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/s/snort.html)

Show only the Snort based traffic:

``` 
 snort 
```

## Capture Filter

You cannot directly filter for the Snort protocol while capturing. However, if a simple configuration and set of rules are being used, it may be possible to limit by IP ranges (e.g. matching $HOME\_NET), transport protocol or port numbers.

## External links

  - The snort project is [here](https://www.snort.org/)

  - For generating capture files from rules, [rule2alert](https://github.com/pevma/rule2alert) may be useful. While testing with a recent snapshot of standard rules, a couple of simple patches were needed.

  - This [video](https://www.youtube.com/watch?v=AQRrrnFwhZM) demonstrates using the Snort post-dissector, and discusses how it might be used as part of an investigation.

## Discussion

The post-dissector is useful as it is, but some limitations are:

  - Does not currently run under Windows. The problem seen was a failure to launch Snort using g\_spawn\_async\_with\_pipes(). Any suggestions on how to fix this would be welcome.
  - Have not tried to using while live capturing, but probably not a good idea, and should assume it doesn't work
  - Not tested with Snort 3, and have not tried to support Suricata. Note that even if alerts are detected using other tools, if e.g. the Emerging Threats rules were used it should be possible to run the same set of rules using Snort.

---

Imported from https://wiki.wireshark.org/Snort on 2020-08-11 23:25:47 UTC
