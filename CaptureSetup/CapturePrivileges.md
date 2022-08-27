# Platform-Specific information about capture privileges

You need to run Wireshark or TShark on an account with sufficient privileges to capture, or need to give the account on which you're running Wireshark or TShark sufficient privileges to capture. The way this is done differs from operating system to operating system.

To be secure (at least in a way), it is recommended that even an administrator should always run in an account with (limited) user privileges, and only start processes that **really** need the administrator privileges. The [Security](/Security) page provides explanations why this is a good idea.

[[_TOC_]] <span id="vm" class="anchor"></span>

## Virtual machine

If you are running inside a virtual machine, make sure the host allows you to put the interface into promiscous mode.

  - [VirtualPC](http://blogs.technet.com/b/windows_vpc/archive/2009/12/07/networking-in-windows-virtual-pc.aspx)

  - [VMWare](http://www.petri.co.il/using-packet-analyzer-on-virtual-network.htm)

## Windows

The [WinPcap](/WinPcap) driver (called NPF) is loaded by Wireshark when it starts to capture live data. This requires administrator privileges. Once the driver is loaded, every local user can capture from it until it's stopped again.

Note: Simply stopping Wireshark won't stop the [WinPcap](/WinPcap) driver\!

It might not be desirable that any local user can also capture from the network while the driver is loaded, but this can't be currently circumvented. Please note that this is not a limitation of the Wireshark implementation, but of the underlying [WinPcap](/WinPcap) driver; see [this note in the WinPcap FAQ](http://www.winpcap.org/misc/faq.htm#Q-7).

There are three possible solutions to start Wireshark with the privilege to capture:

**Start Wireshark as Administrator**

Advantage: Very easy to work with.

Disadvantage: It's very unsecure running Wireshark this way as every possible Wireshark exploit will be running with the administrator account being able to compromise the whole system.

**Start the NPF driver automatically at system start**

The easiest way to do this is to select *Start [WinPcap](/WinPcap) service "NPF" at startup* in the Wireshark installer. You can change the start settings of the NPF service to "automatic" or "system" at any time using the following methods:

  - **From the Device Manager** you can select *View-\>Show hidden devices*, then open *Non-Plug and Play Drivers* and right click on *NetGroup Packet Filter Driver*. In the driver properties you can set the startup type as well as start and stop the driver manually.

  - **From the command line** you can run
    
    ``` 
        sc config npf start= auto
    ```
    
    (This must be run as Administrator under Vista.)

  - **In the registry** you can change HKEY\_LOCAL\_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\NPF\\Start from 0x3 (SERVICE\_DEMAND\_START) to 0x2 (SERVICE\_AUTO\_START) or 0x1 (SERVICE\_SYSTEM\_START).

As the driver is already started you can run Wireshark as user all the time.

Advantage: Very easy to work with.

Disadvantage: *Every* local user can *always* capture live data.

**Start the NPF driver by hand**

You can start the driver by hand before starting Wireshark and stop it afterwards.

Using Wireshark running in a user account could look like:

Start the NPF driver:

`runas /u:administrator "net start npf"`

Start Wireshark as a user and work with it, including capturing, until the specific job is finished.

Stop the NPF driver again:

`runas /u:administrator "net stop npf"`

This can obviously be automated using a batch file.

Advantage: Most secure solution.

Disadvantage: You'll have to enter the password each time you start/stop Wireshark.

## Most UNIXes

Wireshark has implemented [Privilege Separation](/Development/PrivilegeSeparation) which means that the Wireshark GUI (or the tshark CLI) can run as a normal user while the dumpcap capture utility runs as root. This can be achieved by installing dumpcap setuid root. The advantage of this solution is that while dumpcap is run as root the vast majority of Wireshark's code is run as a normal user (where it can do much less damage).

## GNU/Linux distributions, Wireshark is installed using a package manager

GNU/Linux distributions usually provide package managers which handle installation, configuration and removal of software packages. Wireshark is provided by several distributions and some of them help in configuring dumpcap to allow capturing even for non-root users.

### Debian, Ubuntu and other Debian derivatives

By installing Wireshark packages non-root users won't gain rights automatically to capture packets. To allow non-root users to capture packets follow the procedure described in the Wireshark 
[packaging/debian/README.Debian](https://gitlab.com/wireshark/wireshark/-/raw/master/packaging/debian/README.Debian).

## Other Linux based systems or other installation methods

Other Linux distributions may require that you give dumpcap sufficient privileges by hand.

### Setting network privileges for dumpcap if your kernel and file system support file capabilities

1.  Ensure that you have installed the necessary tools, such as the setcap command.

2.  `sudo setcap cap_net_raw,cap_net_admin+eip /usr/sbin/dumpcap` (NOTE: Replace `/usr/sbin` with `/usr/bin` in case you receive an error that indicates that dumpcap isn't in `/usr/sbin`)

3.  Start Wireshark as non-root and ensure you see the list of interfaces and can do live capture.

### Setting network privileges for dumpcap if your kernel and file system don't support file capabilities

In this case, you will need to make dumpcap set-UID to root.

1.  `chown root /usr/sbin/dumpcap` (NOTE: Replace `/usr/sbin` with `/usr/bin` in this command and the next command in case you receive an error that indicates that dumpcap isn't in `/usr/sbin`)

2.  `chmod u+s /usr/sbin/dumpcap`

### Limiting capture permission to only one group

Before setting dumpcap's network privileges (for example, using the *file capabilities* approach above):

1.  Create group "wireshark" and add yourself to it:
    
        sudo groupadd -s wireshark
        sudo gpasswd -a $USER wireshark

2.  Re-login to apply the group changes or use `newgrp wireshark` as the normal user to enter the *wireshark* group. (Run the `groups` command to verify that you are part of the *wireshark* group.)

3.  `sudo chgrp wireshark /usr/sbin/dumpcap`

4.  `sudo chmod o-rx /usr/sbin/dumpcap`

5.  (Changing the group will clear file capabilities (or setuid bits), so reset it using *setcap* as described above.)

6.  Ensure Wireshark works only from a user in the "wireshark" group

## BSD (including macOS)

In order to capture packets, you must have read access to the BPF devices in /dev/bpf\*.

On BSDs without a devfs, the special files for those devices are on your root file system, and changes to them will persist across reboots. In order to allow yourself, or yourself and others, to capture traffic without running Wireshark as root, either make them owned by you, or make them owned by a group to which you and others to whom you want to give capture permission belong and give that group read access, or, if your BSD supports ACLs on special files, add the users who should have permission to capture to the ACL, with the ACL entry giving them read permission. You will probably need super-user permission to do this.

On BSDs with a devfs (this includes macOS), this might involve more than just having somebody with super-user access setting the ownership and/or permissions on the BPF devices - it might involve configuring devfs to set the ownership or permissions every time the system is booted, if the system supports that; FreeBSD 5.x's devfs does. If the system doesn't support that - macOS's devfs doesn't, you might have to find some other way to make that happen at boot time, such as a command in one of the system rc files, or a startup item or launchd launch daemon in macOS; see the ChmodBPF directory in libpcap 0.9.1 or later for such a launch daemon.

## Digital/Tru64 UNIX

Any user can, in principle, capture network traffic. However, no user (not even the super-user) can capture in promiscuous mode on an interface unless the super-user has enabled promiscuous-mode operation on that interface using pfconfig(8), and no user (not even the super-user) can capture unicast traffic received by or sent by the machine on an interface unless the super-user has enabled copy-all-mode operation on that interface using pfconfig, so useful packet capture on an interface probably requires that either promiscuous-mode or copy-all-mode operation, or both modes of operation, be enabled on that interface. You might be able to limit the set of users allowed to capture traffic by changing the ownership and/or permissions of the /dev/pfilt\* devices.

---

Imported from https://wiki.wireshark.org/CaptureSetup/CapturePrivileges on 2020-08-11 23:11:50 UTC
