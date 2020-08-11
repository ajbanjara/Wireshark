# StorageProtocolFamily

This page contains links to various protocols used for block storage and backups.

These protocols are often used in Storage Area Networks ([SAN](/SAN)).

## Block Protocols

  - [SCSI](/SCSI): [Small\_Computer\_System\_Interface](/Small_Computer_System_Interface): A protocol normally used to attach devices such as disk drives, scanners, tape drives etc to a computer. Considered being more high-end and superior to [ATA](/ATA). Wireshark supports dissection of [SCSI](/SCSI) over [FibreChannel](/FibreChannel), [iSCSI](/iSCSI), [NDMP](/NDMP) and [HyperSCSI](/HyperSCSI)

  - [ATA](/ATA): [AT Attachment](/AT-Attachment): A protocol used mainly to talk to IDE hard disks on desktop and laptop PCs. Wireshark supports dissection of [ATA](/ATA) over [AOE](/AOE)

## Transports

### Fibre Channel Family

  - [FibreChannel](/FibreChannel): A low-latency interconnect used to connect FC/SCSI devices to hosts in a [FibreChannel](/FibreChannel) [SAN](/SAN). Expensive but provides high performance. --XXX all other fibrechannel protocols we support to be added as well

### IP Storage Family

  - [iSCSI](/iSCSI): A protocol to transport [SCSI](/SCSI) ontop of TCP/IP.

  - [iSNS](/iSNS): [Internet\_Storage\_Name\_Server](/Internet_Storage_Name_Server): A name server (and more) similar to the [FibreChannel](/FibreChannel) name server.

  - [FCIP](/FCIP): [Fibre Channel Over IP](/Fibre-Channel-Over-IP): A protocol to transport [FibreChannel](/FibreChannel) over [IP](/IP).

  - [iFCP](/iFCP): [Internet Fibre Channel Protocol](/Internet-Fibre-Channel-Protocol): Another protocol to transport [FibreChannel](/FibreChannel) over [TCP](/TCP)/[IP](/IP).

  - [NBD](/NBD): [Network Block Device](/Network-Block-Device): A simple block protocol for Linux.

### Ethernet Storage Family

  - [HyperSCSI](/HyperSCSI): A protocol to transport [SCSI](/SCSI) over [Ethernet](/Ethernet).

  - [AOE](/AOE): [ATA\_Over\_Ethernet](/ATA_Over_Ethernet): A protocol to transport [ATA](/ATA) over [Ethernet](/Ethernet).

  - [FCoE](/FCoE): [Fibre\_Channel\_Over\_Ethernet](/Fibre_Channel_Over_Ethernet): A protocol to transport [FibreChannel](/FibreChannel) [SAN](/SAN) traffic over Ethernet. See <http://fcoe.com>.

## Backup protocols

  - [NDMP](/NDMP): [Network\_Data\_Management\_Protocol](/Network_Data_Management_Protocol): A protocol to manage backups over an [IP](/IP) network.

## Discussion

---

Imported from https://wiki.wireshark.org/StorageProtocolFamily on 2020-08-11 23:25:58 UTC
