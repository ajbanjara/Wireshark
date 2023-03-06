# Kerberos

Kerberos is a service that provides mutual authentication between users and services in a network. It is popular both in Unix and Windows (Active Directory) environments.

## History

Initially Kerberos was developed and deployed as part of the Athena project. This version of the Kerberos service and protocol was version 4. While Kerberos v4 still has limited use in AFS environments, it has largely been replaced by Kerberos v5 in all other environments.

There is no official specification for Kerberos v4 but Wireshark does support the "original" version of this protocol. Wireshark also has limited support for some extensions to Kerberos v4 which Transarc introduced for their AFS implementation.

Kerberos 5 is fully standardized and many implementations exist today. The most common implementations are Heimdal Kerberos, MIT Kerberos and Microsofts implementation used in W2K and later.

Kerberos was initially developed as a pure authentication system but is today also used to provide a transport for authorization data as well using extensions such as PKINIT/X.509 and Microsoft PAC structures.

## Protocol dependencies

- [UDP](/UDP) [TCP](/TCP): Originally Kerberos used [UDP](/UDP) as its transport protocol but modern implementations also support [TCP](/TCP) to overcome PDU size limitations in [UDP](/UDP). All modern clients support [TCP](/TCP) but older clients might not.

## Example traffic

## Wireshark

The Kerberos dissector is fully functional and can if compiled and linked with either Heimdal or MIT kerberos libraries decrypt Kerberos tickets given that a keytab file containing the shared secrets is provided. This support is available for Linux/Unix. Windows support for this feature was added in 0.99.3. This feature also provides decryption of several protocols using GSS-API and Kerberos such as [LDAP](/LDAP) and [DCE/RPC](/DCE/RPC).

