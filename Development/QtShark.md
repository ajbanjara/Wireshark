# Wireshark Qt Port

Goal : Wireshark currently uses the GTK toolkit. An initial port to Qt (aka [QtShark](/QtShark)) has begun but there is lots of work to do. There are also many opportunities to take Wireshark's user interface to the next level. If you have an idea for a better way to implement one of Wireshark's current features or for a great new feature this is the place to propose it.

[[_TOC_]]

# Current tasks

  - Add missing items below.

  - Fix [open Qt UI bugs](https://bugs.wireshark.org/bugzilla/buglist.cgi?list_id=15007&resolution=---&query_format=advanced&bug_status=UNCONFIRMED&bug_status=CONFIRMED&bug_status=IN_PROGRESS&bug_status=INCOMPLETE&bug_status=VERIFIED&component=Qt%20UI&product=Wireshark)

# Implemented Menu Items, Features, and Dialogs

  - Main Window
      - <span class="strike">Wireless toolbar</span>
    
      - <span class="strike">Display Filter Expressions</span>
  - File (15/15)
      - <span class="strike">Open</span>
    
      - <span class="strike">Open recent...</span>
    
      - <span class="strike">Merge</span>
    
      - <span class="strike">Import from Hex Dump</span>
    
      - <span class="strike">Close</span>
    
      - <span class="strike">Save</span>
    
      - <span class="strike">Save as...</span>
    
      - <span class="strike">File set</span>
    
      - <span class="strike">Export Specified Packets...</span>
    
      - <span class="strike">Export Packet Dissections</span>
    
      - <span class="strike">Export Packet Bytes...</span>
    
      - <span class="strike">Export Packet PDUs to File...</span>
    
      - <span class="strike">Export SSL Session Keys</span>
    
      - <span class="strike">Export Objects</span>
    
      - <span class="strike">Print...</span>
    
      - <span class="strike">Quit</span>
  - Edit
      - <span class="strike">Find Packet...</span>
    
      - <span class="strike">Find Next...</span>
    
      - <span class="strike">Find Previous...</span>
    
      - <span class="strike">Mark/Unmark Packet</span>
    
      - <span class="strike">Mark All Displayed</span>
    
      - <span class="strike">Unmark All Displayed</span>
    
      - <span class="strike">Next Mark</span>
    
      - <span class="strike">Previous Mark</span>
    
      - <span class="strike">Ignore/Unignore Packet</span>
    
      - <span class="strike">Ignore All Displayed</span>
    
      - <span class="strike">Set/Unset Time Reference</span>
    
      - <span class="strike">Time Shift...</span>
    
      - <span class="strike">Packet Comment...</span>
    
      - <span class="strike">Configuration Profiles...</span>
    
      - <span class="strike">Preferences...</span>
  - View (9/16)
      - <span class="strike">Show / hide main widgets (toolbars, packet panes)</span>
    
      - <span class="strike">Time Display Format</span>
    
      - <span class="strike">Name Resolution</span>
    
      - <span class="strike">Colorize Packet List</span>
    
      - <span class="strike">Auto Scroll in Live Capture</span> (moved to Go)
    
      - <span class="strike">Zoom</span>
    
      - <span class="strike">Resize Columns</span>
    
      - <span class="strike">Displayed Columns</span>
    
      - <span class="strike">Expand Subtrees</span>
    
      - <span class="strike">Collapse Subtrees</span>
    
      - <span class="strike">Expand All</span>
    
      - <span class="strike">Collapse All</span>
    
      - <span class="strike">Colorize Conversation</span>
    
      - <span class="strike">Reset Coloring</span>
    
      - <span class="strike">Coloring Rules</span>
    
      - <span class="strike">Show Packet in New Window</span>
    
      - <span class="strike">Reload</span>
  - Go
      - <span class="strike">Go to Packet...</span>
    
      - <span class="strike">Go to Linked Packet</span>
    
      - <span class="strike">Next packet</span>
    
      - <span class="strike">Previous packet</span>
    
      - <span class="strike">First packet</span>
    
      - <span class="strike">Last packet</span>
  - Capture
      - <span class="strike">Interfaces...</span> (Moved to main window)
    
      - <span class="strike">Options...</span>
    
      - <span class="strike">Start</span>
    
      - <span class="strike">Stop </span>
    
      - <span class="strike">Restart</span>
    
      - <span class="strike">Capture filters</span>
    
      - <span class="strike">Refresh Interfaces</span>
  - Analyze
      - <span class="strike">Display Filters...</span>
    
      - <span class="strike">Display Filters Macros...</span>
    
      - <span class="strike">Apply as Column</span>
    
      - <span class="strike">Apply as Filter</span>
    
      - <span class="strike">Prepare a Filter</span>
    
      - <span class="strike">Enabled Protocols</span>
    
      - <span class="strike">Decode As</span>
    
      - <span class="strike">User Specified Decodes</span> (folded into Decode As)
    
      - <span class="strike">Follow TCP</span>
    
      - <span class="strike">Follow UDP</span>
    
      - <span class="strike">Follow SSL</span>
    
      - <span class="strike">Follow HTTP</span>
    
      - <span class="strike">Expert Information</span>
  - Statistics (1/25)
      - <span class="strike">Summary</span> *renamed to Capture File Properties*
    
      - <span class="strike">Comments Summary</span> *part of Capture File Properties*
    
      - <span class="strike">Address resolution</span>
    
      - <span class="strike">Protocol hierarchy</span>
    
      - <span class="strike">Conversations</span>
    
      - <span class="strike">Endpoints</span>
    
      - <span class="strike">Packet Lengths</span>
    
      - <span class="strike">IO Graph</span>
    
      - <span class="strike">Conversation List</span> *single dialog*
    
      - <span class="strike">Endpoint List</span> *single dialog*
    
      - <span class="strike">Service Response Time</span>
    
      - <span class="strike">29 West</span>
    
      - <span class="strike">ANCP</span>
    
      - <span class="strike">BACnet</span>
    
      - <span class="strike">BOOTP-DHCP...</span>
    
      - <span class="strike">Collectd</span>
    
      - Compare... *deferred to a future release*
    
      - <span class="strike">Flow Graph...</span>
    
      - <span class="strike">HART-IP</span>
    
      - <span class="strike">HPFEEDS</span>
    
      - <span class="strike">HTTP</span>
    
      - <span class="strike">Sametime</span>
    
      - <span class="strike">Source and Dest IP Addresses</span>
    
      - <span class="strike">ONC-RPC Programs</span>
    
      - <span class="strike">TCP [StreamGraph](/StreamGraph)</span>
    
      - <span class="strike">UDP Multicast Streams</span>
    
      - <span class="strike">F5</span>
    
      - <span class="strike">IP Addresses...</span>
    
      - <span class="strike">IP Destinations...</span>
    
      - <span class="strike">IP Protocol Types..</span>
    
      - <span class="strike">WLAN Traffic</span> (Moved to Wireless menu)
  - Telephony
      - <span class="strike">VoIP Calls</span>
    
      - <span class="strike">ANSI</span>
        
          - <span class="strike">A-I/F BSMAP Statistics</span>
        
          - <span class="strike">A-I/F DTAP Statistics</span>
        
          - <span class="strike">Map Operation Statistics</span>
    
      - <span class="strike">GSM</span>
        
          - <span class="strike">A-Interface BSSMAP</span>
        
          - <span class="strike">A-Interface DTAP</span>
            
              - <span class="strike">Call Control</span>
            
              - <span class="strike">GPRS Mobility Management</span>
            
              - <span class="strike">GPRS Session Management</span>
            
              - <span class="strike">Mobility Management</span>
            
              - <span class="strike">Radio Resource Management</span>
            
              - <span class="strike">Short Message Service</span>
            
              - <span class="strike">Special Conformance Testing Functions</span>
            
              - <span class="strike">Supplementary Services</span>
        
          - <span class="strike">A-Interface SACCH</span>
        
          - <span class="strike">CAMEL Messages and Response Status</span>
        
          - <span class="strike">MAP Operation</span>
        
          - <span class="strike">MAP Summary</span>
    
      - <span class="strike">H.225</span>
    
      - <span class="strike">IAX2 Stream Analysis</span>
    
      - <span class="strike">ISUP Messages</span>
    
      - <span class="strike">LTE</span>
        
          - <span class="strike">RLC Graph</span>
        
          - <span class="strike">MAC</span>
        
          - <span class="strike">RLC</span>
    
      - <span class="strike">MTP3</span>
        
          - <span class="strike">MSUs</span>
        
          - <span class="strike">MSU Summary</span>
    
      - <span class="strike">RTP Streams</span>
    
      - <span class="strike">RTP Analysis</span>
    
      - <span class="strike">RTSP &\#8594 Packet Counter</span>
    
      - <span class="strike">RTP Player</span>
    
      - <span class="strike">SCTP</span>
        
          - <span class="strike">Analyze this association</span>
        
          - <span class="strike">Show All Associations</span>
        
          - <span class="strike">Chunk Counter</span>
    
      - <span class="strike">SMPP Operations</span>
    
      - <span class="strike">UCP Messages</span>
    
      - <span class="strike">SIP Flows</span>
    
      - <span class="strike">SIP Statistics</span>
    
      - <span class="strike">SMPP Operatiopns</span>
    
      - <span class="strike">UCP Messages</span>
    
      - <span class="strike">WAP-WSP</span>
  - Tools
      - <span class="strike">Firewall ACL Rules</span>
    
      - <span class="strike">third-party add-ons</span>
    
      - <span class="strike">Lua</span>
  - Internals (though this might belong under a Help or View sub-menu)
      - <span class="strike">Dissector Tables</span>
    
      - <span class="strike">Conversation Hash Tables</span>
    
      - <span class="strike">Supported Protocols</span>
  - Help
      - <span class="strike">Contents</span>
    
      - <span class="strike">Manual pages</span>
    
      - <span class="strike">Website</span>
    
      - <span class="strike">FAQs</span>
    
      - <span class="strike">Ask (Q\&A) </span>
    
      - <span class="strike">Downloads</span>
    
      - <span class="strike">Wiki</span>
    
      - <span class="strike">Sample Captures</span>
    
      - <span class="strike">Check for updates</span>
    
      - <span class="strike">About Wireshark</span>
  - Packet List
      - <span class="strike">Mark Packet</span>
    
      - <span class="strike">Ignore Packet</span>
    
      - <span class="strike">Set Time Reference</span>
    
      - <span class="strike">Time Shift</span>
    
      - <span class="strike">Edit Packet</span> *deferred. experimental in the GTK+ UI*
    
      - <span class="strike">Packet Comment</span>
    
      - <span class="strike">Manually Resolve Address</span> *renamed to Edit Resolved Name*
    
      - <span class="strike">Apply As Filter</span>
    
      - <span class="strike">Prepare A Filter</span>
    
      - <span class="strike">Conversation Filter</span>
    
      - <span class="strike">Colorize Conversation</span>
    
      - <span class="strike">SCTP</span>
    
      - <span class="strike">Follow</span>
    
      - <span class="strike">Copy</span>
    
      - <span class="strike">Protocol Preferences</span>
    
      - <span class="strike">Decode As</span>
    
      - <span class="strike">Print...</span> *omitted to conserve space*
    
      - <span class="strike">Show Packet in New Window</span>
  - Packet Details
      - <span class="strike">Expand Subtrees</span>
    
      - <span class="strike">Collapse Subtrees</span>
    
      - <span class="strike">Expand All</span>
    
      - <span class="strike">Collapse All</span>
    
      - <span class="strike">Apply as Column</span>
    
      - <span class="strike">Apply as Filter</span>
    
      - <span class="strike">Prepare a Filter</span>
    
      - <span class="strike">Colorize with Filter</span>
    
      - <span class="strike">Follow</span>
    
      - <span class="strike">Copy</span>
    
      - <span class="strike">Export Selected Packet Bytes</span>
    
      - <span class="strike">Edit Packet</span> *Deferred - experimental in the GTK+ UI*
    
      - <span class="strike">Wiki Protocol Page</span>
    
      - <span class="strike">Filter Field Reference</span>
    
      - <span class="strike">Protocol Help</span> *Deferred for a future release?*
    
      - <span class="strike">Protocol Preferences</span>
    
      - <span class="strike">Decode As</span>
    
      - <span class="strike">Disable Protocol</span> *Moved to protocol preferences*
    
      - Resolve Name (filed as [bug 12346](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=12346))
    
      - <span class="strike">Go To Corresponding Packet</span>
    
      - <span class="strike">Show Packet Reference in New Window</span>

## Features in implementation

  - Fix bugs

  - Capture file summary dialog:
    
      - <span class="strike">Window should not be modal that implies to fix the crash when the window is display and the capture file is closed. </span>
    
      - <span class="strike">Possibility to copy to clipboard the summary comment</span>
    
      - Discuss a new design in the dev mailing-list
        
          - Old design (GTK based)
              - <http://imageshack.us/a/img9/6986/summarydlgfinal.png>
          - Theoretical new design (Qt)
              - <http://i.imgur.com/jWGCKEw.png>
            
              - <http://i.imgur.com/zDRGoW6.png>
            
              - <http://i.imgur.com/MuOTSLD.png>

  - Current work on Follow stream:<http://i.imgur.com/3KmCYs4.png?1?8199>

# See Also

## Interface Guidelines

[Windows User Experience Interaction Guidelines for Windows Desktop apps (“UX Guide”)](http://msdn.microsoft.com/en-us/library/windows/desktop/aa511258.aspx)

[OS X Human Interface Guidelines](https://developer.apple.com/library/mac/#documentation/UserExperience/Conceptual/AppleHIGuidelines/Intro/Intro.html)

[GNOME Human Interface Guidelines](https://developer.gnome.org/hig-book/stable/)

[KDE4 Human Interface Guidelines](http://techbase.kde.org/Projects/Usability/HIG)

## Other Links

[LXDE's GTK+ to Qt migration page](http://wiki.lxde.org/en/Migrate_from_GTK+_to_Qt)

[QCustomPlot](http://www.qcustomplot.com/) (possibly useful for IO graphs)

[Qwt](http://qwt.sourceforge.net/) (possibly useful for IO graphs)

---

Imported from https://wiki.wireshark.org/Development/QtShark on 2020-08-11 23:13:01 UTC
