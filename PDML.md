# PDML - Packet Description Markup Language

Wireshark can save network packet dissections in a PDML (Packet Description Markup Language) file. PDML conforms to the [XML](https://en.wikipedia.org/wiki/XML) standard and contains details about the packet dissection.

## Programs supporting this file type

  - Wireshark

## How to create this file type

After you have loaded a capture file into Wireshark, choose *File → Export Packet Dissections → as XML PDML* and save the new file.

## How to convert PDML to HTML

You can convert such a PDML file into [HTML](https://en.wikipedia.org/wiki/HTML) to view in a web browser. This is done with a [XSLT (EXtensible Stylesheet Language)](https://en.wikipedia.org/wiki/XSLT) file called `pdml2html.xsl`. You find this file in the source code distribution of Wireshark and also in the install directory of Wireshark, typically `/usr/share/wireshark/` on a Unix computer.

If you want to use the PDML file on a web server, all that is required is to place the `pdml2html.xsl` file in the same directory where the PDML file is located. The PDML file specifies the XSL file as a XML stylesheet and the web browser will automatically load the XSL file, apply the transformations to the PDML file and display the resulting HTML.

You can also convert the PDML file manually with a XSLT processor. On Unix computers you can use [xsltproc](http://xmlsoft.org/XSLT/xsltproc.html) from the libxslt library. Call it like: `xsltproc pdml2html.xsl a.pdml > a.html`

If you like to use the java XSLT processor [saxon](http://saxon.sourceforge.net) you can convert the file with a call like: `java -jar saxon9he.jar -s:a.pdml -xsl:pdml2html.xsl -o:a.html`

## Example PDML file

  - [cubic.pdml](uploads/__moin_import__/attachments/PDML/cubic.pdml) a sample PDML file showing a capture file of loading a web page.

## External links

  - [pdml2html.xsl](https://code.wireshark.org/review/gitweb?p=wireshark.git;a=blob;f=pdml2html.xsl;hb=HEAD) in the Wireshark GIT repository.

  - <http://cubic.org/~doj/pdml/cubic.pdml> show HTML conversion of the example PDML file in your web browser.

## Discussion

---

Imported from https://wiki.wireshark.org/PDML on 2020-08-11 23:17:52 UTC
