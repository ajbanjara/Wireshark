# Wireshark on mobile devices

There has been some interest in bringing Wireshark to mobile devices. This page tries to give the state by operating system.

**Note:** This page tries to list existing (and formerly existing) solutions. Unless otherwise noted the entries are not based on first hand experience, so whether any of the packages work remains to be seen.

## Android

While there are some traffic capturing/displaying apps available for Android, there is no Wireshark port. Part of this is that (many/most/all?) apps for Android are written in Java.

## iOS

Currently no port to iOS exists. Although there has been some interest to create a native GUI for Wireshark on iOS, the current policy of Apple to [not allow](http://www.fsf.org/news/2010-05-app-store-compliance/) GPLed software into their App Store would severely reduce the users willing to install it via other means. In addition, iOS requires root access to open BPF devices, and an App Store would neither be able to run with root privileges nor install a launchd LaunchDaemon to run at startup time making the BPF devices accessible to the "mobile" user; an iOS port of Wireshark would be able to capture traffic only on jailbroken machines.

## Maemo

There is an outdated version of Wireshark using GTK+ available at [maemo.org](http://maemo.org/packages/view/wireshark/).

---

Imported from https://wiki.wireshark.org/MobileDevices on 2020-08-11 23:16:49 UTC
