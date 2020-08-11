# WINS-Replication (WINSRepl)

Multiple WINS servers can replicate the content with the WINS-Replication protocol.

WINS (Windows Internet Name Service) uses the same protocol as [NBNS](/NBNS), but it uses unicast messages to a WINS-Servers, instead of broadcast messages

## History

XXX - add a brief description of WINS-Replication history

## Protocol dependencies

  - [TCP](/TCP): Typically, WINS-Replication uses [TCP](/TCP) as its transport protocol. The well known TCP port for WINS-Replication traffic is 42.

## Example traffic

    No.     Time        Source                Destination           Protocol Info
         30 151.458700  172.31.9.202          172.31.9.201          WINS-Replication WREPL_REPL_INFORM
    
    Frame 30 (154 bytes on wire, 154 bytes captured)
    Ethernet II, Src: Vmware_3b:ec:aa (00:0c:29:3b:ec:aa), Dst: Vmware_15:2c:37 (00:0c:29:15:2c:37)
    Internet Protocol, Src: 172.31.9.202 (172.31.9.202), Dst: 172.31.9.201 (172.31.9.201)
    Transmission Control Protocol, Src Port: 1749 (1749), Dst Port: 42 (42), Seq: 46, Ack: 46, Len: 100
    WINS (Windows Internet Name Service) Replication, WREPL_REPL_INFORM
        Packet Size: 96
        Opcode: 0x00007800
        Assoc_Ctx: 0x05371e90
        Message_Type: WREPL_REPLICATION (3)
        WREPL_REPLICATION, WREPL_REPL_INFORM
            Replication Command: WREPL_REPL_INFORM (0x00000008)
            WREPL_REPL_TABLE_REPLY
                Partner Count: 3
                WINS Owner [0]
                WINS Owner [1]
                WINS Owner [2]
                Initiator: 172.31.9.202 (172.31.9.202)

## Wireshark

The WINS-Replication dissector is fully functional and also supports TCP reassembly.

## Preference Settings

The preferences for WINS-Replication contains a setting to allow reassembly of PDUs spanning multiple segments.

## Example capture file

  - This are 2 windows 2000 servers and samba4 torture tests:

  - 172.31.9.201 = w2k-201

  - 172.31.9.202 = w2k-202

  - 172.31.9.1 = samba4 NBT-WINSREPLICATION torture test

  - 172.31.9.1 = samba4 NBT-WINSREPLICATION torture test

  - 192.168.244.1= samba4 NBT-WINSREPLICATION torture test

  - [SampleCaptures/WINS-Replication-01.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/WINS-Replication-01.cap.gz)

  - [SampleCaptures/WINS-Replication-02.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/WINS-Replication-02.cap.gz)

  - [SampleCaptures/WINS-Replication-03.cap.gz](uploads/__moin_import__/attachments/SampleCaptures/WINS-Replication-03.cap.gz)

## Display Filter

A complete list of WINS-Replication display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/w/winsrepl.html)

Show only the WINS-Replication based traffic:

``` 
 winsrepl
```

## Capture Filter

You cannot directly filter the WINS-Replication protocol while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the WINS-Replication traffic over the default port (42):

``` 
 tcp port 42
```

## External links

  - <http://msdn.microsoft.com/archive/default.asp?url=/archive/en-us/dnarnetbios/html/msdn_winswp.asp> Microsoft Windows NT Server 4.0 WINS: Architecture and Capacity Planning

## Discussion

---

Imported from https://wiki.wireshark.org/WINS-Replication on 2020-08-11 23:27:31 UTC