You can refer to this tutorial: [Decrypt Kerberos/NTLM “encrypted stub data” in Wireshark](https://medium.com/tenable-techblog/decrypt-encrypted-stub-data-in-wireshark-deb132c076e7), or the steps below.

#### How to Create Keytab File

Various utilities can be used to create a keytab file on various OSes.

##### ktutil

Both MIT and Heimdal Kerberos provide a tool called ktutil. It can be used to create a keytab file if you already know the principal's password or Kerberos key.

Example. The following commands create a keytab file for a user in a Windows domain if you know the password. Here the MIT version of ktutil is used.

```
>ktutil
ktutil: addent -password -p username/domain.com@DOMAIN.COM -k <kvno> -e aes256-cts-hmac-sha1-96
ktutil: wkt ./keytab.file
ktutil: quit
```

AES256 is used by default in modern Windows environments. Use `rc4-hmac` for older environments (see the `etype` field to know the exact algorithm used).

##### ktpass.exe

A tool from Windows 2003 support tools, called ktpass.exe, can also create a keytab file. Please note that only the latest version from the Windows 2003 SP1 support tools supports RC4 keys. The below is an sample ktpass.exe command line dialog for exporting a computer account principal (note that resetting the password on a computer account of a machine joined to the domain could be bad - use ktexport.exe instead).

```
C:\temp> ktpass /out quark.keytab /mapuser quark$@FOO.NET /princ cifs/quark.foo.net@FOO.NET /crypto RC4-HMAC-NT /rndpass /ptype KRB5_NT_PRINCIPAL
Targeting domain controller: dc1.foo.net
Using legacy password setting method
Successfully mapped cifs/quark.foo.net to quark$.
WARNING: Account quark$ is not a user account (uacflags=0x1021).
WARNING: Resetting quark$'s password may cause authentication problems if quark$ is being used as a server.

Reset quark$'s password [y/n]?  y
WARNING: pType and account type do not match. This might cause  problems.
Key created.
Output keytab to quark.keytab:
Keytab version: 0x502
keysize 64 cifs/quark.foo.net@FOO.NET ptype 1 (KRB5_NT_PRINCIPAL) vno 3
etype 0x17 (RC4-HMAC) keylength 16 (0xd0fc81746c2bed1da5d505b491634ce5)
```

##### ktexport.exe

The [ktexport](http://www.ioplex.com/utilities/) utility may be used to dump all RC4 keys on a Windows domain controller to a keytab file. This method may be superior to using ktpass.exe because it does not reset passwords. The ktexport package is just a modification of the pwdump2 program from [bindview.com](http://www.bindview.com/Services/razor/Utilities/Windows/pwdump2_readme.cfm). Simply run ktexport.exe on the target domain controller. A sam.keytab file will be generated in the current directory. Unfortunately, aside from the RC4 keys, most of the other data in the keytab is WRONG. However, it turns out that Wireshark doesn't care. So the generated sam.keytab can be used with Wireshark to decrypt Kerberos tickets. Note that the ktexport.exe program will not run over Remote Desktop or similar but see REAME.ktexport for a workaround.

##### NTDSXtract

The [NTDSXtract](http://www.ntdsxtract.com/) framework may be used to dump all Kerberos keys on a Windows Domain Controller to a keytab file. This method does not reset passwords and does not modify anything on Domain Controller. Unfortunately, aside from the Kerberos keys, most of the other data in the keytab is WRONG. However, it turns out that Wireshark doesn't care. See release notes in [NTDSXtract](http://www.ntdsxtract.com/) distribution for further details.

To dump Kerberos keys follow the steps:

- Extract **SYSTEM** and **NTDS.DIT** files from Domain Controller
  - SYSTEM
  - is a registry hive file. You may find it at c:\\Windows\\System32\\config\\SYSTEM
  - NTDS.DIT
  - is the Active Directory database. You may find it at c:\\windows\\NTDS\\ntds.dit.
- Unfortunately you cannot simply copy these files on a running Domain Controller as both files are opened all the time the machine is running. There are a number of ways to obtain them.
- Copy the files from hard disk image when the machine is shut down. This approach is especially handy if the domain controller is running in a Virtual Machine. This approach is preferred since in guaranties that the database was properly closed.
- Since Windows Server 2008 you may use ntdsutil to obtain the required files. In Windows Server 2003 and Windows Server 2003 R2 ntdsutil is available but it lacks snapshot command. Execute the following commands in elevated Command Prompt on Domain Controller:
  - <span dir="">`PS C:\\\\Users\\\\Administrator> ntdsutil C:\\\\Windows\\\\system32\\\\ntdsutil.exe: snapshot snapshot: activate instance ntds Active instance set to "ntds". snapshot: create Creating snapshot... Snapshot set {6033cdae-a36c-41b6-9640-4c3283a28d1a} generated successfully. snapshot: mount {6033cdae-a36c-41b6-9640-4c3283a28d1a} Snapshot {ecb2b4ff-0ac3-4353-b73f-95300958f28d} mounted as C:\\\\$SNAP_201311021611_VOLUMEC$\\\\`</span>
  - Open another elevated Command Prompt and execute the following commands:

    ```
    PS C:\Users\Administrator> copy 'C:\$SNAP_201311021611_VOLUMEC$\WINDOWS\NTDS\NTDS.dit' c:\temp\
    PS C:\Users\Administrator> copy 'C:\$SNAP_201311021611_VOLUMEC$\Windows\System32\config\SYSTEM' c:\temp\
    ```
  - Go back to the first Command Prompt to unmount the snapshot and quit ntdsutil.

    ```
    snapshot: unmount {6033cdae-a36c-41b6-9640-4c3283a28d1a}
    Snapshot {ecb2b4ff-0ac3-4353-b73f-95300958f28d} unmounted.
    snapshot: delete {6033cdae-a36c-41b6-9640-4c3283a28d1a}
    Snapshot {ecb2b4ff-0ac3-4353-b73f-95300958f28d} deleted.
    snapshot: quit
    C:\Windows\system32\ntdsutil.exe: quit
    PS C:\Users\Administrator>
    ```
  - Grab SYSTEM and NTDS.dit files in the c:\\temp directory.
- Use FTK Imager or other forensics tools
- As the last resort you may use vssadmin to create a Volume Shadow Copy. This approach does not guaranty the integrity of the extracted database. That is you may get corrupted database as result. On the practice, however, this approach usually works fine. Also it is not clear when the changes you made to Active Directory will be committed to hard disk. Anyway this how to use vssadmin utility.
  - Execute the following commands in the elevated Command Prompt. Note, you need cmd.exe, not PowerShell, as PowerShell's copy command does not accept \\\\?\\GLOBALROOT\\Device\\ paths.

    ```
    C:\Documents and Settings\Administrator>vssadmin.exe create shadow /for=c:
    vssadmin 1.1 - Volume Shadow Copy Service administrative command-line tool
    (C) Copyright 2001 Microsoft Corp.

    Successfully created shadow copy for 'c:\'
        Shadow Copy ID: {10b7290a-acdb-4bc0-9465-0ac881a8928b}
        Shadow Copy Volume Name: \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1

    C:\Documents and Settings\Administrator>copy /Y \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\windows\NTDS\ntds.dit c:\temp
            1 file(s) copied.

    C:\Documents and Settings\Administrator>copy /Y \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\System32\config\SYSTEM c:\temp
            1 file(s) copied.

    C:\Documents and Settings\Administrator>vssadmin delete shadows /shadow={10b7290a-acdb-4bc0-9465-0ac881a8928b}
    vssadmin 1.1 - Volume Shadow Copy Service administrative command-line tool
    (C) Copyright 2001 Microsoft Corp.

    Do you really want to delete 1 shadow copies (Y/N): [N]? y

    Successfully deleted 1 shadow copies.

    C:\Documents and Settings\Administrator>
    ```
  - Grab SYSTEM and NTDS.dit files in the c:\\temp directory.
- Process **NTDS.DIT** with esedbexport tool to export all Active Directory database tables

  esedbexport tool is part of [libesedb](http://code.google.com/p/libesedb/) library. You need to download and compile it.

  Use the following command to process **NTDS.DIT**:

  ```
  PS F:\temp> esedbexport.exe .\ntds.dit
  esedbexport 20120102

  Opening file.
  Exporting table 1 (MSysObjects) out of 12.
  Exporting table 2 (MSysObjectsShadow) out of 12.
  Exporting table 3 (MSysUnicodeFixupVer2) out of 12.
  Exporting table 4 (datatable) out of 12.
  Exporting table 5 (hiddentable) out of 12.
  Exporting table 6 (link_table) out of 12.
  Exporting table 7 (sdpropcounttable) out of 12.
  Exporting table 8 (sdproptable) out of 12.
  Exporting table 9 (sd_table) out of 12.
  Exporting table 10 (MSysDefrag2) out of 12.
  Exporting table 11 (quota_table) out of 12.
  Exporting table 12 (quota_rebuild_progress_table) out of 12.
  Export completed.
  PS F:\temp>
  ```

  You may use any machine to run this command, not necessary the domain controller.
  - After the command completes, you'll find ntds.dit.export subdirectory in the current directory with the following content:
  - <span dir="">`PS F:\\\\temp> ls -name .\\\\ntds.dit.export datatable.3 hiddentable.4 link_table.5 MSysDefrag2.9 MSysObjects.0 MSysObjectsShadow.1 MSysUnicodeFixupVer2.2 quota_rebuild_progress_table.11 quota_table.10 sdpropcounttable.6 sdproptable.7 sd_table.8 PS F:\\\\temp>`</span>
  - Note, content of the directory may be different, depending on Active Directory database version.
- Dump Kerberos keys with [NTDSXtract](http://www.ntdsxtract.com/)
  - Install [Python](http://www.python.org/) 2. (At the time of writing, NTDSXtract was not compatible with Python 3.)
  - Install [PyCrypto](https://www.dlitz.net/software/pycrypto/)
  - Here are [Prebuilt Python Binaries for Windows](http://www.voidspace.org.uk/python/modules.shtml#pycrypto)
  - Download [NTDSXtract](http://www.ntdsxtract.com/) framework version 1.2.
  - Execute the following command:

    ```
    PS F:\temp\ntds.dit.export> c:\Python27\python.exe f:\temp\ntdsxtract_v1_2_beta\dskeytab.py .\datatable.3 .\link_table.5 ..\system f:\temp\wd f:\temp\wd\ad.keytab

    The directory (f:\temp\wd) specified does not exists!
    Would you like to create it? [Y/N]y
    y

    [+] Initialising engine...
    [+] Loading saved map files (Stage 1)...
    [!] Warning: Opening saved maps failed: [Errno 2] No such file or directory: 'f:\\temp\\wd\\offlid.map'
    [+] Rebuilding maps...
    [+] Scanning database - 100% -> 3529 records processed
    [+] Searching for Schema object - 100% -> 1575 records processed
    [+] Extracting schema information - 100% -> 1549 records processed
    [+] Loading saved map files (Stage 2)...
    [!] Warning: Opening saved maps failed: [Errno 2] No such file or directory: 'f:\\temp\\wd\\links.map'
    [+] Rebuilding maps...
    [+] Extracting object links...
    Processing principal Administrator.
    Using NT hash.
    Processing principal Guest.
    No information about kerberos keys.
    Processing principal WIN2008X64R2S1$.
    Using supplemental credentials.
    Processing principal krbtgt.
    Using supplemental credentials.
    Processing principal WIN2008X64R2S4$.
    Using supplemental credentials.
    Processing principal WIN2003R2S1$.
    Using supplemental credentials.
    Processing principal WIN2003R2S2$.
    Using supplemental credentials.
    Processing principal user1.
    Using supplemental credentials.
    Processing principal WINXP1$.
    Using supplemental credentials.
    PS F:\temp\ntds.dit.export>
    ```
  - As you may have noticed, the output keytab file is specified as the last parameter to the command. This this the file you need to pass to Wireshark.

## Specifying the keytab file to use

You can specify the filename of the keytab file to use in the KRB5 preferences (main menu, Edit menu, Preferences menu item, in the left tree of Preferences dialog expand Protocols, select KRB5 protocol, on the right panel specify Kerberos keytab file). You can also specify the keytab file(s) to load on the command line using the -K option. You can use this option multiple times to load multiple keytab files.



<details>
<summary>
Limitations in older version of Wireshark (< 1.10.3):
</summary>

There was a bug in the Windows version around 1.10.3. It is now fixed. For reference, you could only specify a filename and not a full path. This meant that you had to store the keytab file in the same directory as where your capture file was stored (which becomes the current working directory for wireshark) and then you specify just the keytab filename without the path.

Similarly, only 32-bit Windows version of Wireshark could decrypt Kerberos traffic around version 1.10.3. It is now fixed. For reference, 64-bit Windows version was compiled without Kerberos support. Open Wireshark About Dialog. In 64-bit version you could see see "Compiled (64-bit) ... without Kerberos ...".
</details>

## Preference Settings

## Example capture file

[SampleCaptures/krb-816.zip](uploads/__moin_import__/attachments/SampleCaptures/krb-816.zip) Zip archive containing Kerberos traffic capture and keytab file.

[SampleCaptures/kerberos-Delegation.zip](uploads/__moin_import__/attachments/SampleCaptures/kerberos-Delegation.zip) An example of Kerberos Delegation in Windows Active Directory. Keytab file is also included. Please use Wireshark 0.10.14 SVN 17272 or above to open the trace.

[SampleCaptures/constained-delegation.zip](uploads/__moin_import__/attachments/SampleCaptures/constained-delegation.zip) An example of Kerberos constrained delegation (s4U2Proxy) in Windows 2003 domain.

## Display Filter

A complete list of Kerberos display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/k/kerberos.html)

Show only the Kerberos v5 traffic:

```
 kerberos
```

Show only the Kerberos v4 traffic:

```
 kerberos4
```

## Capture Filter

You cannot directly filter Kerberos protocols while capturing. However, if you know the port used (see above), you can filter on that one.

Capture Kerberos traffic over the default UDP port (88):

```
 udp port 88
```

Capture Kerberos traffic over the default TCP port (88):

```
 tcp port 88
```

## External links

- [Wikipedia article on Kerberos](http://en.wikipedia.org/wiki/Kerberos\_%28protocol%29)
- [Kerberos](http://www.xml-dev.com/blog/?action=viewtopic&id=21) A visual description of Kerberos
- [RFC 4120](http://www.ietf.org/rfc/rfc4120.txt) _The Kerberos Network Authentication Service (V5)_
- [RFC 3961](http://www.ietf.org/rfc/rfc3961.txt) _Encryption and Checksum Specifications for Kerberos 5_
- [RFC 3962](http://www.ietf.org/rfc/rfc3962.txt) _Advanced Encryption Standard (AES) Encryption for Kerberos_
- [draft-ietf-krb-wg-kerberos-clarifications](http://ietfreport.isoc.org/idref/draft-ietf-krb-wg-kerberos-clarifications/) _RFC 1510 Clarifications_

Obsolete:

- [RFC 1510](http://www.ietf.org/rfc/rfc1510.txt) _The Kerberos Network Authentication Service (V5)_

## Discussion

---

Imported from https://wiki.wireshark.org/Kerberos on 2020-08-11 23:15:46 UTC