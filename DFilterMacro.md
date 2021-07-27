# Display Filter Macros

Macros allow you to save on typing complex filter expressions.

Lets's say we have a macro named *tcp\_ses* defined as "`(ip.addr eq $1 and ip.addr eq $2) and (tcp.port eq $3 and tcp.port eq $4)`". Entering "`$tcp_ses{10.10.10.10, 10.0.0.1, 1234, 4567} `" would be equivalent to entering "`(ip.addr eq 10.10.10.10 and ip.addr eq 10.0.0.1) and (tcp.port eq 1234 and tcp.port eq 4567)`" into the display filter box.

Macros are resolved when the filter is entered, before it is compiled.

Spaces in the macro expression in the filter will be expanded into the filter.

:warning: If there is a syntax error caused by the use of a macro the error will not refer to the macro but to the expanded text.

## Examples

  - tcp\_ses  
    ( (ip.src == $1 and ip.dst == $2 and tcp.srcport == $3 and tcp.dstport == $4) or (ip.src == $2 and ip.dst == $1 and tcp.srcport == $4 and tcp.dstport == $3) )
  - net10  
    10.0.0.0/8
  - dot\_org  
    $1.org

`ip.addr == ${net10`} becomes `ip.addr == 10.0.0.0/8`

` http.host == "${dot_org:www.wireshark}" ` becomes ` http.host == "www.wireshark.org" ` but be aware that ` http.host == "${dot_org: www.wireshark }" ` becomes ` http.host == " www.wireshark .org" ` which is probably not what you want.

-----

# Display Filter Macros of currently selected packet fields

Use field value from currently selected packet on right side of comparison operator.

## Example

Select a packet then apply display filter:

`tcp.stream == ${tcp.stream`}

The filtered view will be all packets with a `tcp.stream` value equal to the `tcp.stream` of the selected packet. Similar to `Follow->TCP Stream` (which sets display filter `tcp.stream eq` "some value") without the popup window.

History of the feature: <https://www.wireshark.org/lists/wireshark-dev/200707/msg00314.html>

Code commit: <https://gitlab.com/wireshark/wireshark/-/commit/9865b6346f6442bc8326cde55e5f012250748131>

`As per Ulf's request add ${proto.field} macros that will use the value of the given field has in the last selected packet.`

-----

Two places to update in User's Guide:

<https://www.wireshark.org/docs/wsug_html_chunked/ChDisplayFilterMacrosSection.html>

Chapter 11. Customizing Wireshark 11.8. Display Filter Macros

<https://www.wireshark.org/docs/wsug_html_chunked/ChWorkDefineFilterMacrosSection.html>

Chapter 6. Working With Captured Packets 6.7. Defining And Saving Filter Macros

---

Imported from https://wiki.wireshark.org/DFilterMacro on 2020-08-11 23:13:29 UTC
