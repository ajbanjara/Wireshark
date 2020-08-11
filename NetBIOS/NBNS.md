# NetBIOS Name Service (NBNS)

This service is often called **WINS** on Windows systems.

The NetBIOS Name Service is part of the NetBIOS-over-TCP protocol suite, see the [NetBIOS](/NetBIOS) page for further information.

NBNS serves much the same purpose as [DNS](/DNS) does: translate human-readable names to IP addresses (e.g. www.wireshark.org to 65.208.228.223). (As NetBIOS can run on top of several different network protocols (e.g. [IP](/IP), [IPX](/IPX), ...), other implementations of the NetBIOS services have their own mechanisms for translating NetBIOS names to addresses.) NBNS's services are more limited, in that NetBIOS names exist in a flat name space, rather than DNS's hierarchical one (multiple flat name spaces can exist, by using NetBIOS scopes, but those are rarely used), and NBNS can only supply IPv4 addresses; NBNS doesn't support IPv6.

With the advent of SMB-over-TCP, it is no longer necessary to have a machine's NetBIOS name in order for that machine to make connections to SMB servers or in order for SMB connections to be made to that machine, and with the advent of "dynamic DNS", a host can register its name and its IP address or addresses with a [DNS](/DNS) server when it boots (note that its IP address might not be static - it might be granted by a [DHCP](/DHCP) server - so you can't necessarily statically register a machine's host name and IP address with a [DNS](/DNS) server). Therefore, newer Windows systems, starting with Windows 2000, can use [DNS](/DNS) for all the purposes for which NBNS was used. NBNS is still widely used especially on Windows networks, as there might still be older versions of Windows on those networks, or it might not yet have been converted to use only [DNS](/DNS).

**WINS** (Windows Internet Name Service) uses the same protocol, but unicast messages to a WINS-Server, multiple WINS servers can replicate the content with the [WINS-Replication](/WINS-Replication) protocol.

## History

See the [NetBIOS](/NetBIOS) page for the history of NetBIOS.

## Protocol dependencies

  - [UDP](/UDP): Typically, NBNS uses [UDP](/UDP) as its transport protocol. The well known UDP port for NBNS traffic is 137.

  - [TCP](/TCP): NBNS can also use [TCP](/TCP) as its transport protocol for some operations, although this might never be done in practice. The well known TCP port for NBNS traffic is 137.

## Example traffic

    No.     Time        Source                Destination           Protocol Info
          1 0.000000    192.168.20.102        192.168.255.255       NBNS     Name query NB PSMTP.COM<00>
    
    Frame 1 (92 bytes on wire, 92 bytes captured)
    Ethernet II, Src: 192.168.20.102 (00:0b:cd:ee:3b:a5), Dst: Broadcast (ff:ff:ff:ff:ff:ff)
    Internet Protocol, Src: 192.168.20.102 (192.168.20.102), Dst: 192.168.255.255 (192.168.255.255)
    User Datagram Protocol, Src Port: netbios-ns (137), Dst Port: netbios-ns (137)
    NetBIOS Name Service
        Transaction ID: 0xe17b
        Flags: 0x0110 (Name query)
            0... .... .... .... = Response: Message is a query
            .000 0... .... .... = Opcode: Name query (0)
            .... ..0. .... .... = Truncated: Message is not truncated
            .... ...1 .... .... = Recursion desired: Do query recursively
            .... .... ...1 .... = Broadcast: Broadcast packet
        Questions: 1
        Answer RRs: 0
        Authority RRs: 0
        Additional RRs: 0
        Queries
            PSMTP.COM<00>: type NB, class IN
                Name: PSMTP.COM<00> (Workstation/Redirector)
                Type: NB
                Class: IN

## Wireshark

The NBNS dissector is partially functional; it dissects NBNS-over-UDP, but not NBNS-over-TCP (I'm not sure we've ever seen any NBNS-over-TCP traffic).

## Preference Settings

(XXX add links to preference settings affecting how NBNS is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of NBNS display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/n/nbns.html)

Show only the NBNS based traffic:

``` 
 nbns
```

## Capture Filter

You cannot directly filter NBNS while capturing. However, as it runs atop [UDP](/UDP) or [TCP](/TCP) port 137, you can filter on those ports.

Capture NBNS traffic:

``` 
 port 137
```

## External links

  - [RFC1001](http://www.ietf.org/rfc/rfc1001.txt) *Protocol Standard For a NetBIOS Service on a TCP/UDP Transport: Concepts and Methods*

  - [RFC1002](http://www.ietf.org/rfc/rfc1002.txt) *Protocol Standard For a NetBIOS Service on a TCP/UDP Transport: Detailed Specifications*

## Discussion

---

Imported from https://wiki.wireshark.org/NetBIOS/NBNS on 2020-08-11 23:17:12 UTC
