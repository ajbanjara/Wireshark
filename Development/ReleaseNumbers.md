# Release numbers

## Release number tuple

Official Wireshark release numbers are constructed as a three number tuple: **`Major.Minor.Maintenance`**.

In some cases, such as the file version for Windows executables, a build number may be present: **`Major.Minor.Maintenance.Build`**.

The *Major release number* has reached **1** after numerous years of development. Only when the program undergoes a significant change this number will increment. The change to Qt as primary GUI toolkit was such change, resulting in the number to be set to **2**. The change to **3** came about when the GTK+ GUI toolkit was dropped and Npcap as Windows capture library was introduced. This number is likely to remain constant for a while.

The *Minor release number* basically follows an even/odd number scheme. For every official release an <span class="u">even</span> number is assigned and the code is branched off for maintenance. The development continues on the next higher <span class="u">odd</span> release number. Note that this development package is a moving target and meaningless without its commit ID.

The *Maintenance release number* gives you the stage of maintenance which that release is in. It starts of with 0 and increments with every maintenance release.

The *Build number* is the source code repository commit ID corresponding to that particular build.

## Release candidates and automated builds

Before a release there may be release candidates, which are designated with the abbreviation *rc* and a number, such as *3.1.7rc1*.

Additionally [automated builds](https://www.wireshark.org/download/automated/) include a commit ID. For example, the version stamp for the file `Wireshark-win64-3.3.0rc0-1595-g584569932b06.exe` means the following:

  - This is a development release (3 is odd).

  - There have been 1595 commits since the last minor release (3.2.0) was branched off.

  - This build was triggered by [commit 584569932b06](https://gitlab.com/wireshark/wireshark/-/commit/584569932b066fb4cc2f2c533743bf5c58c8c076).

During development it may be desirable to have more exposure of newly implemented features. Although the development builds are available for everyone to download occasionally a development snapshot will be released. Note that these aren't branched off from the development tree, nor maintained. To indicate that development continues the Maintenance release number will be incremented.

## Example release number tree

This tree shows a release number assignment tree based on this algorithm. On the left the main development trunk follows the down arrows, while the right arrows indicate stable release branches. It's is like an upside down tree.

    Older Wireshark releases
      ↓
      ↓→ 0.99.8pre1 → 0.99.8
      ↓
    0.99.9
      ↓
      ↓→ 1.0.0pre1 → 1.0.0pre2 → 1.0.0 → 1.0.1 → 1.0.…
      ↓
    1.1.0 (a development snapshot may be released, which will not be branched off)
      ↓
    1.1.1
      ↓
      ↓→ 1.2.0pre1 → 1.2.0pre2 → 1.2.0 → 1.2.1 → 1.2.…
      …
    1.9.0 (if Wireshark significantly changes the program the Major number may bump)
      ↓
      ↓→ 2.0.0rc1 → 2.0.0rc2 → 2.0.0 → 2.0.1 → 2.0.…
      ↓
    2.1.0
      ↓
      ↓→ 2.2.0rc1 → 2.2.0rc2 → 2.2.0 → 2.2.1 → 2.2.…
      ↓
    2.3.0
      …
    2.6.0 (if Wireshark significantly changes the program the Major number may bump)
      ↓
      ↓→ 3.0.0rc1 → 3.0.0rc2 → 3.0.0 → 3.0.1 → 3.0.…
      ↓
    3.1.0
     etc

---

Imported from https://wiki.wireshark.org/Development/ReleaseNumbers on 2020-08-11 23:13:02 UTC
