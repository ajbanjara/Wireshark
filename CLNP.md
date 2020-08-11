# Connection Less Network Protocol (CLNP)

For an overview, see the [IsoProtocolFamily](/IsoProtocolFamily) page.

You will often see this to be an "Inactive subset" as this layer was often simply not implemented in the ISO protocol stacks.

## History

CLNP is a layer-3 connectionless protocol defined by OSI and specified in ITU-T X.233 and ISO/IEC 8473-1. It never enjoyed wide acceptance, IP instead becoming the layer-3 protocol of choice in the networking community. It was however defined as the layer-3 protocol in the SDH/SONET management protocol stack and this is practically the only application where it is still in use.

## Protocol dependencies

  - [LLC](/LLC): Typically, CLNP uses [LLC](/LLC) as its transport protocol, atop a LAN protocol, although it can also run atop, for example, X.25.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The CLNP dissector is (fully functional, partially functional, not existing, ... whatever the current state is) - XXX - please add info, I don't know.

## Preference Settings

(XXX add links to preference settings affecting how CLNP is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here. Keep it short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

## Display Filter

A complete list of CLNP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/c/clnp.html)

Show only the CLNP based traffic:

``` 
 clnp 
```

## Capture Filter

Capture CLNP based traffic only:

``` 
 clnp 
```

This might not work with older versions of libpcap/WinPcap.

## External links

  - [ITU-T Recommendation X.233](http://www.itu.int/rec/T-REC-X.233-199708-I)

## Discussion

---

Imported from https://wiki.wireshark.org/CLNP on 2020-08-11 23:12:17 UTC
