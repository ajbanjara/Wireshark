# Optimize the Packet List

The current implementation of the packet list has some serious drawbacks especially when working with large capture files.

It uses a GTKCList which is a bit inflexible, e.g. it needs to keep all the content text in memory even for the content currently not being displayed.

Drawbacks:

  - huge memory consumption: we must keep (at least) the info column texts in memory (which makes around half of the memory consumption of a packet\!)

  - coloring rules for all packets: coloring rules are processed for all packets, but would only be required for the displayed ones

  - columns can't be changed: the GTKCList don't allow columns to be added, removed, or moved without having to exit and restart Wireshark (or at least destroy the widget)

  - ADNS name resolution not shown for all packets: name resolution not shown in packets already displayed while resolution is still done (and won't be updated afterwards)

  - changing the time stamp format is slow: this requires the GTKCList (column?) to be regenerated

  - known bugs with the vertical scroll bar: see <http://bugs.wireshark.org/bugzilla/show_bug.cgi?id=220>

The first two points are very serious for performance when working with large capture files (\>10MB). Allocating massive amounts of memory takes it's time and processing the coloring rules for packets that are not displayed is simply useless.

**Optimizing these things will help improving the overall performance while working with large capture files a lot**.

## A new Design

The GTKCList doesn't provide us with the features we require to fix the problems listed above. So it's clear we have to use a different GTK widget or write a new one on our own.

Beside the current functionality, it should:

  - generate the column contents with a callback, rather than saving the text of the columns when a row is added
  - allow to dynamically change columns

## 1st Prototype: GTKTreeView

According to the [GTK+ API reference](http://developer.gnome.org/doc/API/2.0/gtk/index.html), GTKClist (and GTKCTree) are deprecated in favor of GTKTreeView, which supports everything above. Unfortunately, GTKTreeView doesn't exist in GTK+ 1.2.

Replacing the GTKCList by a GTKTreeView seemed to be straightforward, as the complete functionality is encapsulated in the file gtk/packet\_list.c :smiley:

I've done a prototype implementation using the GTKTreeView which wasn't very hard to do, but then I was running into some serious problems:

  - rows using more display space: GTKTreeView uses 1-2px more for each row, ending up with a few lines less on the screen. I've even tried to implement my own GTKTreeCellRenderer but couldn't limit the space usage
  - appending rows is significantly slower compared to the GTKCList (doubles / triples the time\!). I've had a look at the append function, but didn't saw a way to improve speed here

The files of this prototype implementation are attached (beware, ugly prototype code ahead) in case we might need it later ...

Conclusion: this won't be GTK1.x compatible and faces some significant problems which I wasn't able to solve. As the packet list is very performance critical, it might even be a good idea to not use a standard widget here so we can fine tune the behaviour ... - *[UlfLamping](/UlfLamping)*

## Finalizing the prototype

**The "new" packet list is now the default\!**

Using our own custom TreeView most problems have been addressed. With the new packet list rows do use more display space but that may be a price we have to pay. Adding rows to the list is fast as very little data is copied.

Improvements:

  - Loading a 19Mb file(203950 packets) time is reduced from \~14s to \< 4s.

  - Memory usage From \~170 Mb to \~113 Mb.

  - Applying coloring is fast, from 22s to less than 1s.

  - Changing time format is fast, from \>4min 30s less than 1s.

  - Changing time reference is fast, from 22s to less than 1s.

Drawbacks

  - Uses more display space.
  - Sorting is mabye slower(make a measure).

Not yet implemented feature:

  - Recreate packet list when adding/deleting columns Implementation sketch/idea:
      - Use a [GpointerArray](/GpointerArray) for col\_text then it should be possible to insert a new index(column) on the fly. g\_ptr\_array\_sort could be used to order the list(?). Marking the packets as undissected and calling gtk\_widget\_queue\_draw should redraw the packet list with the new column.
    We currently have new\_packet\_list\_recreate() which destroys the packet list and creates a new. This must be rewritten.

Outstanding issues:

  - Update internal structures (cfile.cinfo.\*) when DnD moving columns in the packet list.
  - Resize columns correctly, according to both title and content length.
  - Add missing sorting indicator in the No. column on startup.
  - Select the next packet when removing a Time Reference from a packet not matching the display filter.

Issues Noted

  - **\[WMeier\]** SVN \#29971 \<Tab\> and then \<Shift Tab\> between the summary pane and the
    
    details pane doesn't quite work the same ....
    
    After \<Tab\> from summary to details and then \<Shift Tab\> back to summary it takes an extra down-arrow to move down 1 row.
    
    Were in the code is \<Tab\> handled?
    
    **jyoung** Based on some google searches it looks like \<Tab\> processing is handled natively by the core GTK widgets:
    
      - See: <http://www.cc.gatech.edu/ccg/people/marty/gtk/original_sys.html>
    
    **jyoung** SVN \#30025; Understand issue with \<Tab\> and \<Shift\>\<Tab\>.
    
      - \<Tab\> and \<Shift\>\<Tab\> will move focus to the label of the selected column in the summary pane.
        
        A sequence of six (6) \<Tab\> keypresses moves focus sequentially from selected frame in packet list (summary pane); to selected element in details pane, to hex pane, to leftmost item in toolbar 1 (the list capture interfaces button), to the leftmost item in toolbar 2 (the Filter: label) to the label of selected column in the summary pane, and back to the originally selected frame. So with Tab forward we can get back where we started (with one extra \<tab\> keypress).
        
        But on TAB backwards (\<shift\>\<tab\>) the focus initially moves from the selected frame in the packet list (summary pane) to the label of the selected column in the summary pane; to the rightmost item in toolbar 2 ("Apply"); to the rightmost item in toolbar 1 ("Show some help..."); to the hex pane, to the selected item in the details pane, and back to the label of the selected column in the summary pane. On TAB Backwards *focus always skips over the originally selected item in the summary pane*.
        
        I suspect slipping in **focus = gtk\_window\_get\_focus(GTK\_WINDOW(top\_level));** and **gtk\_window\_set\_focus(GTK\_WINDOW(top\_level), focus);** within an appropriate callback will solve the \<Tab\> and \<Shift\>\<Tab\> issue. The trick is to figure out which callback (or callbacks) to add them to.

  - **jyoung** SVN \#30083; Attempted to replicate problem reported in bug 4035: "Application crash when changing real-time option". I could NOT replicate this bug. But I did find some issues with cursor placement/movement within the summary portal when a busy active capture was in progess (there were lots of packets on the wire). With the old packet list I am able to stop the auto-scroll feature by clicking on the summary portal and pressing up arrow once. But that does not happen in the new packet list; the list keeps scrolling. Also when I did disable the "Auto Scroll in Live Capture" (either by the Menu option or by clicking on the "Go back in packet history" button) I could NOT actually scroll through the packet list while new packets are added to the list. The cursor would temporarily show up on frame 1 or perhaps 2 and then disappear until I pressed down arrow again which would cause the cursor to momentarily appear back on frame 1 or frame 2 only to disappear again.

  - **ABroman** It would be nice to get a grip on the remaining issues, going trough the bugs I have found the following remaining bugs: see list below. Some of these may have been fixed in recent commits. It would also be nice to know what remains of the other issues mentioned on this page.

### Bugs

  - [Bug 4056](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4056) - new\_packet\_list: Hex pane display issue after startup. (Partly fixed)

  - [Bug 4357](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4357) - new\_packet\_list: [GtkTreeView](/GtkTreeView)::expander-size determines minimum row height size of new packet list records.

  - [Bug 4445](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4445) - new\_packet\_list: summary pane selected frame highlighting not maintained. GTK bug [618325](https://bugzilla.gnome.org/show_bug.cgi?id=618325)

---

Imported from https://wiki.wireshark.org/Development/OptimizePacketList on 2020-08-11 23:12:56 UTC
