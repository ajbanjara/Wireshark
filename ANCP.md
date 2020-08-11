# Access Node Control Protocol (ANCP)

The Access Node Control Protocol (ANCP) is a TCP based protocol intended to facilitate the transmission of control and dynamic subscriber configuration information between an access node (DSLAM) and a L3 subscriber aware controller (BRAS/NAS).

## History

ANCP started out as L2CP (Layer 2 Control Protocol) in the IETF WG, and was later renamed to ANCP. The current charter is at <http://datatracker.ietf.org/wg/ancp/charter/>.

Most of the ANCP message formats and state machine is derived from GSMPv3(RFC 3292). Although GSMP can run directly on L2 (ATM/Eth), ANCP runs on TCP and uses the GSMP TCP Encapsulation.

ANCP has its own Adjacency layer over TCP. The messages that ANCP endpoints can exchange are decided at ANCP adjacency establishment with the use of 'Capabilities'. No other message will be processed until ANCP capability negotiation happens and both endpoints agree upon a common capability set.

## Protocol dependencies

  - [TCP](/TCP): Typically, ANCP uses [TCP](/TCP) as its transport protocol. The well known TCP port for ANCP traffic is 6068.

## Example traffic

ANCP Adjacency (SYN) Message with capabilities (Topology-Discovery and OAM):

    Internet Protocol, Src: 10.1.1.1 (10.1.1.1), Dst: 10.1.1.2 (10.1.1.2)
    Transmission Control Protocol, Src Port: 19717 (19717), Dst Port: gsmp (6068), Seq: 1, Ack: 1, Len: 48
    Access Node Control Protocol
        Length: 44
        Version: 0x31 (3.1)
        Message Type: Adjacency (10)
        Timer: 100 msec
        .000 0001 = Code: 1 (Syn, M Flag Unset)
        Sender Name: aa:bb:cc:00:7c:00 (aa:bb:cc:00:7c:00)
        Receiver Name: 00:00:00_00:00:00 (00:00:00:00:00:00)
        Sender Port: 0
        Receiver Port: 0
        Partition Info: 0x01 (Type = 0, Flag = 1)
        Sender Instance: 1
        Partition ID: 0
        Receiver Instance: 0
        Tech Type: DSL (5)
        Num TLVs: 2
            Length: 8
            Capability: Dynamic-Topology-Discovery (1) (0 bytes)
            Capability: OAM (4) (0 bytes)

## Wireshark

The ANCP dissector supports the following messages

  - Adjacency Message
  - Topology Discovery Extensions:
      - Port-Up Message
      - Port-Down MEssage
  - OAM Extension:
      - Port Management Message

In the Wireshark GUI, Statistics-\>ANCP-\>Packet Types stats, shows the ANCP message statistics.

## Example capture file

  - [SampleCaptures/ancp.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/ancp.pcap.gz)

## Display Filter

A complete list of ANCP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/a/ancp.html)

Show only the ANCP based traffic:

``` 
 ancp 
```

## External links

  - Additional info on IETF

  - [Protocol I-D](http://tools.ietf.org/html/draft-ietf-ancp-protocol-09)

  - [Framework](http://tools.ietf.org/html/draft-ietf-ancp-framework-13)

## Discussion

ANCP Multicast support to be added.

---

Imported from https://wiki.wireshark.org/ANCP on 2020-08-11 23:11:10 UTC
