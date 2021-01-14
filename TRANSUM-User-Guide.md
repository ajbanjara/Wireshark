## Background
A particular challenge for network and application support people is identifying the cause of a slow response time issue.

![image](uploads/d2b3611298bf38361ed130187eacfa10/image.png)

Today's business applications are delivered by complex multi-tiered systems.  When a performance problem occurs it can be difficult to determine the causing component let alone the fix.  In this manual we refer to these types of issues as gray problems.
Network analysis is a tremendously powerful way to analyze the performance of a computer system, and Wireshark is by far the most widely used tool for this purpose.  We can use a tool like Wireshark to analyze the data flows between the components.
TRANSUM extends the capabilities of Wireshark by providing a breakdown of the overall response time from a service in a way that makes it simple to:
Identify slow response times from components such as web, application and database services
Breakdown the slow response times into network and service elements
The principle objective of TRANSUM is to enable an application or network analyst to be able to quickly pinpoint the cause of slow response times.

## Concepts
The concept of Response Time Elements is key to the design and use of TRANSUM.  It's a simple concept but you'll need to understand it to make any sense of the TRANSUM output.
We start by understanding that every multi-tier system is made up of multiple processes running on infrastructure.

![image](uploads/0f418b3e27be8e3d2623a5f9a335697f/image.png)

When the processes communicate with each other, in almost all cases one will take the role of client and the other will provide a service.

![image](uploads/ea4359bdc2192f9690504beadd8b6a21/image.png)

Flowing between the client and service we have application messages, which we will call Application Protocol Data Units or APDUs.  There are two types of APDU:
Request APDU that flows from client to service; an example would be an HTTP POST message
Response APDU that flows from service to client; an example would be an HTTP 200 OK response
Many APDUs are transported from client to service using TCP, and TRANSUM can analyze these types of flow.

![image](uploads/81d7f0d138fee99db0f7a34a5d35a56d/image.png)

An APDU may not fit into a single segment.  Typically a segment can only carry 1,460 bytes of data, and so if the APDU is, say, 2,000 bytes it must be split into two segments and hence two packets.  In the diagram above we see a Request APDU split across two packets and a Response APDU split across three packets.

## The RTE Model
The following diagram is our reference model for response time analysis.  Don't be put off by the talk of reference models, it's a very simple concept.

![image](uploads/297765f89b6201a84aa328a2b2243565/image.png)

### APDU Response Time
In the diagram above we see a Request APDU split across four packets and a Response APDU split across three packets.  From the perspective of the Tier n client process what's important is the time taken from sending the first Request packet to receiving the last Response packet.
APDU Response Time measures first request to last response

### Service Time
The perspective of the service process is somewhat different.  The service will probably need to receive the whole Request to begin processing it and once it starts sending the response it's reasonable to assume that all processing is complete; this assumption will be accurate for almost all systems you ever study.  Therefore, what is important here is the time between receiving the last Request packet and sending the first Response packet.
Service Time measures last request to first response

### Spread Time
It will take some time to transfer the multiple request packets and the multiple response packets across the network.  We call this time Spread.  The Spread time is affected by network and transport issues such as:
- Bandwidth
- Queuing (Load)
- TCP Retransmissions
- Latency
- TCP Window Size
- Poor buffer sizing (Nagle Delayed Send and Delayed ACK effects)

The important point here is that if we see high Spread values, we can then drill down into the sequence of request or response packets to determine the cause.
Request Spread measures first request to the last request.
Response Spread measures first response to last response.

### Important Note
The important point to note about the RTE concept is that APDU Response Time is a measure of Service Time plus Spread, and therefore only when you identify a high APDU Response Time do you need to drill down into it to determine if it's caused by a network/transport problem or by a slow service.
Isn't that neat?

![image](uploads/977727b2b4980493136e64b73bcc11a9/image.png)

## Limitations

### Supported Protocols
TRANSUM studies the flow of packets within a TCP Stream to identify Request and Response APDUs.

![image](uploads/aadb7a50f8c766372d4a1f83a56ea0fe/image.png)

TRANSUM has a number of RTE functions.

#### Generic TCP
The Generic TCP RTE function is only accurate if:
- The APDUs within a stream follow a request-response-request-response pattern; we call this a *flip-flop mode* of operation
- There is no other further level of multiplexing running on top of TCP

Therefore, if we look at a single TCP stream and we see two requests followed by two response, the Generic TCP Function cannot currently accurately calculate the RTE values.

