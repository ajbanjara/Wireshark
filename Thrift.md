*Please Note*: :construction: This page is a work in progress :construction:

[[_TOC_]]

# Apache Thrift (Thrift)

Thrift is a lightweight, language-independent software stack for point-to-point RPC implementation.

For a description of Thrift refer to [Apache Thrift home page](https://thrift.apache.org/).

One key point of Thrift is that several data serialization methods (Thrift Protocols) are possible for a given definition. Only Thrift Binary Protocol and Thrift Compact Protocol are currently supported by the Thrift dissector of Wireshark.

For an overview of the different protocols available, see [Thrift GitHub repository](https://github.com/apache/thrift).

Change log about Wireshark supporting Thrift:
- Wireshark 2.0.0 - Initial support for Thrift Binary Protocol.
- Wireshark 3.5.0 - Full support for Thrift Binary and Compact protocols as well as C sub-dissectors based on the generic one (in progress, see wireshark!3752).

## Protocol dependencies

Thrift content is usually detected and dissected automatically by the default Thrift dissector, allowing fast analysis out-of-the-box.

In some cases however, in particular when one of the endpoints is using an unbuffered implementation, the heuristic dissector might fail to detect a Thrift header as there is not enough data to look at.

In this case, one can set the known port number in the Thrift dissector preferences (both TCP and UDP are supported).

## Write your own Thrift-based dissector

With Thrift protocols being self-described, it’s relatively easy to analyse Thrift PDU with Wireshark on one screen and the documentation of your protocol on the other but it can get bothersome when your protocol contains a lot of different types and deep sub-structures.

Writing a Thrift-based sub-dissector removes the need for the documentation of your Thrift-based protocol and makes the search for a specific PDU easier in a huge capture.

### Example 1: [Jaeger](https://github.com/jaegertracing)

For this first example, we will dissect the `emitBatch` command described in [agent.thrift](https://github.com/jaegertracing/jaeger-idl/blob/master/thrift/agent.thrift) and depending on structures defined in [https://github.com/jaegertracing/jaeger-idl/blob/master/thrift/jaeger.thrift](jaeger.thrift).

The complete dissector is shared on GitLab and/or GitHub (repository TBD), with the history of commits following the process described below.

### Example 2: [Armeria Maritima](https://en.wikipedia.org/wiki/Armeria_maritima)

The second example is the reverse engineered protocol for an anonymized capture that will allow us to cover all types of data as well as a few elements not covered by the Jaeger dissector above.

In particular, Jaeger is using ONEWAY command which allow the dissector to start dissecting the data without any prior check, while this protocol uses CALL commands associated to REPLY which request the sub-dissector to check the direction before analysis of the content.

This protocol is also developed as a plugin instead of an integrated dissector.

The complete dissector is shared on GitLab and/or GitHub (repository TBD), with the history of commits following the process described below.