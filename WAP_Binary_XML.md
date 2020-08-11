# WAP Binary XML (WBXML)

The WAP Binary XML (WBXML) protocol is part of the [WapProtocolFamily](/WapProtocolFamily) and tries to translate XML documents into a compact representation.

In order to use WBXML, a given mapping between a XML media type (such as WML, SI, SL, CO, or EMN) and a binary WBXML representation must exist. This mapping will translate a set of XML tags, attribute names and even parts of attribute values (and other potentially recurring text strings) into a *token* which is a 8-bit binary *index* in a so-called *code space*.

A WBXML document consists of a header and a stream of WBXML tokens and text strings. The WBXML protocol even foresees a string table, where the WBXML encoder can store recurring text strings; the WBXML stream then contains a reference into the string table whenever the given text string appears.

The WBXML encoder and decoder knows 2 states: 'tag state' and 'attribute state'. the initial state is the tag state. Whenever a token is processed, it will be handled according to the current state. A token may trigger a state change.

There exists 3 token types in WBXML:

  - **Global tokens** with specific meaning in WBXML. Global tokens have the same meaning in either code space.

  - **Tokens in the 'tag code space**' used for representing XML tags.

  - **Tokens in the 'attribute code space**' used for representing names of tag attributes, their values or parts thereof, and even the name of a tag attribute followed with (the start of) its attribute value.

## History

The initial WBXML 1.0 specification was not adopted. It is significantly different from the subsequent WBXML versions (1.1, 1.2 and 1.3). Those subsequent versions are almost identical.

## Protocol dependencies

  - [WSP](/WSP): Many media types used in WAP are encoded in WBXML format, conveyed over [WSP](/WSP).

## Example traffic

