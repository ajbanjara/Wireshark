# Access Link Control Application Part (ALCAP)

ALCAP is the protocol used for control plane of transport layer [UMTS](/UMTS) in charge of managing and multiplexing users into [ATM](/ATM) [AAL2](/AAL2) virtual connections. ALCAP is specified for Iub, Iur and Iu (circuit switched domain) interfaces. This protocol is only used when these interfaces are ATM-based. The [ITU-T](/ITU-T) Q.2630.2 standard, AAL type 2 signalling protocol - Capability Set 2, is chosen for ALCAP protocol.

## History

For Iub and Iur interfaces, ALCAP is specified in [3GPP](/3GPP) TS 25.426. For Iu interface, ALCAP is specified in 3GPP TS 25.414.

## Protocol dependencies

  - [SSCOP](/SSCOP): the SAAL sublayer that transports ALCAP signaling messages.

  - [SSCF-NNI](/SSCF-NNI), [MTP3b](/MTP3b): additional layers applicable only for Iur and Iu interfaces.

## Example traffic

Example of ALCAP (Q.2630) Establish request message decoded by Wireshark:

    AAL type 2 signalling protocol (Q.2630)
        DSAID: 0x00000000
        Message Type: Establish request (ERQ) (5)
        Message Compatibility: 22
            .0.. .... = Pass-On SNI: Do Not Send Notification (0)
            ..10 .... = Pass-On II: Discard Message (2)
            .... .0.. = General SNI: Do Not Send Notification (0)
            .... ..10 = General II: Discard Message (2)
        Parameter: Originating signalling association identifier (OSAID) (6)
            Message Compatibility: 22
                .0.. .... = Pass-On SNI: Do Not Send Notification (0)
                ..10 .... = Pass-On II: Discard Message (2)
                .... .0.. = General SNI: Do Not Send Notification (0)
                .... ..10 = General II: Discard Message (2)
            Length: 4
            OSAID: 0x02000044
        Parameter: Connection element identifier (CEID) (2)
            Message Compatibility: 22
                .0.. .... = Pass-On SNI: Do Not Send Notification (0)
                ..10 .... = Pass-On II: Discard Message (2)
                .... .0.. = General SNI: Do Not Send Notification (0)
                .... ..10 = General II: Discard Message (2)
            Length: 5
            Path ID: 65
            CID: 127
        Parameter: Destination NSAP service endpoint address (DNSEA) (4)
            Message Compatibility: 22
                .0.. .... = Pass-On SNI: Do Not Send Notification (0)
                ..10 .... = Pass-On II: Discard Message (2)
                .... .0.. = General SNI: Do Not Send Notification (0)
                .... ..10 = General II: Discard Message (2)
            Length: 20
            Address: 4556789ABCDEF0120F0000000000000000000000
            IDP = 4556789ABCDEF0120F
            X.213 Address Format Information ( AFI ): E.164 (0x45)
            IDI = 56789ABCDEF0120F
            Country Code: 56 Chile length 2
            DSP length 11(len 20 -9 )
            X.213 Address Format Information ( DSP ): 0000000000000000000000
        Parameter: Link characteristics (ALC) (5)
            Message Compatibility: 22
                .0.. .... = Pass-On SNI: Do Not Send Notification (0)
                ..10 .... = Pass-On II: Discard Message (2)
                .... .0.. = General SNI: Do Not Send Notification (0)
                .... ..10 = General II: Discard Message (2)
            Length: 12
            Maximum Forward Bit Rate: 75
            Maximum Backwards Bit Rate: 81
            Average Forward Bit Rate: 75
            Average Backwards Bit Rate: 16
            .001 1000 = Maximum Forward CPS SDU Size: 24
            .001 1010 = Maximum Backwards CPS SDU Size: 26
            .001 1000 = Average Forward CPS SDU Size: 24
            .001 1010 = Average Backwards CPS SDU Size: 26
        Parameter: Served user generated reference (SUGR) (7)
            Message Compatibility: 22
                .0.. .... = Pass-On SNI: Do Not Send Notification (0)
                ..10 .... = Pass-On II: Discard Message (2)
                .... .0.. = General SNI: Do Not Send Notification (0)
                .... ..10 = General II: Discard Message (2)
            Length: 4
            SUGR: 0F000000
        Parameter: Served user transport (SUT) (8)
            Message Compatibility: 11
                .0.. .... = Pass-On SNI: Do Not Send Notification (0)
                ..01 .... = Pass-On II: Discard Parameter (1)
                .... .0.. = General SNI: Do Not Send Notification (0)
                .... ..01 = General II: Discard Parameter (1)
            Length: 3
            SUT Length: 0x02
            SUT: 0204

## Wireshark

The ALCAP dissector is fully functional however it can presently only be called by a user DLT (data link type) or called by name from another dissector. See [FileFormatReference](/FileFormatReference).

## Preference Settings

(XXX add links to preference settings affecting how PROTO is dissected).

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/...](uploads/__moin_import__/attachments/SampleCaptures/... "Upload new attachment \"...\"")

## Display Filter

A complete list of ALCAP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/a/alcap.html)

Show only the ALCAP based traffic:

``` 
 alcap 
```

## Capture Filter

Because ALCAP traces can only currently be read from existing trace files, there is no way to filter for ALCAP messages while capturing.

## External links

  - [3GPP specification: 25.414](http://www.3gpp.org/ftp/Specs/html-info/25414.htm)

  - [3GPP specification: 25.426](http://www.3gpp.org/ftp/Specs/html-info/25426.htm)

  - [ITU-T Recommendation Q.2630.2 AAL type 2 signalling protocol - Capability Set 2](http://www.itu.int/rec/T-REC-Q.2630.2-200012-I/en) (2000-12 version)

## Discussion

---

Imported from https://wiki.wireshark.org/ALCAP on 2020-08-11 23:11:07 UTC