Those protocols supported by the Generic TCP measurement function include:
- Web HTTP and HTTPS
- Web service HTTP and HTTPS
- Microsoft SQL database TDS without Multiple Active Result Set (MARS) activated
- Oracle database TNS
- PostgeSQL database
- .NET Remoting both SOAP and binary
- SMTP
- FTP command connection
- Many proprietary protocols that obey the flip-flop pattern

#### Generic UDP

The Generic UDP RTE function is only accurate if:
- The APDUs within a stream follow a request-response-request-response pattern; we call this a *flip-flop mode* of operation
- There is no other further level of multiplexing running on top of UDP

Therefore, if we look at a single UDP stream and we see two requests followed by two response, the Generic UDP Function cannot accurately calculate the RTE values.
UDP is often used for broadcasts and DHCP is a good example.

![image](uploads/15e6f86758e8b51591aaa576add63ad6/image.png)

The DHCP Requests have an IP address of 0.0.0.0 and a broadcast destination address.  The response flow as unicast packets.  Because the IP address pairs in requests and responses don't match, Wireshark considers there to be two different UDP streams here; one for the requests and one for the responses.  The TRANSUM Generic UDP dissector uses the UDP Stream value as one of the criteria to match requests and responses and so it's quite obvious that TRANSUM cannot successfully process DHCP flows.

#### DCE-RPC Support

TRANSUM includes support for DCE-RPC based protocols, including Microsoft's MS-RPC protocol.  The match of request with response is made using the TCP Stream, Context ID, Call ID and an internally generated suffix.  The suffix is needed because the other three values are not necessarily unique and TRANSUM needs to be able to uniquely identify a Request-Response pair.

#### DNS Support

The match of request with response is made using the UDP Stream Number and the DNS Transaction ID.

#### SMB2 Support

This is automatically used for streams to or from TCP Port 445 that include SMB2 messages.  SMB1 messages are not processed by the SMB2 RTE function.

The SMB2 RTE function handles:
- Multi-credit requests (several requests sent before receiving a response)
- Compound message and multi-message packets
- When a multi-message request is processed, the SMB2 function calculates RTE values from the request packet to the point where responses have been received for all requests.

[MISSING IMAGE]

Therefore, the RTE figures represent the worst case response time values.

#### Other Protocols

For other protocols, the Wireshark response time measurements (Time from/since request) are the next best thing, we just need to be aware that one or other of the Spread values will not be included.

### IPv6

TRANSUM includes support for IP version 6.  Due to the limited amount of IPv6 sample trace data we have available this area has not been tested as thoroughly as traces based on IPv4.

### Accuracy

There are some inaccuracies in the way that TRANSUM calculates the RTE elements.  These arise because the values are calculated using traces captured at a single point in the network.

[MISSING IMAGE]

Consider the values calculated from a trace captured adjacent to the client.  The Request Spread value will not include network transit time for the last packet, which should strictly be included.  Similarly, the Response Spread value will not include the network transit time for the first response packet.  The sum of these values is one Network Round Trip Time (RTT), and we can think of it as a missing RTT.

TRANSUM will assume that these missing times are part of the Service Time, and so the Service Time is exaggerated. This also means that a Request or Response APDU comprising a single packet will have a spread value of zero, whereas in fact the spread should be equivalent to the one-way network latency.

If we use TRANSUM to investigate an intermittent response time problem, these inaccuracies tend to be insignificant compared to the delays associated with the actual problem.

We can get a more accurate view if needed in the following way:
- Capture a trace adjacent to the client
- Capture a trace adjacent to the service
- Export the Packet List from each trace with RTE data values
- Import the Packet Lists into a spreadsheet program
- Line up the entries from each trace so that data for one packet from the two traces resides on a single row (two sets of RTE data; one client-side, one service side)
- The APDU Response Time from the client-side trace will be accurate
- The Service Time from the service-side trace will be accurate
- For each row calculate a Spread Adjustment value as follows:
  + Spread Adjustment = ( APDU Response Time [measured adj. to client] - Service Time [measured adj. to service] - Request Spread [measured adj. to service] - Response Time [measured adj. to client] ) / 2
- Add this Spread Adjustment figure to each client-side or service-side spread figure to give Request Spread and Response Spread values that include the network delay

This adjustment in itself is a compromise as it assumes that the missing RTT is a symmetrical delay across the network.  However, to achieve something more accurate would require perfect synchronisation of clocks on the two capture units and this is not realistic.

Most importantly, none of these inaccuracies affect the APDU Response Time measured at the client, which remains accurate in all cases.  As APDU Response Time is the value that is initially used to flag up a problem, the need to make the above adjustments will be rare.

