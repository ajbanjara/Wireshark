# How To Edit the Wireshark wiki

You can edit any page by pressing the **Edit** link at the top of the page, or the **EditText** link at the bottom of the page. Capitalized words joined together form a [WikiName](/WikiName), which hyperlinks to another page. The highlighted title searches for all pages that link to the current page. Pages which do not yet exist are linked with a question mark: just follow the link and you can add a definition. There are some templates defined for typical new pages, like a [ProtocolTemplate](/ProtocolTemplate) page.

To learn more about what a [WikiWikiWeb](/WikiWikiWeb) is, read about [WhyWikiWorks](http://moinmoin.wikiwikiweb.de/WhyWikiWorks "MoinMoin") and the [WikiNature](http://moinmoin.wikiwikiweb.de/WikiNature "MoinMoin"). Also, consult the [WikiWikiWebFaq](http://moinmoin.wikiwikiweb.de/WikiWikiWebFaq "MoinMoin").

## Copyright Information

Before posting, please read the [License](/License) page. **If you don't agree with the license, then don't post here.**

## Wiki editing

  - [HelpForBeginners](/HelpForBeginners): help to get you started

  - [WikiSandBox](/WikiSandBox): feel free to change this page and experiment with editing

  - [SyntaxReference](/SyntaxReference): a short reference about wiki markup

## Navigation

  - [RecentChanges](/RecentChanges): see where people are currently working

  - [TitleIndex](/TitleIndex): Index of all pages

  - [SiteNavigation](/SiteNavigation): get an overview over this site and what it contains

## How To Add a Protocol

It's often the case, that a protocol is known under different names or abbreviations, e.g. HTTP or [HyperTextTransferProtocol](/HyperTextTransferProtocol), or ...

To prevent duplicated content, redirections are used, so one master page exists with maybe one or even more redirection pages pointing to it. When the wiki user clicks on this redirected term, he/she will see the master page, with a small comment at the top of the page about the redirection.

The master page should be named the way it's often used in the text on other pages (most of the time this will be the abbreviated protocol name). This results in not showing the redirection note most of the time. For example: to reduce typing, I would typically use HTTP in my texts, instead of the much longer [HyperTextTransferProtocol](/HyperTextTransferProtocol), although this might be useful at some places.

When creating the master page, it's a good idea to use the Protocol Template page, which will give you a skeleton to fill in common protocol data.

The redirection page(s) can then simply be created using the Redirect Template page, while creating the page content of the redirection page.

So to create a new protocol page:

  - add the protocol name to the [ProtocolReference](/ProtocolReference) page (by editing this page and using [WikiName](/WikiName)'s) and save your changes

  - a "broken link" of your protocol will appear at the [ProtocolReference](/ProtocolReference) page where you added it, click on it

  - you will be requested to add a new page, use the protocol or redirect template as described above

## Attachments

If you have an example capture file for a specific protocol, it is appreciated to put it into the [SampleCaptures](/SampleCaptures) page and add a link to that file in the protocols page.

If you want to add a screenshot, it's a good idea to use the *.png* or *.gif* file format. The *.jpg* format isn't the best choice here, as it's producing larger sized files with lower image quality.

## Wiki Names

For several reasons it is **not** recommended to fill in spaces for the page names, as this makes it hard to find the right spelling while typing in the content of another page. So "[HyperTextTransferProtocol](/HyperTextTransferProtocol)" should be used instead of "[HyperTextTransfer](/HyperTextTransfer) Protocol" or "[HyperText](/HyperText) Transfer Protocol".

If you want to see spaces between the words of the page name, use the corresponding setting in your wiki preferences.

-----

## Discussion

---

Imported from https://wiki.wireshark.org/HowToEdit on 2020-08-11 23:14:45 UTC
