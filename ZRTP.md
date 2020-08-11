# ZRTP

The official description of ZRTP is 'Media Path Key Agreement for Secure RTP'. It's a protocol to exchange and verify end-to-end encryption keys for voice communications.

## History

ZRTP is being developed by Philip Zimmermann ([Mr. PGP](http://en.wikipedia.org/wiki/Philip_Zimmermann)), Alan Johnston and Jon Callas as alternative to the various encryption signaling protocols with specifically the [End-to-End argument](http://en.wikipedia.org/wiki/End-to-end_argument) in mind.

## Protocol dependencies

  - [RTP](/RTP): ZRTP carried in RTP version 0 packets.

## Example traffic

![http://zfoneproject.com/images/wireshark-zrtp-hello.jpg](http://zfoneproject.com/images/wireshark-zrtp-hello.jpg "http://zfoneproject.com/images/wireshark-zrtp-hello.jpg")

## Wireshark

The ZRTP dissector is fully functional. It supports the protocol versions 0.80, 0.85, 0.90, 0.95, 1.0 and 1.1.

### Capture on Windows

(From the [Zfone project website](http://zfoneproject.com/wireshark.html)):

If you want to use Wireshark to capture Zfone encrypted VoIP traffic on the same machine that Zfone is running on, you cannot do it on Windows. This is because on Windows, the Zfone device driver is closer to the network adapter than the [WinPcap](/WinPcap) device driver. This means Wireshark - and other applications using [WinPcap](/WinPcap) - capture only unencrypted IP traffic. Zfone has already decrypted incoming packets before Wireshark can see them, and Zfone only encrypts outgoing packets after they have been forwarded to Wireshark. This problem only exists on Windows.

If you need to capture encrypted packets from a Windows machine running Zfone, you must run Wireshark on a separate machine between the two parties.

## Preference Settings

The dissector has no preference settings. The [RTP](/RTP) dissector has to set 'Treat RTP version 0 packets as' to 'Invalid or ZRTP'.

## Example capture file

A sample SIP call with ZRTP protected media:

  - [Asterisk\_ZFONE\_XLITE.pcap](uploads/__moin_import__/attachments/SampleCaptures/Asterisk_ZFONE_XLITE.pcap "Asterisk_ZFONE_XLITE.pcap")

## Display Filter

A complete list of ZRTP display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/z/zrtp.html)

Show only the ZRTP based traffic:

``` 
 zrtp 
```

## Capture Filter

You cannot directly filter ZRTP protocols while capturing. However, if you know the [UDP](/UDP) port used (see above), you can filter on that one.

## External links

  - [draft-zimmermann-avt-zrtp](http://tools.ietf.org/html/draft-zimmermann-avt-zrtp) *ZRTP: Media Path Key Agreement for Secure RTP*.

  - [Zfone](http://zfoneproject.com/) The Zfone project.

## Discussion

---

Imported from https://wiki.wireshark.org/ZRTP on 2020-08-11 23:27:54 UTC
