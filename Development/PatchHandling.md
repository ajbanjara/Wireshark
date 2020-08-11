# Patch Handling

Note: Since early 2014 with the introduction of [Gerrit](https://code.wireshark.org/review) this process has evolved beyond this stage, see [Development/SubmittingPatches](/Development/SubmittingPatches).

## Introduction

A recent discussion among core Wireshark developers led to the conclusion that the current patch handling policy is open for improvement. In order to get the policy change implemented this page collects all relevant information and tasks until all relevant changes have been made in the infrastructure and documentation.

[[_TOC_]]

## Background

The mailing list is **full** of people wondering if their patch is being ignored. This is bad firstly because it clutters the mailing list, but more critically it leads to resentment amongst the developer base. If you have to submit or chase your patch five times, you begin to feel that your work is unappreciated, and that it's just not worth the effort of submitting it upstream. And yes, we all know that it's not that the work is unappreciated - I'm talking about the developer's point of view here.

It is believed that having patches submitted to Bugzilla in the first instance would convey the following advantages:

1.  It's much easier to see when a patch has been overlooked - you just search for new bugs. Finding overlooked patches in the mailing list is hard, particularly if you come back to it after a few days away.
2.  It keeps discussion of a particular patch in one place; you can see how a patch evolves, together with any review comments that get made; threading on the mailing list is woefully inadequate for this.
3.  You could even put a bug number in the commit comment, which would allow future maintainers to see the patch history - this can be very useful when trying to understand why a particular bit of code is written the way it is.
4.  It keeps the mailing list free for discussion of ways of fixing problems, general approaches, etc, rather than filling it up with "Here's a patch for foo"; "no really, here's a patch for foo"; "for the love of god, won't somebody review my patch"; "checked in, thank you" - which is frankly only noise.

## Tasks

## Completed tasks

1.  Modify Bugzilla to handle patch submissions and review requests.
2.  Documentation: the following all say you can or should send patches to the mailing list; they need updating to say you should send them to bugzilla and flag them for review:
      - <http://www.wireshark.org/develop.html>
    
      - Developer guide updates (<http://www.wireshark.org/docs/wsdg_html/#ChSrcSend>)
    
      - [SendingFilesToWireshark](/SendingFilesToWireshark)
3.  An email needs sending to wireshark-dev announcing the change of process and asking people to create bugs in future.

## Discussion

---

Imported from https://wiki.wireshark.org/Development/PatchHandling on 2020-08-11 23:12:58 UTC
