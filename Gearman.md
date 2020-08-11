# Gearman

[Gearman](http://gearman.org/index.php) provides a generic application framework to farm out work to other machines or processes that are better suited to do the work. It allows you to do work in parallel, to load balance processing, and to call functions between languages. It can be used in a variety of applications, from high-availability web sites to the transport of database replication events. In other words, it is the nervous system for how distributed processing communicates.

## History

The first implementation of Gearman came from the folks at Danga Interactive ([LiveJournal/SixApart](/LiveJournal/SixApart)). The name is an anagram for “Manager,” since it dispatches jobs to be done, but does not do anything useful itself. This wiki was setup to provide a single place to organize all information related to Gearman. Content is being updated regularly, so please check back often. You may also want to check out other forms of communication if you would like to learn more or get involved\!

It previously operated on port 7003, but this conflicted with the AFS port range and the new port (4730) was assigned by IANA. Communication happens between either a client and job server, or between a worker and job server.

## Protocol dependencies

  - [TCP](/TCP): Typically, Gearman protocol uses [TCP](/TCP) as its transport protocol. The well known TCP port for Gearman traffic is 4730.

## Example traffic

\[REQ\] CAN\_DO(1) LEN=2

  - Magic Code: \\0REQ Packet Type: CAN\_DO (1) Data Length: 2 Data Content: wc
      - Function Name: wc

\[REQ\] GRAB\_JOB(9) LEN=0

  - Magic Code: \\0REQ Packet Type: GRAB\_JOB (9) Data Length: 0

\[RES\] NO\_JOB(10) LEN=0

  - Magic Code: \\0RES Packet Type: NO\_JOB (10) Data Length: 0

\[REQ\] PRE\_SLEEP(4) LEN=0

  - Magic Code: \\0REQ Packet Type: PRE\_SLEEP (4) Data Length: 0

\[REQ\] GRAB\_JOB(9) LEN=0

  - Magic Code: \\0REQ Packet Type: GRAB\_JOB (9) Data Length: 0

\[RES\] JOB\_ASSIGN(11) LEN=984

  - Magic Code: \\0RES Packet Type: JOB\_ASSIGN (11) Data Length: 984 Data Content: H:debian:1
      - Job Handle: H:debian:1 Function Name: wc Function Argument \[truncated\]: SYSTEM...

\[REQ\] WORK\_COMPLETE(13) LEN=14

  - Magic Code: \\0REQ Packet Type: WORK\_COMPLETE (13) Data Length: 14 Data Content: H:debian:1
      - Job Handle: H:debian:1 Function Result: 10\\n

## Wireshark

The Gearman dissector is partially functional. Also will add info of additional Wireshark features where appropriate later, like special statistics of this protocol.

## Example capture file

  - [SampleCaptures/gearman.pcap](uploads/__moin_import__/attachments/SampleCaptures/gearman.pcap)

## Display Filter

A complete list of gearman display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/g/gearman.html)

Show only the gearman based traffic:

``` 
 gearman 
```

## Capture Filter

You cannot directly filter gearman protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the PROTO traffic over the default port (4730):

``` 
 tcp port 4730 
```

## External links

  - [Gearman Protocol](http://gearman.org/index.php?id=protocol)

## Discussion

---

Imported from https://wiki.wireshark.org/Gearman on 2020-08-11 23:14:15 UTC
