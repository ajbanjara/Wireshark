# SMB2/NegotiateProtocol

Opcode 0x00

This is the first [SMB2](/SMB2) command issued on any new TCP session for SMB2. It is used to negotiate which version of the protocol to use and also for the server to provide a list of valid authentication mechanisms the client must use in the following [SMB2/SessionSetup](/SMB2/SessionSetup) calls.

# SMB2/NegotiateProtocol Request

## SMB2/NegotiateProtocol Request Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |         Buffer Code           |                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode)

# SMB2/NegotiateProtocol Response

## SMB2/NegotiateProtocol Response Packet Format

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |          Buffer Code          |                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                             Server                            |
    +-+-+-+-+                      GUID                     +-+-+-+-+
    |                                                               |
    +-+-+-+-+                                               +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                  Current Time                 +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                                                               |
    +-+-+-+-+                   Boot Time                   +-+-+-+-+
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |        Sec Blob Offset        |        Sec Blob Length        |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |               |               |               |               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    | Sec Blob  ANS.1/DER encoded blob containing supported authentication mechanisms
    +-+-+-+-+...

## Buffer Code

[SMB2/BufferCode](/SMB2/BufferCode)

### Sec Blob Offset

This is the offset in bytes of the security blob, starting from the start of the [SMB2](/SMB2) Header.

### Sec Blob Length

This field contains the length of the security blob.

### Sec blob

If present, this field contains the security blob that contains the authentication mechanisms the server supports. This blob will be padded to start on a 8 byte boundary hence the 4 padding bytes?

## NT Status Codes

# Discussion

The two timestamps in the reply are probably the current time of the server and the time the server booted.

Here is an example of a SMB2/Negotiate request packet

    [000] FE 53 4D 42 40 00 00 00  00 00 00 00 00 00 3F 00  .SMB@... ......?.
    [010] 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  ........ ........
    [020] FF FE 00 00 00 00 00 00  00 00 00 00 00 00 00 00  ........ ........
    [030] 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  ........ ........
    [040] 24 00 01 00 00 00 00 00  00 00 00 00 00 00 00 00  $....... ........
    [050] 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  ........ ........
    [060] 00 00 00 00 00 00                                 ......

and an example response

    [000] FE 53 4D 42 40 00 00 00  00 00 00 00 00 00 01 00  .SMB@... ........
    [010] 01 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  ........ ........
    [020] FF FE 00 00 00 00 00 00  00 00 00 00 00 00 00 00  ........ ........
    [030] 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  ........ ........
    [040] 41 00 00 00 06 00 00 00  B9 FB 9B 60 AD 9C DD 40  A....... ...`...@
    [050] A5 47 B1 34 A4 6C 8D 9D  0D 00 00 00 00 00 01 00  .G.4.l.. ........
    [060] 00 00 01 00 00 00 01 00  04 B5 EC 87 FE E3 C5 01  ........ ........
    [070] 72 A2 34 21 D6 E3 C5 01  80 00 40 00 00 00 00 00  r.4!.... ..@.....
    [080] 60 3E 06 06 2B 06 01 05  05 02 A0 34 30 32 A0 30  `>..+... ...402.0
    [090] 30 2E 06 09 2A 86 48 82  F7 12 01 02 02 06 09 2A  0...*.H. .......*
    [0A0] 86 48 86 F7 12 01 02 02  06 0A 2A 86 48 86 F7 12  .H...... ..*.H...
    [0B0] 01 02 02 03 06 0A 2B 06  01 04 01 82 37 02 02 0A  ......+. ....7...

In the response the data starting at 0x80 is ASN.1/DER encoded, and decodes as follows:

``` 
  0 60   62: [APPLICATION 0] {
   2 06    6:   OBJECT IDENTIFIER '1 3 6 1 5 5 2'
  10 A0   52:   [0] {
  12 30   50:     SEQUENCE {
  14 A0   48:       [0] {
  16 30   46:         SEQUENCE {
  18 06    9:           OBJECT IDENTIFIER '1 2 840 48018 1 2 2'
  29 06    9:           OBJECT IDENTIFIER '1 2 840 113554 1 2 2'
  40 06   10:           OBJECT IDENTIFIER '1 2 840 113554 1 2 2 3'
  52 06   10:           OBJECT IDENTIFIER '1 3 6 1 4 1 311 2 2 10'
            :           }
            :         }
            :       }
            :     }
            :   }
```

---

Imported from https://wiki.wireshark.org/SMB2/NegotiateProtocol on 2020-08-11 23:25:11 UTC
