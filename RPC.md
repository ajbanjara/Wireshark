# Remote Procedure Call (RPC) protocols

RPC is used to uniformly call a procedure (a function) on a remote machine. (It can usually also be used between processes on the same machine.)

This should be possible regardless of the different platform-specific details (like actual data sizes, endianness, padding, ...). RPC mechanisms include a "marshalling" function to gather up the arguments to the procedure and send them from the caller to the callee in a standardized format, or to indicate in the call message the format being used. The callee will "un-marshall" the received arguments and supply them to the code that executes the call. Similarly, the results of the call are marshalled into a standardized format before being sent from the callee back to the caller, and un-marshalled and supplied to the caller after being received. XXX - a diagram might explain this much better

Often the various RPC mechanisms provide additional services, such as grouping several related functions in a so called program (ONC-RPC) or interface (DCE/RPC).

The "traditional" RPC services are not well suited for the internet (e.g. dynamically choosing port numbers causing problems with firewalls). New RPC-like protocols are called **Web services** and often use HTTP for transport and XML for the content (i.e., using XML as the standardized format for marshalling arguments and results).

There are several different RPC mechanisms available:

  - [ONC-RPC](/ONC-RPC): Open Network Computing - Remote Procedure Calls: The [RPC](/RPC) mechanism (often called "Sun RPC") used on many Un\*x systems to implement services such as [NIS](/NIS) and [NFS](/NFS).

  - [DCE/RPC](/DCE/RPC): Distributed Computing Environment / Remote Procedure Call: The protocol used for many remote procedure call-based applications, including many applications from Microsoft.

  - [DCOM](/DCOM): Distributed Component Object Model: Microsoft's "object oriented" RPC based on [DCE/RPC](/DCE/RPC), obsoleted by [SOAP](/SOAP)

  - [CORBA](/CORBA): Common Object Request Broker Architecture: RPC mechanism (and a lot more) be the OMG (Object Management Group)

  - [XML-RPC](/XML-RPC): an RPC mechanism using [HTTP](/HTTP) as the transport mechanism and [XML](/XML) as the marshalling mechanism

  - [SOAP](/SOAP): Simple Object Access Protocol: an object-oriented derivative of XML-RPC (is the relationship between XML-RPC and SOAP similar to the one between DCE/RPC and DCOM?).

  - [RX](/RX): The [RPC](/RPC) mechanism used by AFS and no one else. It has some very interesting properties.

## External links

  - <http://en.wikipedia.org/wiki/RPC>

## Discussion

---

Imported from https://wiki.wireshark.org/RPC on 2020-08-11 23:24:03 UTC
