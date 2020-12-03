[[_TOC_]]

:information_source: **We migrated from Gerrit to GitLab on August 23rd, 2020**

We migrated from [Gerrit](https://code.wireshark.org/review/) to [GitLab](https://gitlab.com/wireshark/wireshark/tree/master).
The instructions below are being updated for use with GitLab.
See the [Migrating From Gerrit](#migrating-from-gerrit) section if you have an open change there.

For complete instructions on contributing code, see the [contribution section of the Developer's Guide](https://www.wireshark.org/docs/wsdg_html_chunked/ChSrcContribute.html).

# Quickstart

The sample below demonstrates the workflow for a patch. Replace `USERNAME` with your GitLab username and `BRANCH_NAME` with the name you choose for your branch:

    $ # Prepare your environment:
    $ git clone -o upstream git@gitlab.com:wireshark/wireshark.git
    $ cd wireshark
    $ git remote add downstream git@gitlab.com:USERNAME/wireshark.git
    $ cp tools/pre-commit .git/hooks
    $ chmod a+x .git/hooks/pre-commit
    
    $ # Submit a patch:
    $ git checkout -b BRANCH_NAME
    Switched to a new branch 'BRANCH_NAME'
    <Make changes>
    $ git commit
    $ git push downstream HEAD
    Enumerating objects: 14, done.
    Counting objects: 100% (14/14), done.
    Delta compression using up to 8 threads
    Compressing objects: 100% (13/13), done.
    Writing objects: 100% (13/13), 148.07 KiB | 21.15 MiB/s, done.
    Total 13 (delta 6), reused 0 (delta 0), pack-reused 0
    remote:
    remote: To create a merge request for BRANCH_NAME, visit:
    remote:   https://gitlab.com/USERNAME/wireshark/merge_requests/new?merge_request%5Bsource_branch%5D=BRANCH_NAME
    remote:
    To gitlab.com:USERNAME/wireshark.git
     * [new branch]      HEAD -> BRANCH_NAME

    $ # Amend your current change (e.g.: edit commit message, add additional tests):
    <Make changes>
    $ git commit -a --amend
    $ git push downstream +HEAD
    $ # ...or add a separate commit on top of the current change:
    < make some changes>
    $ git commit -a
    $ git push downstream HEAD

    $ # Work complete! Delete the local BRANCH_NAME branch:
    $ git checkout master
    Switched to branch 'master'
    $ git branch -D BRANCH_NAME
    Deleted branch BRANCH_NAME (was c159b39).
    
    $ # Oops! Need to make more changes to the BRANCH_NAME branch:
    $ git fetch upstream
    $ git checkout upstream BRANCH_NAME

    $ # Oops! Need to squash commits:
    $ git checkout BRANCH_NAME
    $ # Replace the '10' with the number of commits to squash together
    $ # In your editor, keep 'pick' for your first commit and replace the other 'pick's with 'squash':
    $ git rebase -i @~10 --rebase-merges
    $ git push downstream +HEAD

# Setup

- Install git. For Windows users see [this page](/Development/SubmittingPatches/GitForWindows) for help with that.

- Go to https://gitlab.com and sign in. You can register a GitLab account directly, or sign in using your GitHub, Google, Bitbucket, and other accounts.

- Go to https://gitlab.com/profile/keys and add an SSH key.

- Go to https://gitlab.com/wireshark/wireshark/ and click the "Fork" button.
This will create your own personal copy of the Wireshark repository.

- Now you should be able to clone the main repository and add your personal repository:
    ```
    git clone -o upstream git@gitlab.com:wireshark/wireshark.git
    cd wireshark
    git remote add downstream git@gitlab.com:<your.username>/wireshark.git
    ```

<!-- Install one of the GitLab CLIs? -->

## Git Hooks

In your local repository directory, there will be a `.git/hooks/` directory, with sample git hooks for running [automatic actions before and after git commands](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks). 

Wireshark provides a custom pre-commit hook which performs general checks along with Wireshark-specific API and formatting checks, but it might return false positives.
If you want to install it, copy the `pre-commit` file from the `tools` directory (`cp ./tools/pre-commit .git/hooks/`) and make sure it is executable.
Alternatively, you can use Git's sample git pre-commit hook which detects whitespace errors such as mixed tabs and spaces.
To install it, copy or rename the existing `.git/hooks/pre-commit.sample` file to `.git/hooks/pre-commit`.
If the pre-commit hook is preventing you from committing what you believe is a valid change, you can run `git commit --no-verify` to skip running the hooks.

The Gerrit code review system required a commit-msg hook. This is no longer necessary.

# Submitting A Change

- Create and checkout a new branch with a name related to the type of change (e.g. the bug number you're fixing or the dissector you're working on):
    ```
    git checkout -b my-branch-name upstream/master
    ```
    This creates a branch named "my-branch-name" based on the master branch in the official repository.

- Make your changes and test they work.

- Use `git add FILE1 FILE2...` to stage the files you've changed or added for commit.
    
- Alternatively, use `git commit -a`, which commits it and adds all *existing* changed files to the commit automatically (but not newly-created files).
(You'll still need to use `git add FILE` for new files.)

- Run `git commit` to commit your change, or `git commit -a` as noted above.
You can use "#" to [reference issues](https://docs.gitlab.com/ee/user/markdown.html#special-gitlab-references), for example "closes \#1234" to close issue 1234. 

- Run `git push downstream HEAD`. This pushes the current branch (my-branch-name) to your personal repository.

- Go to https://gitlab.com/wireshark/wireshark/merge_requests.  
(Should this be https://gitlab.com/USERNAME/wireshark/merge_requests ??? See above)  
You should see a "New merge request" button for your branch.
Press it.

  - Make sure the "**Merge options** / Delete source branch when merge request is accepted" box is checked if desired.

  - Make sure the "**Contribution** / [Allow commits from members who can merge to the target branch](https://docs.gitlab.com/ee/user/project/merge_requests/allow_collaboration.html)"
box is checked. This will allow members of the Wireshark core team to rebase your commit before applying. Since Wireshark only allows fast-forward merges, without this option you yourself will have to return to your merge request to rebase it before it can be merged if any other requests have been merged during the review process.

  - Once you're satisfied with everything, press the “Submit merge request” button.

# The Review Process

To see the status of the review process, go to the URL returned in the previous step and see/discuss the patch and its current review status.
When you create a merge requests, a series of tests will be run.

# Writing A Good Commit Message

When running `git commit`, you will be prompted to describe the change. Here are some guidelines on how to make that message actually useful to other people (and to scripts that may try to parse it):

- Provide a very brief description (under 60 characters) of the change in the first line.

  - If the change is specific to a single protocol, start this line with the abbreviated name of the protocol and a colon.
    
  - If the change is not complete yet, prefix the line with `[WIP]` to inform this change not to be submitted yet. This can be removed later.

- Insert a single blank line after the first line.

- Provide a detailed description of the change in the following lines, breaking paragraphs where needed. Limit each line to 80 characters.

As mentioned above, you can use "#" to [reference issues](https://docs.gitlab.com/ee/user/markdown.html#special-gitlab-references).
"Closes #1234" is special -- it will close issue 1234 when the change is merged, while other references such as "see #4512" will simply link to the issue. 

<!-- XXX Fix issue URL when the migration is complete. -->
:bulb: If you're contributing a non-trivial fix to a dissector, you should [open an issue](https://gitlab.com/wireshark/wireshark/-/issues) and attach a sample capture file.

Putting all that together, we get the following example:

    MIPv6: Fix dissection of Service Selection Identifier

    APN field is not encoded as a dotted string so the first character is not a
    length. Closes #10323.

# Amending a Change

If you need to update your merge request you can do so by doing the following:

- Check out the existing branch:
    ```
    git checkout my-branch-name
    ```

- Make your changes, and `git add` them as described in [Submitting a Change](#submitting-a-change).
Alternatively, `git commit -a --amend` will automatically add the changed tracked files.

- Run `git commit --amend` to update your existing commit, or `git commit -a --amend` as noted above.

- Do **NOT** change your branch name.
That's how GitLab associates your change with the original merge request.

- Do **NOT** add entries to the commit message describing the changes in a particular additional patch, the commit message should only reflect the overall intent of the change, not how it progressed, i.e. we don't need to see how sausages are made. GitLab provides the ability to diff between patches to review these anyway.

- Run `git push downstream +HEAD`.
The "+" is shorthand for force-pushing and will be needed if you amended your commit.
Multiple commits are also allowed.

# Fixing Merge Errors

Sometimes a reviewer/core developer will tell you your change has merge issues.
This just means some other changes have conflicted with your change in ways that git cannot fix automatically.
To resolve this, you need to fix the merge errors in your local branch and push a new patch set to GitLab for the same review.
Here are the steps:

- Check out your existing branch:
    ```
    git checkout my-branch-name
    ```

- Rebase against the Wireshark master:
    ```
    git pull --rebase upstream/master
    ```
    This fetches Wireshark's master branch and reapplies your changes on top of it.

- At this point you will likely have merge errors -- otherwise you wouldn't have been told so by the reviewer.
Git will produce a message telling you this, with lines such as:
    ```
    CONFLICT (content): Merge conflict in ui/qt/main_window.ui
    Auto-merging ui/qt/main_window.h
    Failed to merge in the changes.
    ```
    The `CONFLICT` line tells you the name of a file that failed to merge.

- You can also do a `git status` to see what files are not merged for the rebase - they're the ones that are in red at the bottom, under the section `Unmerged paths`.
Those are the ones with merge errors.

- Open the offending file(s) in your editor, and search for the string "<<<<<<<".
You will see "<<<<<<<" and ">>>>>>>" lines, which git put in to show the conflicting lines for what's in HEAD (which is `master`) vs. what's in your local branch you're trying to rebase.
The unmerged lines from each branch are separated by a "=======" line.
Some editors have conflict resolution features that make fixing this more convenient.

- Fix the conflicts, by deleting the "<<<<<<<" and ">>>>>>>" and "=======" lines, and correcting the code such that the final is what the code should be once the rebasing is complete.

- Save your file.

- Run `git add FILENAME` to add the just-fixed file(s) to the staging area.

- Run `git rebase --continue` to continue.
You may hit more merge errors and need to repeat the above steps to resolve them.

- Once they're all resolved, commit the changes using `git commit --amend`, save the commit message again without changing the Change-ID line in it, and `git push downstream +HEAD` to push it to your repository.
 
    - Note the `--amend` option is being used, because you don't want to generate a new commit and new review; you just want to upload a new patch set for the previous review.

- You're done!

# Cleaning Up After A Merge

At some point (hopefully soon) your code changes will be merged into the master branch in gitlab.com/wireshark/wireshark.
When that happens, it's safe to delete the changes branch in your local and personal GitLab repository.

You can delete both from the command line:

    # Delete your local branch
    git branch -d my-branch-name
    # Delete your remote branch
    git push -d downstream my-branch-name

You can also delete merged branches in your personal repository in the [GitLab web UI](https://docs.gitlab.com/ee/user/project/repository/branches/#delete-merged-branches).

<!-- XXX Gerrit-era instructions are below. Do they still apply?

 You could force git to delete it using the `-D` option, but this is a better/cleaner way:

  - Check out your local `master`: `git checkout master`

  - Pull down the latest changes to it: `git pull`
    
      - `git pull` does both a `git fetch` and `git merge`. So long as you made no local changes to your local `master`, this step should just work.

  - Rebase your changes to the latest master: `git rebase master my-branch-name`
    
      - If you hit a merge/rebase error at this point, go to the previous section and follow the instructions, but do not push it up again with `gerrit review`, instead just locally commit it.

  - Checkout `master` again: `git checkout master`

  - Delete the branch by issuing `git branch -d my-branch-name`
    
      - Note the lower-case `-d` option, not the upper-case `-D` which forces a deletion.
-->

## Testing Someone Else's Merge Request

If you would like to test someone else's merge request or personal repository branch you can do the following:

    # Fetch their branch to a local branch named FETCH_HEAD.
    git fetch https://gitlab.com/some-other-user/wireshark.git their-branch-name
    # Create a branch from FETCH_HEAD with a more useful name.
    git checkout -b other-user-branch-name FETCH_HEAD

Each [merge request](https://gitlab.com/wireshark/wireshark/-/merge_requests) will have a "Check out branch" button with similar instructions.

# Undoing A Change

If you haven't committed yet and want to undo changes to a file, run `git checkout -- $FILES` to revert to the last version.
To undo changes to the whole tree, run `git checkout` with no path.

If you've staged a change with `git add` but haven't committed yet, run `git reset HEAD $FILES` to unstage them (and then git checkout to actually undo the changes).
Note that "HEAD" is literal text, not a variable.

If your change is in master, you should revert the change in a new commit with `git revert $SHA`. This generates a new commit, which must go through the normal review process.

# Backporting A Change To A Release Branch

Some changes that fix bugs should also be applied to release branches, so that the bugs are fixed in the next regular Wireshark releases.

Changes that backport cleanly by cherry-picking them can be backported by using the "Cherry-pick" option in the "Options" item on the page for the [commit](https://gitlab.com/wireshark/wireshark/-/commits/master). (**N.B.**, *not* the page for the merge request.) The "Cherry-pick" option will pop up a dialog; choose the branch to which the change should be cherry-picked, and leave "Start a '''new merge request''' with these changes" checked.  Clicking "Cherry-pick" will take you to a page for a new merge request; follow the instructions for merge requests in "Submitting A Change" above.

Changes that *don't* backport cleanly by cherry-picking them will require some editing on your part in order to backport them.  To backport a change to a release branch that can't be cleanly cherry-picked:

- If necessary, do a `git pull` to update your repository so that it includes the change.

- Create and checkout a new branch with a name related to the type of change (e.g. the bug number you're fixing or the dissector you're working on):
    ```
    git checkout -b my-branch-name upstream/master-X.Y
    ```
    where "master-X.Y" is the release branch to which to backport the change.

    This creates a branch named "my-branch-name" based on the master-*X*.*Y* branch in the official repository.

- Cherry-pick the fix:
    ```
    git cherry-pick -x {commit}
    ```
    where {commit} is the commit ID of the commit to backport.

- Fix any merge errors that show up as a result of the cherry-pick.

- Build the code with the cherry-picked change and test the change.

- Run `git commit` to commit your change. 

- Run `git push downstream HEAD`. This pushes the current branch (my-branch-name) to your personal repository.

- Go to https://gitlab.com/wireshark/wireshark/merge_requests.
You should see a "New merge request" button for your branch.
Press it.

  - Select the release branch as the "**Target branch**".

  - Make sure the "**Merge options** / Delete source branch when merge request is accepted" box is checked if desired.

  - Make sure the "**Contribution** / [Allow commits from members who can merge to the target branch](https://docs.gitlab.com/ee/user/project/merge_requests/allow_collaboration.html)"
box is checked. This will allow members of the Wireshark core team to rebase your commit before applying. Since Wireshark only allows fast-forward merges, without this option you yourself will have to return to your merge request to rebase it before it can be merged if any other requests have been merged during the review process.

  - Once you're satisfied with everything, press the “Submit merge request” button.

The rest of the steps given above apply to this change.

# A Super-Short Overview Of Git

Git manages a collection of commits, each identified by its unique SHA. Each commit (except the very first) contains a pointer to one or more parent commits, thus forming a history (technically a [DAG](https://en.wikipedia.org/wiki/Directed_acyclic_graph)).

Since multiple commits can have the same parent, and a single commit can have multiple parents, this allows branches of development to diverge and be merged. A branch diverges when two commits share a parent, and the branch merges when a single commit contains both branches as its parent:

``` 
  A
  |
  B
  |
  C
 / \
D   E
|   |
F   |
|   |
G   H
 \ /
  I
```

A label is a fixed mapping from a text string to a commit SHA, so for example tag "v1.10.6" simply points to SHA "3dac78778cca8a7838350c67d322c90053977d8a" which is a commit.

A "branch" is exactly the same; a mapping from a text string to a commit SHA. However, a branch is not fixed; when you make a new commit whose parent is currently a branch, that branch is updated to the new commit.

Before:

    A
    |
    B <- branch: master-1.10, tag: v1.10.6

After a new commit:

    A
    |
    B <- tag: v1.10.6
    |
    C <- branch: master-1.10

You can run `git checkout BRANCHNAME` to switch between branches you're working on, branches you're reviewing, and master.

A more comprehensive description of git can be found in [this book](https://git-scm.com/book/en/v2)

### Watching changes

GitLab does not currently provide a way to track the changes happening on a specific file. It is a frequently requested [open issue](https://gitlab.com/gitlab-org/gitlab/-/issues/1817), so support may be added some time in the future.

# Migrating From Gerrit

Prior to using GitLab, Wireshark used the [Gerrit code review system](https://code.wireshark.org/review). Here are a few things to keep in mind when migrating to GitLab:

**GitLab associates branches with merge requests**

Gerrit required a unique identifier (e.g. `Change-Id: I58b2f0f5eeec85c891bd7fdbb6132eb8147baabf`) in git commit messages in order to associate a commit with a change.
GitLab uses a branch name in your personal repository.
When you update a merge request, be sure to push it to the same branch name as before. 

**You need to remove your `commit-msg` hook.**

Gerrit enforced change IDs using a `commit-msg` hook script.
You should remove `.git/hooks/commit-msg`.

**You need to update your remotes.**

Your local repository might have a remote named "origin" or "gerrit" that points to "ssh://code.wireshark.org/wireshark".
You can leave it as-is or rename it, but it [might not be updated](https://bugs.chromium.org/p/gerrit/issues/detail?id=656) after the migration.

The documentation here and in the [Developer's Guide](https://www.wireshark.org/docs/wsdg_html_chunked/) assumes that you have an "upstream" remote for the main repository and a "downstream" remote for your personal repository:

    git remote add upstream git@gitlab.com:wireshark/wireshark.git
    git remote add downstream git@gitlab.com:USERNAME/wireshark.git

You can name the remotes anything you like.

If you [mirror your fork](https://about.gitlab.com/blog/2016/12/01/how-to-keep-your-fork-up-to-date-with-its-origin/) you only need the "downstream" remote.

**Gerrit changes weren't migrated to GitLab merge requests**

Although bugs were migrated to issues, changes must be migrated individually.
You can migrate a change by doing the following:

```
# Download the change using git-review...
$ git review -d 12345
...OR click on the "download" link in the change and copy+paste the checkout command.
$ git fetch https://code.wireshark.org/review/wireshark refs/changes/72/38172/2 && git checkout -b my-change FETCH_HEAD
# Double-check your branch name.
$ git status
# Push the change to GitLab.
$ git push downstream HEAD
```

**Bugs / issues are linked differently**

Prior to the migration you could link to bugs using "Bug: 1234" or "Ping-Bug: 1234".
Issue numbers in GitLab must be prefixed with a number sign (#).
You can automatically close an issue with "closes", e.g. "closes #1234".

**There are multiple CLI options.**

Prior to the migration, we used the [git-review](https://opendev.org/opendev/git-review) tool to manage changes on the command line.
The following tools might let us manage merge requests, but more testing needs to be done.

* https://github.com/zaquestion/lab - Go. Single binary for each major platform.
* https://invent.kde.org/sdk/git-lab - Python. Developed by the KDE team.
* https://github.com/vishwanatharondekar/gitlab-cli - Node / NPM.

---

Imported from https://wiki.wireshark.org/Development/SubmittingPatches on 2020-08-11 23:13:08 UTC
