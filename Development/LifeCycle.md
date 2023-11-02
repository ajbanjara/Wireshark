# Release Life Cycle

The [Wireshark download page](https://www.wireshark.org/download.html) lists three types of releases: *Stable*, *Old Stable*, and *Development*.

  - The Stable release is the latest official version of Wireshark. In most cases this is the version you should use.
  - The Old Stable release is an older official version of Wireshark which is still supported. You may be required to use one of these, for example if your organization has strict software approval policies.
  - The Development version is used for testing new features. Use this if you need one of those features.

The Stable and Old Stable release lifetimes conform to the following guidelines:

  - At least two (and preferably exactly two) branches will be supported at any given time.

  - Each release shall be supported for a minimum of 18 months. Support might be extended to 24 or 30 months, e.g. for releases preceding a major change.

  - Support for release X.Y ends when it reaches the end of its minimum lifetime or when version X.Y+4 is released, whichever comes **later**.

Depending on the pacing of major releases and their lifetimes we might have an "Old Old Stable" branch in addition to the Stable and Old Stable ones.

See [End of Life planning](/Development/LifeCycle#end-of-life-planning) for life cycle information specific to each release.

A more detailed description can be found in the [Release Policy](/Development/ReleasePolicy).

## Staying Current

Wireshark releases are announced on the [wireshark-announce](https://www.wireshark.org/lists/) mailing list. A [PAD](http://pad.asp-software.org/) file is also published at <https://www.wireshark.org/wireshark-pad.xml>.

## Release Numbers

To understand the numbering of the releases, see the explanation of [release numbers](/Development/ReleaseNumbers).

## Release Planning

For the planning of the upcoming releases and their proposed contents see the [roadmap](/Development/Roadmap).

## Past Releases

Release Notes for each release are available on the [main site](https://www.wireshark.org/docs/relnotes/).  
[Version Info](/Development/Version-Info) (build components) for past Windows releases.

The git change log provides good information about changes in each release:

- [release-4.2](https://gitlab.com/wireshark/wireshark/commits/release-4.2)
- [release-4.0](https://gitlab.com/wireshark/wireshark/commits/release-4.0)
- [release-3.6](https://gitlab.com/wireshark/wireshark/commits/release-3.6)
- [release-3.4](https://gitlab.com/wireshark/wireshark/commits/release-3.4)
- [master-3.2](https://gitlab.com/wireshark/wireshark/commits/master-3.2)
- [master-3.0](https://gitlab.com/wireshark/wireshark/commits/master-3.0)
- [master-2.6](https://gitlab.com/wireshark/wireshark/commits/master-2.6)
- [master-2.4](https://gitlab.com/wireshark/wireshark/commits/master-2.4)
- [master-2.2](https://gitlab.com/wireshark/wireshark/commits/master-2.2)
- [master-2.0](https://gitlab.com/wireshark/wireshark/commits/master-2.0)
- [master-1.12](https://gitlab.com/wireshark/wireshark/commits/master-1.12)

Changes for older releases are listed in wiki pages:

- [Development/Trunk-1.10](/Development/Trunk-1.10)
- [Development/Trunk-1.8](/Development/Trunk-1.8)
- [Development/Trunk-1.6](/Development/Trunk-1.6)
- [Development/Trunk-1.4](/Development/Trunk-1.4)
- [Development/Trunk-1.2](/Development/Trunk-1.2)
- [Development/Trunk-1.0](/Development/Trunk-1.0)
- [Development/BetaReleases](/Development/BetaReleases)

## End of Life planning

In order to limit the development burden, support for a (old-)stable release is eventually ended. This is the planning for abandoning old releases. A note is added why such release may still be relevant for you.

| Version | Stable Release Date | End of Support               | Notes |
|----|----|----|----|
| 4.2     | Q4, 2023            | Release + 18 or more months | Support ends when 4.6.0 is released. Last release to support macOS 10.14 on Intel.                                                                          |
| 4.0     | September 28, 2022  | Release + 18 or more months | Support ends when 4.4.0 is released.                                                                           |
| 3.6     | November 22, 2021   | May 22, 2024 | Long term support (LTS). Last release to support 32-bit Windows. Last release to support macOS 10.13 on Intel. Last release to support Red Hat EL 7. Last release to support SUSE Linux ES 12. |
| 3.4     | October 29, 2020    | April 29, 2022 or later | Support ends when 4.0.0 is released.                                                                           |
| 3.2     | December 18, 2019   | November 22, 2021   | Last release to support Windows 7 and Windows Server 2008 R2. |
| 3.0     | February 28, 2019   | October 29, 2020    | Last release to support macOS 10.12. |
| 2.6     | April 18, 2018      | October 18, 2020            | Long term support (LTS). Last release to support GTK+ and Qt4. Last release to support Red Hat EL 6. Last release to support Mac OS X 10.6 and 10.7 and OS X 10.8, 10.9, 10.10, and 10.11. |
| 2.4     | July 19, 2017       | July 19, 2019               | GTK+ UI disabled by default.                                                                                                                         |
| 2.2     | September 7, 2016   | September 7, 2018           | Last release to support Windows Vista and (the non-R2) Windows Server 2008.                                                                          |
| 2.0     | November 18, 2015   | November 18, 2017           | Last release to support OS X on 32-bit x86.                                                                                                          |
| 1.12    | July 31, 2014       | July 31, 2016               | Last release using the GTK+ GUI by default. Last release to support Windows Server 2003.                                                             |
| 1.10    | June 5, 2013        | June 5, 2015                | Last release to support Windows XP and U3 packages.                                                                                                  |
| 1.8     | June 21, 2012       | June 21, 2014               | Last release to support Mac OS X on PPC.                                                                                                             |
| 1.6     | June 7, 2011        | June 7, 2013                | Last release that compiles on Red Hat EL 5.                                                                                                          |
| 1.4     | August 30, 2010     | August 30, 2012             |                                                                                                                                                      |
| 1.2     | June 15, 2009       | June 30, 2011               | Last release to support Windows 2000.                                                                                                                |
| 1.0     | March 31, 2008      | September 30, 2010          | Last release to support GTK+ 1.0.                                                                                                                    |

## Discussion

[Support for Windows 7 ended on January 14, 2020](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet). Wireshark 3.2 is the last release that supports it.

[Support for Windows Vista ended on April 11, 2017](https://support.microsoft.com/en-us/help/22882/windows-vista-end-of-support). Wireshark 2.2 is the last release that supports it.

[Support for Windows XP ended](https://support.microsoft.com/en-us/help/14223/windows-xp-end-of-support) on April 8, 2014. Wireshark 1.10 is the last release that supports it.

U3 [reached end of life](http://kb.sandisk.com/app/answers/detail/a_id/5358/~/u3-launchpad-end-of-life-notice) in 2009. We stopped producing U3 packages when 1.10 reached end of life.

---

Imported from https://wiki.wireshark.org/Development/LifeCycle on 2020-08-11 23:12:53 UTC
