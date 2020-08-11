# Service Location Protocol (SRVLOC)

The Service Location Protocol provides a scalable framework for the discovery and selection of network services. Using this protocol, computers using the Internet need little or no static configuration of network services for network based applications. This is especially important as computers become more portable, and users less tolerant or able to fulfill the demands of network system administration.

## History

XXX - add a brief description of SRVLOC history

## Protocol dependencies

  - [UDP](/UDP): Typically, SRVLOC uses [UDP](/UDP) as its transport protocol. The well known TCP/UDP port for SRVLOC traffic is 427.

## Example traffic

    Service Location Protocol
        Version: 2
        Function: DA Advertisement (8)
        Packet Length: 81
       +Flags: 0x0000
        Next Extension Offset: 0
        XID: 0
        Lang Tag Len: 2
        Lang Tag: en
        Error Code: No Error (0)
        DAADVERT Timestamp: Aug 24, 2007 11:20:58.000000000
        URL Length: 39
        URL: service:directory-agent://10.103.103.35
        Scope List Length: 11
        Scope List: OUR-DEFAULT
        Attribute List Length: 0
        Attribute List:
        SLP SPI Length: 0
        SLP SPI:
        Auths: 0 

## Wireshark

The SRVLOC dissector is fully functional. See discussion below...

## Preference Settings

(XXX add links to preference settings affecting how SRVLOC is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of SRVLOC display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/s/srvloc.html)

Show only the SRVLOC based traffic:

``` 
 srvloc 
```

## Capture Filter

You cannot directly filter SRVLOC protocols while capturing. However, if you know the [UDP](/UDP) port used (see above), you can filter on that one.

## External links

  - [Service Location Protocol on Wikipedia](http://en.wikipedia.org/wiki/Service_Location_Protocol)

  - [Service Location Protocol on SourceForge](http://www.openslp.org/)

  - [OpenSLP](http://www.openslp.org/)

  - [Service Loacation Protocol, Version 2 (RFC 2608)](http://tools.ietf.org/rfc/rfc2608.txt)

## Discussion

The attribute-list display is written to display only attributes of one type (unknown). Others are either not displayed or displayed incorrectly. --[BillFlorac](/BillFlorac)

---

Imported from https://wiki.wireshark.org/SRVLOC on 2020-08-11 23:25:49 UTC
