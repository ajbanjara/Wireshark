# Amateur Radio Protocols

I can not really do better than [the AX.25 article on Wikipedia](http://en.wikipedia.org/wiki/AX.25).

## History

Again I can not really do better than [the AX.25 article on Wikipedia](http://en.wikipedia.org/wiki/AX.25).

## Protocols

### OSI Layer 2-ish

  - [AX.25](/AX.25) - derived from the X.25 protocol suite for use on Amateur Radio

### OSI Layer 3-ish

  - Flexnet

  - NETROM - provides route management, route dissemination, remote command

  - ROSE - [X.25](/X.25) by another name

### Application data formats

  - [APRS](http://www.aprs.org/) - Automatic Packet Reporting System

  - [OpenTRAC](http://opentrac.org/) - Open Tactical Reporting and Communication Protocol - not currently implemented

### TNC control protocols

  - [KISS](/KISS) - [SLIP](http://en.wikipedia.org/wiki/Serial_Line_Internet_Protocol) plus some [TNC](http://en.wikipedia.org/wiki/Terminal_node_controller) commands.

  - 6PACK - a [TNC](http://en.wikipedia.org/wiki/Terminal_node_controller) control protocol - not currently implemented

### Encapsulations

  - AXIP - AX.25 over IP
  - AXUDP - AX.25 over UDP

## External links

  - <https://www.tapr.org/pub_ax25.html>

  - <http://www.ax25.net/AX25.2.2-Jul%2098-2.pdf>

  - <http://www.ka9q.net/papers/kiss.html>

  - <http://www.ax25.net/kiss.aspx>

  - <ftp://ftp.ucsd.edu/hamradio/packet/tcpip/docs/netrom.ps.gz>

  - <http://en.wikipedia.org/wiki/AX.25>

  - <http://opentrac.org/spec.pdf>

  - <http://www.aprs.org/doc/APRS101.PDF>

  - <http://tools.ietf.org/html/rfc1055>

## Discussion

  - AX.25 over UDP, TCP This LUA script registers the AX.25 protocol against a UDP port.

  - ``` 
    -- ax25-udp.lua
    
    -- load the udp.port table
    udp_table = DissectorTable.get( "udp.port" )
    
    -- get a handle to the AX.25 dissector
    proto_ax25 = Dissector.get( "ax25" )
    
    -- register AX.25 to handle udp port
    udp_table:add( 10093, proto_ax25 )
    ```
    
    For TCP substitute "tcp" for "udp" in the above script. Amend the port number (10093 in the above example) to the one relevant to your operations. If more then one port is used then add extra xxx\_table:add() lines to the script

  - KISS - The KISS dissector in Wireshark handles only the various commands, it does not handle the [SLIP](http://en.wikipedia.org/wiki/Serial_Line_Internet_Protocol) based framing and escape codes. The reasons behind this are:
    
      - that the AX.25 stack in Linux "encapsulates" the AX.25 frame in a KISS data frame, but without the escape coding
    
      - some implementations of KISS over \<some other protocol\> seen in the wild do the same. For those wanting a full KISS implementation then this file [kiss-framing.lua](uploads/__moin_import__/attachments/AmateurRadioProtocolFamily/kiss-framing.lua "Upload new attachment \"kiss-framing.lua\"") is an LUA script that handles the SLIP framing and hands off the KISS commands to the ax25\_kiss dissector. As above for TCP substitute "tcp" for "udp" in the above script. Amend the port number to the one relevant to your operations. If more then one port is used then add extra xxx\_table:add() lines to the script

---

Imported from https://wiki.wireshark.org/AmateurRadioProtocolFamily on 2020-08-11 23:11:08 UTC
