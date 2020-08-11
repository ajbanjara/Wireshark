# Pcapng Wireshark preferences block

Define a pcapng block to store Wireshark preferences used to view the file. The content could be read to a file profile which would then be made the active profile. Opening a new file would overwrite this profile.

## Goal/Purpose

Sometimes it's difficult to view a file in the same manner as the person sending the file because of different preference settings used to view the file. As an example the receiver may only see UDP packets as the proper port preference for the protocol in question isn't set.

## Open Issues / Questions

  - What should happen if the user opens a pcapng file with such preferences, and then the user selects Edit-\>Preferences? Should it show the user's \*real\* preferences, or the file ones? Or should there be a File-\>Preferences window pane for the file ones?

I was thinking about a file profile, the profile would work as profiles do now.

  - If the user changes her normal preferences after opening a pcapng file with file preferences, should the GUI change to her preferences, or keep to the file's?

That would work as editing a profile today.

  - How would version differences of file preferences be handled? Currently if you start a new version of Wireshark, which doesn't understand some preference because it got removed (or vice-versa you open a older version of Wireshark which doesn't understand some new preference), then you get a error message in the console, and if you save your preferences again it removes unknown ones. (right?) So what happens if you open a file with file preferences that are not understood, and you save the file again, for example to a new name or to remove some frames?

Hmm, two file profiles original/current?

This brings up the point that the preferences mechanism is used for several different purposes:

  - personal UI preferences, such as IPv4's "Show IPv4 summary in protocol tree", which should probably \*not\*, in general, be affected by preferences in a file;
  - general behavioral preferences, such as TCP's "Allow subdissectors to reassemble TCP streams", which shouldn't necessarily \*always\* be affected by preferences in a file, but which sometimes perhaps \*should\* be affected by preferences in a file;
  - mechanisms for giving Wireshark information about a \*particular\* capture that was sent "out of band" or that was sent in packets that weren't captured, such as ATM's "Decode unknown AAL2 traffic as" or most of MTP3's preferences, which should almost always, if not always, be affected by preferences in a file.

Perhaps there should be a new mechanism for the third of those types of preferences, similar to the preferences mechanism, so that the third type of setting can be kept separate from the first two, and only the settings managed by that mechanism would be stored in the file.

There might be preferences for the \*default\* settings of those options, but a change to the \*current\* settings of those options, whether from the UI or from the capture file, wouldn't change the default settings.

In addition, some of those settings might be "per-conversation" (with "conversations" including TCP connections, virtual circuits of various sorts, etc.).

Would the over all goal be better served with new per-packet-option(s)guiding dissection?

---

Imported from https://wiki.wireshark.org/PrefBlock on 2020-08-11 23:18:17 UTC
