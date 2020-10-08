# Replace use of deprecated GTK and GLib functions

Wireshark currently uses a number of [GTK](http://library.gnome.org/devel/gtk/2.6/DeprecatedObjects.html) widget classes and [GLib](http://library.gnome.org/devel/glib/2.6/ix02.html) functions whose use has been deprecated.

This page is provides information as to work-in-progress to replace the use of these functions.

[[_TOC_]]

## GtkItemFactory -\> GtkUIManager


| File                             | Status                                                                                         |
| -------------------------------- | ---------------------------------------------------------------------------------------------- |
| `conversations_table.c`          | Completed: [Rev 33851](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33761) |
| `expert_comp_table.c`            | Completed: [Rev 33761](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33761) |
| `hostlist_table.c`               | Completed: [Rev 34014](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33761) |
| `menus.c`                        | Note 1                                                                                         |
| `proto_help.c`                   | Note 2                                                                                         |
| `proto_hier_stats.c`             | Completed: [Rev 34026](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34026) |
| `service_response_time_table.c`  | Completed: [Rev 34002](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=34002) |
| `wlan_stat_dlg.c`                | Completed: [Rev 33860](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=33860) |


### Discussion

#### Note 1

A lot has already been done by Anders, which can be found under the compile switch `MAIN_MENU_USE_UIMANAGER`. The question now is how to integrate the more dynamic parts, like taps, statistics, etc.

#### Note 2

Right now the code in `proto_help` has been disabled when building with `MAIN_MENU_USE_UIMANAGER`.

## GtkCombo -\> GtkComboBoxEntry


| File            | Status                                                                                         |
| --------------- | ---------------------------------------------------------------------------------------------- |
| `capture_dlg.c` | Completed: [Rev 36741](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36741) |


## GtkOptionMenu -\> GtkComboBox

See [Bug 4487](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4487) re dropdown widget behavior change seen when Windows Gtk was updated from Gtk 2.16 to Gtk 2.18.


| File                 | Status                                                                              |
| -------------------- | ----------------------------------------------------------------------------------- |
| `capture_dlg.c`      | Completed: [Rev 33497](http://anonsvn.wireshark.org/viewvc?view=rev&revision=33497) |
| `capture_file_dlg.c` | Completed: [Rev 31950](http://anonsvn.wireshark.org/viewvc?view=rev&revision=31950) |
| `firewall_dlg.c`     | Completed: [Rev 31948](http://anonsvn.wireshark.org/viewvc?view=rev&revision=31948) |
| `dcerpc_stat.c`      | Completed: [Rev 33592](http://anonsvn.wireshark.org/viewvc?view=rev&revision=31950) |
| `decode_as_dlg.c`    | Completed: [Rev 31949](http://anonsvn.wireshark.org/viewvc?view=rev&revision=31949) |
| `rpc_stat.c`         | Completed: [Rev 31972](http://anonsvn.wireshark.org/viewvc?view=rev&revision=31972) |
| `uat_gui.c`          | Completed: [Rev 31908](http://anonsvn.wireshark.org/viewvc?view=rev&revision=31908) |


### Discussion

Question: Should these changes be backported to the 1.2 branch ? - *Bill Meier*

I reverted/upgraded the Win32 and Win64 GTK+ bundles in the trunk and trunk-1.2 branches to 2.16.6, so backporting shouldn't be necessary. 2.16 is [strongly recommended over 2.18](https://bugzilla.gnome.org/show_bug.cgi?id=598299), and the latest 2.16 packages should hopefully take care of the [Secunia complaints](http://secunia.com/community/forum/thread/show/3238/wireshark_64bit_includes_outdated_gtk_library) which spurred the upgrade to 2.18. - *Gerald Combs*

## GtkClist -\> GtkTreeView


| File                 | Status                                                                              |
| -------------------- | ----------------------------------------------------------------------------------- |
| `airpcap_dlg.c`      | Completed: [Rev 35862](http://anonsvn.wireshark.org/viewvc?view=rev&revision=35862) |
| `mcast_stream_dlg.c` | Completed: [Rev 32376](http://anonsvn.wireshark.org/viewvc?view=rev&revision=32376) |
| `rtp_stream_dlg.c`   | Completed: [Rev 32589](http://anonsvn.wireshark.org/viewvc?view=rev&revision=32589) |
| `uat_gui.c`          | Completed: [Rev 32621](http://anonsvn.wireshark.org/viewvc?view=rev&revision=32621) |
| `voip_calls_dlg.c`   | Completed: [Rev 32248](http://anonsvn.wireshark.org/viewvc?view=rev&revision=32248) |


### Discussion

---

Imported from https://wiki.wireshark.org/ReplaceDeprecatedGtkGLibFunctionUsage on 2020-08-11 23:23:53 UTC
