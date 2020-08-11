# Node-B Application Protocol (NBAP)

NBAP is the protocol for signaling between UTRAN [RNC](/RNC) and [NodeB](/NodeB) over [Iub](/Iub) interface. The Iub interface can be either [ATM](/ATM)-based or [IP](/IP)-based.

  - In ATM-based Iub, NBAP is carried inside [SAAL](/SAAL) over ATM [AAL2](/AAL2).

  - In IP-based Iub, NBAP is carried inside [SCTP](/SCTP) over IP.

## History

NBAP is specified in [3GPP](/3GPP) TS 25.433. IP option for Iub is introduced in UMTS Release 5.

## Protocol dependencies

Depending on the Iub interface option either of the following is required:

  - [SSCOP](/SSCOP), the SAAL sublayer that transports NBAP signaling messages, for ATM option.

  - [SCTP](/SCTP) for IP option

## Example traffic

An example of NBAP id-radioLinkDeletion initiating message decoded by Wireshark:

    UTRAN Iub interface NBAP signalling
        NBAP-PDU: initiatingMessage (0)
            initiatingMessage
                procedureID
                    procedureCode: id-radioLinkDeletion (24)
                    ddMode: common (2)
                criticality: reject (0)
                messageDiscriminator: dedicated (1)
                transactionID: shortTransActionId (0)
                    shortTransActionId: 0
                initiatingMessageValue
                    id-radioLinkDeletion
                        protocolIEs: 3 items
                            Item 0
                                Item
                                    id: id-NodeB-CommunicationContextID (143)
                                    criticality: reject (0)
                                    value
                                        id-NodeB-CommunicationContextID: 23
                            Item 1
                                Item
                                    id: id-CRNC-CommunicationContextID (44)
                                    criticality: reject (0)
                                    value
                                        id-CRNC-CommunicationContextID: 23
                            Item 2
                                Item
                                    id: id-RL-informationList-RL-DeletionRqst (213)
                                    criticality: notify (2)
                                    value
                                        id-RL-informationList-RL-DeletionRqst: 1 item
                                            Item 0
                                                Item
                                                    id: id-RL-informationItem-RL-DeletionRqst (206)
                                                    criticality: notify (2)
                                                    value
                                                        id-RL-informationItem-RL-DeletionRqst
                                                            rL-ID: 0

## Wireshark

The NBAP dissector is fully functional however it can presently only be called by a user DLT (data link type) or called by name from another dissector. See [FileFormatReference](/FileFormatReference).

## Preference Settings

There is no Wireshark preference settings for NBAP.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/PROTO.pcap](uploads/__moin_import__/attachments/SampleCaptures/PROTO.pcap)

## Display Filter

A complete list of NBAP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/n/nbap.html)

Show only the NBAP based traffic:

``` 
 nbap 
```

## Capture Filter

Because NBAP traces can only currently be read from existing trace files, there is no way to filter for NBAP messages while capturing.

## External links

  - [3GPP specification: 25.433](http://www.3gpp.org/ftp/Specs/html-info/25433.htm)

## Discussion

---

Imported from https://wiki.wireshark.org/NBAP on 2020-08-11 23:17:06 UTC
