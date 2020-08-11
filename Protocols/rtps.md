# Real-Time Publish-Subscribe (RTPS)

-----

RTPS protocol was developed by Real-Time Innovations, Inc. as wire protocol for Data Distribution System.

This page contains only a short introduction to RTPS. For more detailed information, you can access the following sources:

  - The Real-time Publish-Subscribe Wire Protocol DDS Interoperability Wire Protocol (DDSI): <http://www.omg.org/spec/DDSI/>

  - Full OMG DDS Standard Specification: <http://www.omg.org/cgi-bin/doc?ptc/2003-07-07>

  - NDDS and RTPS information: <http://www.rti.com/resources.html>

## Introduction

With the explosion of the Internet, the TCP/UDP/IP protocol suite has become the underlying framework upon which all Internet-based communications are built. Their success attests to the generality and power of these protocols. However, these transport-level protocols are too low level to be used directly by any but the simplest applications. Consequently, higher-level protocols such as HTTP, FTP, DHCP, DCE, RTP, DCOM, and CORBA have emerged. Each of these protocols fills a niche, providing well-tuned functionality for specific purposes or application domains.

In network communications, as in many fields of engineering, it is a fact that one size does not fit all. Engineering design is about making the right set of trade-offs, and these trade-offs must balance conflicting requirements such as generality, ease of use, richness of features, performance, memory size and usage, scalability, determinism, and robustness. These trade-offs must be made in light of the types of information flow (e.g. periodic, one-to-many, request-reply, events), and the constraints imposed by the application and execution platforms.

The Real-Time Publish-Subscribe (RTPS) Wire Protocol provides two main communication models: the publish-subscribe protocol, which transfers data from publishers to subscribers; and the Composite State Transfer (CST) protocol, which transfers state.

The RTPS protocol is designed to run over an unreliable transport such as UDP/IP. The broad goals for the RTPS protocol design are:

  - Plug and play connectivity so that new applications and services are automatically discovered and applications can join and leave the network at any time without the need for reconfiguration.
  - Performance and quality-of-service properties to enable best-effort and reliable publishsubscribe communications for real-time applications over standard IP networks.
  - Configurability to allow balancing the requirements for reliability and timeliness for each data delivery.
  - Modularity to allow simple devices to implement a subset and still participate in the network.
  - Scalability to enable systems to potentially scale to very large networks.
  - Extensibility to allow the protocol to be extended and enhanced with new services without breaking backwards compatibility and interoperability.
  - Fault tolerance to allow the creation of networks without single points of failure.
  - Type-safety to prevent application programming errors from compromising the operation of remote nodes.

The RTPS Protocol runs in a Domain of DomainParticipants. A DomainParticipant contains local CommunicationEndpoints through which it sends or receives information using the RTPS Protocols. The CommunicationEndpoints are either Readers or Writers. Writers provide locally available data (a composite state or a stream of issues) on the Domain. Readers obtain this information.

There are two broad classes of Writers: Publications and CSTWriters. A Publication is a Writer that provides issues to one or more instances of a Subscription using the publish-subscribe protocol and semantics.

The presence of a Publication in an DomainParticipant indicates that the DomainParticipant is willing to publish issues to matching subscriptions on the Domain. The attributes of the Publication describe the contents (the topic), the type of the issues, and the quality of the stream of issues that is published on the Domain.

There are two broad classes of Readers: Subscriptions and CSTReaders. A Subscription is a Reader that receives issues from one or more instances of Publication, using the publish-subscribe protocol.

The presence of a Subscription indicates that the DomainParticipant wants to receive issues from Publications for a specific topic in the Domain. The Subscription has attributes that identify the contents (the topic) of the data, the type of the issues and the quality with which it wants to receive the stream of issues.

The CSTWriter and CSTReader are the equivalent of the Publication and Subscription, respectively, but are used as communication end-points of the state-synchronization protocol (CST).

Every Reader (CSTReader or Subscription) and Writer (CSTWriter or Publication) is part of an DomainParticipant. The DomainParticipant and its Readers and Writers are local, which is indicated in Figure 1.1 by the keyword "local" on the relationship between an DomainParticipant and its CommunicationEndpoints.

There are two kinds of DomainParticipants: Managers and ManagedApplications. A Manager is a special DomainParticipant that helps ManagedApplications automatically discover each other within the Domain. A ManagedApplication is an DomainParticipant that is managed by one or more Managers. Every ManagedApplication is managed by at least one Manager.

The protocol provides two types of functionality:

  - Data Distribution: The RTPS protocol specifies the message formats and communication protocols that support the publish-subscribe protocol (to send issues from Publications to Subscriptions) and the Composite State Transfer (CST) protocol (to transfer state from a CSTWriter to a CSTReader) at various service levels.

  - Administration: The RTPS protocol defines a specific use of the CST protocol that enables DomainParticipants to obtain information about the existence and attributes of all the other DomainParticipants and CommunicationEndpoints in the Domain. This metatraffic enables every DomainParticipant to obtain a complete picture of all DomainParticipants, Readers and Writers in the Domain. This information allows every DomainParticipant to send the data to the right locations and to interpret incoming packets.

## The Basic RTPS Transport Interface

RTPS is designed to run on an unreliable transport mechanism, such as UDP/IP. The protocols implement reliability in the transfer of issues and state.

RTPS takes advantage of the multicast capabilities of the transport mechanism, where one message from a sender can reach multiple receivers.

RTPS is designed to promote determinism of the underlying communication mechanism. The protocol also provides an open trade-off between determinism and reliability.

### The Basic Logical Messages

The RTPS protocol uses five logical messages:

  - ISSUE: Contains the application's UserData. ISSUEs are sent by Publications to one or more Subscriptions.

  - VAR: Contains information about the attributes of an Entity, which is part of a composite state. VARs are sent by CSTWriters to CSTReaders.

  - HEARTBEAT: Describes the information that is available in a Writer. HEARTBEATs are sent by a Writer (Publication or CSTWriter) to one or more Readers (Subscription or CSTReader).

  - GAP: Describes the information that is no longer relevant to Readers.

  - ACK: Provides information on the state of a Reader to a Writer.

Each of these logical messages are sent between specific Readers and Writers as follows:

  - Publication to Subscription(s): ISSUEs and HEARTBEATs
  - Subscription to a Publication: ACKs
  - CSTWriter to a CSTReader: VARs, GAPs and HEARTBEATs
  - CSTReader to a CSTWriter: ACKs

Readers and Writers are both senders and receivers of RTPS Messages. In the protocol, the logical messages ISSUE, VAR, HEARTBEAT, GAP and ACK can be combined into a single message in several ways to make efficient use of the underlying communication mechanism. Chapter 3 explains the format and construction of a Message.

### Underlying Wire Representation

RTPS uses the CDR (Common Data Representation) as defined by the Object Management Group (OMG) to represent all basic data and structures.

---

Imported from https://wiki.wireshark.org/Protocols/rtps on 2020-08-11 23:22:29 UTC
