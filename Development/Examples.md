# Examples

Some examples which are used by the various installers as a newbie's "starter point".

This includes the files for capture filters, display filters and coloring rules.

Probably we should add a **very limited** amount of example capture files too.

## The situation so far (and why it should be changed)

Currently, the installers will only install the files which are needed for Wireshark to do its job.

There are no Example files, no files with default settings and such.

So if a newbie installs Wireshark, he or she will be presented by a blank page for capture filters, display filters and coloring rules.

This will **really** make it hard to get a start with these features.

On the devlist, I've often heard something like:

"The user should read the documentation (help, getting started, ...), which describes the way such settings have to be done".

Well, that's actually not the way things work. The typical newbie will install a program, "play" a while with that program, and if getting in comfort with it read the documentation to get deeper knowledge.

Please note, that if the user gets stuck somewhere, that's the moment where he/she might abandon to use the program and begin searching for alternatives. (Some might say there's no alternative to Wireshark, but I would say such a person may be right, but still is bit arrogant :wink:

That's the main reason, why usability guides will enforce to make things as easy as possible for a new user. If he/she gets comfortable with a program and tries to use its full potential, he/she will read the docu and often get's a "wow, I didn't knew that, sounds to be useful".

Saying all this, trying to explain why adding some basic defaults is **really important**.

## Install defaults

Instead of leaving things emtpy, the installer should provide default files.

**Of course, the installer should never overwrite already available configuration files.**

## Example Policies

An Example should be:

  - generally applicable and understandable (using common protocols, like HTTP, TCP, ...)
  - no repetition (provide something new)
  - contain one (or two, but not more) special case(s) to explain the "remaining" potential of the feature

## Example Filter Files

The example files can now be found in the [Wireshark sources](http://anonsvn.wireshark.org/viewcvs/viewcvs.py/trunk):

  - [Capture filters](http://anonsvn.wireshark.org/viewcvs/viewcvs.py/trunk/cfilters)

  - [Display filters](http://anonsvn.wireshark.org/viewcvs/viewcvs.py/trunk/dfilters)

  - [Coloring Rules](http://anonsvn.wireshark.org/viewcvs/viewcvs.py/trunk/colorfilters)

## Capturing files

We might add the example test.cap from the user's guide screenshots here.

## Discussion

Some example files were added in 14595

---

Imported from https://wiki.wireshark.org/Development/Examples on 2020-08-11 23:12:45 UTC
