# eXtensible Markup Language (XML)

For a description of XML refer to [Wikipedia's XML Page](http://en.wikipedia.org/wiki/XML)

## Protocol dependencies

XML content is normally dissected by Wireshark from several MIME media-types. The MIME content is provided by a wide variety of protocols including [HTTP](/HTTP), [JXTA](/JXTA), [RTSP](/RTSP) and [SIP](/SIP). You can add MIME processing support to your dissector via :

    dissector_table_t media_type_dissector_table = find_dissector_table("media_type");
    
    gboolean media_type_recognized = dissector_try_string(media_type_dissector_table,
                                                          mediatype, content_tvb, pinfo, tree);

## Example traffic

XXX - Add example decoded traffic for this protocol here (as plain text or Wireshark screenshot).

## Wireshark

The XML dissector is fully functional. and it has the ability to load XML DTDs and use them to choose the filter fields to be used when parsing XML.

:warning: The XML dissector is not an XML validator\! It uses the DTDs just to be able to extract information for the filtering engine.

## Preference Settings

\* Use Heuristics. Tries to recognise unknown XML media types

## DTDs

There's a directory in the wireshark data dir called `dtds` that contains DTDs (Take a look at what's in there). All files ending in `.dtd` will be processed.

For an explanation on how XML DTDs are made you can take a look at [this tutorial](http://www.xmlfiles.com/dtd/dtd_intro.asp)

Because the dissector only interested in names, almost anything that "looks like" a DTD is ok, you do not need a real one.

The minimum file contains just the `<? wireshark:protocol ?>` [XML processing instruction](http://www.w3.org/TR/REC-xml/#sec-pi) (XMLPI).

The following DTD tags are (partially) implemented and must be after the `<?wireshark:protocol?>` XMLPI tag

  - \<\! ENTITY\>

  - \<\! DOCTYPE\>

  - \<\! ELEMENT\>

  - \<\! ATTLIST\>

There are more complex DTD tags that allow "parameterized types" or "templates" that aren't implemented. The DTD parser does not currently support file inclusion, i.e. You will have cut-and-paste common sections "by hand" into your DTD files.

### example DTD

    <?wireshark:protocol proto_name="this" media="application/this"
    hierarchy="yes" ?>
    <!DOCTYPE this [
      <!ELEMENT that (other|another|#PCDATA) >
      <!-- #PCDATA is assumed to be there even it isn't -->
    
      <!ATTLIST that 
         one CDATA #REQUIRED
         two CDATA #IMPLIED  >
      <!-- we don't care of #REQUIRED, #IMPLIED or other #THINGS  -->
    
      <!ELEMENT other (#PCDATA) >
      <!ELEMENT another (#PCDATA) >
    ]>

this creates the following filter fields

    this
    this.that
    this.that.one
    this.that.two
    this.that.other
    this.that.another

given the xml:

    <this>
       aaa
       <that one="bbb">
          ccc
          <other>ddd</other>
       </that>
       eee
    </this>

all these filter expressions match:

    this == "aaa"
    this == "eee"
    this.that == "ccc"
    this.that.one == "bbb"
    this.that.other == "ddd"
    this.that.other != "<other>ddd</other>"

### \<? wireshark:protocol ?\>

The \<?wireshark:protocol?\> XML processing instruction is used to tell wireshark how to interpret with the rest of the DTD file

The PI allows the following attributes:

#### proto\_name

The name to be used as the root of the namespace, the protocol. It SHOULD be there.

#### description

A description of the protocol described by the DTD.

#### media

The MIME media type associated with this DTD. MIME content with this type will be dissected using the DTD.

#### root

root="that" has the effect that all field names from there will be "this.that"

#### hierarchy

  - hierarchy="yes|no" defaults to no

  - NO: this this.that this.that.one this.other

  - YES: this this.that this.that.one this.**that**.other

Recursion in elements is stopped abruptly the second time the same element is found a "root name" will be used instead.

    <!ELEMENT one (two)>
    <!ELEMENT two (three|four)>
    <!ELEMENT three (one|two)>
    <!ELEMENT four (#PCDATA)>

will create:

    one
    one.two
    one.two.three
    one.two.three.one
    one.two.three.two
    one.two.four
    one.three.one
    one.three.two
    one.four

### \<\! DOCTYPE \>

The only form accepted by the current DTD parser is:

    <!DOCTYPE xxx [
        ....
    ]>

Other forms will cause a syntax error.

### \<\! ENTITY \>

These are "replace" text.

    <!ENTITY % aaa bbb CDATA #IMPLIED ccc ID #IMPLIED >
    <!ATTLIST other %aaa; >

is equivalent to:

    <!ATTLIST other 
        bbb CDATA #IMPLIED
        ccc ID #IMPLIED >

:star2: Note: entities of both types (% and no %) are resolved by the DTD parser. There is no information whatsoever available about entities while dissecting.

### \<\! ELEMENT \>

Elements are the main building blocks of both XML and HTML documents.

The first ELEMENT tag found will be the default root if none was given with the `<?wireshark:protocol?>`. If it's name is different from `proto_name` the root name will be `protoname.elemname`

### \<\! ATTLIST \>

Attributes provide extra information about elements.

ATTLIST parameters will be ignored we just care about the name.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here.

## Display Filter

A complete list of XML display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/x/xml.html)

Show only the XML based traffic:

``` 
 xml 
```

XML based protocols for which a DTD exists in the `dtds` directory will have their own protocol fields instead. You won't get RSS (for which a default DTD exists) if you filter with `xml` instead try

``` 
 rss 
```

## Capture Filter

You cannot directly filter XML protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the XML traffic over HTTP that uses HTTP's default port (80):

``` 
 tcp port 80 
```

## External links

  - [W3C's XML pages](http://www.w3.org/XML/) XML pages of the World-Wide-Web Consortium.

## Discussion

I don't have an RSS capture at hand, but the statement in the Display Filter section about `xml` not working as a filter where a DTD exists doesn't seem true for the protocol I'm playing with... Martin Mathieson

---

Imported from https://wiki.wireshark.org/XML on 2020-08-11 23:27:50 UTC
