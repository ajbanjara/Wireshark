# Wireshark Portable

## Introduction

You can now install Wireshark onto a [PortableApps](http://www.portableapps.com/) enabled device that will allow you to run Wireshark on any Windows XP & 2000 machine that you plug the device into. There is no need to run the normal Wireshark installation package, Wireshark will be ready to run as soon as the machine recognises the device.

Portable`  `Apps provides a USB flash drive with a mechanism for launching applications directly from the drive. There is no need to run a specific installation program. When you remove the drive, not trace of the applications are left on the machine.

![WiresharkPortable.gif](uploads/__moin_import__/attachments/WiresharkPortable/WiresharkPortable.gif
"WiresharkPortable.gif")

As well as the Wireshark application, all of your Wireshark preferences will be stored on the USB flash drive. So that whichever machine you run Wireshark on your will always get your own preferences. This happens even when a Wireshark has been conventionally installed on the machine.

## PortableApps Package

You can build an experimental version of Wireshark`  `Portable from the latest version of the [Wireshark sources](http://www.wireshark.org/download.html).

The packaging uses the same "Nullsoft Install System" (NSIS) that is used by the standards Wireshark windows installer. However, an additional plug-in for NSIS is required for the Wireshark`  `Portable packaging. This plug-in, FindProcDLL, can be downloaded from <http://nsis.sourceforge.net/Find_Process_By_Name> and is required to ensure that only one copy of Wireshark is running.

Use the *packaging\_papps* target in the top-level Wireshark directory.

    % nmake -f makefile.nmake packaging_papps

This will result in a single file called **wireshark-\<version\>.paf.exe** in the directory **packaging/portableapps/win32** .

The [Ultimate Packer for eXecutables](http://upx.sourceforge.net/) can optionally be used to reduce the size of the package that is installed on the USB flash drive - see config.nmake.

## Installing PortableWireshark

To install the package, choose the 'Options/Install New App' option from the main Portable`  `Apps menu and select the file 'wireshark-\<version\>.paf.exe'. The will result in a short Wizard that will install the package on your USB flash device and result in a new menu item being added to the main Portable`  `Apps menu.

![WiresharkPortableInstall.gif](uploads/__moin_import__/attachments/WiresharkPortable/WiresharkPortableInstall.gif
"WiresharkPortableInstall.gif")

## Ini File Settings

The Wireshark Portable Launcher will look for an ini-file called WiresharkPortable.ini within its directory. It is only necessary to have a ini-file if you wish to change the default configuration. There is an example ini-file included within the package that you can move to the correct location. The ini-file is formatted as follows:

    [WiresharkPortable]
    WiresharkDirectory=App/Wireshark 
    WiresharkExecutable=wireshark.exe
    AdditionalParameters=
    DisableWinPcapInstall=false
    WinPcapInstaller=WinPcap_4_1_beta5.exe

The Wireshark`  `Directory entry should be set to the directory **relative** to the directory containing the Wireshark Portable Launcher (WiresharkPortable.exe) which contains the Wireshark binaries and libraries. This entry must be present and the default is `App/Wireshark`.

The Wireshark`  `Executable entry allows you to specify the Wireshark Portable Launcher to use an alternate EXE call to launch Wireshark. The default is `wireshark.exe`.

The Additional`  `Parameters entry allows you to pass additional commandline parameter entries to wireshark.exe.

The Disable`  `Win`  `Pcap`  `Install allows you to disable the automatic installation of [WinPcap](/WinPcap) when it is not present on the host system. The default is `false`.

The Win`  `Pcap`  `Installer allows you to specify a different [WinPcap](/WinPcap) installer than the default one included in the distribution. For example, if you wish to download a later version of [WinPcap](/WinPcap) and have that installed instead. For the release 1.0 of Wireshark this was `WinPcap_4_0_2.exe`, currently the default is `WinPcap_4_1_beta5.exe`.

## Known Issues

If Win`  `Pcap is not installed on the machine, Wireshark`  `Portable will install it when and starts, and remove it when it exits. This can become tedious if Wireshark`  `Portable is started many times.

---

Imported from https://wiki.wireshark.org/WiresharkPortable on 2020-08-11 23:27:36 UTC
