# BackUp Tape Coordinator (BUTC)

This protocol is used on Transarc [DCE/DFS](/DCE/DFS) to control tapes on remote servers.  
BUTC is a protocol to manage and automate backups in a [DCE/DFS](/DCE/DFS) environment. It is used to talk to remote backup tape coordinators which manage the actual tape drives.

## History

BUTC was originally a component in the [AFS](/AFS) network protocol but was broken out into a separate protocol when [AFS](/AFS) was reimplemented atop [DCE/RPC](/DCE/RPC) i.e. [DCE/DFS](/DCE/DFS). Even in the [DCE/RPC](/DCE/RPC) variant of the protocol it still contains some legacy commands and fields that stem from its origins in AFS.

## Protocol dependencies

  - [UDP](/UDP): Typically, BUTC uses [UDP](/UDP) as its transport protocol.

  - [DCE/RPC](/DCE/RPC): BUTC is implemented on top of [DCE/RPC](/DCE/RPC) and will thus run ontop of all transports supported by [DCE/RPC](/DCE/RPC). It is, however, most commonly implemented on top of [DCE/RPC](/DCE/RPC) over IP/UDP.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The BUTC dissector is (fully functional, minus one opcode). Since BUTC is implemented atop [DCE/RPC](/DCE/RPC) the normal DCE/RPC service response time statistics thatEwireshark calculates will also apply for BUTC.

## Preference Settings

There are no preference settings specific to BUTC. However since it is transported atop [DCE/RPC](/DCE/RPC) preference options for DCE/RPC will apply to BUTC as well. When BUTC is implemented on top of UDP one can use the [IP\_Reassembly](/IP_Reassembly) preferences to make Wireshark reassemble all fragments into one full BUTC PDU.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of BUTC display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/b/butc.html)

    butc

## Capture Filter

There is no capture filter for BUTC, but if you know which UDP port it is using you can capture on that instead.

## External links

  - [A nice IBM manual describing how to use BUTC and backups for DCE/DFS](http://www-306.ibm.com/software/stormgmt/dfs/library/docs/31manuals/AdminGd/duagd014.htm)  

  - [TheOpenGroup](http://www.opengroup.org/) The Open Group recently released [DCE/DFS](/DCE/DFS) under an Open Source licence and the IDL interface description for BUTC is available from them.

## Discussion

---

Imported from https://wiki.wireshark.org/BUTC on 2020-08-11 23:11:40 UTC
