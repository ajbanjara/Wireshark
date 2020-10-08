# OpenFlow (openflow)

Software Defined Networking (SDN) Southbound API standard protocol.

## History

The OpenFlow dissector is available in the current Wireshark stable release (v1.12.x). As of 2014-11-04 it supports:


| OpenFlow version | Protocol version | Status     | File                                                                                                                               |
| ---------------- | ---------------- | ---------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| OpenFlow 1.0     | 0x01             | aprox. 50% | [epan/dissectors/packet-openflow\_v1.c](https://gitlab.com/wireshark/wireshark/-/blob/master/epan/dissectors/packet-openflow_v1.c) |
| OpenFlow 1.1     | 0x02             | 0%         |                                                                                                                                    |
| OpenFlow 1.2     | 0x03             | 0%         |                                                                                                                                    |
| OpenFlow 1.3     | 0x04             | 100%       | [epan/dissectors/packet-openflow\_v4.c](https://gitlab.com/wireshark/wireshark/-/blob/master/epan/dissectors/packet-openflow_v4.c) |
| OpenFlow 1.4     | 0x05             | aprox. 90% | [epan/dissectors/packet-openflow\_v5.c](https://gitlab.com/wireshark/wireshark/-/blob/master/epan/dissectors/packet-openflow_v5.c) |
| OpenFlow 1.5     | 0x06             | 0%         |                                                                                                                                    |


## Protocol dependencies

  - [TCP](/TCP): OpenFlow uses [TCP](/TCP) as its transport protocol. Well known TCP ports for OpenFlow traffic are 6633
    
    and 6653 (the official IANA port since 2013-07-18).

## Example traffic

The [SampleCaptures](/SampleCaptures) page has example capture files.

## Preference Settings

You need to change the default port (0) to something like 6633 or 6653.

OpenFlow TCP port in the user's preferences file (\~/.wireshark/preferences):

    #  openflow TCP port if other than the default
    # A decimal number
    openflow.tcp.port: 6633

## Display Filter

A complete list of OpenFlow display filter fields can be found in the [display filter reference](https://www.wireshark.org/docs/dfref/#section_o) or listed with the following command:

    tshark -G fields | grep -i openflow

Show only the OpenFlow based traffic:

``` 
 openflow
```

Show only the OpenFlow 1.3 based traffic:

``` 
 openflow_v4
```

## Capture Filter

You cannot directly filter OpenFlow protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one. Capture only the OpenFlow traffic over the default port (6633 or 6653):

``` 
 tcp port 6633
```

## OpenFlow protocol specification changes

  - OpenFlow 1.4.0 Spec - Section B.14.17 - The TCP port number must now be 6653 (2013-08)

  - OpenFlow 1.3.3 Spec - Section B.14.2 - Replace *OpenFlow protocol* into *OpenFlow switch protocol* (EXT-357) (2013-09-27)

  - OpenFlow 1.3.3 Spec - Section B.14.2 - Replace *wire protocol* with *protocol version* (2013-09-27)

## External links

  - [Open Networking Foundation](http://www.opennetworking.org/)

  - [OpenFlow Switch Specifications](https://www.opennetworking.org/sdn-resources/technical-library)

  - [IANA OpenFlow port number](http://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml?search=openflow)

## Discussion

#### How to I know if my Wireshark version supports dissection of OpenFlow packets ?

Check the output of the following command:

    $ tshark -G protocols | grep -i openflow
    OpenFlow        openflow        openflow
    OpenFlow 1.0    openflow_v1     openflow_v1
    OpenFlow 1.3    openflow_v4     openflow_v4
    OpenFlow 1.4    openflow_v5     openflow_v5

#### Wireshark doesn't dissect my OpenFlow packets

You may have to go to the Preferences to change the default port associated with the OpenFlow dissector. Currently the dissector ships with 6653 as the default port but in the past it shipped with 0 (in Wireshark 1.11). See the **Preferences Settings** section above.

#### What is the OpenFlow port being used by Wireshark

Check the output of the following command:

    $ tshark -G decodes | grep -i openflow
    tcp.port        6653    openflow

#### Tshark doesn't dissect my OpenFlow packets

Even without changing the OpenFlow TCP default port in the Wireshark preferences, you can force tshark to decode OpenFlow packets in another port with a command similar to the following:

    tshark -d tcp.port==6633,openflow -r file.pcapng

---

Imported from https://wiki.wireshark.org/OpenFlow on 2020-08-11 23:17:40 UTC
