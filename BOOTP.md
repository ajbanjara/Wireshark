# Bootstrap Protocol (BOOTP)

BOOTP is a client/server protocol used to dynamically assign various parameters from a BOOTP server at boot time.

See also [DHCP](/DHCP) which uses BOOTP.

## History

BOOTP was devised in the 1980's as a more capable alternative than [RARP](/RARP), which was then used as address assignment protocol. Besides address assignment BOOTP provides bootstrap information to allow a client to contact a server for a download file. The constant addition of vendor options eventually resulted in a progression to [DHCP](/DHCP).

## Protocol dependencies

  - [UDP](/UDP): Typically, BOOTP uses [UDP](/UDP) as its transport protocol. The well known UDP port for a BOOTP client is 68 and for a BOOTP server is 67.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The BOOTP dissector is fully functional.

## Preference Settings

(XXX add links to preference settings affecting how BOOTP is dissected).

## Example capture file

XXX - Add a simple example capture file. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of BOOTP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/b/bootp.html)

Show only the BOOTP based traffic:

``` 
 bootp 
```

## Capture Filter

You cannot directly filter BOOTP protocols while capturing if they are going to or from arbitrary ports. However, BOOTP traffic normally goes to or from ports 67 and 68, and traffic to and from those ports is normally BOOTP traffic, so you can filter on those port numbers.

Capture only traffic to and from ports 67 and 68:

``` 
 port 67 or port 68 
```

On many systems, you can say "port bootps" rather than "port 67" and "port bootpc" rather than "port 68".

## External links

  - [RFC951](http://www.ietf.org/rfc/rfc951.txt) *Bootstrap Protocol*

  - [RFC1542](http://www.ietf.org/rfc/rfc1542.txt) *Clarifications and Extensions for the Bootstrap Protocol*

  - [RFC2132](http://www.ietf.org/rfc/rfc2132.txt) *DHCP Options and BOOTP Vendor Extensions*

## Discussion

---

Imported from https://wiki.wireshark.org/BOOTP on 2020-08-11 23:11:35 UTC
