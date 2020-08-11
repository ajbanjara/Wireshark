# STANAG 5066 Subnetwork Interface Sublayer (S5066\_SIS)

STANAG 5066 (Profile for High Frequency (HF) Radio Data Communication) is a NATO protocol stack definition operated over HF modem/radio equipment. S5066 provides standard clients over SIS(Subnetwork Interface Sublayer) and an IP mapping/adaptation sublayer in order to make use of conventional IP applications over HF radio band in a transparent way.

For a detailed description see: <http://s5066.nc3a.nato.int/S5066Public/STANAG5066.php>

## Protocol dependencies

  - [TCP](/TCP): Typically, S5066\_SIS uses [TCP](/TCP) as its transport protocol. The well known TCP port for S5066 traffic is 5066.

## Wireshark

The S5066\_SIS dissector is fully functional.

## Example capture file

  - [SampleCaptures/S5066-HFChat-1.pcap](uploads/__moin_import__/attachments/SampleCaptures/S5066-HFChat-1.pcap)

  - [SampleCaptures/S5066-HFChat-Rejected.pcap](uploads/__moin_import__/attachments/SampleCaptures/S5066-HFChat-Rejected.pcap)

  - [SampleCaptures/S5066-Expedited.pcap](uploads/__moin_import__/attachments/SampleCaptures/S5066-Expedited.pcap)

## Display Filter

A complete list of PROTO display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/s/s5066.html)

Show only the PROTO based traffic:

``` 
 s5066 
```

## Capture Filter

You cannot directly filter S5066\_SIS protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the S5066\_SIS traffic over the default port (5066):

``` 
 tcp port 5066 
```

## External links

  - [STANAG 5066](http://s5066.nc3a.nato.int/S5066Public/STANAG5066.php)

---

Imported from https://wiki.wireshark.org/STANAG_5066_SIS on 2020-08-11 23:25:56 UTC
