# Time-Triggered Ethernet (TTEthernet, TTE)

The TTEthernet protocol was developed to enable time-triggered communication over Ethernet. Its services include a clock synchronization service, a startup service, and clique detection and recovery services. TTEthernet is a transparent synchronization protocol, which means that it is able to co-exist with other traffic, potential legacy traffic, on the same physical communication network. It defines basic building blocks that allow to transparently integrate the time-triggered services on top of message-based communication infrastructures such as standard Ethernet. In addition, it is designed to operate for a multitude of cross-industry applications. As such, TTEthernet comprises demanding fault-tolerant capabilities.

TTEthernet specifies services that enable time-triggered communication on top of Ethernet, the TT Services. Messages from higher layer protocols, like IP or UDP, can easily be "made" time-triggered without modifications of the messages' contents itself. This is, because the TTEthernet protocol overhead is transmitted in dedicated messages, called Protocol Control Frames, which are used to establish system-wide clock synchronization. In short, TTEthernet is only concerned with "when" a data message is sent, rather than with specific contents within a data message.

For details about the protocol, please refer to the TTEthernet specification, available from TTTech (<ttethernet@tttech.com>).

## History

## Protocol dependencies

  - Any protocol that can be on top of standard Ethernet can also be on top of TTE.
  - Usually, UDP/IP is used (see the AFDX standard).
  - PCF: The "data payload" of such frames is entirely used by TTEthernet. PCF contain no real payload.

## Example traffic

Captured TTE traffic can, for example, look like this:

  - [TTE\_sample\_all.png](uploads/__moin_import__/attachments/TTEthernet/TTE_sample_all.png)

## Wireshark

The recognition of TTE traffic is based on the *MAC Destination Constant Field*. The TTE dissector actually consists of two dissectors, one for **TTE Data Frames** (TTE, based on ARINC664 AFDX Frame), and one for **TTE Protocol Control Frames** (TTE-PCF). The former dissects the destination MAC address and displays the "Constant Field" and the "Critical Traffic Identifier (CT ID)". The latter dissects the contents of a PCF frame, as shown in the above example.

Both dissectors are fully functional and are active by default. They can be disabled independently, using the 'Analyze.Enabled protocols...' menu entry.

## Preference Settings

Traffic satisfying the equation "Constant Field" & "CT Mask" = "CT Marker" is considered critical traffic and is hence processed by the TTE dissectors.

1.  Select "TTE" from the available protocols.
2.  Set "CT Mask" and "CT Marker" according to the above equation.

## Example capture file

  - [SampleCaptures/TTE\_mix\_small.pcap](uploads/__moin_import__/attachments/SampleCaptures/TTE_mix_small.pcap)
    
    Note: the *MAC Destination Constant Field* was set to 3000101 for this example.

## Display Filter

| Filter                  | Traffic Description                              |
| ----------------------- | ------------------------------------------------ |
| `tte `                  | all TTEthernet based                             |
| `tte.macdest==3000101 ` | all traffic to the Ethernet MAC address 3000101  |
| `tte.ctid==20 `         | all with the Critical Traffic Identifier 20      |
| `tte.pcf `              | all TTE Protocol Control Frame (PCF) traffic     |
| `tte.pcf.sd==1 `        | all TTE PCF traffic within a certain sync domain |

## Capture Filter

| Filter                                                         | Traffic Description                                                         |
| -------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `ether proto 0x891d `                                          | only frames with ethertype 0x891d                                           |
| `ether src 00:08:15:00:08:15 `                                 | only frames from 00:08:15:00:08:15                                          |
| `ether dst 00:08:15:00:08:15 and ether src 00:08:15:00:08:20 ` | only frames directed to 00:08:15:00:08:15 and coming from 00:08:15:00:08:20 |
| `less 100 `                                                    | only frames with a size of less than or equal to 100 bytes                  |

Additional examples for capture filters can be found in the tcpdump capture filter expressions at <http://www.tcpdump.org/tcpdump_man.html>.

## External links

  - The TTEthernet specification is available at <http://www.ttagroup.org/ttethernet/specification.htm>.

## Discussion

---

Imported from https://wiki.wireshark.org/TTEthernet on 2020-08-11 23:26:57 UTC
