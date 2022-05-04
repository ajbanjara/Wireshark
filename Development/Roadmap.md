# Roadmap

This is a tentative roadmap for the next stable releases of Wireshark. For more information on the Wireshark release lifecycle and on past releases see [Development/LifeCycle](/Development/LifeCycle).

## Planning

| **Release** | **Expected Date** | **Notes** |
|-------------|-------------------|-----------|
| 4.0.0rc1 | May 11, 2022 | First release candidate for Wireshark 4.0.0 |
| 3.6.5 | June 15, 2022 | Next maintenance release of the 3.6 branch |
| 3.4.14 | June 15, 2022 | Next maintenance release of the 3.4 branch |
| 4.0.0rc2 | June 16, 2022 | Second release candidate for Wireshark 4.0.0 |

## Backporting Changes

Significant bug fixes should be [backported to all applicable stable branches](Development/SubmittingPatches#backporting-a-change-to-a-release-branch) after they are checked in to the master branch. You can follow development progress using the links below.

[Recent changes](https://gitlab.com/wireshark/wireshark/commits/master) in the [master (development) branch](https://gitlab.com/wireshark/wireshark/-/tree/master)

[Recent changes](https://gitlab.com/wireshark/wireshark/commits/release-3.6) in the [3.6 branch](https://gitlab.com/wireshark/wireshark/-/tree/release-3.6)

[Recent changes](https://gitlab.com/wireshark/wireshark/commits/release-3.4) in the [3.4 branch](https://gitlab.com/wireshark/wireshark/-/tree/release-3.4)

## Proposed Changes

For a list of bugs that should have been fixed before the 2.0 release, see [Bugzilla (target milestone: 2.0 release)](https://bugs.wireshark.org/bugzilla/buglist.cgi?resolution=---&target_milestone=2.0%20release).

Other proposed items (possibly out of date, see wiki source):

* Items marked with :one: in the TODO list of [Development/SNMP](/Development/SNMP) since rev148 2007-08-30
* When major library version bumps are needed `*.CMakeList.txt`-s have to be changed at two locations and `debian/lib*N.*` files have to be updated and renamed
* Keep plugin API and ABI stable and versioned, so binary plugins will reliably work with more than one Wireshark version (ABI changes can be followed here: <https://abi-laboratory.pro/tracker/timeline/wireshark/>) since rev2033 2011-10-30
  * Run `tools/git-compare-abis.sh` in the Git repository right before the release since rev2033 2011-10-30
  * Bump library versions as needed based on [Libtool's documentation](http://www.gnu.org/software/libtool/manual/html_node/Updating-version-info.html) in `*/Makefile.am` and `*/CmakeList.txt` (don't forget updating `debian/*.symbols`) since rev2033 2011-10-30 for autotools, rev3305 2014-05-30 for cmake
  * When major library version bumps are needed `*.CMakeList.txt`-s have to be changed at two locations and `debian/lib*N.*` files have to be updated and renamed
* Include Lua API changes in release notes (Lua dissectors can detect Wireshark version using get_version() and adjust the API used.)
* Add privilege separation for dissection since rev10 2006-03-27
* Add thread/multiprocessor support since rev12 2006-04-06

... well, maybe all the points mentioned in the [WishList](/WishList)!

## Unsorted

* Security improvements (see also: [Security](/Security))
  * Add privilege separation for POSIX environments (in progress) since rev8 2005-12-12
  * Add a similar mechanism for the Windows environment since forever rev1 2004-10-15
  * Enhance the API to make it easier to write secure code (e.g. add `tvb_get_gstring()`)? since forever rev1 2004-10-15
* Documentation of library API's (e.g. wiretap) since forever rev1 2004-10-15

## Discussion

---

Imported from <https://wiki.wireshark.org/Development/Roadmap> on 2020-08-11 23:13:03 UTC
