# Storage Area Network (SAN)

These are the technologies and protocols used to implement block storage across a network a.k.a Storage Area Networking.

SAN is essentially a network dedicated to be used (often inside a datacentre) to interconnect block storage devices such as disks, tape libraries, raid systems, intelligent disks etc to hosts. In laymans terms one can say that SAN is a dedicated network using special protocols and hardware to attach SCSI disks to hosts across a network.

For an overview about the various SAN protocols used, see the [StorageProtocolFamily](/StorageProtocolFamily) page.

In SAN what is transported between the server (called a Target in SAN-speak) and the clients (called Initiators in SAN-speak) would be SCSI.

SANs are usually implemented using [FibreChannel](/FibreChannel) protocol and switches to act as the interconnect and transport for SCSI but the recent [iSCSI](/iSCSI) protocol together with Gigabit Ethernet is gaining popularity in the industry.

In a SAN, since what is served to the clients are block devices and the SCSI protocol, one can in general NOT share the same data (disks) between multiple clients unless one is using some sort of clustering filesystem.

SAN is the opposite to [NAS](/NAS) where one can share the data between multiple clients and what one serves is files and filesystems.

[San Magazine](http://www.sanmagazine.com/) Did a really good article summing up SAN's

---

Imported from https://wiki.wireshark.org/SAN on 2020-08-11 23:24:25 UTC
