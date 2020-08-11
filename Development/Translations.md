# Internationalization and Translation

Wireshark added user interface translations in the Qt UI in version 2.0. If you wish to assist with translations or would like more information about them, see the Internationalization and Translation section of the [Developer's Guide](https://www.wireshark.org/docs/wsdg_html_chunked/ChUIQt.html#ChUII18N).

In the project's early days, the general consensus among the developers was that Wireshark shouldn't be translated. The following arguments support that view, and some of them are still valid.

-----

Here you will find some explanations why it might not be a good idea to translate Wireshark into any other language (than English).

Anyway, Wireshark is open source, so you can start a translation if you still wish to do so, after reading this :smiley:

## Targets

The following is currently available in english only and might be an object for translation:

  - Wireshark GUI (menus, dialogs, ...)
  - Wireshark dissector specific output
  - User documentation (User's Guide, manpages, ...)
  - Webpage
  - Wiki
  - Developer documentation
  - ...

In addition to this, and as an important point, most network protocol related information is available in english only (e.g. the famous RFC's).

## Amount of Work

Which parts have to be translated to become useful? The most important part is the dissector related output.

Don't underestimate the amount of text in the dissectors\! There are currently 1200 dissectors (rising), each containing a **lot of text**. Translating all of this might be just impossible in a reasonable amount of time\!

On the other hand, doing an incomplete translation is really ugly and has to be avoided.

The *User's guide* and the Wireshark GUI could be translated, but would this be useful? This will be a lot of work and most of the really interesting output will still be untranslated.

## Maintenance

The Wireshark developer community is small, so maintenance (like bugfixing) and answering users/developers questions becomes a time consuming part of the developer work.

Anything which adds additional maintenance work without gaining real improvements has to be avoided therefore, and adding translated information will increase the workload, as people will ask for updated versions, send bugfixes, ask for translations to other languages, ...

## Conclusion

Translating all the dissector output is practically impossible. But without this, it might not make real sense to translate other parts. So in the end the effort of translating Wireshark might better be spent for some other work.

However, the recent switch to Qt has made it reasonably easy to translate the UI into different languages. It has also been argued (convincingly) that having the UI in the user's native language (so the File-\>Save As menu is presented in the user's native language) makes for a better user experience, even if the dissector output has English-language field names, descriptions of enumerated values, etc..

## Discussion

Others might disagree on the reasons I've written down. I'm german and thought about a german translation, but dismissed the idea because of the reasons above. - *[UlfLamping](/UlfLamping)*

---

Imported from https://wiki.wireshark.org/Development/Translations on 2020-08-11 23:13:13 UTC
