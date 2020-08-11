# RADIUS

RADIUS is a protocol for remote user authentication, authorization and accounting (AAA). Its primary use is for Internet Service Providers, though it may as well be used on any network that needs a centralized authentication and/or accounting service for its workstations.

RADIUS is often used in larger [Wi-Fi](/Wi-Fi) (wireless) networks for AAA purposes, replacing the simple shared key methods which are uncomfortable if a Wi-Fi network reaches a specific size.

The [DIAMETER](/DIAMETER) protocol is the designated successor, but RADIUS is still commonly used today.

## History

RADIUS was originally specified in an RFI by Merit Network in 1991 to control dial-in access to NSFnet. Livingston Enterprises responded to the RFI with a description of a RADIUS server. Merit Network awarded the contract to Livingston Enterprises that delivered their [PortMaster](/PortMaster) series of Network Access Servers and the initial RADIUS server to Merit. RADIUS was later (1997) published as RFC 2058 and RFC 2059 (current versions are RFC 2865 and RFC 2866)

## Protocol dependencies

  - [UDP](/UDP): RADIUS uses [UDP](/UDP) as its underlying protocol. The registered UDP port for RADIUS traffic is 1812; the early deployment of RADIUS used UDP port 1645, which conflicted with the "datametrics" service. When RADIUS is used for accounting rather than authentication and configuration, the registered UDP port is 1813; the early deployment used port 1646, which conflicted with the "sa-msg-port" service.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

RADIUS dissector is fully functional.

## Preference Settings

### Shared Secret

` radius.shared_secret ` If not empty it will try to use the string given to decrypt encrypted AVPs (password)

## Radius Dictionary

Since version 0.10.12 the Radius dissector will try to load protocol information (Vendors, Attributes and Values) from the `dictionary` file located in the `radius` directory of either the user's directory or the defaults directory, and the files included by the `dictionary` file.

    #  The format of the dictionary (and the default dictionary)
    #  is a subset of of FreeRADIUS'.
    #
    #  Valid data types for attributes are:
    #
    #       string  - 0-253 octets
    #       ipaddr  - 4 octets in network byte order
    #       integer - 32 bit value in big endian order (high byte first)
    #             (wireshark uses this type for non-standard 1-2-3 and 8 byte integers as well)
    #       date    - 32 bit value in big endian order - seconds since
    #                                       00:00:00 GMT,  Jan.  1,  1970
    #       ifid    - 8 octets in network byte order
    #       ipv6addr   - 16 octets in network byte order
    #       ipv6prefix - 18 octets in network byte order
    #       octets  - raw octets, printed as hex strings
    
    # include another dictionary file from this directory
    $INCLUDE dictionary.juniper
    
    VENDOR  Cosine  3085
    VENDOR  Cisco   9
    
    BEGIN-VENDOR  Cosine
    ATTRIBUTE  Cosine-Connection-Profile-Name       1 string
    ATTRIBUTE  Cosine-VPI-VCI                 5 octets
    ATTRIBUTE  Cosine-DLCI                    6 integer
    END-VENDOR  Cosine
    
    
    # standard avps
    ATTRIBUTE  User-Name            1 string
    
    
    # encrypted avps 
    ATTRIBUTE  Password             2 string encrypt=1
    
    # avps with tag 
    ATTRIBUTE  Tunnel-Type          64 integer has_tag
    ATTRIBUTE  Tunnel-Password      69 string has_tag,encrypt=2
    
    # single vendor avps 
    ATTRIBUTE Cisco-Disconnect-Cause 195 integer Cisco
    
    # Values are declared
    VALUE  Tunnel-Type  PPTP     1
    VALUE  Tunnel-Type  L2F      2
    VALUE  Tunnel-Type  L2TP     3
    VALUE  Tunnel-Type  ATMP     4
    VALUE  Tunnel-Type  VTP      5
    VALUE  Tunnel-Type  AH       6
    VALUE  Tunnel-Type  IP       7
    VALUE  Tunnel-Type  MIN-IP   8
    VALUE  Tunnel-Type  ESP      9
    VALUE  Tunnel-Type  GRE      10
    VALUE  Tunnel-Type  DVS      11
    VALUE  Tunnel-Type  IP-in-IP 12
    VALUE  Tunnel-Type  VLAN     13

## Example capture file

XXX - Add a simple example capture file. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of RADIUS display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/r/radius.html)

Show only the RADIUS traffic:

``` 
 radius 
```

Show only RADIUS Access-Request messages:

``` 
 radius.code == 1 
```

Show only RADIUS Access-Accept messages:

``` 
 radius.code == 2 
```

Show only RADIUS Access-Reject messages:

``` 
 radius.code == 3 
```

Show only RADIUS Accounting-Request\[start\] messages:

``` 
 radius.Acct_Status_Type == 1 
```

Show only RADIUS Accounting-Request\[stop\] messages:

``` 
 radius.Acct_Status_Type == 2 
```

Show only RADIUS response messages that take longer than two seconds from the request:

``` 
 radius.time >= 2 
```

Show only RADIUS Access-Reject messages that come with an Reply-Message attribute containing "password":

``` 
 radius.code == 3 and radius.Reply_Message contains "password" 
```

## Capture Filter

You cannot directly filter RADIUS protocols while capturing. However, if the RADIUS traffic is using one or more of the standard [UDP](/UDP) ports (see above), you can filter on that port or ports.

Capture RADIUS authentication and configuration traffic over the assigned port (1812):

``` 
 udp port 1812 
```

Capture RADIUS accounting traffic over the assigned port (1813):

``` 
 udp port 1813 
```

Capture RADIUS authentication and configuration traffic, and RADIUS accounting traffic, over the assigned ports):

``` 
 udp port 1812 or udp port 1813 
```

## External links

  - [RFC2865](http://www.ietf.org/rfc/rfc2865.txt) Remote Authentication Dial In User Service (RADIUS)

  - [RFC2866](http://www.ietf.org/rfc/rfc2866.txt) RADIUS Accounting

  - [RFC2867](http://www.ietf.org/rfc/rfc2867.txt) RADIUS Accounting Modifications for Tunnel Protocol Support

  - [RFC2868](http://www.ietf.org/rfc/rfc2868.txt) RADIUS Attributes for Tunnel Protocol Support

  - [RFC2869](http://www.ietf.org/rfc/rfc2869.txt) RADIUS Extensions

  - [RADIUS attributes and packet type codes](http://www.iana.org/assignments/radius-types)

  - [History of RADIUS](http://www.interlinknetworks.com/app_notes/History_of_RADIUS.htm)

## RADIUS servers

See [RadiusServers](/RadiusServers) for information about various RADIUS server distributions.

## Discussion

---

Imported from https://wiki.wireshark.org/Radius on 2020-08-11 23:23:47 UTC
