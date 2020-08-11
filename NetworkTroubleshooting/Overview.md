# Network Troubleshooting: An Overview

This page will give you an overview where Wireshark can help you troubleshoot a network (... and where it might be better to use a different tool).

As learning network troubleshooting is an endless task (there are a lot of good books written about it), this can only be a rough overview. You can even spend a whole life (and get your annual income) with this.

:warning: Please keep in mind, that Wireshark is not aimed (and may not be well suited either) for all the tasks mentioned below (you'll be guided about the specific tasks below)\!

**In general: if you don't know any network protocols and how a network is generally working, Wireshark won't be very useful to you, until you are willing to learn something about it.**

## General Troubleshooting

Well, something on your network does not work at all or not as expected and you need to solve it.

  - Service unresponsive: For example, you simply can't connect to your own Web server. The application you use isn't very helpful in finding the specific cause of the problem, as it only gives a general error message. This problem is often caused by an unresponsive service (such as the web server, a router in between, ...). There might even be a specific error code on the line, which the application you use "translates" to a generic error message ("host not available") which isn't helpful at all. Once you know what "should" happen on your network, Wireshark can be very helpful in finding the problem you have.
  - Protocol Problems: Incompatible protocol implementations won't interoperate. This shouldn't be a problem with today's commonly used (and mature) TCP/IP protocols, but might be the case for new protocols (you might even currently implement yourself). If Wireshark supports the protocol in question and you know that protocol (at least a bit) Wireshark is an invaluable source of troubleshooting information.

## Performance

Your network is running too slow. Of course, this depends on the expectations you have :smiley:

Some possible causes:

  - insufficient performance: the overall network performance **is** too slow for the task you want to do, e.g. you can't expect to serve a million [HTTP](/HTTP) requests per second over a 100MBit/s [Ethernet](/Ethernet) link. Wireshark can be helpful to get an idea if it's the case here, but Monitoring (mentioned below) might be a better way to detect and handle such problems.

  - timeouts: a client first tries to reach a specific service. After the usual timeout it will try another one which serves the purpose. At the next request the game repeats on and on. Although searching for the cause can be tedious, Wireshark can be very helpful here.

  - bottlenecks: the overall performance of your network is ok, but somewhere there's a bottleneck making things slow (maybe only a specific link between servers/switches/routers/houses/plants/...). As Wireshark is not well suited for distributed analysis, Monitoring tools (mentioned below) might do a better job here.

  - protocol problems: incompatible protocol implementations slow down possible performance, same as protocol problems in the general section above.

  - flooding: "intended" (e.g. virus/trojan) or "unintended" (e.g. misconfiguration/buggy implementation) sending of lots of packets which floods the network. Wireshark can help you find the originator and the type of the flood.

So depending on the cause, Wireshark may or may not be helpful tracking down performance problems.

## Monitoring

Keep an eye on what's going on in your network. Monitoring will warn you about broken services (e.g. webserver not responding), performance problems and alike.

This might range from a simple cron job pinging a remote machine once every hour, through dedicated tools like [Nagios](http://www.nagios.org/) (formerly NetSaint) and end up in commercial enterprise level tools such as [HP OpenView (tm)](http://www.openview.hp.com/).

Wireshark is not well suited for (and not aimed towards) monitoring. However, if your favourite monitoring tool detected a problem you may end up in the *general troubleshooting* or *performance* section described above.

## Security

Some of the common security tasks:

  - scanning: actively scan your network and enhance the security of it, before something bad happens
  - intrusion detection: get an alarm if something strange happens on your network
  - forensic: something bad has happened, and you need to know what it was

In general, security related tasks are best done by specialized tools. However, Wireshark can assist you while using these tools to gain greater knowledge and a *feeling* of what's really going on by providing additional information.

### Scanning

Scan your network using tools like [Nmap](http://www.insecure.org/nmap/) or [Nessus](http://www.nessus.org/) to find known security holes before the bad guys do. By analysing the network traffic such tools create, Wireshark can help you understand what these tools really do.

### Intrusion Detection

An IDS server, running software such as [Snort](http://www.snort.org/), will analyse network traffic and trigger an alarm if something "looks strange". Looking at the network traffic, Wireshark may help you to decide if the IDS reported a false alarm or if there's a real problem.

### Forensic

After something bad has happened, try to find out what really has happened, how it has happened and eventually who initiated it. Wireshark may be helpful with this, if you have to dig deeply into the network traffic. However, people have reported that they use Wireshark to capture the traffic of their *whole network* for forensic purposes (using tape libraries or such to store all the data) using Wireshark as a network backup tool\!

---

Imported from https://wiki.wireshark.org/NetworkTroubleshooting/Overview on 2020-08-11 23:17:21 UTC
