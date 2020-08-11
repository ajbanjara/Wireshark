## Graeme Lunt

Hi\!

I have been working on Wireshark since mid 2005 initially working on the dissectors that interested me, but then diversifying into other areas of Wireshark.

The dissectors I developed are primarily for the OSI X.400 Messaging Services and X.500 Directory Services, including the lower layers of the stack. I've also worked on the IETF equivalents; SMTP, LDAP.

So far I have added dissectors for:

  - [ROS](/ROS): Remote Operations Service Element

  - [RTSE](/RTSE): Reliable Transfer Service Element

  - [X411](/X411): X.400 Message Transfer Service (P1)

  - [X413](/X413): X.400 Message Store Service (P7)

  - [X420](/X420): X.420 Interpersonal Message Service (P22) (including X.420 File Transfer Body Part).

  - [S4406](/S4406): STANAG 4406 Military Message Service (P772)

  - [DISP](/DISP): X.500 Directory Information Shadowing Protocol

  - [DAP](/DAP): X.500 Directory Access Protocol

  - [DSP](/DSP): X.500 Directory Shadowing Protocol

  - [DOP](/DOP): X.500 Directory Object Management Binding Protocol

  - [PKCS12](/PKCS12): Personal Information Exchange Syntax (private key storage (.pfx or .p12 files).

  - [IMF](/IMF): Internet Message Format (RFC2822)

  - [TNEF](/TNEF): Transport-Neutral Encoding Format (TNEF) (those pesky winmail.dat files\!)

This has involved forays into the existing dissectors:

  - [BER](/BER): ASN.1 Basic Encoding Rules

  - [PRES](/PRES): OSI Presentation Layer

  - [CMS](/CMS): Cryptographic Message Syntax

  - [ESS](/ESS): Enhanced Security Services

  - [LDAP](/LDAP): Lightweight Directory Access Protocol

  - [SMTP](/SMTP): Simple Message Transfer Protocol

I've even tried to understand how asn2wrs (on which most of my new dissectors rely) does it's magic\!

I have introduced a new file type that allows Wireshark to read a raw ASN.1 BER-encoded file, for example a PKCS\#12 file. All of Wireshark's powerful ASN.1 dissection routines can then be brought to bear on these files, that may not normally be sent over the wire. The "Decode As" feature has been updated to recognise ASN.1 files and offer dissection in accordance to common ASN.1 definitions.

I have developed the [U3Packaging](/U3Packaging) for Wireshark that allows you to run Wireshark from a USB stick, as well as a [WiresharkPortable](/WiresharkPortable) version of Wireshark that runs under the [PortableApps](http://www.portableapps.com/) framework.

Current things I am working on are:

  - [TNEF](/TNEF): Still looking to enhance this to allow the registration of dissectors for specific MAPI properties.

I am \[still\] looking at mechanisms that will allow the user to associate a known BER syntax with a given OID - either from a configuration file, parsing of ASN.1 modules, SNMP MIBS etc, or some other mechanism.

If there is some messaging/directory feature you would like to see in Wireshark, send it to the development list and I'll try and help out.

For other information see <http://www.smhs.co.uk>.

Email: `<graeme.lunt AT SPAMFREE smhs DOT co DOT uk>`

-----

---

Imported from https://wiki.wireshark.org/GraemeLunt on 2020-08-11 23:14:19 UTC
