# Wireshark Development Workflow

This page is an overview. For actual instructions on creating patches see [CreatingPatches](/CreatingPatches). For instructions on how to use Git and Gerrit to submit patches, see [Development/SubmittingPatches](/Development/SubmittingPatches).

If you have questions, comments regarding the workflow, please send a message to the <wireshark-dev@wireshark.org> mailing list.

# Background

The Wireshark (formerly Ethereal) project was started by Gerald Combs and welcomes patches from external contributors. Over the years, \~50 contributors have been given write access to the version control system (first to CVS then to Subversion), they are known as the [Core Developers](/Developers).

Most of Wireshark's code resides in packet-decoding logic, a.k.a dissectors, spread across many files. There are no official owners of source code or functional subsystems. Developers work on parts of the code based on their interests and needs.

*Prior to the introduction of Gerrit, Core Developers committed code directly to the version control system without code review, but the commits were monitored via the <wireshark-commits@wireshark.org> list for spotting trivial problems. Some of the changes were discussed in advance, especially intrusive ones. Contributors without commit rights submitted their patches through [BugZilla](https://bugs.wireshark.org/bugzilla) or the <wireshark-dev@wireshark.org> mailing list, and those changes were reviewed by at least one Core Developer before being committed. Wireshark is built and tested on several architectures automatically after each commit by [BuildBot](http://buildbot.wireshark.org/trunk/waterfall).*

# Accepting and Committing Changes

Wireshark's code is version managed in Git at <https://code.wireshark.org/review/gitweb?p=wireshark.git;a=summary>. If you are not familiar with Git, please read [Pro Git](http://git-scm.com/book). *master* is the main development branch and *master-2.0*, *master-1.12*, etc. are for maintaining the contents of stable release branches like Wireshark 2.0.x, 1.12.x, etc. respectively. Released versions are tagged as wireshark-\<release version\>, e.g. wireshark-1.12.4.

Every change to the officially managed branches goes through code review using Gerrit at <https://code.wireshark.org/review/>. If you are not familiar with Gerrit, please read [this guide](https://code.wireshark.org/review/Documentation/intro-quick.html).

Please submit your changes through [Gerrit](https://code.wireshark.org/review/) instead of Bugzilla. If you would like to provide an example capture file along with patch, please see [CreatingPatches](/CreatingPatches) on how to do that.

The changes submitted for review can be committed to the target branch after all the following criteria are met:

1.  At least one Core Developer gives a +2. (Core Developers can bypass peer review for trivial changes by giving +2 for their own commits). Although non-core developers can add +1 to a review, these do not accumulate (two +1's does not make a +2) so a Core Developer must be involved in every final commit (see [here](https://code.wireshark.org/review/Documentation/intro-quick.html#_reviewing_the_change) for details).

2.  No Core Developer gives a -2. (There should be no one strongly opposing the change. Disagreements can be resolved in Gerrit comments, on the [mailing lists](https://www.wireshark.org/lists/), or any other way. :laughing:

3.  Code is building in a Petri Dish build, after which the Verified flag is set to +1. Petri Dish builds don't work for the *master-1.x* branches, so builds for those have to be tested otherwise. Once passed the Verify flag can be set to +1.

\[ 4. Code is building and tests are passing on all platforms. (Tests automatically start when a change set is created or updated. Note that there may be tests which are not run for changes under review, just for the branches.)**The automatic build is not in place yet. They have to be requested manually.**\]

After all the criteria are met any Core Developer can push the "Submit Change" button; integration to the target branch does not happen automatically.

Changes are cherry-picked to the target branch by Gerrit to keep the history linear. The rationale behind this is that while merging would reflect the history more accurately, linear history is easier to interpret by humans. Changes with dependencies are cherry-picked after all dependencies are cherry-picked, too. When a cherry-pick can't be done without conflict, the change needs to be updated in the review.

In case of integrating very long branches where cherry-picking would not be feasible merge can be performed outside of Gerrit and the result can be "git push"-ed to the the target branch, but only Gerald and Developers officially selected by him have the rights to push the merge commit.

After each branch change (when a review is finished integrating the change or a new commit is pushed to a branch) all builds and tests are triggered to test the new state. This run includes builds and tests which are omitted for changes under review.

# FAQ

**Q:** Why does the project use Git?

**A:** It was a project decision based on many discussions. Some pointers:

[Should we migrate to a different SCM?](http://ask.wireshark.org/questions/5975/should-we-migrate-to-a-different-scm)

[How about moving from svn to git?](http://www.wireshark.org/lists/wireshark-dev/200911/msg00058.html)

**Q:** Why does the project use Gerrit (why not e.g. [GitHub](http://github.com/))?

**A:** Git allows projects to choose from several typical workflows for collaboration. One is the dictator and lieutenants model followed by the Linux project, where the first line of integration is done by a selected set of developers (lieutenants) responsible for functional areas of the code and the final integrator is the dictator. [GitHub](http://github.com/) emphasizes the social aspect of development and helps this model by implementing pull request and merge based collaboration. In the Wireshark development model on the other hand, functional-area-based code ownership is not very strong and every Core Developer tends to review any kind of change. Gerrit helps in implementing exactly this kind of workflow, where integration is done by peer-review. It is worth noting that in peer-review based integration there is no similar role to the dictator who can be a bottleneck sometimes. Her/his part of role is implemented by Gerrit itself. Gerrit is used by other big projects ([LibreOffice](https://gerrit.libreoffice.org), [Android](https://android-review.googlesource.com/), etc.) with similar development structure.

# Links

## Wireshark's Gerrit site

<https://code.wireshark.org/review/>

## Gerrit in the Wild

[Android](https://android-review.googlesource.com/)

[KitWare](http://review.source.kitware.com/)

[LibreOffice](https://gerrit.libreoffice.org/)

[Qt](https://codereview.qt-project.org/)

[others](https://gerrit.googlesource.com/homepage/+/md-pages/docs/ShowCases.md)

---

Imported from https://wiki.wireshark.org/Development/Workflow on 2020-08-11 23:13:28 UTC
