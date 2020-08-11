# UDP-based Data Transfer (UDT)

UDT is a reliable UDP based application level data transport protocol for distributed data intensive applications over wide area high-speed networks.

## Protocol dependencies

  - [UDP](/UDP): Typically, UDT uses [UDP](/UDP) as its transport protocol.

## Example traffic

``` 
  1   0.000000    10.0.0.11 -> 10.0.0.1     UDT UDT type: handshake  id: 0
  2   0.000072     10.0.0.1 -> 10.0.0.11    UDT UDT type: handshake  id: c70e0893
  3   0.000347    10.0.0.11 -> 10.0.0.1     UDT UDT type: handshake  id: 0
  4   0.000608     10.0.0.1 -> 10.0.0.11    UDT UDT type: handshake  id: c70e0893
  5   0.010183    10.0.0.11 -> 10.0.0.1     UDT UDT type: data  seqno: 1304707562  msgno: 1  id: 1d4a3cae
  6   0.010222     10.0.0.1 -> 10.0.0.11    UDT UDT type: ack  id: c70e0893
  7   0.010330    10.0.0.11 -> 10.0.0.1     UDT UDT type: ack2  id: 1d4a3cae
  8   0.028902    10.0.0.11 -> 10.0.0.1     UDT UDT type: data  seqno: 1304707563  msgno: 2  id: 1d4a3cae
  9   0.028938     10.0.0.1 -> 10.0.0.11    UDT UDT type: ack  id: c70e0893
 10   0.029021     10.0.0.1 -> 10.0.0.11    UDT UDT type: data  seqno: 1304707562  msgno: 1  id: c70e0893
 11   0.029550     10.0.0.1 -> 10.0.0.11    UDT UDT type: data  seqno: 1304707563  msgno: 2  id: c70e0893
 12   0.029571     10.0.0.1 -> 10.0.0.11    UDT UDT type: data  seqno: 1304707564  msgno: 2  id: c70e0893
 13   0.029590     10.0.0.1 -> 10.0.0.11    UDT UDT type: data  seqno: 1304707565  msgno: 2  id: c70e0893
```

## Wireshark

The UDT dissector is fully functional. It uses a heuristic on [UDP](/UDP) streams to detect UDT streams. Since the heuristic is looking for handshake exchanges at the beginning of flows, you may need to manually set the dissector to UDT.

## Example capture file

  - [SampleCaptures/UDT.pcap](uploads/__moin_import__/attachments/SampleCaptures/UDT.pcap)

## Capture Filter

You cannot directly filter UDT protocols while capturing. However, if you know the [UDP](/UDP) port used (see above), you can filter on that.

## External links

  - <http://udt.sourceforge.net>

  - <http://tools.ietf.org/html/draft-gg-udt-03> *UDT: UDP-based Data Transfer Protocol*

## Discussion

---

Imported from https://wiki.wireshark.org/UDT on 2020-08-11 23:27:02 UTC
