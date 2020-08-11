[[_TOC_]]

## Setup

  - Install git. For Windows users see [this page](/Development/SubmittingPatches/GitForWindows) for help with that.

  - Go to Wireshark's [Gerrit Code Review](https://code.wireshark.org/review/) site and sign in. Gerrit supports OpenID, so if you've got an account with Google, Yahoo, Launchpad, Wordpress, Blogger or any of a dozen other OpenID providers you will be able to use that account.

  - Once you've logged in, Gerrit will prompt you for your SSH public key. Add that.

  - Now you should be able to clone the repository by running:

`git clone ssh://USERNAME@code.wireshark.org:29418/wireshark`

  - For convenience, install the git-review tool. This should be as easy as `pip install git-review` if you've already got python installed (which you probably do). Command options `man git-review` or [1.28.0 copy here.](/Development/SubmittingPatches/Git-Review)

  - Run `git review -s` in your repository to set up Git's `commit-msg` hook which is necessary for Gerrit integration.

### Git Hooks

In your local repository directory, there will be a `.git/hooks/` directory, with sample git hooks for running automatic actions before and after git commands. The `git review -s` at the end of the previous section installed a `commit-msg` hook here. If you don't use `git review` you have to install the commit-msg hook from the tools directory yourself, in order to generate the `Change-ID` required by Gerrit. Copy the `commit-msg` file from the `tools` directory (`cp ./tools/commit-msg .git/hooks/`) and make sure it is executable or it will not be run. You can also optionally install other hooks that you find useful.

In particular, the `pre-commit` hook will run every time you commit a change and can be used to automatically check for various errors in your code. The sample git pre-commit hook simply detects whitespace errors such as mixed tabs and spaces; to install it, rename the existing `.git/hooks/pre-commit.sample` file to `.git/hooks/pre-commit`.

Wireshark provides a custom pre-commit hook which does additional Wireshark-specific API and formatting checks, but it might return false positives. If you want to install it, copy the `pre-commit` file from the `tools` directory (`cp ./tools/pre-commit .git/hooks/`) and make sure it is executable or it will not be run.

