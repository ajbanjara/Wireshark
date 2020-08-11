"The extcap interface is a versatile plugin interface that allows external binaries to act as capture interfaces directly in wireshark. It is used in scenarios, where the source of the capture is not a traditional capture model (live capture from an interface, from a pipe, from a file, etc)." -- doc/README.extcap (Now in [8.2. Extcap: Developer Guide](https://www.wireshark.org/docs/wsdg_html_chunked/ChCaptureExtcap.html) )

This page aims to help discussion the development of extcap internals.

[[_TOC_]]

## Issues

(Should probably be filled in bugzilla, but this keeps it in one overview.) All extcap bugs: <https://bugs.wireshark.org/bugzilla/buglist.cgi?quicksearch=extcap>

### Issue: Slow discovery, interfaces list cannot be configured

Even if you capture from a local interface (cf. tshark -i lo), it will invoke all extcap helpers (twice) according to strace. I have not checked yet with the GUI, but it will probably be worse.

There is another recurring pattern, "ssh", "cisco" and "randpkt" are all fake names, but their actual capture behavior depends on configuration (SSH host, remote interface for ssh, packet types for randpkt). Such fake interfaces also clutter the UI.

Ideas (suggestions):

\- Let every extcap binary report its (maximum) capabilities and identifier ("ssh", "randpkt", etc.), this must be a fast operation. Can possibly be the current --extcap-config

**Question** What is meant by capabilities? --extcap-config currently requires an interface.

\- The data after the prefix (identifier plus colon (":")) is interface dependent, possible usage: <ssh:host:eth0>

**Question** This will get confusing pretty fast - What should be transported via the identifiers? - Supported interface-specific options can be discovered via --extcap-interface-config (idea)

**Question** Will break downward comformance - Do not scan for interfaces until the interface prefix matches (in tshark) or if the extcap type is selected (in Wireshark)

**Question** This should be an extcap utility feature - Extcap can receive arguments to help during the discovery.

**Question** This is planned for the future

Alternatively, we could impose restrictions on the filename and require a certain pattern (`*dump[.ext]`) which makes it even faster.

#### Current flow

Based on doc/README.extcap ([8.2. Extcap: Developer Guide](https://www.wireshark.org/docs/wsdg_html_chunked/ChCaptureExtcap.html)), for all extcap binaries in the extcap directory:

1.  Discover version and interfaces: `--extcap-interfaces`

2.  Find DLTs for interface: `--extcap-interface IFACE --extcap-dlts`

3.  Configuration options (for UI): `--extcap-interface IFACE --extcap-config`

4.  (on start capture) Start capture: `--extcap-interface IFACE [params] --capture [--extcap-capture-filter CFILTER] --fifo FIFO`

#### New flow

For all extcap binaries:

1.  Discover version, identifiers and possible parameters to influence discovery (e.g. SSH host, Android serial)

**Question** - What should be displayed for androiddump after just printing the utility? There can be anywhere up to 10 connections for androiddump alone, without known which to use.

For each extcap binary and a given parameters (for discovery with `tshark -D` or in the GUI):

1.  Find extcap interfaces ("eth0", "eth1" -\> "<ssh:example.com:eth0>", "<ssh:example.com:eth1>"). (NOTE: depends on prior configuration of parameters as needed)

2.  Find interface-specific options (XXX do these exist now that the parameter is part of the interface name?)

3.  (on start capture) Start capture with given options.
    
    I do not really get the need for "<ssh:example.com:eth0>". This will clutter up the list way more and does not really help in reducing the number of interfaces, nor discovery (as it simply does not discover anything in any way). The real issue here are utilites like androiddump, which need to scan during bootup for interfaces and their capabilities. But this is a question on when this scan happens and how it is handled. It has to be done during each bootup and only the utility knows how and when it is being done. extcap cannot mandate nor influence how this scan or when this scan may happen. What can be done is first scanning for possible extcaps and delaying the actual query of interfaces, until after the GUI has finished loading. That way, the GUI loads fast, but only if we actually want to start a trace, the interface list will be loaded for that specific extcap.

## Questions

How feasible is it to execute a program and communicate over a pipe? This also avoids leaking passwords in the process list and allows some expensive state to be kept.

**Answer**: The idea behind extcap utilities is to provide an existing utility and expand it's capabilities to directly send traces to wireshark. I agree, that for sshdump this opens up a security consideration, but this can be resolved by using an identity file for ssh/ciscodump.

---

Imported from https://wiki.wireshark.org/Development/Extcap on 2020-08-11 23:12:46 UTC
