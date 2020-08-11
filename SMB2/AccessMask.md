# SMB2/AccessMask

This is a 32 bit mask that describes the access mask of a file.

## AccessMask

List of the access bits that wireshark currently knows about:

    0x80000000  Generic Read
    0x40000000  Generic Write
    0x20000000  Generic Execute
    0x10000000  Generic All
    0x08000000
    0x04000000
    0x02000000  Maximum Allowed
    0x01000000  System Security
    0x00800000  
    0x00400000
    0x00200000
    0x00100000  Synchronize
    0x00080000  Write Owner
    0x00040000  Write DAC
    0x00020000  Read Control
    0x00010000  Delete
    0x00008000
    0x00004000
    0x00002000
    0x00001000
    0x00000800
    0x00000400
    0x00000200
    0x00000100  Write Attributes
    0x00000080  Read Attributes
    0x00000040  Delete child
    0x00000020  Execute
    0x00000010  Write EA
    0x00000008  Read EA
    0x00000004  Append
    0x00000002  Write
    0x00000001  Read

# Discussion

---

Imported from https://wiki.wireshark.org/SMB2/AccessMask on 2020-08-11 23:24:51 UTC
