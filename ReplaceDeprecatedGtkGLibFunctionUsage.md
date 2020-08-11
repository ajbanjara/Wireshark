# Replace use of deprecated GTK and GLib functions

Wireshark currently uses a number of [GTK](http://library.gnome.org/devel/gtk/2.6/DeprecatedObjects.html) widget classes and [GLib](http://library.gnome.org/devel/glib/2.6/ix02.html) functions whose use has been deprecated.

This page is provides information as to work-in-progress to replace the use of these functions.

[[_TOC_]]

## GtkItemFactory -\> GtkUIManager

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>File</strong></p></td>
<td><p><strong>Status</strong></p></td>
</tr>
<tr class="even">
<td><p>conversations_table.c</p></td>
<td><p>Completed<a href="http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&amp;revision=33761" class="http">Rev 33851</a></p></td>
</tr>
<tr class="odd">
<td><p>expert_comp_table.c</p></td>
<td><p>Completed<a href="http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&amp;revision=33761" class="http">Rev 33761</a></p></td>
</tr>
<tr class="even">
<td><p>hostlist_table.c</p></td>
<td><p>Completed<a href="http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&amp;revision=33761" class="http">Rev 34014</a></p></td>
</tr>
<tr class="odd">
<td><p>menus.c</p></td>
<td><p>Note 1</p></td>
</tr>
<tr class="even">
<td><p>proto_help.c</p></td>
<td><p>Note 2</p></td>
</tr>
<tr class="odd">
<td><p>proto_hier_stats.c</p></td>
<td><p>Completed<a href="http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&amp;revision=34026" class="http">Rev 34026</a></p></td>
</tr>
<tr class="even">
<td><p>service_response_time_table.c</p></td>
<td><p>Completed<a href="http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&amp;revision=34002" class="http">Rev 34002</a></p></td>
</tr>
<tr class="odd">
<td><p>wlan_stat_dlg.c</p></td>
<td><p>Completed<a href="http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&amp;revision=33860" class="http">Rev 33860</a></p></td>
</tr>
</tbody>
</table>

</div>

### Discussion

#### Note 1

A lot has already been done by Anders, which can be found under the compile switch MAIN\_MENU\_USE\_UIMANAGER. The question now is how to integrate the more dynamic parts, like taps, statistics, etc.

#### Note 2

Right now the code in proto\_help has been disabled when building with MAIN\_MENU\_USE\_UIMANAGER.

## GtkCombo -\> GtkComboBoxEntry

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>File</strong></p></td>
<td><p><strong>Status</strong></p></td>
</tr>
<tr class="even">
<td><p>capture_dlg.c</p></td>
<td><p>Completed: <a href="http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&amp;revision=36741" class="http">Rev 36741</a></p></td>
</tr>
</tbody>
</table>

</div>

## GtkOptionMenu -\> GtkComboBox

See [Bug 4487](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4487) re dropdown widget behavior change seen when Windows Gtk was updated from Gtk 2.16 to Gtk 2.18.

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>File</strong></p></td>
<td><p><strong>Status</strong></p></td>
</tr>
<tr class="even">
<td><p>capture_dlg.c</p></td>
<td><p>Completed: <a href="http://anonsvn.wireshark.org/viewvc?view=rev&amp;revision=33497" class="http">Rev 33497</a></p></td>
</tr>
<tr class="odd">
<td><p>capture_file_dlg.c</p></td>
<td><p>Completed: <a href="http://anonsvn.wireshark.org/viewvc?view=rev&amp;revision=31950" class="http">Rev 31950</a></p></td>
</tr>
<tr class="even">
<td><p>firewall_dlg.c</p></td>
<td><p>Completed: <a href="http://anonsvn.wireshark.org/viewvc?view=rev&amp;revision=31948" class="http">Rev 31948</a></p></td>
</tr>
<tr class="odd">
<td><p>dcerpc_stat.c</p></td>
<td><p>Completed: <a href="http://anonsvn.wireshark.org/viewvc?view=rev&amp;revision=31950" class="http">Rev 33592</a></p></td>
</tr>
<tr class="even">
<td><p>decode_as_dlg.c</p></td>
<td><p>Completed: <a href="http://anonsvn.wireshark.org/viewvc?view=rev&amp;revision=31949" class="http">Rev 31949</a></p></td>
</tr>
<tr class="odd">
<td><p>rpc_stat.c</p></td>
<td><p>Completed: <a href="http://anonsvn.wireshark.org/viewvc?view=rev&amp;revision=31972" class="http">Rev 31972</a></p></td>
</tr>
<tr class="even">
<td><p>uat_gui.c</p></td>
<td><p>Completed: <a href="http://anonsvn.wireshark.org/viewvc?view=rev&amp;revision=31908" class="http">Rev 31908</a></p></td>
</tr>
</tbody>
</table>

</div>

### Discussion

Question: Should these changes be backported to the 1.2 branch ? - *Bill Meier*

I reverted/upgraded the Win32 and Win64 GTK+ bundles in the trunk and trunk-1.2 branches to 2.16.6, so backporting shouldn't be necessary. 2.16 is [strongly recommended over 2.18](https://bugzilla.gnome.org/show_bug.cgi?id=598299), and the latest 2.16 packages should hopefully take care of the [Secunia complaints](http://secunia.com/community/forum/thread/show/3238/wireshark_64bit_includes_outdated_gtk_library) which spurred the upgrade to 2.18. - *Gerald Combs*

## GtkClist -\> GtkTreeView

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>File</strong></p></td>
<td><p><strong>Status</strong></p></td>
</tr>
<tr class="even">
<td><p>airpcap_dlg.c</p></td>
<td><p>Completed: <a href="http://anonsvn.wireshark.org/viewvc?view=rev&amp;revision=35862" class="http">Rev 35862</a></p></td>
</tr>
<tr class="odd">
<td><p>mcast_stream_dlg.c</p></td>
<td><p>Completed: <a href="http://anonsvn.wireshark.org/viewvc?view=rev&amp;revision=32376" class="http">Rev 32376</a></p></td>
</tr>
<tr class="even">
<td><p>rtp_stream_dlg.c</p></td>
<td><p>Completed: <a href="http://anonsvn.wireshark.org/viewvc?view=rev&amp;revision=32589" class="http">Rev 32589</a></p></td>
</tr>
<tr class="odd">
<td><p>uat_gui.c</p></td>
<td><p>Completed: <a href="http://anonsvn.wireshark.org/viewvc?view=rev&amp;revision=32621" class="http">Rev 32621</a></p></td>
</tr>
<tr class="even">
<td><p>voip_calls_dlg.c</p></td>
<td><p>Completed: <a href="http://anonsvn.wireshark.org/viewvc?view=rev&amp;revision=32248" class="http">Rev 32248</a></p></td>
</tr>
</tbody>
</table>

</div>

### Discussion

---

Imported from https://wiki.wireshark.org/ReplaceDeprecatedGtkGLibFunctionUsage on 2020-08-11 23:23:53 UTC
