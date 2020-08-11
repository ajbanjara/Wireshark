# OPC - OLE For Process Control

OPC is a series of standards specifications. The first standard (originally called simply the OPC Specification and now called the Data Access Specification) resulted from the collaboration of a number of leading worldwide automation suppliers working in cooperation with Microsoft. Originally based on Microsoft's OLE COM (component object model) and DCOM (distributed component object model) technologies, the specification defined a standard set of objects, interfaces and methods for use in process control and manufacturing automation applications to facilitate interoperability. The COM/DCOM technologies provided the framework for software products to be developed. There are now hundreds of OPC Data Access servers and clients.

## History

OPC Data Access was the first OPC specification. It was very easy to use because COM/DCOM was used as the underlying protocol and COM technologies were well supported by all kinds of IDEs from C++ and Visual Basic to VBA in Office applications. It spread very quickly as a vendor independent standard for accessing process data and other specifications for different automation technology requirements such as Alarm & Events followed. Despite its advantages, the DCOM based solution also has disadvantages. In addition to some problems with DCOM timeouts and network interruptions, one of the biggest problems is that it is bound to Microsoft and is not portable to other operating systems.

The first approach to address this problem was the SOAP based XML-DA protocol. It was intended for higher level enterprise applications, but it was unexpectedly used a lot by embedded device vendors because it was the first protocol to allow access to process data from other operating systems in a standardized way. Unfortunately, XML-DA is not the most efficient and resource saving of protocols.

**OPC Unified Architecture** is a completely new invention of OPC and not only a new protocol. All existing specifications have been integrated into one object oriented address space. There is a new information model which allows description of all kind of data, including meta data and complex relations. Requirements such as redundancy, configurable timeouts, and much more have been integrated. One of the most important features is that it is **completely portable** and no longer bound to Microsoft. OPC UA describes services on an abstract level, which can be mapped to different kinds of protocols. One of the most important protocol mappings is the binary mapping to an efficient TCP/IP based protocol which is often referred to as "OPC/TCP" or "OPC Binary". More precisely, this is a binary encoding of the service data transported via a native TCP/IP protocol. The IANA registered port for "OPC/TCP" is 4840. On the user interface level a UA server is identified by a URL like in a web browser. The protocol prefix to access such a server is "opc.tcp://".

Another important protocol mapping is the SOAP mapping which is actually a [WebService](/WebService). The encoding is done as XML and the transport is done via HTTP/SOAP. The protocol prefix for that is just "<http://>".

There is also a third mapping that is a hybrid between the other two protocols. The data is encoded as binary as with OPC/TCP, but is transported via a single SOAP service named "Invoke." This way, the binary data is BASE64 encoded and is transported via HTTP/SOAP in the Invoke call. This is a compromise between the efficient binary encoding and the firewall friendly HTTP protocol.

## Protocols

### DCOM based protocols

  - [OPC DA](/OPC-DA): The OPC Data Access protocol

  - [OPC HDA](/OPC-HDA): The OPC Historical Data Access protocol

  - [OPC AE](/OPC-AE): The OPC Alarm & Events protocol

  - [OPC Commands](/OPC-Commands): The OPC Commands protocol

### SOAP based protocols

  - [OPC XML-DA](/OPC-XML-DA): The first webservice based OPC protocol.

### TCP/IP based protocols

  - [OPC UA](/OPC-UA): The OPC Unified Architecture protocol.

## External links

  - The OPC Foundation: <http://www.opcfoundation.org>

  - Overview about OPC UA: <http://www.ascolab.com/index.php?file=ua&lang=en>

## Discussion

---

Imported from https://wiki.wireshark.org/OPC on 2020-08-11 23:17:40 UTC