If the pre-commit hook is preventing you from committing what you believe is a valid change, you can run `git commit --no-verify` to skip running the hooks. *Warning:* using `--no-verify` avoids the commit-msg hook, and thus will not automatically add the required `Change-ID` to your commit. In case you are not updating an existing patch you may generate a `Change-ID` by running `git review -i` (or `git commit --amend` if don't use git review).

## Submitting a Change

  - Create and checkout a new branch with a name related to the type of change (e.g. the bug number you're fixing or the dissector you're working on): `git checkout -b my-branch-name`
    
      - This is a shortcut for the commands `git branch my-branch-name && git checkout my-branch-name`, which would create a branch named `my-branch-name` and then check it out.
    
      - Unless you really want to do something unusual, you should be creating these off of the local `master` branch. To see what branch you're on, do `git branch` and the one with the `*` next to it is the one you're currently on. To change to `branch-name`, do `git checkout branch-name` (so to change to `master` do `git checkout master`).

  - Make your changes and test they work.

  - Use `git add FILE1 FILE2...` to stage the files you've changed for commit.
    
      - Alternatively, use `git commit -a`, which commits it and adds all *existing* changed files to the commit automatically (but not newly-created files).
    
      - If you need to add a new file to git, you should use `git add FILE`.

  - Run `git commit` to commit your change, or `git commit -a` as noted above.

  - Run `git review` (or use to `git push origin HEAD:refs/for/master/BRANCH_NAME` if you don't have git review and replace BRANCH\_NAME by the name of your branch) to upload it to Gerrit. On success this will return a URL which is the location of the Gerrit review.

## The review process

To see the status of the review process, go to the URL returned in the previous step and see/discuss the patch and its current review status.

Alternatively the gerrit command line may be used:

  - Use the web interface to upload your ssh public key if not already done.

  - Access gerrit by running e.g. `ssh USERNAME@code.wireshark.org -p29418 gerrit --help`

Useful gerrit commands:

  - Submit a change: `ssh USERNAME@code.wireshark.org -p29418 gerrit review --submit --code-review +1 NUMBER_RETURNED_ABOVE --message "'MESSAGE GOES HERE'"`

<!-- end list -->

  - Run Petri-Dish: `ssh USERNAME@code.wireshark.org -p29418 gerrit review --label Petri-Dish=+1 NUMBER_RETURNED_ABOVE --message "'MESSAGE GOES HERE'"`
    
      - Only core devs can run Petri Dish for non-draft changes

Find them all [here](https://code.wireshark.org/review/Documentation/cmd-index.html).

### Writing a Good Commit Message

When running `git commit`, you will be prompted to describe the change. Here are some guidelines on how to make that message actually useful to other people (and to scripts that may try to parse it):

  - Provide a very brief description (under 60 characters) of the change in the first line.
      - If the change is specific to a single protocol, start this line with the abbreviated name of the protocol and a colon.
    
      - If the change is not complete yet prefix the line with `[WIP]` to inform this change not to be submitted yet. This can later be removed.
  - Insert a single blank line after the first line.
  - Provide a detailed description of the change in the following lines, breaking paragraphs where needed. Limit each line to 80 characters.

You can also add metadata at the bottom of the commit message which will be used by Gerrit for searching and triggering [Bugzilla](https://bugs.wireshark.org) integration. Each line of the footer is of the form `Label: value`. There can be no extra line-breaks between footer lines.

Wireshark currently supports the following metadata tags:

<div>

<table>
<tbody>
<tr class="odd">
<td><p><strong>Tag</strong>             </p></td>
<td><p><strong>Meaning</strong></p></td>
</tr>
<tr class="even">
<td><p><code class="backtick">Change-Id</code></p></td>
<td><p>A unique hash describing the change, which is generated automatically by the git <code class="backtick">commit-msg</code> hook which you installed during setup. This should <em>not</em> be changed, even when rebasing or amending a commit following code review. If you pass <code class="backtick">--no-verify</code> to <code class="backtick">git commit</code> you will have to add this line yourself.</p></td>
</tr>
<tr class="odd">
<td><p><code class="backtick">Bug</code></p></td>
<td><p>Make Gerrit automatically add a comment <em>and</em> close the given bug number when the commit is merged. For use when the change does fully fix the issue.</p></td>
</tr>
<tr class="even">
<td><p><code class="backtick">Ping-Bug</code></p></td>
<td><p>Make Gerrit just add a comment to the referenced bug. For use when the change is related but does not fully fix the issue.</p></td>
</tr>
</tbody>
</table>

</div>

:bulb: The `Bug` and `Ping-Bug` tags are particularly useful if a capture file has been provided via a [Bugzilla](https://bugs.wireshark.org) entry in parallel with the change. All non-trivial fixes to dissectors should try to do this.

Putting all that together, we get the following example:

``` 
    MIPv6: fix dissection of Service Selection Identifier

    APN field is not encoded as a dotted string so the first character is not a length

    Bug: 10323
    Change-Id: Ia62137c785d505e9d0f1536a333b421a85480741
```

## Amending a Change

If you need to upload a new version of an existing change *to the same review*.

  - Check out the existing branch `git checkout my-branch-name`

  - Make your changes, and `git add` them as in "Submitting a Change".
    
      - Alternatively, `git commit -a --amend` to automatically add the changed tracked files.

  - Run `git commit --amend` to update your existing commit, or `git commit -a --amend` as noted above. If using `-m`, make sure you include the same `Change-ID:` as the original on a line by itself with no leading spaces in your commit message.

  - Do **NOT** modify or remove the `Change-ID:` line at the bottom of the commit message, and do not add new lines below it. It must be at the bottom of the message (ignoring comments), or else the commit-msg hook will add a brand new Change-ID, which means you'll be creating a brand new review in gerrit. Keeping the same Change-ID means you're just going to push an update to your previous gerrit review, which is the goal.

  - Do **NOT** add entries to the commit message describing the changes in a particular additional patch, the commit message should only reflect the overall intent of the change, not how it progressed, i.e. we don't need to see how sausages are made. Gerrit provides the ability to diff between patches to review these anyway.

  - Run `git review` (or use to `git push origin HEAD:refs/for/master` if you don't have `git review` to upload your amended commit.

If you've already accidentally made multiple commits, you can squash them down into one commit by running `git rebase -i master`, and changing all but the very first `pick` into `squash` in the interactive dialogue (see [here](http://gitready.com/advanced/2009/02/10/squashing-commits-with-rebase.html) for more details). Be sure the preserve the `Change-ID` line of your *original* commit, not the most recent\!

## Fixing merge errors

Sometimes a reviewer/core developer will tell you your change has merge issues. This just means some other changes have conflicted with your change in ways that git cannot fix automatically. To resolve this, you need to fix the merge errors in your local branch and push a new patch set to gerrit for the same review. Here are the steps:

  - Check out your local `master`: `git checkout master`

  - Pull down the latest changes to it: `git pull`
    
      - `git pull` does both a `git fetch` and `git merge`. So long as you made no local changes to your local `master`, this step should just work without any issues.

  - Rebase your changes to the latest master: `git rebase master my-branch-name`

  - At this point you will likely have merge errors - otherwise you wouldn't have been told so by the reviewer. Git will produce a message telling you this, with lines such as:

<!-- end list -->

    CONFLICT (content): Merge conflict in ui/qt/main_window.ui
    Auto-merging ui/qt/main_window.h
    Failed to merge in the changes.

  - The `CONFLICT` line tells you the name of a file that failed to merge.

  - You can also do a `git status` to see what files are not merged for the rebase - they're the ones that are in red at the bottom, under the section `Unmerged paths`. Those are the ones with merge errors.

  - Open the offending file(s) in your editor, and search for the string "\<\<\<\<\<\<\<". You will see "\<\<\<\<\<\<\<" and "\>\>\>\>\>\>\>" lines, which git put in to show the conflicting lines for what's in HEAD (which is `master`) vs. what's in your local branch you're trying to rebase. The unmerged lines from each branch are separated by a "=======" line.

  - Fix the conflicts, by deleting the "\<\<\<\<\<\<\<" and "\>\>\>\>\>\>\>" and "=======" lines, and correcting the code such that the final is what the code should be once the rebasing is complete.

  - Save your file.

  - Issue a `git add FILENAME` to add the just-fixed file(s) to the staging area.

  - Issue a `git rebase --continue` to continue. You may hit more merge errors and need to repeat the above steps to resolve them.

  - Once they're all solved, commit the changes using `git commit --amend`, save the commit message again without changing the Change-ID line in it, and `git review` to push it to gerrit again.
    
      - Note the `--amend` option is being used, because you don't want to generate a new commit and new review; you just want to upload a ne wpatch set for the previous review.

  - You're done\!

## Deleting your changes

At some point (hopefully soon) your code changes will be merged into the master branch on wireshark.org. (well, technically they're cherry-picked and then committed and pushed, but close enough) When that happens, it's safe to delete your local changes branch. You could force git to delete it using the `-D` option, but this is a better/cleaner way:

  - Check out your local `master`: `git checkout master`

  - Pull down the latest changes to it: `git pull`
    
      - `git pull` does both a `git fetch` and `git merge`. So long as you made no local changes to your local `master`, this step should just work.

  - Rebase your changes to the latest master: `git rebase master my-branch-name`
    
      - If you hit a merge/rebase error at this point, go to the previous section and follow the instructions, but do not push it up again with `gerrit review`, instead just locally commit it.

  - Checkout `master` again: `git checkout master`

  - Delete the branch by issuing `git branch -d my-branch-name`
    
      - Note the lower-case `-d` option, not the upper-case `-D` which forces a deletion.

## Testing a Change from Gerrit

If somebody else has uploaded a change to gerrit you want to test locally (without submitting it to master):

  - Determine the ID of the review (this is the numeric value, ie "Change 602", not the SHA).

  - Run `git review -d $ID`. This will download the change and create a new branch named "review/author\_name/topic" or "review/author\_name/ID" if no topic is set.

## Undoing a Change

If you haven't committed yet and want to undo changes to a file, run `git checkout $FILES` to revert to the last version. To undo changes to the whole tree, run `git checkout` with no path.

If you've staged a change with `git add` but haven't committed yet, run `git reset HEAD $FILES` to unstage them (and then git checkout to actually undo the changes). Note that "HEAD" is literal text, not a variable.

If you're change is in master, you should revert the change in a new commit with `git revert $SHA`. This generates a new commit, which must go through the normal Gerrit review process.

## A Super-Short Overview of Git

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

If you want to keep track of the changes happening on a specific file, you can using gerrit. Go to your settings page: <https://code.wireshark.org/review/#/settings/projects> In the tab Watched projects, add a watch for every file you want to watch by first selecting Wireshark in the project Name and then apply a filter in the Only-if look alike: <file:path/towards/my/file>

## Sample workflow commands

The sample below demonstrates the workflow for a patch. Replace `mybranchname` with the name you choose for your branch:

    $ # Prepare to submit a patch
    $ git clone ssh://USERNAME@code.wireshark.org:29418/wireshark
    $ cd wireshark
    $ git review -s
    $ git checkout -b mybranchname
    Switched to a new branch 'mybranchname'
    
    $ # Make some changes
    $ git commit
    $ git review
    remote: Resolving deltas: 100% (2/2)
    remote: Processing changes: new: 1, refs: 1, done    
    remote: 
    remote: New Changes:
    remote:   https://code.wireshark.org/review/398
    remote: 
    To ssh://USERNAME@code.wireshark.org:29418/wireshark
    
    $ # Optional: Give your code a +1 and add a message
    $ ssh USERNAME@code.wireshark.org:29418 -p 29418 gerrit review 398,1 --submit --code-review +1 --message "'Please review and run Petri Dish'"
    
    $ # Add changes for a second patchset (e.g.: Added additional tests)
    $ git commit -a --amend
    $ git review -R
    $ # Optional: Add a message:
    $ ssh USERNAME@code.wireshark.org -p29418 gerrit review 398,1 --message "'Added unit tests'"
    
    $ # Work complete! Delete the mybranchname branch
    $ git checkout master
    Switched to branch 'master'
    $ git branch -D mybranchname
    Deleted branch mybranchname (was c159b39).
    
    $ # Oops! Need to make more changes to the mybranchname branch
    $ git review -d 398

---

Imported from https://wiki.wireshark.org/Development/SubmittingPatches on 2020-08-11 23:13:08 UTC
