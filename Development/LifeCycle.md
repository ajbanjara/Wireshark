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

The git change log provides good information about changes in each release:

  - [master-3.2](https://code.wireshark.org/review/gitweb?p=wireshark.git;a=shortlog;h=refs%2Fheads%2Fmaster-3.2)

  - [master-3.0](https://code.wireshark.org/review/gitweb?p=wireshark.git;a=shortlog;h=refs%2Fheads%2Fmaster-3.0)

  - [master-2.6](https://code.wireshark.org/review/gitweb?p=wireshark.git;a=shortlog;h=refs%2Fheads%2Fmaster-2.6)

  - [master-2.4](https://code.wireshark.org/review/gitweb?p=wireshark.git;a=shortlog;h=refs%2Fheads%2Fmaster-2.4)

  - [master-2.2](https://code.wireshark.org/review/gitweb?p=wireshark.git;a=shortlog;h=refs%2Fheads%2Fmaster-2.2)

  - [master-2.0](https://code.wireshark.org/review/gitweb?p=wireshark.git;a=shortlog;h=refs%2Fheads%2Fmaster-2.0)

  - [master-1.12](https://code.wireshark.org/review/gitweb?p=wireshark.git;a=shortlog;h=refs%2Fheads%2Fmaster-1.12)

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

<div>

<table>
<tbody>
<tr class="odd">
<td><p>Version</p></td>
<td><p>Stable Release Date</p></td>
<td><p>End of Life</p></td>
<td><p>Notes</p></td>
</tr>
<tr class="even">
<td><p>3.4</p></td>
<td><p>Q3 2020</p></td>
<td><p>Release + 18 or more months</p></td>
<td><p>Last release to support Red Hat EL 6? Support ends when 3.8.0 is released.</p></td>
</tr>
<tr class="odd">
<td><p>3.2</p></td>
<td><p>December 18, 2019</p></td>
<td><p>June 18, 2021 or later</p></td>
<td><p>Last release to support Windows 7 and Windows Server 2008 R2. Support ends when 3.6.0 is released.</p></td>
</tr>
<tr class="even">
<td><p>3.0</p></td>
<td><p>February 28, 2019</p></td>
<td><p>August 28, 2020 or later</p></td>
<td><p>Support ends when 3.4.0 is released.</p></td>
</tr>
<tr class="odd">
<td><p>2.6</p></td>
<td><p>April 18, 2018</p></td>
<td><p>October 18, 2020</p></td>
<td><p>Long term support (LTS). Last release to support GTK+ and Qt4. Last release to support Mac OS X 10.6 and 10.7 and OS X 10.8, 10.9, 10.10, and 10.11.</p></td>
</tr>
<tr class="even">
<td><p>2.4</p></td>
<td><p>July 19, 2017</p></td>
<td><p>July 19, 2019</p></td>
<td><p>GTK+ UI disabled by default.</p></td>
</tr>
<tr class="odd">
<td><p>2.2</p></td>
<td><p>September 7, 2016</p></td>
<td><p>September 7, 2018</p></td>
<td><p>Last release to support Windows Vista and (the non-R2) Windows Server 2008.</p></td>
</tr>
<tr class="even">
<td><p>2.0</p></td>
<td><p>November 18, 2015</p></td>
<td><p>November 18, 2017</p></td>
<td><p>Last release to support OS X on 32-bit x86.</p></td>
</tr>
<tr class="odd">
<td><p>1.12</p></td>
<td><p>July 31, 2014</p></td>
<td><p>July 31, 2016</p></td>
<td><p>Last release using the GTK+ GUI by default. Last release to support Windows Server 2003.</p></td>
</tr>
<tr class="even">
<td><p>1.10</p></td>
<td><p>June 5, 2013</p></td>
<td><p>June 5, 2015</p></td>
<td><p>Last release to support Windows XP and U3 packages.</p></td>
</tr>
<tr class="odd">
<td><p>1.8</p></td>
<td><p>June 21, 2012</p></td>
<td><p>June 21, 2014</p></td>
<td><p>Last release to support Mac OS X on PPC.</p></td>
</tr>
<tr class="even">
<td><p>1.6</p></td>
<td><p>June 7, 2011</p></td>
<td><p>June 7, 2013</p></td>
<td><p>Last release that compiles on Red Hat EL 5.</p></td>
</tr>
<tr class="odd">
<td><p>1.4</p></td>
<td><p>August 30, 2010</p></td>
<td><p>August 30, 2012</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>1.2</p></td>
<td><p>June 15, 2009</p></td>
<td><p>June 30, 2011</p></td>
<td><p>Last release to support Windows 2000.</p></td>
</tr>
<tr class="odd">
<td><p>1.0</p></td>
<td><p>March 31, 2008</p></td>
<td><p>September 30, 2010</p></td>
<td><p>Last release to support GTK+ 1.0.</p></td>
</tr>
</tbody>
</table>

</div>

## Discussion

[Support for Windows 7 ended on January 14, 2020](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet). Wireshark 3.2 is the last release that supports it.

[Support for Windows Vista ended on April 11, 2017](https://support.microsoft.com/en-us/help/22882/windows-vista-end-of-support). Wireshark 2.2 is the last release that supports it.

[Support for Windows XP ended](https://support.microsoft.com/en-us/help/14223/windows-xp-end-of-support) on April 8, 2014. Wireshark 1.10 is the last release that supports it.

U3 [reached end of life](http://kb.sandisk.com/app/answers/detail/a_id/5358/~/u3-launchpad-end-of-life-notice) in 2009. We stopped producing U3 packages when 1.10 reached end of life.

---

Imported from https://wiki.wireshark.org/Development/LifeCycle on 2020-08-11 23:12:53 UTC
