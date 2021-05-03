# How To Edit the Wireshark wiki

In order to become a wiki editor you must do the following:

1. Create a GitLab account if you don't already have one.
You can create credentials on gitlab.com itself or register using your GitHub, Bitbucket, Google, or other credentials.

2. Request access to the [Wiki Editors](https://gitlab.com/wireshark/wiki-editors) group,

…or…

2. Send an email to wireshark-dev@wireshark.org with the following format (or something similar):
```
Subject: Wiki editor permission request

Hi,

I would like permission to edit the Wireshark wiki. My GitLab username is <your username>.
```

3. Go to https://gitlab.com/wireshark/editor-wiki/wikis/home and start making edits.
If GitLab returns a 404 error, it's probably because you aren't logged in or you don't have edit permissions.
The [public wiki](https://gitlab.com/wireshark/wireshark/wikis/home) will be synchronized each time you save your changes.

Why do we have a separate project for editing the wiki? Because you need *really powerful* permissions to do so, and a separate project makes that safer and easier:

https://gitlab.com/gitlab-org/gitlab/issues/25177

https://gitlab.com/gitlab-org/gitlab/issues/27294

## Contributing

In order to edit this wiki you should be familiar with Markdown, specifically [GitLab Flavored Markdown](https://gitlab.com/help/user/markdown).

Before contributing, please read the [License](/License) page. **If you don't agree with the license, then don't contribute.**

## Tables

Due to limitations with the conversion process, tables in wiki pages are now HTML.
You can [convert simple tables to GFM](https://gitlab.com/wireshark/gitlab-migration/issues/5) if desired.

## Attachments

If you have an example capture file for a specific protocol, it is appreciated to put it into the [SampleCaptures](/SampleCaptures) page and add a link to that file in the protocols page.

## Screenshots

Please save screen captures as PNG or GIF. JPEG can introduce artifacts that make text fuzzy or otherwise difficult to read.

## Protocol Documentation

:information_source: **We migrated from MoinMoin to the Gitlab built-in Wiki (based on Gollum) on August 23rd, 2020**

**Note:** The instructions below have not been updated for the new Wiki. In particular, redirections do not work the same way, and [all existing redirections are broken](https://gitlab.com/wireshark/gitlab-migration/-/issues/6).

It's often the case that a protocol is known under different names or abbreviations, e.g. HTTP or [HyperTextTransferProtocol](/Hyper_Text_Transfer_Protocol), or ...

To prevent duplicated content, redirections are used, so one master page exists with maybe one or even more redirection pages pointing to it. When the wiki user clicks on this redirected term, he/she will see the master page, with a small comment at the top of the page about the redirection.

The master page should be named the way it's often used in the text on other pages (most of the time this will be the abbreviated protocol name). This results in not showing the redirection note most of the time. For example: to reduce typing, I would typically use HTTP in my texts, instead of the much longer [HyperTextTransferProtocol](/Hyper_Text_Transfer_Protocol), although this might be useful at some places.

When creating the master page, it's a good idea to use the Protocol Template page, which will give you a skeleton to fill in common protocol data.

The redirection page(s) can then simply be created using the Redirect Template page, while creating the page content of the redirection page.

So to create a new protocol page:

- add the protocol name to the [ProtocolReference](/ProtocolReference) page (by editing this page and using [WikiName](/WikiName)'s) and save your changes

- a "broken link" of your protocol will appear at the [ProtocolReference](/ProtocolReference) page where you added it, click on it

- you will be requested to add a new page, use the protocol or redirect template as described above

---

Imported from https://wiki.wireshark.org/HowToEdit on 2020-08-11 23:14:45 UTC