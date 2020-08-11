# Directory Access Protocol (DAP)

The Directory Access Protocol (DAP) is used by Directory User Agemts (DUAs) to retrieve information from a Directory System Agent (DSA). The information in the DSA is stored in entries in a hierarchical form, with each entry containing attributes that are specific to one of more object classes. DAP allows a client to list, search, add, delete, modify and rename the entries within the DSA.

If a DSA does not hold the information being searched for, it may chain the DAP operation to another DSA using [DSP](/DSP).

## History

## Protocol dependencies

  - [ROS](/ROS): Typically, DAP uses [ROS](/ROS) during connection establishment (abstract syntax [2.5.3.1](http://oid.elibel.tm.fr/2.5.3.1)).

  - [ACSE](/ACSE): Typically, DAP uses [ACSE](/ACSE) for association control (association context [2.5.9.1](http://oid.elibel.tm.fr/2.5.9.1))

  - [COTP](/COTP): Typically, DAP uses [COTP](/COTP) as its transport protocol. The well known TCP port for DAP traffic is 102, though some DSAs will often listen on other ports e.g. 19970.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Wireshark

The DAP dissector is fully functional, including support for signed operations.

## Preference Settings

There is a single preference field for the DAP dissector, the DAP TCP Port - the port to which DAP associations are made. The default value is 102.

## Example capture file

To be provided.

## Display Filter

A complete list of DAP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/d/dap.html)

Show only the DAP based traffic:

``` 
 dap
```

## Capture Filter

You cannot directly filter DAP protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the DAP traffic over a non-standard port (19970):

``` 
 tcp port 19970 
```

## External links

  - [ASN.1 Specification from ITU](http://www.itu.int/ITU-T/asn1/database/itu-t/x/x511/2005/DirectoryAbstractService.html)

  - [X.511 Recommendation](http://www.itu.int/rec/T-REC-X.511-200508-I/en)

  - [Understanding X.500 - The Directory](http://www.cs.kent.ac.uk/pubs/1996/2051/) David Chadwick's book

## Discussion

---

Imported from https://wiki.wireshark.org/DAP on 2020-08-11 23:12:26 UTC