An example decoding of a WBXML encoded Client Provisioning push message is given below:

    Wireless Session Protocol, Method: Push (0x06), Content-Type: application/vnd.wap.connectivity-wbxml
        Transaction ID: 0x01
        PDU Type: Push (0x06)
        Headers Length: 47
        Content-Type: application/vnd.wap.connectivity-wbxml; SEC=USERPIN; MAC=0BB3BB551F0A93359EC29E6CEAC1440E4A617489
            SEC: USERPIN (0x01)
            MAC: 0BB3BB551F0A93359EC29E6CEAC1440E4A617489
    WAP Binary XML, Version: 1.3, Public ID: "-//WAPFORUM//DTD PROV 1.0//EN (Provisioning 1.0)"
        Version: 1.3 (0x03)
        Public Identifier (known): -//WAPFORUM//DTD PROV 1.0//EN (Provisioning 1.0) (0x0000000b)
        Character Set: utf-8 (0x0000006a)
        String table: 5 bytes
            Start  | Length | String
                 0 |      5 | 'NAP1'
        Data representation
            Level | State | Codepage | WBXML Token Description         | Rendering
                0 | Tag   | T   0    |   Known Tag 0x05           (AC) |  <wap-provisioningdoc
                0 |  Attr | A   0    |   Known attrStart 0x46          |    version='1.0'
                0 | Tag   | T   0    | END (attribute list)            |  >
                1 | Tag   | T   0    |   Known Tag 0x06           (AC) |    <characteristic
                1 |  Attr | A   0    |   Known attrStart 0x51          |      type='PXLOGICAL'
                1 | Tag   | T   0    | END (attribute list)            |    >
                2 | Tag   | T   0    |   Known Tag 0x07           (A.) |      <parm
                2 |  Attr | A   0    |   Known attrStart 0x15          |        name='PROXY-ID'
                2 |  Attr | A   0    |   Known attrStart 0x06          |        value=
                2 |  Attr | A   0    | STR_I (Inline string)           |          '170.187.51.4'
                2 | Tag   | T   0    | END (Known Tag)                 |      />
                2 | Tag   | T   0    |   Known Tag 0x07           (A.) |      <parm
                2 |  Attr | A   0    |   Known attrStart 0x07          |        name='NAME'
                2 |  Attr | A   0    |   Known attrStart 0x06          |        value=
                2 |  Attr | A   0    | STR_I (Inline string)           |          'BankMainProxy'
                2 | Tag   | T   0    | END (Known Tag)                 |      />
                2 | Tag   | T   0    |   Known Tag 0x07           (A.) |      <parm
                2 |  Attr | A   0    |   Known attrStart 0x1C          |        name='STARTPAGE'
                2 |  Attr | A   0    |   Known attrStart 0x06          |        value=
                2 |  Attr | A   0    | STR_I (Inline string)           |          'http://www.bank.com/startpage.wml'
                2 | Tag   | T   0    | END (Known Tag)                 |      />
                2 | Tag   | T   0    |   Known Tag 0x06           (AC) |      <characteristic
                2 |  Attr | A   0    |   Known attrStart 0x59          |        type='PXAUTHINFO'
                2 | Tag   | T   0    | END (attribute list)            |      >
                3 | Tag   | T   0    |   Known Tag 0x07           (A.) |        <parm
                3 |  Attr | A   0    |   Known attrStart 0x19          |          name='PXAUTH-TYPE'
                3 |  Attr | A   0    |   Known attrStart 0x06          |          value=
                3 |  Attr | A   0    |   Known attrValue 0x1C          |              'HTTP-BASIC'
                3 | Tag   | T   0    | END (Known Tag)                 |        />
                3 | Tag   | T   0    |   Known Tag 0x07           (A.) |        <parm
                3 |  Attr | A   0    |   Known attrStart 0x1A          |          name='PXAUTH-ID'
                3 |  Attr | A   0    |   Known attrStart 0x06          |          value=
                3 |  Attr | A   0    | STR_I (Inline string)           |            'pxusername'
                3 | Tag   | T   0    | END (Known Tag)                 |        />
                3 | Tag   | T   0    |   Known Tag 0x07           (A.) |        <parm
                3 |  Attr | A   0    |   Known attrStart 0x1B          |          name='PXAUTH-PW'
                3 |  Attr | A   0    |   Known attrStart 0x06          |          value=
                3 |  Attr | A   0    | STR_I (Inline string)           |            'pxuserpasswd'
                3 | Tag   | T   0    | END (Known Tag)                 |        />
                2 | Tag   | T   0    | END (Known Tag 0x06)            |      </characteristic>
                2 | Tag   | T   0    |   Known Tag 0x06           (AC) |      <characteristic
                2 |  Attr | A   0    |   Known attrStart 0x52          |        type='PXPHYSICAL'
                2 | Tag   | T   0    | END (attribute list)            |      >
                3 | Tag   | T   0    |   Known Tag 0x07           (A.) |        <parm
                3 |  Attr | A   0    |   Known attrStart 0x2F          |          name='PHYSICAL-PROXY-ID'
                3 |  Attr | A   0    |   Known attrStart 0x06          |          value=
                3 |  Attr | A   0    | STR_I (Inline string)           |            'PROXY 1'
                3 | Tag   | T   0    | END (Known Tag)                 |        />
                3 | Tag   | T   0    |   Known Tag 0x07           (A.) |        <parm
                3 |  Attr | A   0    |   Known attrStart 0x17          |          name='DOMAIN'
                3 |  Attr | A   0    |   Known attrStart 0x06          |          value=
                3 |  Attr | A   0    | STR_I (Inline string)           |            'www.bank.com/'
                3 | Tag   | T   0    | END (Known Tag)                 |        />
                3 | Tag   | T   0    |   Known Tag 0x07           (A.) |        <parm
                3 |  Attr | A   0    |   Known attrStart 0x20          |          name='PXADDR'
                3 |  Attr | A   0    |   Known attrStart 0x06          |          value=
                3 |  Attr | A   0    | STR_I (Inline string)           |            '170.187.51.3'
                3 | Tag   | T   0    | END (Known Tag)                 |        />
                3 | Tag   | T   0    |   Known Tag 0x07           (A.) |        <parm
                3 |  Attr | A   0    |   Known attrStart 0x21          |          name='PXADDRTYPE'
                3 |  Attr | A   0    |   Known attrStart 0x06          |          value=
                3 |  Attr | A   0    |   Known attrValue 0x05          |              'IPV4'
                3 | Tag   | T   0    | END (Known Tag)                 |        />
                3 | Tag   | T   0    |   Known Tag 0x07           (A.) |        <parm
                3 |  Attr | A   0    |   Known attrStart 0x22          |          name='TO-NAPID'
                3 |  Attr | A   0    |   Known attrStart 0x06          |          value=
                3 |  Attr | A   0    | STR_I (Inline string)           |            'INTERNET'
                3 | Tag   | T   0    | END (Known Tag)                 |        />
                3 | Tag   | T   0    |   Known Tag 0x07           (A.) |        <parm
                3 |  Attr | A   0    |   Known attrStart 0x22          |          name='TO-NAPID'
                3 |  Attr | A   0    |   Known attrStart 0x06          |          value=
                3 |  Attr | A   0    | STR_T (Tableref string)         |            'NAP1'
                3 | Tag   | T   0    | END (Known Tag)                 |        />
                3 | Tag   | T   0    |   Known Tag 0x06           (AC) |        <characteristic
                3 |  Attr | A   0    |   Known attrStart 0x53          |          type='PORT'
                3 | Tag   | T   0    | END (attribute list)            |        >
                4 | Tag   | T   0    |   Known Tag 0x07           (A.) |          <parm
                4 |  Attr | A   0    |   Known attrStart 0x23          |            name='PORTNBR'
                4 |  Attr | A   0    |   Known attrStart 0x06          |            value=
                4 |  Attr | A   0    | STR_I (Inline string)           |              '9203'
                4 | Tag   | T   0    | END (Known Tag)                 |          />
                3 | Tag   | T   0    | END (Known Tag 0x06)            |        </characteristic>
                2 | Tag   | T   0    | END (Known Tag 0x06)            |      </characteristic>
                1 | Tag   | T   0    | END (Known Tag 0x06)            |    </characteristic>
                1 | Tag   | T   0    |   Known Tag 0x06           (AC) |    <characteristic
                1 |  Attr | A   0    |   Known attrStart 0x55          |      type='NAPDEF'
                1 | Tag   | T   0    | END (attribute list)            |    >
                2 | Tag   | T   0    |   Known Tag 0x07           (A.) |      <parm
                2 |  Attr | A   0    |   Known attrStart 0x11          |        name='NAPID'
                2 |  Attr | A   0    |   Known attrStart 0x06          |        value=
                2 |  Attr | A   0    | STR_T (Tableref string)         |          'NAP1'
                2 | Tag   | T   0    | END (Known Tag)                 |      />
                2 | Tag   | T   0    |   Known Tag 0x07           (A.) |      <parm
                2 |  Attr | A   0    |   Known attrStart 0x10          |        name='BEARER'
                2 |  Attr | A   0    |   Known attrStart 0x06          |        value=
                2 |  Attr | A   0    |   Known attrValue 0x2A          |            'GSM-CSD'
                2 | Tag   | T   0    | END (Known Tag)                 |      />
                2 | Tag   | T   0    |   Known Tag 0x07           (A.) |      <parm
                2 |  Attr | A   0    |   Known attrStart 0x07          |        name='NAME'
                2 |  Attr | A   0    |   Known attrStart 0x06          |        value=
                2 |  Attr | A   0    | STR_I (Inline string)           |          'MY ISP CSD'
                2 | Tag   | T   0    | END (Known Tag)                 |      />
                2 | Tag   | T   0    |   Known Tag 0x07           (A.) |      <parm
                2 |  Attr | A   0    |   Known attrStart 0x08          |        name='NAP-ADDRESS'
                2 |  Attr | A   0    |   Known attrStart 0x06          |        value=
                2 |  Attr | A   0    | STR_I (Inline string)           |          '+35808124002'
                2 | Tag   | T   0    | END (Known Tag)                 |      />
                2 | Tag   | T   0    |   Known Tag 0x07           (A.) |      <parm
                2 |  Attr | A   0    |   Known attrStart 0x09          |        name='NAP-ADDRTYPE'
                2 |  Attr | A   0    |   Known attrStart 0x06          |        value=
                2 |  Attr | A   0    |   Known attrValue 0x07          |            'E164'
                2 | Tag   | T   0    | END (Known Tag)                 |      />
                2 | Tag   | T   0    |   Known Tag 0x07           (A.) |      <parm
                2 |  Attr | A   0    |   Known attrStart 0x0A          |        name='CALLTYPE'
                2 |  Attr | A   0    |   Known attrStart 0x06          |        value=
                2 |  Attr | A   0    |   Known attrValue 0x10          |            'ANALOG-MODEM'
                2 | Tag   | T   0    | END (Known Tag)                 |      />
                2 | Tag   | T   0    |   Known Tag 0x06           (AC) |      <characteristic
                2 |  Attr | A   0    |   Known attrStart 0x5A          |        type='NAPAUTHINFO'
                2 | Tag   | T   0    | END (attribute list)            |      >
                3 | Tag   | T   0    |   Known Tag 0x07           (A.) |        <parm
                3 |  Attr | A   0    |   Known attrStart 0x0C          |          name='AUTHTYPE'
                3 |  Attr | A   0    |   Known attrStart 0x06          |          value=
                3 |  Attr | A   0    |   Known attrValue 0x1A          |              'PAP'
                3 | Tag   | T   0    | END (Known Tag)                 |        />
                3 | Tag   | T   0    |   Known Tag 0x07           (A.) |        <parm
                3 |  Attr | A   0    |   Known attrStart 0x0D          |          name='AUTHNAME'
                3 |  Attr | A   0    |   Known attrStart 0x06          |          value=
                3 |  Attr | A   0    | STR_I (Inline string)           |            'wwwmmmuser'
                3 | Tag   | T   0    | END (Known Tag)                 |        />
                3 | Tag   | T   0    |   Known Tag 0x07           (A.) |        <parm
                3 |  Attr | A   0    |   Known attrStart 0x0E          |          name='AUTHSECRET'
                3 |  Attr | A   0    |   Known attrStart 0x06          |          value=
                3 |  Attr | A   0    | STR_I (Inline string)           |            'wwwmmmsecret'
                3 | Tag   | T   0    | END (Known Tag)                 |        />
                2 | Tag   | T   0    | END (Known Tag 0x06)            |      </characteristic>
                2 | Tag   | T   0    |   Known Tag 0x06           (AC) |      <characteristic
                2 |  Attr | A   0    |   Known attrStart 0x54          |        type='VALIDITY'
                2 | Tag   | T   0    | END (attribute list)            |      >
                3 | Tag   | T   0    |   Known Tag 0x07           (A.) |        <parm
                3 |  Attr | A   0    |   Known attrStart 0x12          |          name='COUNTRY'
                3 |  Attr | A   0    |   Known attrStart 0x06          |          value=
                3 |  Attr | A   0    | STR_I (Inline string)           |            '228'
                3 | Tag   | T   0    | END (Known Tag)                 |        />
                3 | Tag   | T   0    |   Known Tag 0x07           (A.) |        <parm
                3 |  Attr | A   0    |   Known attrStart 0x13          |          name='NETWORK'
                3 |  Attr | A   0    |   Known attrStart 0x06          |          value=
                3 |  Attr | A   0    | STR_I (Inline string)           |            '001'
                3 | Tag   | T   0    | END (Known Tag)                 |        />
                2 | Tag   | T   0    | END (Known Tag 0x06)            |      </characteristic>
                1 | Tag   | T   0    | END (Known Tag 0x06)            |    </characteristic>
                0 | Tag   | T   0    | END (Known Tag 0x05)            |  </wap-provisioningdoc>

