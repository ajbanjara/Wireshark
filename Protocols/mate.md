# Meta Analysis and Tracing Engine (MATE)

MATE is not a protocol, is a tool that allows to create user configurable extension(s) of the display filter engine.

MATE is described in the [MATE's wiki page](/Mate).

## Wireshark

As of 0.10.9 MATE is functional, although it is still in a prototype stage, non the less it can be used. There are known problems in MATE's reinitialization (most will be fixed before the next release), that means that most often you'll need to restart wireshark instead of loading a new capture file.

## Preference Settings

the only preference setting that MATE has is **mate.config\_filename** which tells mate from wich file it has to load as it's configuration.

## Display Filter

For a detailed description on what Pdu, Gop (Group of Pdus) and Gog (Group of Groups) are please take a look to [Mate's Manual](/Mate/Manual)

  - **mate.*pdu\_name***: an integer containing the id of the Pdu
    
      - **mate.*pdu\_name*.RelativeTime**: a float representing the number of seconds passed since beginig of capture
    
      - **mate.*pdu\_name*.TimeInGop**: a float representing the time of this Pdu relatively to it's Gop start
    
      - **mate.*pdu\_name*.*pdu\_attrib***: a string containing some data element extracted fom the frame

  - **mate.*gop\_name*** : an integer containing the id of the Pdu
    
      - **mate.*gop\_name*.StartTime**: the number of seeconds passed since beginig of capture to the creation of this Gop
    
      - **mate.*gop\_name*.Time**: the time passed between the `GopStart` and the `GopStop`
    
      - **mate.*gop\_name*.Duration**: the time passed between the `GopStart` and the last Pdu assigned to this Gop
    
      - **mate.*gop\_name*.NumOfPdus**: the number of Pdus that have being assigned to the Gop
    
      - **mate.*gop\_name*.Pdu**: depending on the `ShowPduTree` setting this might be either the framenumber or the id of a Pdu assigned to this Gop
    
      - **mate.*gop\_name*.*gop\_attrib***: a string containing an attribute of the Gop's AVPL

  - **mate.*gog\_name***: the id of a Gog
    
      - **mate.*gog\_name*.StartTime**: the number of seconds passed since beginig of capture to the creation of this Gog
    
      - **mate.*gog\_name*.NumOfGops**: the number of Gops that have being assigned to the Gog
    
      - **mate.*gog\_name*.Duration**: the number of seconds passed from the creation of the Gog to the last Pdu assigned to one of its Gops
    
      - **mate.*gog\_name*.Gop**: the id of a Gop that belongs to this Gog
    
      - **mate.*gog\_name*.*gog\_attrib***: a string containing an attribute of the Gop's AVPL

## Capture Filter

You cannot directly filter MATE while capturing. MATE builds its tree based on information imported from other protocols.

## Discussion

---

Imported from https://wiki.wireshark.org/Protocols/mate on 2020-08-11 23:20:59 UTC