## TSHARK

TRANSUM supports tshark.  To obtain the decode information tshark must be run with the -2 option.  A typical command is:
```
tshark -2 -q -ta -C TRANSUM -Y "transum"  -T fields -E separator=, -E quote=d -e _ws.col.Time -e frame.number -e ip.src -e ip.dst -e transum.art -e _ws.col.Info -r trace_file.pcapng
```

## Configuration
In this section we look at the individual configuration.

The TRANSUM plugin is not enabled by default, and so the first step is to enable it:

- In the main top menu choose Analyze -> Enabled protocols...
- In the Enabled Protocols dialogue box search for TRANSUM
- Check the TRANSUM protocol and click OK

Now let's look at the preferences for the TRANSUM plugin.

![image](uploads/a2dce941a21bbf2cb829900847665acd/image.png)

The preferences dialogue screen can be accessed in the normal ways:
- In the top menu go to Edit -> Preferences -> Protocols (expand this) -> TRANSUM
- Right click on an TRANSUM RTE Data object in the Packet Detail pane and choose Protocol Preferences -> Open TRANSUM RTE DATA preferences ...

### Capture position

This setting affects how TRANSUM handles TCP retransmissions.

- Client - TRANSUM ignores retransmissions from service to client.  The rationale is that if we are tracing adjacent to the client and we see an original packet and later a retransmitted packet then the client would have seen both too, and so the retransmission should be ignored.
- Service - TRANSUM ignores retransmissions from client to service.  The rationale is that if we are tracing adjacent to the service and we see an original packet and later a retransmitted packet then the service would have seen both too, and so the retransmission should be ignored.
- Intermediate - TRANSUM includes all retransmissions in spread calculations.

Wireshark can mark a packet as a TCP Retransmission if ACKs and data packets get out of sync.  This will cause an inaccurate RTE calculation if the retransmission is the last request or last response packet.

### Subdissector reassembly enabled

This setting should match that of the TCP preference *Allow subdissectors to reassemble TCP streams*.

[MISSING IMAGE]

If none of the options to add RTE data to particular packets are set as defined below, the RTE data will be added to the packet list entry that has a summary of the APDU message.
NB:  It's important to note that this setting will not automatically track that of the TCP preference setting.  Currently the Wireshark support for LUA scripting does not provide a mechanism to read the preference settings of another dissector and so we must manually keep these settings in sync.

### Output RTE data for these TCP service ports

This is a list of the TCP service ports for which TRANSUM will calculate RTE values.  The list must be port numbers with a single comma between each.  TRANSUM now supports port ranges of the form 4000-4024.
If you need TRANSUM to generate RTE data for other service ports simply add them to the list.
For example, a Microsoft SQL Database instance uses port 1433 by default.  However, your DBA may have configured it to use another port, or you may have multiple instances running on a single server, in which case you will want to add those port numbers.

### Output RTE data for these UDP service ports

This is a list of the UDP service ports for which TRANSUM will calculate RTE values.  The list must be port numbers with a single comma between each.  TRANSUM now supports port ranges of the form 4000-4024.
If you need TRANSUM to generate RTE data for other UDP service ports simply add them to the list.

### Discard orphaned TCP Keep-Alives

TRANSUM ignores packets that Wireshark marks as TCP Keep-Alive.  However, Wireshark needs to see the packet prior to the TCP Keep-Alive to correctly interpret the current packet as a TCP Keep-Alive, and if this earlier packet is not in the trace file Wireshark will assume that the Keep-Alive packet as a data packet.

![image](uploads/82dec76c41959c680fe16c4e7e40c542/image.png)

The above screenshot shows the issue.  Note how packet 1 has been interpreted as a data packet, whereas it is actually a TCP Keep-Alive.  We can see that TRANSUM assumes that this is the first packet of the Request APDU and so we get a very high Req Spread value.

By enabling this* Discard orphaned TCP Keep-Alives* option TRANSUM will assume that any packet with a TCP Len of 1 byte and the ACK flag set is a TCP Keep-Alive, and so ignore the packet.

![image](uploads/801ec0a70257bbec1b1aa3385b1431b8/image.png)

Here the discard option has been enabled and we see that TRANSUM has ignored packet 1.  It's important to note that even though enabling this option gets around the TRANSUM issue, Wireshark still incorrectly assumes that the packet contains valid data.

The default setting is *disabled*

### RTE Data Placement

By checking one or more of the options presented after this heading we can specify which packets should include the RTE data.

[MISSING IMAGE]