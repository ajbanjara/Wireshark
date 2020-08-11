# Rlogin

Rlogin provides a remote-echoed, locally flow-controlled virtual terminal. It is widely used between Unix hosts.

## History

Rlogin was originally a BSD application / protocol.

## Protocol dependencies

  - [TCP](/TCP): Rlogin uses [TCP](/TCP) as its transport protocol. The well known TCP port for Rlogin traffic is 513.

## Wireshark

The Rlogin dissector is functional.

## Preference Settings

n/a

## Display Filter

A complete list of Rlogin display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/r/rlogin.html)

Show only the Rlogin based traffic:

``` 
 rlogin 
```

## Capture Filter

You cannot directly filter Rlogin protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the Rlogin traffic over the default port (513):

``` 
 tcp port 513 
```

## External links

  - [RFC 1282](http://www.ietf.org/rfc/rfc1282.txt) *BSD Rlogin*

## Discussion

---

Imported from https://wiki.wireshark.org/RLogin on 2020-08-11 23:24:00 UTC
