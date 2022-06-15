# Bundle Protocol (BP)

The Bundle Protocol provides datagram transport over a high-delay or disrupted network using a variety of convergence layers ([TCPCL](/TCPCL), [LTPCL](/LTP), _etc._) to give per-hop bundle transport between BP nodes.

## History

BPv6 was standardized in [RFC 5050](https://www.ietf.org/rfc/rfc5050.html).
BPv7 was standardized in [RFC 9171](https://www.ietf.org/rfc/rfc9171.html).

## Protocol dependencies

  - [TCPCL](/TCPCL): The BPv6 had defined a corresponding TCPCL version 3 and BPv7 has defined a TCPCL version 4 to provide reliable transfer over low-delay (_e.g._ local or terresterial) data links.
  - [LTPCL](/LTP): The BPv6 has an experimental Licklider Transmission Protocol to provide reliable transfer over high-delay and lossy data links. There is currently no disambiguation between BPv6 and v6 over LTP; only one [client service ID](https://www.iana.org/assignments/ltp-parameters/ltp-parameters.xhtml#client-service-ids) has been allocated for "Bundle Protocol".
  - BPSec: The BP uses extension Block Integrity Block (BIB) and Block Confidentiality Block (BCB) to provide block-level security.

## Wireshark

The BP dissector supports extension block dissecting using sub-dissector tables and payload dissection as an administrative record or based on destination EID service identification.
The dissection hierarchy looks like:
 1. If the bundle flag indicates Administrative payload, the "bpv7.admin" dissector is used.
 1. Otherwise, the destination EID is used to determine how to dissect the payload.
     * For the "dtn" scheme, with a well-known scheme specific part (e.g. "dtn:none") the SSP is used with the "bpv7.payload.dtn_wkssp" dissector table.
     * For the "dtn" scheme, the DTN service demux is used with the "bpv7.payload.dtn_serv" dissector table.
     * For the "ipn" scheme, the IPN service number is used with the "bpv7.payload.ipn_serv" dissector table.
 1. Otherwise, the heuristic dissector "bpv7.btsd".

## Preference Settings

The BPv7 dissector contains a heuristic dissector for block-type-specific data (BTSD) which currently uses CBOR as a fallback. This heuristic dissector applies to all BTSD, including the payload data.

## Example capture file

The unit test tree contains a BPv6 and BPv7 test file using separate CLs. 

[[BPv6|/../blob/master/test/captures/dtn_tcpclv3_bpv6_transfer.pcapng]]

[[BPv7|/../blob/master/test/captures/dtn_tcpclv4_bpv7_transfer.pcapng]]


## Display Filter

Show only BPv6 traffic with filter `bundle` and BPv7 traffic with filter `bpv7`.

Show TCPCL traffic with filter `tcpcl`, LTP traffic with filter `ltp`.

## External links

  - [RFC 5050](https://www.ietf.org/rfc/rfc5050.html) Bundle Protocol Specification
  - [RFC 5326](https://www.rfc-editor.org/rfc/rfc5326.html) Licklider Transmission Protocol - Specification
  - [RFC 7242](https://www.rfc-editor.org/rfc/rfc7242.html) TCP Convergence Layer Version 3
  - [RFC 9171](https://www.ietf.org/rfc/rfc9171.html) Bundle Protocol Version 7
  - [RFC 9172](https://www.ietf.org/rfc/rfc9172.html) Bundle Protocol Security
  - [RFC 9174](https://www.ietf.org/rfc/rfc9174.html) TCP Convergence Layer Version 4
