# Development Tips

Here you will find various tips useful while development and debugging.

[[_TOC_]]

## Printing to a console

Sometimes you just want to peek at some variables to see whats going on in your code, without the need for a heavy duty debugger session. In these cases printf can be your best friend. To get this working you need:

  - Open up the console (needed for Windows only):
    
    Start Wireshark and go to Edit->Preferences...->Advanced. In the Search: box enter "console", then select  `gui.console_open` in the search results. Change Value to 'ALWAYS' and click the Ok button.

  - Wireshark logging broadly adopts the concept of domain and level from the GLib Messages and Logging API. You can filter the log level using the command-line option `--log-level=<level>` or the environment variable `WIRESHARK_LOG_LEVEL=<level>`. You can filter the domain using `--log-domains=<domain>` or `WIRESHARK_LOG_DOMAINS=<domain>`. The domain filter accepts a comma separated list of domains. The log levels available by increasing verbosity are "critical", "warning", "message" (default), "info", "debug" and "noisy". Level "noisy" usually more useful if you know what you are looking for and can filter log output to a specific domain.
```
$ tshark --log-level=noisy --log-domain=main,capture --log-file=/tmp/wsdebug -r some.pcap
```
  - put `ws_log` statements in your code (`ws_debug`, `ws_info`, `ws_message`, etc..., see [wsutil/wslog.h](https://gitlab.com/wireshark/wireshark/-/blob/master/wsutil/wslog.h)) or `g_print`. Also available is `proto_tree_add_debug_text(tree, format)` which will display debug message right in the place. Check proto.c for details.

If you have your eye on some condition, so you can add the following to your code:

    if (condition) {
      g_print("Kilroy was here\n");
    }

Notice that printf/g\_print doesn't work for dumpcap (e.g. capture\_loop.c) since stdio is used for communication with Wiresharks capture engine. Use `g_log` or [\`g\_printerr\`](https://developer.gnome.org/glib/stable/glib-Warnings-and-Assertions.html#g-printerr) instead.

**Don't forget to remove these statements later, after you've found your bug.** These printf like statements should not remain active in production code as they are often annoy the uninterested user.

## Breakpoint on a specific packet number

Often you know, that you have a bug/problem in your dissector, which can be found only in a specific packet.

Let's say you know packet number 1234 has a bug, so you can add the following to your code:

    if (pinfo->fd->num == 1234) {
      g_print("Here is my bug\n");
    }

and simply set a breakpoint to the g\_print call.

Of course you will need access to pinfo, but this should be the case in any dissector.

Don't forget to remove this later, after you've found your bug :smiley:

Some debuggers, such as gdb and MSVC, also let you make breakpoints conditional; you could set a breakpoint at some point in a routine, and make the condition for the breakpoint be `pinfo->fd->num == 1234`.

## Using GDB for debugging

Extracted from <http://www.gnu.org/software/libtool/manual/libtool.html#Debugging-executables>

If you want to debug your own build of Wireshark on UNIX before you install the application you have to run GDB through libtool, like so:

    user@host:~/src/wireshark$ libtool --mode=execute gdb wireshark

## Using DDD for debugging

DDD is GNU's graphical front-end for the GDB command-line debugger (among others). <http://www.gnu.org/software/ddd/>

To help DDD locate your source files while debugging, "cd" into the directory where those source files exist and then start DDD through libtool (just like GDB), or look in the DDD menu "Edit" -\> "GDB Settings..." -\> "Search path for source files" and explicitly add the path there.

## Debugging without Optimization

If you are debugging and optimization is a problem (for example, the line numbers displayed when stepping through the code don't appear to line up with what's actually being executed), set the `CMAKE_BUILD_TYPE` to `Debug` to disable optimizations when building by following steps like the ones below:

```
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Debug ..
make
gdb run/tshark
```

## Reducing libtool verbosity

Typing *libtool --mode=execute* over and over can get old quickly. In most shells you can create a shortcut to reduce typing.

Bourne-style shells:

    function lx
    {
        glibtool --mode=execute $*
    }

C-style shells:

    alias lx 'glibtool --mode=execute'

Using this shortcut the GDB example above can be shortened to:

    user@host:~/src/wireshark$ lx gdb wireshark

## Debugging using Valgrind

[Valgrind](http://valgrind.org/) dynamically analyzes programs and is great at catching memory-related errors. By default it won't catch bugs in Wireshark's chunk allocator (emem.c). Fortunately you can tell Wireshark to use g\_malloc instead of the chunk allocator at runtime:

    export WIRESHARK_DEBUG_EP_NO_CHUNKS=1
    export WIRESHARK_DEBUG_SE_NO_CHUNKS=1

Assuming you have the *lx* shortcut defined (above) you and check for memory problems like so:

    lx valgrind --tool=memcheck tshark -nVxr /path/to/capture.pcap > /dev/null

## Debugging using AddressSanitizer

[AddressSanitizer (ASAN)](https://github.com/google/sanitizers/wiki/AddressSanitizer) can catch memory-safety issues at runtime, including use-after-free, double-free, buffer overflow and memory leaks. It requires GCC or Clang and works on Linux and macOS. MSVC on Windows is not supported.

To get started, build Wireshark with `cmake -DENABLE_ASAN=1`. For improved debugging, set some extra environment variables before running programs:

    # Reduce false negatives by forcing malloc for every allocation.
    export WIRESHARK_DEBUG_WMEM_OVERRIDE=simple
    export G_SLICE=always-malloc
    # The following options are only recommended when investigating
    # memory leaks. The first option slows down a lot but results in
    # more precise backtraces. The second option prints addresses of
    # leaked objects which can be inspected in a debugger.
    export ASAN_OPTIONS=fast_unwind_on_malloc=0:report_objects=1

If you are just interested in memory safety checks, but not memory leak debugging, simply disable the latter with:

    export ASAN_OPTIONS=detect_leaks=0

These ASAN options are documented at <https://github.com/google/sanitizers/wiki/AddressSanitizerFlags>

## Running dumpcap on Linux as unprivileged user

dumpcap requires privileges for capturing packets. To test it from the build directory, the reasonably safe options are:

  - Add filesystem capabilities: `sudo setcap cap_net_raw,cap_net_admin+eip run/dumpcap` (downsides: does not work for a build directory in tmpfs (/tmp) that is mounted with `nosuid`, changes are lost after a rebuild).

  - Use ambient capabilities, see [\[Wireshark-dev\] Capturing packets on Linux during development](https://www.wireshark.org/lists/wireshark-dev/201711/msg00025.html).

Under no circumstances should you run it as (setuid) root, unless you do not care about the environment (for example, a virtual machine).

In either case, adding capabilities will prevent gdb/strace from attaching. To solve that, use ambient capabilities with `cap_sys_ptrace` before starting GDB. Note that this will permit debugging *any* process, including those owned by root.

## Debugging GLib warnings

GLib calls by applications, like Wireshark, can cause warnings. To debug these you can set environment variables influencing how GLib reacts to these warnings. In combination with a debugger you can look at the call stack leading to this warning. See [Running GLib Applications](http://library.gnome.org/devel/glib/stable/glib-running.html)

## Using MSVC++ for debugging

Extracted from ~~<http://www.ethereal.com/lists/ethereal-dev/200503/msg00778.html>~~
[[Ethereal-dev] How to trace Ethereal on WinXP using MSVC++?](https://www.wireshark.org/lists/ethereal-dev/200503/msg00778.html)

If you are just wanting to debug Wireshark then the Win32 binaries should already include the debug symbols by default. You can look at the file config.nmake and ensure that the debug switch is enabled...

    # Linker flags
    # /DEBUG generate debug info
    LOCAL_LDFLAGS=/DEBUG

Once you have a valid binary with debug symbols you can easily debug Wireshark by opening up the binary from within MSVC.

So from within Visual Studio just click on the File \! Open \! Project/Solution menu and then browse to the installed location of the Wireshark .exe. Typically: c:\\program files\\wireshark\\wireshark-gtk2. Once you have it open you should see wireshark.exe listed in the far left window of Visual Studio. To execute Wireshark just press the F5 key. If you want to break within some location within Wireshark then just open a source file and set a break point. The execution of Wireshark.exe will halt at the specific location. You can then step through the source code to isolate/debug your issue.

Note: For Visual Studio 6, use File \! Open, change the file extension type to be all files, and then proceed as above.

## \*\*Obsolete\*\* Using the MSVC6 "source browser" capability

It is sometimes quite useful to be able to use the "Tools/Source Browser" capability of MSVC6 to find the definitions and references for Wireshark functions and variables.

To build and use the required "Browse Information File" (.bsc) file:

1.  Change config.nmake to add the /Fr switch to the compiler flags (in addition to making the linker flags /DEBUG change described above).

<!-- end list -->

    # Compiler flags
    # /W3  warning level 3 (0 less - 4 most, 1 default)
    # /Zi  create .pdb file for debugging
    # /Fr  create .sbr files used by BSCMAKE to create a "Browse Information File"
    LOCAL_CFLAGS=/Zi /W3 /Fr

1.  Build wireshark using nmake as usual
2.  Create the .bsc file as follows:

<!-- end list -->

``` 
 user@host:~/src/wireshark$ nmake -f Makefile.nmake wireshark.bsc
```

1.  Open the Wireshark binary from within Visual Studio as described above; Select Tools/Source\_Browser from the Toolbar; (If an error message appears, it may be necessary to specify the location of the .bsc file under Project/Settings). Enter a valid identifier and select OK to get a list of the source locations (file names and line numbers) of the definitions and references for the identifier.

By using the keyboard shortcuts associated with the source browser it is possible to quite easily navigate through source files. (See MSVC Help for "Browse Information Files").

For example: If the cursor is located at the beginning of an identifier, entering F12 will go immediately to the source file location of the definition of the identifier. Entering \<Ctrl Num \*\> will then move the cursor back to the previous location.

---

Imported from https://wiki.wireshark.org/Development/Tips on 2020-08-11 23:13:12 UTC
