# Roadmap

This is a tentative roadmap for the next stable releases of Wireshark. For more information on the Wireshark release lifecycle and on past releases see [Development/LifeCycle](/Development/LifeCycle).

## Planning

| **Release** | **Expected Date** | **Notes** |
| ---         |  ---              | ---       |
| 3.4.0rc1    | October 22, 2020   | First release candidate for 3.4 |
| 3.2.8       | November 4, 2020  | Next maintenance release of the 3.2 branch |

## Backporting Changes

Significant bug fixes should be [backported to all applicable stable branches](/Development/Backporting) after they are checked in to the master branch. You can follow development progress using the links below.

[Recent changes](https://code.wireshark.org/review/#/q/project:wireshark+AND+branch:master) in the [master (development) branch](https://code.wireshark.org/review/gitweb?p=wireshark.git;a=shortlog;h=refs/heads/master)

[Recent changes](https://code.wireshark.org/review/#/q/project:wireshark+AND+branch:master-3.2) in the [3.2 branch](https://code.wireshark.org/review/gitweb?p=wireshark.git;a=shortlog;h=refs/heads/master-3.2)

[Recent changes](https://code.wireshark.org/review/#/q/project:wireshark+AND+branch:master-3.0) in the [3.0 branch](https://code.wireshark.org/review/gitweb?p=wireshark.git;a=shortlog;h=refs/heads/master-3.0)

[Recent changes](https://code.wireshark.org/review/#/q/project:wireshark+AND+branch:master-2.6) in the [2.6 branch](https://code.wireshark.org/review/gitweb?p=wireshark.git;a=shortlog;h=refs/heads/master-2.6)

## Proposed Changes

For a list of bugs that should have been fixed before the 2.0 release, see [Bugzilla (target milestone: 2.0 release)](https://bugs.wireshark.org/bugzilla/buglist.cgi?resolution=---&target_milestone=2.0%20release).

Other proposed items (possibly out of date, see wiki source):

  - Items marked with :one: in the TODO list of [Development/SNMP](/Development/SNMP) <span class="comment" style="display:none">since rev148 2007-08-30</span>

  - Keep plugin API and ABI stable and versioned, so binary plugins will reliably work with more than one Wireshark version (ABI changes can be followed here: <https://abi-laboratory.pro/tracker/timeline/wireshark/>) <span class="comment" style="display:none">since rev2033 2011-10-30</span>
    
      - Run `tools/git-compare-abis.sh` in the Git repository right before the release <span class="comment" style="display:none">since rev2033 2011-10-30</span>
    
      - Bump library versions as needed based on [Libtool's documentation](http://www.gnu.org/software/libtool/manual/html_node/Updating-version-info.html) in `*/Makefile.am` and `*/CmakeList.txt` (don't forget updating `debian/*.symbols`) <span class="comment" style="display:none">since rev2033 2011-10-30 for autotools, rev3305 2014-05-30 for cmake</span>
    
      - When major library version bumps are needed `*.CMakeList.txt`-s have to be changed at two locations and `debian/lib*N.*` files have to be updated and renamed

  - Include Lua API changes in release notes (Lua dissectors can detect Wireshark version using get\_version() and adjust the API used.)

  - Add privilege separation for dissection <span class="comment" style="display:none">since rev10 2006-03-27</span>

  - Add thread/multiprocessor support <span class="comment" style="display:none">since rev12 2006-04-06</span>

... well, maybe all the points mentioned in the [WishList](/WishList)\!

## Unsorted

  - Security improvements (see also: [Security](/Security))
    
      - Add privilege separation for POSIX environments (in progress) <span class="comment" style="display:none">since rev8 2005-12-12</span>
    
      - Add a similar mechanism for the Windows environment <span class="comment" style="display:none">since forever rev1 2004-10-15</span>
    
      - Enhance the API to make it easier to write secure code (e.g. add `tvb_get_gstring()`)? <span class="comment" style="display:none">since forever rev1 2004-10-15</span>

  - Documentation of library API's (e.g. wiretap) <span class="comment" style="display:none">since forever rev1 2004-10-15</span>

## Discussion

---

Imported from https://wiki.wireshark.org/Development/Roadmap on 2020-08-11 23:13:03 UTC
