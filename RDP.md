# Remote Desktop Protocol (RDP)

RDP is a proprietary protocol developed by Microsoft for their Terminal Server services.

## History

See [Wikipedia entry](http://en.wikipedia.org/wiki/Remote_Desktop_Protocol#Version_history)

## Protocol dependencies

  - [TPKT](/TPKT): Typically, RDP uses [TPKT](/TPKT) as its transport protocol. TPKT runs atop TCP; when used to transport RDP, the well known TCP port is 3389, rather than the normal TPKT port 102.

  - [COTP](/COTP): This is the same as X.224.

  - [T.125](/T.125): Multipoint Communication Service

  - [T.124](/T.124): Generic Conference Control

  - [SSL](/SSL): SSL may be used with Enhanced RDP security, and is used on the same port as standard RDP. The SSL dissector may be used to handle the SSL and then hand off the encapsulated data to the RDP dissector. The encapsulated RDP will never negotiate any Standard RDP Security, so all of these SSL protected PDUS should be able to be dissected (subject to be able to do applicable decompression).

## Example traffic

Example capture files are detailed below.

## Wireshark

A basic RDP dissector exists that can decode most of the PDUs that are exchanged during the connection sequence. If Standard RDP Security is being negotiated, all the PDUs after the SecurityExchangePDU will be encrypted. There is no handling of virtual channel PDUs (beyond the security header) at the moment.

## Preference Settings

Port: default 3389

## SSL Configuration

In order to dissect Enhanced RDP Security SSL, you should configure the [SSL](/SSL) dissector with the following:  

    <server-ip>,3389,tpkt,<path to key>

## CredSSP

RDP can also use the Credential Security Support Provider ([CredSSP](/CredSSP)) protocol to provide authentication information. This is always run under a [SSL](/SSL) encrypted session. The CredSSP [documentation](http://download.microsoft.com/download/9/5/E/95EF66AF-9026-4BB0-A41D-A4F81802D92C/%5BMS-CSSP%5D.pdf) states that [SPNEGO](/SPNEGO) is used to select between [NTLM](/NTLM) and [Kerberos](/Kerberos) - but the RDP captures seen to date carry [NTLM](/NTLM) without any [SPNEGO](/SPNEGO). The [FreeRDP](http://www.freerdp.com/) project provides a number of capture files, associated private keys and a detailed analysis of the protocol exchanges on their [wiki](http://www.freerdp.com/wiki/doku.php?id=network_level_authentication). As yet, it has not proved possible to recover the NTLM keys in order to decrypt the CredSSP encrypted PDUs.

## Example capture file

  - [SampleCaptures/RDP-002.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/RDP-002.pcap.gz)
    
      - Capture on 10.226.41.226 as client to 10.226.24.52 as server with a capture filter of *ip host 10.226.24.52*
    
      - Client system is Windows XP Professional with Service Pack 2 running Microsoft Remote Desktop Connection **5.1.2600.2180** with **128-bit encryption**.
    
      - Server system is Windows Server 2003 with Service Pack 1 running Microsoft Terminal Services **5.2.3790.1830**. Here some possibly relevant settings.
        
          - Type is **Microsoft RDP 5.2**
        
          - Transport is **TCP**
        
          - Security layer is **RDP Security Layer**
        
          - Encryption level is **High**
        
          - Certificate is **\<none\>**
    
      - The capture includes
        
          - the client initiating a connection to the server,
        
          - the client authenticating to the server,
        
          - the client obtaining a remote desktop,
        
          - the client using the **Log Out** feature,
        
          - the session being torn down.

  - [SampleCaptures/RDP-003.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/RDP-003.pcap.gz)
    
      - Capture on 10.226.41.226 as client to 10.226.29.74 as server with a capture filter of *ip host 10.226.29.74*
    
      - Client system is Windows XP Professional with Service Pack 2 running Microsoft Remote Desktop Connection **5.1.2600.2180** with **128-bit encryption**.
    
      - Server system is Windows 2000 Server with Service Pack 4 running Microsoft Terminal Services **5.0.2195.6696**. Here some possibly relevant settings.
        
          - Type is **Microsoft RDP 5.0**
        
          - Transport is **TCP**
        
          - Encryption level is **Medium**
        
          - **Use standard Windows authentication** is enabled
    
      - The capture includes
        
          - the client initiating a connection to the server,
        
          - the client authenticating to the server,
        
          - the client obtaining a remote desktop,
        
          - the client using the **Log Out** feature,
        
          - the session being torn down.

  - [SampleCaptures/RDP-004.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/RDP-004.pcap.gz)
    
      - Capture on 192.168.235.3 through IPSec VPN tunnel with IP 172.21.128.16 as client to 10.226.24.52 as server with a capture filter of *ip host 10.226.24.52*
    
      - Client system is Windows XP Professional with Service Pack 2 running Microsoft Remote Desktop Connection **6.0.6000** with **128-bit encryption**.
    
      - Server system is Windows Server 2003 with Service Pack 1 running Microsoft Terminal Services **5.2.3790.1830**. Here some possibly relevant settings.
        
          - Type is **Microsoft RDP 5.2**
        
          - Transport is **TCP**
        
          - Security layer is **RDP Security Layer**
        
          - Encryption level is **High**
        
          - Certificate is **\<none\>**
    
      - The capture includes
        
          - the client initiating a connection to the server,
        
          - the client authenticating to the server,
        
          - the client obtaining a remote desktop,
        
          - the client using the **Log Out** feature,
        
          - the session being torn down.

  - [SampleCaptures/rdp-ssl.pcap.gz](uploads/__moin_import__/attachments/SampleCaptures/rdp-ssl.pcap.gz) ([cert.pem](uploads/__moin_import__/attachments/SampleCaptures/rdp-ssl.pcap.gz.cert.pem "cert.pem"))
    
      - Transport is **TCP**
    
      - Security Layer is *SSL*
    
      - RDP Encryption method is **None**
    
      - RDP Encryption level is **None**
    
      - Certificate is **\<none\>**
    
    <!-- end list -->
    
      - The capture includes:
          - the client initiating a connection to the server,
          - the client authenticating to the server,
          - the client obtaining a remote desktop,

## Display Filter

There are no built-in display filters specifically for RDP. However, RDP protocols use TCP port 3389.

Display only the RDP based traffic:

    rdp

You may also use display filters based on the protocols on top of which RDP is built.

The following filter will include the conference set up and establishment of virtual channels, as well as the RDP conversation.

    t125

The following display references may also prove useful:

  - [T.125](http://www.wireshark.org/docs/dfref/t/t125.html)

  - [COTP (X.224)](http://www.wireshark.org/docs/dfref/c/cotp.html)

  - [X.224](http://www.wireshark.org/docs/dfref/x/x224.html)

  - [TPKT](http://www.wireshark.org/docs/dfref/t/tpkt.html)

## Capture Filter

You can filter RDP protocols while capturing, as it's always using TCP port 3389.

Capture only the RDP based traffic:

    tcp port 3389

## Notes about Terminal Server Services Encryption Settings

RDP 5.0

  - All levels use RSA RC4 encryption

  - **Low** - protects data sent *from client to server*
    
      - *56-bit* if Windows 2000 server to Windows 2000 or higher client
    
      - *40-bit* if Windows 2000 server to pre-Windows 2000 client

  - **Medium** - protects data sent *from client to server* and data sent *from server to client*
    
      - *56-bit* if Windows 2000 server to Windows 2000 or higher client
    
      - *40-bit* if Windows 2000 server to pre-Windows 2000 client

  - **High** - protects data sent *from client to server* and data sent *from server to client*
    
      - *128-bit* if Windows 2000 server to Windows 2000 or higher client
    
      - not sure what happens to earlier clients; ie whether it falls back or fails

RDP 5.1

  - to be investigated

RDP 5.2

  - All levels use RSA RC4 encryption

  - **Client Compatible** - protects data sent *from client to server*
    
      - dynamically determines maximum supported key strength

  - **High** - protects data sent *from client to server* and data sent *from server to client*
    
      - *128-bit*
    
      - clients that do not support 128-bit will not be able to connect

RDP 6.0

  - to be investigated

## External links

  - [ITU-T T Series Recommendation T.128](http://www.itu.int/rec/T-REC-T.128-199802-I/en) - *Multipoint application sharing* - ostensibly, RDP is based on this ITU-T Recommendation for telecommunications.

  - [Microsoft Network Monitor 3](http://en.wikipedia.org/wiki/Microsoft_Network_Monitor) provides some clues as to what other standards RDP is based on.
    
      - [ITU-T X Series Recommendation X.224](http://www.itu.int/rec/T-REC-X.224-199511-I/en) - *Open Systems Interconnection* - Protocol for providing the connection-mode transport service
    
      - [ITU-T T Series Recommendation T.125](http://www.itu.int/rec/T-REC-T.125-199802-I/en) - *Multipoint communication service protocol specification*

  - [rdesktop](http://www.rdesktop.org/) is an [open source](http://en.wikipedia.org/wiki/Open_source) application for connecting to Microsoft Terminal Server services using RDP. The documentation for *rdesktop* also includes references to additional RFCs.
    
      - [RFC 905](http://www.faqs.org/rfcs/rfc905.html) - *ISO Transport Protocol specification ISO DP 8073*
    
      - [RFC 2126](http://www.faqs.org/rfcs/rfc2126.html) - *ISO Transport Service on top of TCP (ITOT)*

  - ['Reverse-Engineering and Implementation of the RDP 5 Protocol'](http://efod.se/writings/thesis.pdf)

## Discussion

  - From Tomas Kukosa via the Wireshark-dev mailing list 2007/10/26 06:59:23 GMT:

    The X.224 is equal with the ISO International Standard 8073 which is implemented in the Wireshark. If you use Decode as TPKT on the RDP stream, it makes partially valid output.


  - [ISO/IEC 8073:1997](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=24077) - costs 216 Swiss francs

  - [ISO/IEC 8073:1997/Amd 1:1998](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=28666) - costs 16 Swiss francs

  - From Guy Harris:
    
      - [ITU-T X.224](http://www.itu.int/rec/T-REC-X.224/en) - costs 0 Swiss francs :smiley:

  - From Brendan Dolan-Gavitt:
    
      - [MS-RDPBCGR](http://download.microsoft.com/download/9/5/e/95ef66af-9026-4bb0-a41d-a4f81802d92c/%5BMS-RDPBCGR%5D.pdf) describes the full RDP protocol now\!

  - From Graeme Lunt (22/09/2011):
    
      - T.125 is dissected from COTP through the heuristic dissector. This initially caused some conflicts with [SES](/SES) but the [SES](/SES) was algorithm was tightened up. However, there may still be some conflicts.
    
      - T.124 is dissected from T.125 using a heuristic dissector - but as the payload contains a OID which identifies it as T.124 this is quite straight-forward. Also, no other dissectors currently register with T.125\!
    
      - RDP is dissected from T.124 through the registration of H.221 non standard keys "Duca" (supposedly short for "Ducati") and "[McDn](/McDn)". [SendData](/SendData) traffic is registered on channelId. (Note that the channelId registration is currently global rather than per conversation - though this does not appear to cause any issues as standard channelIds seem to be used.)
    
      - RDP compression uses [RFC 2118](http://tools.ietf.org/html/rfc2118) which is subject to a US Patent. The RFC specifically states: *MPPC can only be used in products that implement the Point to Point Protocol AND for the sole purpose of interoperating with other MPPC and Point to Point Protocol implementations.*. This is might make it difficult to implement decompression in US versions of Wireshark.
    
      - As noted by Thomas (above) and Steven ([msg00127](http://www.wireshark.org/lists/wireshark-dev/200711/msg00127.html)), X.224 is equivalent to COTP (ISO 8073) and so the X.224 dissector is probably no longer required in Wireshark.
    
      - RDP is, in part, based on T.128 - but a specific, separate T.128 dissector has not been implemented.

---

Imported from https://wiki.wireshark.org/RDP on 2020-08-11 23:23:50 UTC
