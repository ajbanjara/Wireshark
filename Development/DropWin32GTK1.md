***
:warning:
This page is historical. After a discussion at Sharkfest'08 the development team decided to drop GTK1 support after the Wireshark 1.0 release. At the time of this writing, only the old stable release of Wireshark (1.0.x) supports GTK1 and GTK2. The 1.2 release, and all later releases, only support GTK2.
***

# Drop Win32 Wireshark support for GTK1.x

It would be desirable to drop the support for GTK 1.x completely, as this puts a lot of double effort in implementing and debugging new GUI features.

However, there's a main difference between Win32 and Unix based installation. The Win32 installer comes together with the GTK libraries so we can switch to a new GTK version without much problems. On Unix, GTK libraries that are already installed on the system are used so Wireshark has to deal with "what is there".

As a lot of Unix based installation running Wireshark might be pretty old and therefore don't support (or just don't have installed) GTK2.x at all, and we don't want to force users to upgrade their libs, we cannot drop GTK1.x support completely.

## GTK2.x status

As the GTK2 version has reached stability now, we might want to drop the support for GTK+ 1.x based libraries, at least for the Win32 NSIS installer.

This will simplify the installation procedure for the Wireshark Win32 users and also decrease the installer size.

## Reasons against doing this:

### GtkFileChooser

The new file chooser used in the GTK2.x version is often reported to be unintuitive and buggy (at least in the current GTK2.x Win32 libs).

It should be possible to use the old style GtkFileDialog together with the GTK2 library versions. Maybe we could use a preference setting to change between them.

BTW: One can use drag-n-drop from the windows explorer to open files.

Note: The file chooser has been replaced with native Win32 open file dialogs.

## Discussion

Could the ones still using the old GTK1.x GUI explain the reasons they do so? - *Ulf Lamping*

Many of my co-workers have dropped back to GTK1.x after loosing entire capture sessions due to flakiness of the file chooser. I don't believe anyone was aware of the drop-n-drag capability. - *Bryan Miller*

Not until I can get a GTK2 version which runs on NT4 thank you. I tried changing all the desktop fonts to Tahoma (as suggested in at least one place in the mail archive) and I still get a crash in pango when I try to open the preferences. The GTK1 version works perfectly. - *Andrew Hood*

---

Imported from https://wiki.wireshark.org/Development/DropWin32GTK1 on 2020-08-11 23:12:44 UTC
