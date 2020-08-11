# ISDN User Part (ISUP)

This protocol is used as signalling in trunks between telephone exchanges to establish and release calls.

ISUP is standardized by [ITU-T](/ITU-T) in Q.761 to Q.769. There are several national variants as well.

[BICC](/BICC) (Bearer Independent Call Control), defined by Q.1901 and annexes, is an extension of ISUP.

## History

ISUP supercedes TUP (Telephony User Part) as the standard for call control between telephone exchanges. Its first deployments date back to the early 80's, It is still used by most exchanges. BICC, ISUP's successor and extension should replace this protocol as Telephone Operators migrate from TDM links ([E1](/E1)/[T1](/T1)) to Packet Based systems (mainly [IP](/IP) and [ATM](/ATM)).

## Protocol dependencies

  - [MTP3](/MTP3): Typically, ISUP uses [MTP3](/MTP3) as its transport protocol. The service indicator ISUP uses is 5.

## Example traffic

``` 
  1   0.000000   10.28.6.42 -> 10.28.6.44   ISUP (ITU) IAM (CIC 213)
  2   0.006621   10.28.6.44 -> 10.28.6.42   ISUP (ITU) CFN (CIC 213)
  3   0.123844   10.28.6.44 -> 10.28.6.42   ISUP (ITU) ACM (CIC 213)
  4   0.124157   10.28.6.44 -> 10.28.6.42   ISUP (ITU) ANM (CIC 213)
  5  17.068921   10.28.6.42 -> 10.28.6.44   ISUP (ITU) REL (CIC 213)
  6  17.089918   10.28.6.44 -> 10.28.6.42   ISUP (ITU) RLC (CIC 213)
Message Transfer Part Level 3
    Service information octet
        11.. .... = Network indicator: Reserved for national use (0x03)
        ..00 .... = Spare: 0x00
        .... 0101 = Service indicator: ISUP (0x05)
    Routing label
        .... .... .... .... ..10 1111 1000 0011 = DPC: 12163
        .... 1011 0100 0000 10.. .... .... .... = OPC: 11522
        0101 .... .... .... .... .... .... .... = Signalling Link Selector: 5
ISDN User Part
    CIC: 213
    Message type: Initial address (1)
    Nature of Connection Indicators: 0x0
        Mandatory Parameter: 6 (Nature of connection indicators)
        .... ..00 = Satellite Indicator: No Satellite circuit in connection (0x00)
        .... 00.. = Continuity Check Indicator: Continuity check not required (0x00)
        ...0 .... = Echo Control Device Indicator: Echo control device not included
    Forward Call Indicators: 0xa001
        Mandatory Parameter: 7 (Forward call indicators)
        .... ...0 .... .... = National/international call indicator: Call to be treated as national call
        .... .00. .... .... = End-to-end method indicator: No End-to-end method available (only link-by-link method available) (0x0000)
        .... 0... .... .... = Interworking indicator: no interworking encountered (No.7 signalling all the way)
        ...0 .... .... .... = End-to-end information indicator: no end-to-end information available
        ..1. .... .... .... = ISDN user part indicator: ISDN user part used all the way
        10.. .... .... .... = ISDN user part preference indicator: ISDN user part required all the way (0x0002)
        .... .... .... ...1 = ISDN access indicator: originating access ISDN
        .... .... .... .00. = SCCP method indicator: No indication (0x0000)
    Calling Party's category: 0xa (ordinary calling subscriber)
        Mandatory Parameter: 9 (Calling party's category)
        Calling Party's category: ordinary calling subscriber (0x0a)
    Transmission medium requirement: 2 (64 kbit/s unrestricted)
        Mandatory Parameter: 2 (Transmission medium requirement)
        Transmission medium requirement: 64 kbit/s unrestricted (2)
    Called Party Number: 4891F
        Mandatory Parameter: 4 (Called party number)
        Pointer to Parameter: 2
        Parameter length: 5
        1... .... = Odd/even indicator: odd number of address signals
        .000 0001 = Nature of address indicator: subscriber number (national use) (1)
        1... .... = INN indicator: routing to internal network number not allowed
        .001 .... = Numbering plan indicator: ISDN (Telephony) numbering plan (1)
        Called Party Number: 4891F
            .... 0100 = Address signal digit: 4 (4)
            1000 .... = Address signal digit: 8 (8)
            .... 1001 = Address signal digit: 9 (9)
            0001 .... = Address signal digit: 1 (1)
            .... 1111 = Address signal digit: Stop sending (15)
            E.164 Called party number digits: 4891F
    Pointer to start of optional part: 7
    Calling Party Number: 3933399708
        Optional Parameter: 10 (Calling party number)
        Parameter length: 7
        0... .... = Odd/even indicator: even number of address signals
        .000 0011 = Nature of address indicator: national (significant) number (3)
        0... .... = NI indicator: complete
        .001 .... = Numbering plan indicator: ISDN (Telephony) numbering plan (1)
        .... 01.. = Address presentation restricted indicator: presentation restricted (1)
        .... ..11 = Screening indicator: network provided (3)
        Calling Party Number: 3933399708
            .... 0011 = Address signal digit: 3 (3)
            1001 .... = Address signal digit: 9 (9)
            .... 0011 = Address signal digit: 3 (3)
            0011 .... = Address signal digit: 3 (3)
            .... 0011 = Address signal digit: 3 (3)
            1001 .... = Address signal digit: 9 (9)
            .... 1001 = Address signal digit: 9 (9)
            0111 .... = Address signal digit: 7 (7)
            .... 0000 = Address signal digit: 0 (0)
            1000 .... = Address signal digit: 8 (8)
            E.164 Calling party number digits: 3933399708
    Optional forward call indicators: non-CUG call (128)
        Optional Parameter: 8 (Optional forward call indicators)
        Parameter length: 1
        .... ..00 = Closed user group call indicator: non-CUG call (0)
        .... .0.. = Simple segmentation indicator: no additional information will be sent
        1... .... = Connected line identity request indicator: requested
    Access transport (5 bytes length)
        Optional Parameter: 3 (Access transport)
        Parameter length: 5
        Access transport parameter field (-> Q.931)
        Low-layer compatibility
            Information element: Low-layer compatibility
            Length: 3
            ...0 1000 = Information transfer capability: Unrestricted digital information (0x08)
            .00. .... = Coding standard: ITU-T standardized coding (0x00)
            1... .... = Extension indicator: last octet
            ...1 0000 = Information transfer rate: 64 kbit/s (0x10)
            .00. .... = Transfer mode: Circuit mode (0x00)
            1... .... = Extension indicator: last octet
            ...0 0110 = User information layer 1 protocol: Recommendation H.223 and H.245 (0x06)
            1... .... = Extension indicator: last octet
    User service information, (3 bytes length)
        Optional Parameter: 29 (User service information)
        Parameter length: 3
        User service information (-> Q.931 Bearer_capability)
        ...0 1000 = Information transfer capability: Unrestricted digital information (0x08)
        .00. .... = Coding standard: ITU-T standardized coding (0x00)
        1... .... = Extension indicator: last octet
        ...1 0000 = Information transfer rate: 64 kbit/s (0x10)
        .00. .... = Transfer mode: Circuit mode (0x00)
        1... .... = Extension indicator: last octet
        ...0 0110 = User information layer 1 protocol: Recommendation H.223 and H.245 (0x06)
        1... .... = Extension indicator: last octet
    Propagation delay counter = 100 ms
        Optional Parameter: 49 (Propagation delay counter)
        Parameter length: 2
        Propagation delay counter = 100 ms
    Location number: 00600001
        Optional Parameter: 63 (Location number)
        Parameter length: 6
        0... .... = Odd/even indicator: even number of address signals
        .000 0011 = Nature of address indicator: national (significant) number (3)
        1... .... = INN indicator: routing to internal network number not allowed
        .001 .... = Numbering plan indicator: ISDN (Telephony) numbering plan (1)
        .... 00.. = Address presentation restricted indicator: presentation allowed (0)
        .... ..11 = Screening indicator: network provided (3)
        Location number: 00600001
            .... 0000 = Address signal digit: 0 (0)
            0000 .... = Address signal digit: 0 (0)
            .... 0110 = Address signal digit: 6 (6)
            0000 .... = Address signal digit: 0 (0)
            .... 0000 = Address signal digit: 0 (0)
            0000 .... = Address signal digit: 0 (0)
            .... 0000 = Address signal digit: 0 (0)
            0001 .... = Address signal digit: 1 (1)
    Parameter Type unknown/reserved (5 Bytes)
        Optional Parameter: 244 (unknown)
        Parameter length: 5
    Parameter compatibility information (2 bytes length)
        Optional Parameter: 57 (Parameter compatibility information)
        Parameter length: 2
        Upgraded parameter no: 1 = unknown (244)
        Instruction indicators: 0x90
        .... ...0 = Transit at intermediate exchange indicator: Transit interpretation
        .... ..0. = Release call indicator: do not release call
        .... .0.. = Send notification indicator: do not send notification
        .... 0... = Discard message indicator: Do not discard message (pass on)
        ...1 .... = Discard parameter indicator: Discard parameter
        .00. .... = Pass on not possible indicator: Release call (0x00)
        1... .... = Extension indicator: last octet
    End of optional parameters (0)
```

## Wireshark

The ISUP dissector is fully functional

## Preference Settings

The only preference is "Show CIC in info column" a Boolean used to show the CIC (channel ID) to which the message is referred.

## Example capture file

  - [SampleCaptures/isup.cap](uploads/__moin_import__/attachments/SampleCaptures/isup.cap) a single call's signalling sequence using ISUP/MTP3/M3UA/SCTP/IP ( Note that this trace is a M3UA draft 6 capture. You must set your M3UA preferences to Draft 6 by selecting Edit -\>Preferences -\> Protocols -\>M3UA -\> Draft 6 )

## Display Filter

A complete list of ISUP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/i/isup)

Show only the ISUP traffic:

``` 
 isup 
```

## Capture Filter

You cannot directly filter ISUP packets while capturing. However, in case ISUP runs over MTP3/M3UA/SCTP/IP you could filter SCTP traffic using

``` 
 ip proto 0x84
```

or, with newer versions of libpcap/WinPcap,

``` 
 ip proto sctp
```

.

## External links

  - <http://www.itu.int> ITU - International Telecommunication Union

## Discussion

---

Imported from https://wiki.wireshark.org/Protocols/isup on 2020-08-11 23:20:28 UTC
