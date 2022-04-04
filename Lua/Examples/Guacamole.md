# Guacamole Dissector

This dissector dissects the [Guacamole Protocol](https://guacamole.apache.org/doc/gug/guacamole-protocol.html).

**Installation** - place in plugins directory - see [Lua Support in Wireshark](https://www.wireshark.org/docs/wsdg_html_chunked/wsluarm.html)  

[guacamole.lua](uploads/26e88a64af128e812a94dd3d44d1e055/guacamole.lua)

Also requires [col.lua](uploads/815ba39e89ef7aba3258c09620f0837c/col.lua)

**Example** - The following capture file containing Guacamole data over TCP can be used for testing the dissector.

[guacamole_over_tcp.pcap](uploads/17d12b8ac4f05c25ef7b83ed11f08550/guacamole_over_tcp.pcap)

**Filter** `guacp`

![guacamole_over_tcp](uploads/48ff80ee3e8ace9f683e9b73856cbc33/guacamole_over_tcp.png)

You can also find another sample capture file attached to the [GUACAMOLE-620](https://issues.apache.org/jira/browse/GUACAMOLE-620) Jira issue.  That one will exercise the TCP reassembly feature as well.

In order to dissect the Guacamole data over HTTP as depicted in the diagram on the [Implementation and architecture](https://guacamole.apache.org/doc/gug/guacamole-architecture.html) page, the following Guacamole PostDissector is also needed.  This is not an ideal solution but I know of no other way to get to the HTTP payload without modifying the Wireshark HTTP dissector.

**NOTE**: You will need to modify the Guacamole PostDissector to set `GUACDC_WEB_PORT` to the correct port to match your configuration.

[guacp-postdissector.lua](uploads/935f4169dd7efef222a2fcad0eab8e36/guacp-postdissector.lua)

Due to possible privacy concerns, I am unable to provide a sample capture file of Guacamole over HTTP.