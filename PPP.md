# Point-to-Point Protocol (PPP)

PPP is used to transfer [IP](/IP) and other packet based traffic through a serial line. It can also be encapsulated over Ethernet with PPP-over-Ethernet (PPPoE) and over ATM with PPP-over-ATM (PPPoA); these are used by many ISP's (Internet Service Providers) for broadband Internet access.

PPP may use [CHAP](/CHAP) for authentication purposes.

## History

Today most ISP's offer PPP for serial (telephone) line internet access.

The former internet standards [SLIP](/SLIP) and its compressed cousin [CSLIP](/CSLIP) were used before PPP, but are obsolete now.

## Protocol dependencies

  - PPP can run directly over a serial line (dial-up or directly-connected asynchronous lines and synchronous lines such as T1/E1 lines).

  - [ISDN](/ISDN): PPP can run over an [ISDN](/ISDN) B channel.

  - [Ethernet](/Ethernet): PPP can use [Ethernet](/Ethernet) and other protocols in the [LanProtocolFamily](/LanProtocolFamily) with PPPoE.

  - [ATM](/ATM): PPP can use [ATM](/ATM) with PPPoA.

## Example traffic

XXX - Add example traffic here (as plain text or Wireshark screenshot).

## Example Flow

PPP: Point-to-Point Protocol tutorial rfc 1661, wireshak PPP [analysis](https://www.youtube.com/watch?v=iqM9SmrWENQ)

## Wireshark

The PPP dissector is fully functional.

(See [CaptureSetup/PPP](/CaptureSetup/PPP) for information on capturing PPP control protocol traffic).

## Preference Settings

(XXX add links to preference settings affecting how PPP is dissected).

## Example capture files

  - [SampleCaptures/PPPHandshake.cap](uploads/__moin_import__/attachments/SampleCaptures/PPPHandshake.cap) PPP Handshake using Microsoft Windows VPN

  - [SampleCaptures/PPP-config.cap](uploads/__moin_import__/attachments/SampleCaptures/PPP-config.cap) LCP and IPCP configuration of a Direct Cable Connection (WinXP)

  - [SampleCaptures/ppp-dialup-munged.pppd](uploads/__moin_import__/attachments/SampleCaptures/ppp-dialup-munged.pppd) Linux pppd async dialup connect/disconnect. Note that the login info in the pppd capture file has been munged slightly thus 'pppdump -p ...' shows that certain of the HDLC frames have a bad FCS).

## Display Filter

A complete list of PPP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/p/ppp.html)

Show only the PPP based traffic:

``` 
 ppp
```

## Capture Filter

There's currently no support for filtering on any PPP fields other than the protocol.

## External links

  - [RFC 1661](http://www.ietf.org/rfc/rfc1661.txt) *The Point-to-Point Protocol (PPP)* (various other PPP related RFC's are available)

  - [Point-to-Point Protocol](http://en.wikipedia.org/wiki/Point-to-Point_Protocol) at Wikipedia.org

## Discussion

---

Imported from https://wiki.wireshark.org/PPP on 2020-08-11 23:18:16 UTC
