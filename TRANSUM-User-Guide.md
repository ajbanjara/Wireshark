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

