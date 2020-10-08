# Elasticsearch

Elasticsearch <http://www.elasticsearch.org/> is a distributed full-text search engine based on Lucene. It provides a RESTful HTTP API as well as a binary API for indexing and searching documents. Elasticsearch offers unicast and multicast discovery of nodes in a cluster.

## Ports used

  - **9200** - TCP HTTP RESTful interface

  - **9300** - TCP Binary API and inter-cluster communications

  - **54328** - UDP Multicast discovery

## Dissector status


| Protocol type | Dissection | Notes                                                                          |
| ------------- | ---------- | ------------------------------------------------------------------------------ |
| HTTP          | Full       | Passed to HTTP dissector                                                       |
| Discovery     | Full       |                                                                                |
| Binary        | Partial    | Actions, request/response type, request IDs, errors and packet length decoded. |


## Supported versions

In theory the dissector should work from versions of Elasticsearch \>= 0.20.0RC1. This may change as the binary protocol gets more dissection work.

## Example packet captures

  - [elasticsearch\_two\_nodes\_starting\_requesting\_data.pcap](uploads/__moin_import__/attachments/Elasticsearch/elasticsearch_two_nodes_starting_requesting_data.pcap) - Discovery and binary protocol

  - [elasticsearch\_http\_query.pcap](uploads/__moin_import__/attachments/Elasticsearch/elasticsearch_http_query.pcap) - RESTful HTTP Interface

## Filtering

The filter **elasticsearch** will include *Discovery*, *HTTP* and *Binary* protocols.

## Code reviews

  - <https://code.wireshark.org/review/#/c/4948/>

## To do

  - There are 60-odd action requests that need to be decoded.
  - Request/responses can be compressed with LZ compression. Currently, Wireshark does not support LZ decompression (only gzip) so this needs to be introduced first.

---

Imported from https://wiki.wireshark.org/Elasticsearch on 2020-08-11 23:13:46 UTC
