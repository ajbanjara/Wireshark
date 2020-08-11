## Building an ASN.1-based dissector as a plugin

The usual way to build an ASN.1-based dissector is to put it into the asn1 subtree. This works well and is somewhat simpler than building as a plugin, but there are two reasons one might want to build as a plugin:

  - to speed development, since only the plugin needs to be recompiled
  - to allow flexibility in deploying an updated plugin, since only the plugin needs to be distributed

Reasons one might not want to build as a plugin:

  - the code is somewhat more complex
  - the makefile is quite a bit more complex
  - building under the asn1 subtree keeps all such dissectors together

If you still think you'd like to build your module as a plugin, this page describes an outline of that process. If you'd rather build in the more conventional manner, see the [Asn2wrs](/Asn2wrs) page instead.

### Sample code

[toyasn1.tar.gz](uploads/__moin_import__/attachments/ASN1_plugin/toyasn1.tar.gz) sample code for ASN.1-based plugin dissector

The gzipped file contains the following files:

    toyasn1/
    toyasn1/AUTHORS
    toyasn1/CMakeLists.txt
    toyasn1/COPYING
    toyasn1/ChangeLog
    toyasn1/INSTALL
    toyasn1/Makefile.am
    toyasn1/Makefile.common
    toyasn1/Makefile.in
    toyasn1/Makefile.nmake
    toyasn1/NEWS
    toyasn1/README
    toyasn1/TODO
    toyasn1/toyasn1.cnf
    toyasn1/moduleinfo.h
    toyasn1/moduleinfo.nmake
    toyasn1/toyasn1.asn
    toyasn1/plugin.rc.in
    toyasn1/packet-toyasn1-template.c
    toyasn1/packet-toyasn1-template.h
    toyasn1/plugin.c

### Example

To use this sample code, first make sure you have complete and up to date source and make sure that you can successfully build Wireshark. Once you have done that *but not before* you can proceed with the sample code by extracting it (e.g. using `tar -xvzf toyasn1.tar.gz` from within the plugins directory in the build tree.

#### Under Linux

1.  add this plugin's name (toyasn1) to ../Makefile.am
2.  add this plugin's name (toyasn1) to ../../configure.in
3.  run autoreconf at top level
4.  run make at top level (will automatically run configure and rebuild all of Wireshark)
5.  the toyasn1 plugin should be complete

After you've done this the first time, you can make changes to the .asn file and run make within your directory (e.g. within plugins/toyasn1 for this sample). It is much quicker than a rebuild of the entire tree and works just as well. Note that this sample code does not have a port assigned (because there is no IANA-assigned port for the fictional toyasn1 protocol), so this means that in order to play with it, you'll need to select some packets and then choose *decode as...* and choose toyasn1 as the protocol.

#### Under Windows

1.  replace each instance of *toyasn1* in Makefile.common to your plugin's name

2.  replace each instance of *toyasn1* in moduleinfo.nmake to your plugin's name

3.  add your plugin's name to ../Makefile.nmake

4.  run make at top level

5.  your plugin should be complete

<!-- end list -->

``` 
```

---

Imported from https://wiki.wireshark.org/ASN1_plugin on 2020-08-11 23:11:18 UTC
