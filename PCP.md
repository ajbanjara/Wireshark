# Performance Co-Pilot Protocol (PCP)

Performance Co-Pilot provides a framework and services to support system-level performance monitoring and management. For live monitoring, PCP uses a TCP based protocol for transferring information about performance metrics between collector and monitor processes.

## History

PCP was originally developed at Silicon Graphics Inc (SGI) in the late 90s. It is now an open source project with contributors around the globe.

## Protocol dependencies

  - [TCP](/TCP): PCP uses [TCP](/TCP) as its transport protocol. The well known TCP port for PCP traffic is 44321.

## Example traffic

  - [PCP/pcp-sample-metrics-screenshot.png](uploads/__moin_import__/attachments/PCP/pcp-sample-metrics-screenshot.png)

  - [PCP/Screenshot-pcp\_names\_example.pcap.png](uploads/__moin_import__/attachments/PCP/Screenshot-pcp_names_example.pcap.png)

## Wireshark

The PCP dissector is fully functional.

## Example capture file

  - [SampleCaptures/pcp-sample-metrics.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/pcp-sample-metrics.pcap.gz)

  - [PCP/pcp\_ssl\_creds.pcap](uploads/__moin_import__/attachments/PCP/pcp_ssl_creds.pcap) - Example of SSL upgrade via SECURE\_ACK

  - [PCP/pcp\_names\_example.pcap](uploads/__moin_import__/attachments/PCP/pcp_names_example.pcap) - Example of dynamic PMID resolution

## Links

  - [PMPROXY](/PMPROXY) - Proxy protocol for PCP.

  - [PCP Project Page](http://pcp.io) - Home page for the Performance Co-Pilot project.

---

Imported from https://wiki.wireshark.org/PCP on 2020-08-11 23:17:50 UTC
