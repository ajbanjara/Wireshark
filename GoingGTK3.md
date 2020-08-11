# Migrate from GTK+ 2 to GTK+ 3

GTK3 has been released a while ago and most current distributions provide now both, GTK2 and GTK3. As described in the [GTK+ Reference Guide](http://developer.gnome.org/gtk3/stable/gtk-migrating-2-to-3.html) there are some preparations to be done before our [Carcharodon Photoshopia](http://www.wireshark.org/faq.html#q1.4) can migrate to the fresher waters defined by GTK+ 3. Not that there's anything wrong with GTK+ 2, but those waters will become stale after a while.

[[_TOC_]]

## How to get there

First thing would be to finish up [ReplaceDeprecatedGtkGLibFunctionUsage](/ReplaceDeprecatedGtkGLibFunctionUsage) and then investigate the work to be done for the migration. These work items can be listed and commented on here.

Clearly the Wireshark source code would need to be compatible with a wide version range of GTK+ 2 and 3 versions. This may result in certain features not being available when compiled with lower versions of GTK+ 2, or difference implementations based on the available version.

We could also go for a Wireshark 2.0 requiring GTK+ 3.0, which would allow us to clean up the code considerably.

## GTK version identification in source code

Use the macro [GTK\_CHECK\_VERSION](http://library.gnome.org/devel/gtk/unstable/gtk3-Feature-Test-Macros.html#GTK-CHECK-VERSION:CAPS) to determine what version of API should be programmed against.

## GDK key names

One of the changes is the change of GDK key names. To accommodate porting a compatability header is provided: [gdkkeysyms-compat.h](http://git.gnome.org/browse/gtk+/tree/gdk/gdkkeysyms-compat.h?h=master). This header came into existence with GTK+ 2.22, but is no longer automagically included from `gdkkeysyms.h` in GTK+ 3.

I think *configure* should look for this, and if found define `HAVE_GDKKEYSYMS_H`. That symbol should be checked then before including `gdkkeysyms.h`.

## Notes

### Build Wireshark with GTK 2.22 on Windows

As of [revision 36623](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=36623) we build with GTK+ 2.22. Having 2.24 for Windows may take time [see here](http://tml-blog.blogspot.com/2011/03/gtk-on-windows-i-am-not-really-doing-it.html). Wireshark uses GTK 2.24 now (Note made 2013-02 but it's been there for a while).

### Build Wireshark with GTK+ 3 on \*NIX

As of [revision 35918](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=35918) Wireshark has a configure script option of "`--with-gtk3`" which will attempt to find GTK+ 3 on the local system (which can be installed alongside GTK+ 2) and use it. CMake users may use the option ENABLE\_GTK3=ON.

Compilation fails right now though (Jun 20th, 2011), but it should help things along. See the Wireshark sources [gtk/STATUS.GTK3](http://anonsvn.wireshark.org/viewvc/trunk/gtk/STATUS.gtk3?revision=38079&view=markup&pathrev=38084) for some details.

Wireshark now builds with GTK3 (August 31st, 2011).

### Build Wireshark with GTK+ 3.2 on \*NIX

Wireshark builds with GTK3.2 (December 29th, 2011). GTK+ 3.2 deprecates GtkHBox and GtkVBox which are used extensively by Wireshark so GTK\_DISABLE\_DEPRECATED can't currently be used when building with GTK+ 3.2 or newer. `configure.in` is patched in [revision 40326](http://anonsvn.wireshark.org/viewvc/viewvc.cgi?view=rev&revision=40326). Fixed by introducing ws\_gtk\_box\_new() we now build with GTK\_DISABLE\_DEPRECATED(Note made 2013-02).

---

Imported from https://wiki.wireshark.org/GoingGTK3 on 2020-08-11 23:14:18 UTC
