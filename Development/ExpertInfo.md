# Expert Info

[[_TOC_]]

The general idea behind the following "Expert Infos" is to have a better display of "uncommon" or "notable" network behaviour. This way, both novice and expert users will hopefully find probable network problems a lot faster, compared to scanning the packet list "manually".

**For basic information what expert infos are and how to use them, please refer to the [User's Guide](http://www.wireshark.org/docs/wsug_html_chunked/ChAdvExpert.html)**.

## Add an "Expert Info" to a Dissector

To add an expert info, dissectors call `expert_add_info_format()` as defined in `epan/expert.h`:

    extern void
    expert_add_info_format(packet_info *pinfo, proto_item *pi, int group,
            int severity, const char *format, ...);

There are some examples in common protocols (TCP, IP, HTTP, ...). A typical example will look like:

    #include <epan/expert.h>
    
    ...
    
    flags_item=proto_tree_add_uint(tree, hf_tcp_anaysis_duplicate_ack_frame,
            tvb, 0, 0, ta->dupack_frame);
    expert_add_info_format(pinfo, flags_item, PI_SEQUENCE, PI_NOTE, "This is a TCP duplicate ack");

The proto\_item (`flags_item` in this case) can be NULL if there's no associated protocol item available.

**Remember: The tree variable might be NULL, so the call to `expert_add_info_format()` should not be inside any "`if (tree)`" block\!**

### Severity levels

There are four severity levels (see `epan/proto.h`), in parentheses are the colors in which tree items will be marked:

  - PI\_CHAT (gray): information about usual workflow, e.g. a TCP packet with the SYN flag set
  - PI\_NOTE (cyan): notable things, e.g. an application returned an "usual" error code like HTTP 404
  - PI\_WARN (yellow): warning, e.g. application returned an "unusual" error code like a connection problem
  - PI\_ERROR (red): serious problem, e.g. \[Malformed Packet\]

A dissector developer selects which level a specific problem really has. The dissector might even use a preference setting to have a mapping between the "event" and the level to be displayed, so the user can decide which problem is interesting to him and which only annoys him. However, no dissector currently provide this functionality.

Example: a TCP zero window is at least uncommon on most networks. If a user has a scenario where this would appear often, he could be able to switch off a warning about this.

**Hint: If you can't decide between two possible severity levels, choose the less important one\!** The topic you're currently working on seems probably more important than it will look like in a few weeks :wink:

### Groups

The currently implemented groups can be found in epan/proto.h:

  - PI\_CHECKSUM: a checksum was invalid, usually PI\_WARN
  - PI\_SEQUENCE: protocol sequence info, e.g. wasn't continuous or a retransmission was detected or had other errors or ...
  - PI\_RESPONSE\_CODE: problem with application response code, e.g. HTTP 404 page not found, usually PI\_NOTE
  - PI\_REQUEST\_CODE: an application request (e.g. File Handle == xxxx), usually PI\_CHAT
  - PI\_UNDECODED: dissector incomplete or data can't be decoded for other reasons, usually PI\_WARN
  - PI\_REASSEMBLE: reassembling info, e.g. because not all fragments available or exception while reassembling
  - PI\_MALFORMED: malformed packet or dissector has a bug (exception occured), dissection of this packet aborted, usually PI\_ERROR
  - PI\_DEBUG: debugging (should not remain in production code), usually PI\_ERROR
  - PI\_PROTOCOL: violation of protocol specs (e.g. invalid field values), dissection of this packet probably continued
  - PI\_SECURITY: security related, e.g. plain text passwords

Probable ideas for further groups:

  - PI\_DELAY: a delay between two related packets/segments was very long or too long (Request\<-\>Response, Data\<-\>Acknowledge, ...)

  - PI\_MISSING: missing request or response, etc. (xxx - include this into DELAY?)

*XXX - add more, but only if there's a real need for it\! So be prepared for additions here ...*

### Summary text

This is a "printf like" free format text. Hint: Don't add "random" id's or alike to the text, otherwise the composite dialog will list all entries separately and therefore be less helpful.

## To be done

  - add a lot more expert infos to all the dissectors we have ...
  - add a kind of hyperlink in the dialog to further information about a specific entry (e.g. link to the wiki)
  - add a "severity filter" to the "Expert Info Composite" dialog so you can filter out info with chat (or note, or ...) severities
  - merge both "Expert Info" and "Expert Info Composite" into one
  - it should be possible to use the severity / group / "free format text" for filtering. XXX - is this possible with our current display filter engine? If not, we could define a(some) common protocol field(s), which is(are) somehow automatically added if an issue is reported, e.g. adding a subtree with the automatically generated fields.

---

Imported from https://wiki.wireshark.org/Development/ExpertInfo on 2020-08-11 23:12:45 UTC
