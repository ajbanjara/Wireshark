You may have arrived here by [right clicking](https://www.wireshark.org/docs/wsug_html/#ChWorkPacketDetailsPanePopUpMenu) on a text label in the [Packet Details](https://www.wireshark.org/docs/wsug_html/#ChUsePacketDetailsPaneSection), then selecting `Wiki Protocol Page`  

![210503_text_label](uploads/6d2f903e2b087cc481906fb48258e5a8/210503_text_label.png)
  

Worked on in !2897 - Qt: URLs to Display Filter Reference and Wiki Protocol pages  

There is more than one way to add a text label. Examples below use `proto_tree_add_subtree()`.  
See [README.dissector](https://gitlab.com/wireshark/wireshark/-/blob/master/doc/README.dissector) and [proto.c](https://gitlab.com/wireshark/wireshark/-/blob/master/epan/proto.c):  
<pre>
/* Add a text-only node that creates a subtree underneath.
 */
proto_tree *
proto_tree_add_subtree(proto_tree *tree, tvbuff_t *tvb, gint start, gint length, gint idx, proto_item **tree_item, const char *text)
{
	return proto_tree_add_subtree_format(tree, tvb, start, length, idx, tree_item, "%s", text);
}
</pre>

Examples:  
[packet-tcp.c](https://gitlab.com/wireshark/wireshark/-/blob/master/epan/dissectors/packet-tcp.c)
<pre>
    tree=proto_tree_add_subtree(parent_tree, tvb, 0, 0, ett_tcp_timestamps, &item, "Timestamps");
    proto_item_set_generated(item);
</pre>
  
[packet-ssh.c](https://gitlab.com/wireshark/wireshark/-/blob/master/epan/dissectors/packet-ssh.c)
<pre>
  ssh2_tree = proto_tree_add_subtree(tree, tvb, offset, -1, ett_ssh2, NULL, wmem_strbuf_get_str(title));
</pre>

TODO: add info to [Dev Guide](https://www.wireshark.org/docs/wsdg_html/#_improving_the_dissection_information) and a screen shot of the `foo.dissector` Packet Details.