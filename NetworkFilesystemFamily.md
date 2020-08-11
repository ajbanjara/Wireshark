# Network Filesystem Family

This page contains links to various protocol families used for network filesystems, i.e. [NAS](/NAS) (Network Attached Storage) protocols.

## NFS Family

The standard network filesystem for Unix. [ONC-RPC](/ONC-RPC) is the [RPC](/RPC) mechanism on top of which [NFS](/NFS) is implemented.

### Core NFS Protocols

  - [NFS](/NFS): [Network\_File\_System](/Network_File_System): The standard network filesystem for Unix.

  - [KLM](/KLM): [Kernel\_Lock\_Manager](/Kernel_Lock_Manager) The protocol used on NFS servers and clients to communicate lock information between the NFS client in the kernel and the [NLM](/NLM) user space lock manager daemon (local loopback only).

### NFS version 2 and 3 Helper Protocols

NFS version 4 included these services.

  - [MOUNT](/MOUNT): The protocol used to mount a network filesystem.

  - [NSM](/NSM): [Network\_Status\_Monitoring\_Protocol](/Network_Status_Monitoring_Protocol) The protocol used to detect client/server reboots and to indicate when state should be resynchronized.

  - [NLM](/NLM): [Network\_Lock\_Manager](/Network_Lock_Manager) The protocol used to implement the Unix semantics advisory file locking. Very fragile protocol.

### Extra NFS Support Protocols

While these protocols are not required in order to run [NFS](/NFS) they often are implemented and add additional functionality to [NFS](/NFS) shares.  

  - [NFS-AUTH](/NFS-AUTH): A less than popular protocol used to offer user authentication to [NFS](/NFS). Was made obsolete by [SecureNFS](/SecureNFS).

  - [NFS-ACL](/NFS-ACL): A protocol used to add [ACL](/ACL)s to NFS version 2 and 3.

  - [RQUOTA](/RQUOTA): [Remote\_Quota\_Protocol](/Remote_Quota_Protocol) A protocol to report quota usage across the network.

## AFS Family

These protocols are used by the Andrew File System service that was a very sophisticated network filesystem for its time and still have many features much more advanced than anything [NFS](/NFS) has ever been able to offer.

  - [RX](/RX): The [RPC](/RPC) mehanism used by [AFS](/AFS).

  - [AFS](/AFS): [Andrew File System](/Andrew-File-System): A network filesystem that was very advanced for its time.

XXX add the remaining ones

## DCE/DFS

  - [DCE/RPC](/DCE/RPC): The [RPC](/RPC) mechanism used by [DCE/DFS](/DCE/DFS).

  - [BUTC](/BUTC): [BackUp\_Tape\_Coordinator](/BackUp_Tape_Coordinator): The protocol used by [DCE/DFS](/DCE/DFS) to manage backup operations to remote tape drives.

XXX add the remaining ones

## CIFS (SMB) Family

The standard network filesystem for MS Windows. The Server Message Block protocol, now called the Common Internet File System (CIFS) protocol, is a set of protocols originally developed by Microsoft, IBM, and Intel for remote file access.

### CIFS Prerequisites

  - [MS-RAP](/MS-RAP): An older type of [RPC](/RPC) mechanism used on older versions of Windows.

  - [DCE/RPC](/DCE/RPC): The [RPC](/RPC) mechanism used in the SMB server in all NT-based versions of Windows and in the Windows SMB client since Windows NT (3.x or 4.0?) and Windows 95.

### Core CIFS Protocols

  - [SMB](/SMB): [Server\_Message\_Block](/Server_Message_Block) The core protocol used for actual file sharing.

  - [SMB2](/SMB2): [Server\_Message\_Block\_version\_2](/Server_Message_Block_version_2) The new version of SMB.

  - [ATSVC](/ATSVC): The AT scheduler service on CIFS hosts.

  - [DSSETUP](/DSSETUP): Active Directory Services Setup

  - [INITSHUTDOWN](/INITSHUTDOWN) Protocol to remotely shutdown a cifs host.

  - [LSA](/LSA)

  - [NETLOGON](/NETLOGON)

  - [SAMR](/SAMR)

  - [SRVSVC](/SRVSVC)

  - [WKSSVC](/WKSSVC)

  - [WINREG](/WINREG): Windows remote registry service.

  - [Mailslot](/Mailslot):

  - [Pipe](/Pipe)

  - [BrowserProtocol](/BrowserProtocol)

XXX add the remaining ones

### Additional protocols required for CIFS Active Directory

XXX add them here

## Discussion

---

Imported from https://wiki.wireshark.org/NetworkFilesystemFamily on 2020-08-11 23:17:17 UTC
