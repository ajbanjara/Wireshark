# Preferences/Protocols/ISMACryp

### ISMACryp dynamic payload type:

Allows the user to specify the RTP dynamic payload type whose payload is to be interpreted as ISMACryp. Note that if SDP information sets an RTP dynamic payload type to "enc-mpeg4-generic" then Wireshark automatically interprets this as ISMACryp v1.1 and if the payload type is "enc-isoff-generic" then this is interpreted as ISMACryp v2.0.

### ISMACryp version:

Allows the version to be set to ISMACryp v1.1 or 2.0, unless the version is automatically detected via RTP payload type (see above).

### Override RTP payload type for version:

Enabling this box allows the ISMACryp version set manually above to be forced on RTP payload types whose version is detected as having a different version. A use case for doing this is correcting for incorrect SDP information, for example.

### ISMACryp v1.1 parameters:

The following parameters can be set manually:

  - ISMACrypIVLength - length in bytes of ISMACrypIV parameter
  - ISMACrypDeltaIVLength - length in bytes of ISMACrypDeltaIV parameter
  - ISMACrypKeyIndicatorLength - length in bytes of ISMACrypKeyIndicator parameter
  - ISMACrypKeyIndicatorPerAU - indicates whether or not this is set to TRUE or FALSE i.e. whether or not the ISMACrypKeyIndicator is present for each AU
  - ISMACrypSelectiveEncryption - indicates whether or not selective encryption is enabled (TRUE or FALSE)

Note that the above parameters are ISMACryp v1.1 parameters that are also included in v2.0. These are normally setup via SDP but this is not currently supported.

### ISMACryp v2.0 parameters:

The following parameters can be set manually:

  - ISMACrypSliceIndication - indicates whether or not slice start / stop information is present in the header byte
  - ISMACrypPaddingIndication - indicates whether or not padding bitcount information is present in the header byte

Note that the above parameters are only valid for ISMACryp v2.0. These are normally setup via SDP but this is not currently supported.

### Codec mode selection (RFC3640 for ISMACryp v1.1 only):

RFC3640 specifies access unit values for different codecs. The following "modes" are defined:

  - aac-hbr
  - mpeg4-video
  - avc-video

Alternatively, if User mode is ticked, user specific values can be specified below for ISMACryp v1.1. If the version if ISMACryp v2.0 only user mode values are used, irrespective of whether or not User mode is ticked.

Note that the mode is normally setup via SDP but this is not currently supported.

### Following parameters only valid and used for user mode:

The following parameters can be set manually when user mode applies:

  - User mode: [SizeLength](/SizeLength) - length in bits of Size parameter

  - User mode: [IndexLength](/IndexLength) - length in bits of Index parameter

  - User mode: [IndexDeltaLength](/IndexDeltaLength) - length in bits of [IndexDelta](/IndexDelta) parameter

  - User mode: CTSDeltaLength - length in bits of CTSDelta parameter

  - User mode: DTSDeltaLength - length in bits of DTSDelta parameter

  - User mode: [RandomAccessIndication](/RandomAccessIndication) - indicates whether or not the RAP flag is present

  - User mode: [StreamStateIndication](/StreamStateIndication) - length in bits of [StreamState](/StreamState) parameter

---

Imported from https://wiki.wireshark.org/ISMACryp_Preferences on 2020-08-11 23:15:25 UTC
