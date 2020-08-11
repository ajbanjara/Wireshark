# WAP Protocol Family

The Wireless Application Protocol (WAP) consists of a set of protocols that allow the deployment of Internet-like services on a lot of wireless network technologies.

## History

The WAP Forum was founded in 1998.

There have been several releases of the standards:

  - WAP 1.0 (1998) was the first protocol suite, and has never been (fully) implemented in the industry. It however served as a basis for the subsequent releases.

  - WAP 1.1 (1999) was the first functional and sufficiently industry-mature release of the specifications.

  - WAP 1.2 (1999) has not been widely adopted, as it was considered by some as an incomplete release.

  - WAP 1.2.1 (June 2000) could be seen as a bugfix on the WAP 1.2 specifications, however it was a major breakthrough. It is still a successful protocol release.

  - WAP 2.0 was the last release of WAP specifications released by the [WAP Forum](http://www.wapforum.org/), and it implemented the first steps towards convergence between WAP and existing Internet protocols (e.g., [HTTP](/HTTP) over [TCP](/TCP) instead of [WSP](/WSP) over [UDP](/UDP) or [WDP](/WDP)).

The [Open Mobile Alliance (OMA)](http://www.openmobilealliance.org/) was founded in a very short time frame after the release of the WAP 2.0 specification. From that instant on, only bug fixes were added to the WAP 2.0 specification, and a new feature-based technology standardization approach was adopted. This way, the [Open Mobile Alliance (OMA)](http://www.openmobilealliance.org/) now publishes the MMS 1.1 and MMS 1.2 specifications for example, instead of a common OMA 1.1 specification.

## Protocols

The WAP transport protocol stack is shown below:

![WAP\_Transport\_Protocol\_Stacks.jpg](uploads/__moin_import__/attachments/WapProtocolFamily/WAP_Transport_Protocol_Stacks.jpg "WAP_Transport_Protocol_Stacks.jpg")

Depending on the protocol stack, 4 different standard [WDP](/WDP) ([UDP](/UDP)) ports have been defined: 9200, 9201, 9202 and 9203. [WSP](/WSP) can run on other ports too.

  - [MMSE](/MMSE): [Multimedia\_Messaging\_Service\_Encapsulation](/Multimedia_Messaging_Service_Encapsulation): a WAP protocol that implements the [3GPP](/3GPP) MMS specification.

  - [WBXML](/WBXML): [WAP\_Binary\_XML](/WAP_Binary_XML): a WAP protocol that allows compact representation of XML content such as [WML](/WML).

  - [WSP](/WSP): [Wireless\_Session\_Protocol](/Wireless_Session_Protocol): a WAP protocol that implements a pull and push [HTTP](/HTTP)-like protocol.

  - [WDP](/WDP): [Wireless\_Datagram\_Protocol](/Wireless_Datagram_Protocol): a WAP protocol that provides [UDP](/UDP)-like functionality over non-[IP](/IP) bearers.

  - [WTLS](/WTLS): [Wireless\_Transport\_Layer\_Security](/Wireless_Transport_Layer_Security): a WAP protocol that implements over-the-air encryption.

  - [WTP](/WTP): [Wireless\_Transaction\_Protocol](/Wireless_Transaction_Protocol): a WAP protocol that implements transactions over [UDP](/UDP)-like transport.

## Wireshark

The WAP protocols in Wireshark are mature.

## Example capture file

Example capture files for WAP protocols can be found at the [SampleCaptures](/SampleCaptures) page.

## Display Filter

See the individual WAP protocols.

## Capture Filter

You cannot directly filter WAP protocols while capturing.

## External links

  - [The WAP Forum](http://www.wapforum.org/) (now part of the [OMA](http://www.openmobilealliance.org/))

  - [The Open Mobile Alliance (OMA)](http://www.openmobilealliance.org/)

  - [The WAP specifications](http://www.openmobilealliance.org/tech/affiliates/wap/wapindex.html)

## Discussion

---

Imported from https://wiki.wireshark.org/WapProtocolFamily on 2020-08-11 23:27:19 UTC
