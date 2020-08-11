# Backporting Changes

Bug fixes are typically [cherry-picked](http://git-scm.com/docs/git-cherry-pick) from the [development branch](https://code.wireshark.org/review/gitweb?p=wireshark.git;a=shortlog;h=refs/heads/master) to each stable branch. Backporting can be done a number of ways.

## Using Your Web Browser

If you have an account on Wireshark's [code review system](https://code.wireshark.org/review/) the easiest way by far to backport a change is to click the "Cherry Pick" button in the web interface and enter the destination branch (e.g. "master-2.0").

If cherry-picking didn't work (due to a merge conflict) or the change doesn't exist (because it predates our migration to Git) you will have to backport the change manually.

## Using Git

If you want to propose a change for backporting, please cherry pick it and push it to HEAD:refs/for/master-1.10 or HEAD:refs/for/master-1.8 via Git at <https://code.wireshark.org/review>. For example, to cherry-pick from master (SVN trunk) to master-1.10 (SVN trunk-1.10) you would do the following. We're assuming you have already [cloned the Wireshark git repository](https://code.wireshark.org/review/#/admin/projects/wireshark) and are in your local copy.

If you haven't created a local branch for the previous release you're going to back port to, you should do that first as follows:

    # start from master branch
    $ git checkout master
    
    # the first time, create a local branch off of master, based on the tag
    # name of the version you want to back-port to (using wireshark-1.12 in this example):
    $ git checkout -b master-1.12 origin/master-1.12
    
    # once you've done the above once, next time do this to check out this version branch:
    $ git checkout master-1.12

Note that what the above "`checkout -b`" line does is create a local branch off of master called `master-1.12`. When you back-port to release 1.12, you'll be creating a branch off of the `master-1.12` branch; when back-porting to release 1.10, you'll create a branch off of a `master-1.10` branch; and so on.

Once you're in `master-1.12`, do the following:

    # Find a commit from the master branch...
    $ git log origin/master
    
    # ...or find it using its SVN revision
    $ git log --grep revision=45678 origin/master
    
    # create a branch named "backport-r45678", off of your master-1.12
    $ git checkout -b backport-r45678
    
    # Pull in the change from master. Use "-x" to add a "cherry picked from" message.
    $ git cherry-pick -x b88ff840a31

If you encounter merge errors, see [Development/SubmittingPatches](/Development/SubmittingPatches) for information on what to do. Note that you will have to amend your commit after fixing any errors.

If your editor opens a commit message page to edit for this, do *not* delete the existing Change-ID and Reviewer information. Keep that, but delete any `Conflicts:` lines, including the `Conflicts:` line itself. Once everything is ready you can upload your change to the server:

    # Upload the change to Gerrit using the git-review script...
    $ git review -f
    
    # ...or uploading it using Git
    $ git push origin HEAD:refs/for/master-1.12/backport-r45678

At this point Gerrit might complain about a missing Change ID. You can run

    git commit --amend

Add the **same** Change-ID as the original change you're backporting. Gerrit will know this is a new change and create a new review, because it's off of a different branch, but by keeping the same Change-ID gerrit shows it as part of the same change history.

    # upload the change for review
    $ git push origin HEAD:refs/for/master-1.12/backport-r45678

To permanently avoid having to manually add the Change-ID, see [gerrit change-ids](https://code.wireshark.org/review/Documentation/user-changeid.html).

At some future time after your pushed commit has been put into master-1.12 on wireshark.org, you can go back to your local master-1.12 branch, pull down from wireshark.org, rebase your backport branch, and then delete it. Note that `git-review -f` does this for you automatically.

---

Imported from https://wiki.wireshark.org/Development/Backporting on 2020-08-11 23:12:39 UTC
