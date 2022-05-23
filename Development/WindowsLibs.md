# Windows Libraries

This article documents how some of our Windows library dependencies are updated.
For information on building Wireshark using these libraries, see the [Library Reference](https://www.wireshark.org/docs/wsdg_html_chunked/ChapterLibraries.html) chapter in the Developer's Guide.

Many of our libraries are built using [vcpkg](https://github.com/microsoft/vcpkg/). See `.gitlab-ci.yml` in the [wireshark-vcpkg-scripts](https://gitlab.com/geraldcombs/wireshark-vcpkg-scripts) for details.

## Packaging notes

C++ libraries (such as Qt) are highly dependent on the MSVC runtime (MSVCRT) version and require separate packages for each MSVC compiler version.

Some libraries such as GnuTLS and Gcrypt are cross-compiled with MinGW on Linux. Where possible, try to reuse packages from other trusted projects such as OpenSUSE or Debian.

At minimum a library package should contain header files, runtime libraries (.dll) and import libraries (.lib).

Do not use the MinGW .dll.a file, these are not compatible with MSVC. One .dll.a appears to work, but multiple .dll.a libraries results in a cryptic runtime error. Instead create a new import library with either:

- MSVC dumpbin and lib.exe as described [here](https://stackoverflow.com/a/9946390/427545).

- objdump and llvm-dlltool as described [here](https://stackoverflow.com/a/53838952/427545).

Checklist:

- Have you created a subdirectory, named after the zip file?

- Are .lib and .dll files included in the `bin` directory?

- Are .dll files stripped? (Optional if it does not save much)

- Are header files included in the `include` directory?

- Does the directory with .dll files match the `<name>_DLL_DIR` variable in `cmake/modules/Find<name>.cmake`?

## Procedure for updating a library

1. First time: Check out the [Wireshark Development Libraries](https://gitlab.com/wireshark/wireshark-development-libraries) repository.

2. Add your package under `windows/packaging/<library>/`

3. Update `windows/README.md`.

4. Finally update `tools/win-setup.ps1` in the appropriate git branches in the Wireshark sources.

---

Imported from https://wiki.wireshark.org/Development/WindowsLibs on 2020-08-11 23:13:25 UTC