Another decoded XML example is given in [prov.wmbxl](uploads/__moin_import__/attachments/WAP_Binary_XML/prov.wmbxl).

## Wireshark

The WBXML dissector is fully functional, and it contains dissection with token mapping for the following XML media types:

  - Wireless Markup Language (WML): versions 1.0, 1.1, 1.2 and 1.3

  - Service Indication (SI): version 1.0

  - Service Loading (SL): version 1.0

  - Cache Operation (CO): version 1.0

  - WTA Channel (CHANNEL): version 1.0

  - WAP Provisioning (PROV): version 1.0

  - Wireless-Village Client-Server Protocol (WV-CSP): version 1.0 and 1.1 (1.2 will be once the corrected specs will be published)

  - Nokia and Ericsson OTA Provisioning (OTAP): version 7.0 (downwards compatible with all earlier versions)

  - SyncML: version 1.0 and 1.1

  - WSP User-Agent Profile (UAPROF) header values for the *Profile-Diff* header (UAPROF 1.x only; UAPROF 2.0 does not use WBXML anymore).

Partial support for:

  - Phone.com WML+: versions 1.1 and 1.3 (only the WML tokens)

Other WBXML media types may be dissected as WBXML too, but without token mapping.

## Preference Settings

  - **Skip the mapping of WBXML tokens to media type tokens.** Enable this preference if you want to view the WBXML tokens without the representation in a media type (e.g., WML). Tokens will show up as Tag\_0x12, attrStart\_0x08 or attrValue\_0x0B for example.

  - **Disable the parsing of the WBXML tokens.** Enable this preference if you want to skip the parsing of the WBXML tokens that constitute the body of the WBXML document. Only the WBXML header will be dissected (and visualized) then.

## Example capture file

  - [SampleCaptures/WAP\_WBXML\_Provisioning\_Push.pcap](uploads/__moin_import__/attachments/SampleCaptures/WAP_WBXML_Provisioning_Push.pcap) shows a WAP Push containing a Client Provisioning document encoded in WBXML. This example comes from the WAP Provisioning specifications.

## Display Filter

A complete list of WBXML display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/w/wbxml.html)

Show only the WBXML based traffic:

``` 
 wbxml 
```

## Capture Filter

You cannot directly filter WBXML protocols while capturing.

## External links

  - add link to WBXML specification and where to find additional info on the web about WBXML

## Discussion

---

Imported from https://wiki.wireshark.org/WAP_Binary_XML on 2020-08-11 23:27:20 UTC
