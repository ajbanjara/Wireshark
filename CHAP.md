# PPP Challenge Handshake Authentication Protocol (CHAP)

PPP CHAP defines a method for Authentication using [PPP](/PPP), which uses a random Challenge, with a cryptographically hashed Response which depends upon the Challenge and a secret key.

## Protocol dependencies

  - [LCP](/LCP): Typically, the use of CHAP will be negociated through the use of the PPP Link Control Protocol (LCP)

## Wireshark

The PPP CHAP dissector is fully functional.

## Preference Settings

There are no preference settings currently for PPP CHAP

## Display Filter

A complete list of PPP CHAP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/c/chap.html)

Show only the PPP CHAP based traffic:

``` 
 chap
```

## Capture Filter

You cannot directly filter the PPP CHAP protocol while capturing.

## External links

  - [RFC 1994](http://www.ietf.org/rfc/rfc1994.txt) *PPP Challenge Handshake Authentication Protocol (CHAP)*

## Discussion

---

Imported from https://wiki.wireshark.org/CHAP on 2020-08-11 23:12:13 UTC
