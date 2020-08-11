# Common Problems

This page will collect common (compilation) problems while developing Wireshark.

## Win32

### Strange behaviour

You may encounter strange program behaviour or crashes while or after compiling.

This may be caused by the (not well working) MSVC build dependencies, e.g. if some header files changed (by yourself or a source tree update).

It's recommended to do a:

`nmake -f Makefile.nmake distclean`

in any such problems to get a clean build tree.

### unistd.h

If you compile Wireshark for the first time or cross compile the same source tree on both Unix and Windows you may get a MSVC compile error complaining that `unistd.h` is missing, you didn't do:

`nmake -f Makefile.nmake distclean`

first. This is required to remove some intermediate files shipped for the convenience of Unix users, which are incompatible with the MSVC build.

### link: invalid option -- e

If you get the following error while compiling:

{{{link: invalid option -- e Try \`link --help' for more information.}}}

... unfortunately, the link command is available both from Cygwin and from MSVC with completely different purposes and you'll need the MSVC link. If you get this error, in your environment the link command of Cygwin takes precedence over the MSVC one. To fix this, you can change your PATH environment setting or simply renaming the `link.exe` in cygwin's `/bin` directory. If you rename it, make sure to remember that a Cygwin update may provide a new version of that file, which in turn has to be renamed again.

### link: error LNK2001: unresolved external symbol xyz

When compiling your plugin you may run into this error message. This means that this particular symbol is not exported by means of `libwireshark.def` in the `epan` directory. You can add it to your own version of `libwireshark.def` and recompile Wireshark, after which your plugin will link fine. Remember though that the plugin will only work with your compiled Wireshark, since that version alone exports the symbol in question for dynamic linking. Post a request to the developer mailing list to have the symbol included in the development version of `libwireshark.def` so that it is present in subsequent SVN versions and the following releases (it's even better if you send the developer list a patch to `libwireshark.def`, so that the developers don't have to add it by hand).

### Plugins and redistributable C Runtime

If you are compiling your plugin with a newer version of Visual Studio it might happen that you get an error message when putting the dll into another system's plugin directory. As Wireshark is distributed in a VS 6 compiled version, you need to execute vcredist\_x86.exe on the target system. This will make the necessary C Runtime version available for your plugin. If there are still problems (on my system it worked on Win2000/SP4 but on WinXP I also had to do this), do the following: Attach the manifest information (this contains info about which runtime is necessary) to the dll. This can be achieved by typing "mt.exe –manifest [MyLibrary](/MyLibrary).dll.manifest -outputresource:[MyLibrary](/MyLibrary).dll;2" in the vs command prompt in your plugin development directory .

---

Imported from https://wiki.wireshark.org/Development/CommonProblems on 2020-08-11 23:12:42 UTC
