# 3Com Switch Reference

3Com calls their port analyzer/monitor feature RAP (*Roving Analysis Port*).

For information on particular switches, see the documentation for the switch. There are links to that documentation from the [3Com Support & Downloads page](http://www.3com.com/products/en_US/downloadsindex.jsp). The relevant documents are usually command references, administration console guides, administration guides, and the like.

## SuperStack II Switch 3300 (10/100MBit manageable switch)

I've tried this with a model 3C16980 with Hardware Version 2 and Software Version 2.72.

The *Analysis Port* is where Wireshark must be connected to, the *Monitor Port* is where the traffic is captured from.

Don't forget to:

  - enable the roving when using the web interface
  - capture in Wireshark promiscuous mode
  - stop roving when you're done

Remarks:

  - You can only monitor the traffic to/from a single port
  - Roving will be stopped and the roving settings will be gone after a switch reset

See CaptureSetup/Ethernet for general information about capturing using monitor mode (or roving analysis as 3Com calls it).

## Discussion

XXX - is it a common limitation to be able only to mirror a single port or is this a limitation of the 3300 switch model? XXX - this is the only switch I've ever seen with this limitation, I think it's just a 3300 series quirk

---

Imported from https://wiki.wireshark.org/SwitchReference/3Com on 2020-08-11 23:26:02 UTC
