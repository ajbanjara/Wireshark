# Service Area Broadcast Protocol (SABP)

## History

SABP is an 3GPP specification used to signal betwen CN (Core Network) and RNC (Radio Network Controller).  
It informes the RNC which cells it should transmitt cell broadcast messages (messages that are sent out  
to every listener in an 3G cell).  
SABP shall use the ASN.1 Basic Packed Encoding Rules (BASIC-PER) Aligned Variant as transfer syntax.

The following messages are specified.

*WRITE-REPLACE*  
This message is sent by the CN to the RNC

*WRITE-REPLACE COMPLETE*  
This message will be sent by the RNC to the CN in a successful response to a WRITE-REPLACE message.

*WRITE-REPLACE FAILURE*  
This message will be sent by the RNC to the CN as an unsuccessful response to a WRITE-REPLACE message

*KILL*  
This message is sent by the CN to the RNC to stop broadcasting of a specific message.

*KILL COMPLETE*  
This message is sent by the RNC to the CN as a successful response to a KILL message.

*KILL FAILURE* This message is sent by the RNC to the CN as unsuccessful response to a KILL message.

*LOAD QUERY*  
This message is sent by the CN to the RNC to gain an indication of broadcast resources available.

*LOAD QUERY COMPLETE*  
This message will be sent by the RNC as a successful response to the LOAD QUERY message.

*LOAD QUERY FAILURE*  
This message is sent by the RNC to the CN as an unsuccessful response to a LOAD QUERY message.

*MESSAGE STATUS QUERY*  
This message is sent by the CN to the RNC to obtain the current status of a Service Area broadcasting message.

*MESSAGE STATUS QUERY COMPLETE*  
This message is sent by the RNC to the CN as a successful response to a MESSAGE QUERY message.

*MESSAGE STATUS QUERY FAILURE*  
This message is sent by the RNC to the CN in an unsuccessful response to a MESSAGE QUERY message.

*RESET*  
The message is sent by the CN to the RNC to request that the RNC end broadcasting in one or more Service Areas.

*RESET COMPLETE*  
This message is sent from the RNC to the CN as a successful response to a RESET message where indicated Service-Area(s) are now not broadcasting any messages.

*RESET FAILURE*  
This message is sent from the RNC to the CN as an unsuccessful response to a RESET message to indicate that a Service Area broadcasting related problem exists in one or more of its Service Areas.

*RESTART*  
This message is sent from the RNC to the CN to indicate a Service Area broadcasting related restart situation in one or more of its Service-Areas.

*FAILURE*  
This message is sent from the RNC to the CN to indicate that a Service Area broadcasting related problem exists in one or more of its Service-Areas.

*ERROR INDICATION*  
This message is sent by the RNC to CN and is used to indicate that some errors have been detected in the node.

## Protocol dependencies

  - [TCP](/TCP): The IANA assigned port for SABP is 3452

## Example traffic

## Wireshark

the dissector is generated using asn2wrs. SABP is available from WS 0.99.8 but can only be called by name. In the next release (available as a development build) SABP over TCP will be dissected.

## Preference Settings

## Example capture files

Add capture file

## Display Filter

A complete list of SABP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/t/sabp.html)

Show only the SABP based traffic:

``` 
 sabp 
```

## Capture Filter

## External links

  - <http://www.3gpp.org/ftp/Specs/html-info/25419.htm> Specifications

  - <http://www.cellbroadcastforum.org/>

## Discussion

---

Imported from https://wiki.wireshark.org/SABP on 2020-08-11 23:24:18 UTC
