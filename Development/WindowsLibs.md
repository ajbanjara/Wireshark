# Windows Libraries

This article documents how to update library dependencies for Windows.  
`https` links to the current libraries are available in the `WSDG`: [Chapter 5. Library Reference](https://www.wireshark.org/docs/wsdg_html_chunked/ChapterLibraries.html)  
See [wireshark-vcpkg-scripts](https://gitlab.com/geraldcombs/wireshark-vcpkg-scripts) for newer? method to add libraries.

## Packaging notes

C++ libraries (such as Qt) are highly dependent on the MSVC runtime (MSVCRT) version and require separate packages for each MSVC compiler version.

Many libraries (including GnuTLS, Gcrypt, libssh) are cross-compiled with MinGW on Linux. Where possible, try to reuse packages from other trusted projects such as OpenSUSE or Debian.

At minimum a library package should contain header files, runtime libraries (.dll) and import libraries (.lib).

Do not use the MinGW .dll.a file, these are not compatible with MSVC. One .dll.a appears to work, but multiple .dll.a libraries results in a cryptic runtime error. Instead create a new import library with either:

  - MSVC dumpbin and lib.exe as described [here](https://stackoverflow.com/a/9946390/427545).

  - objdump and llvm-dlltool as described [here](https://stackoverflow.com/a/53838952/427545).

Checklist:

  - Have you create a subdirectory, named after the zip file?

  - Are .lib and .dll files included in the `bin` directory?

  - Are .dll files stripped? (Optional if it does not save much)

  - Are header files included in the `include` directory?

  - Does the directory with .dll files match the `<name>_DLL_DIR` variable in `cmake/modules/Find<name>.cmake`?

## Procedure for updating libraries

First time: make a local copy of the repositories:

    svn checkout svn+ssh://svn.wireshark.org/svn/wireshark-win32-libs/trunk wireshark-win32-libs-trunk
    svn checkout svn+ssh://svn.wireshark.org/svn/wireshark-win64-libs/trunk wireshark-win64-libs-trunk

Add a single package (repeat this for both repos as needed):

1.  Update existing copies: `svn up`

2.  Update README.txt in the top-level directory.

3.  `svn add packages/<package>-<version>.zip`

4.  `svn commit -m "Update <package> to <version>"`

Once you are ready to publish a tagged version of all packages. Tag name convention: `yyyy-mm-dd`. Example:

    # Repeat this for both the 32-bit and 64-bit repo as needed.
    svn copy -m "Create a tag for <package> <version>" ^/trunk ^/tags/2018-08-03

Historical note: In the past, a separate `trunk-A.B` existed for `master-A.B` and tags were named like `yyyy-mm-dd-A.B`. Now that they are combined, it is possible to reuse the same date tag across branches.

Finally update `tools/win-setup.ps1` in the appropriate git branches.

## Other commands

  - Display the last ten changes including their paths: `svn log -vl10`

  - Display all tags: `svn ls ^/tags`

---

Imported from https://wiki.wireshark.org/Development/WindowsLibs on 2020-08-11 23:13:25 UTC
