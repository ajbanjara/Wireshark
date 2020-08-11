# How to import a pure payload into Wireshark

It can happen that we have a payload for a protocol, but we don't know anything from lower protocols. We are interested in the upper protocol (i.e., for debugging/improving a dissector) but we are not interested in crafting a complete packet with the full protocol stack. This page is a quick tutorial on how to do that with Wireshark 2.9.0 and beyond.

## Background

For explaining how to leverage this feature, I will take an example protocol: Protobuf, but this applies to any dissector/payload. Let's imagine I have a payload describing a Protobuf payload, but without the lower protocols. Protobuf is a nested protocol and manually crafting a containing packet can be tricky. I'd like to call the protobuf dissector directly.

## Importing the hex payload

First, I have to open Wireshark and click on **File -\> Import from Hex Dump**.

![import.png](uploads/__moin_import__/attachments/dario/import_payload/import.png "import.png")

Second, I have to click on **Browse** and select the file containing the payload.

![encapsulation.png](uploads/__moin_import__/attachments/dario/import_payload/encapsulation.png "encapsulation.png")

The payload must be compatible with the formats Wireshark understands. More details [here](https://www.wireshark.org/docs/wsug_html_chunked/ChIOImportSection.html). A payload can be written by hand with a text editor, or can be exported from Wireshark by right-clicking on the protocol we want, and selecting **Copy -\> As Hex Dump**.

![copy.png](uploads/__moin_import__/attachments/dario/import_payload/copy.png "copy.png")

Now, in the import window, we can choose an encapsulation type. Since this is a pure payload, the encapsulation we need is **Wireshark Upper PDU export**. By selecting this option, a new dummy header will became selectable: **ExportPDU: payload**. This encapsulation type will tell Wireshark that we have Exported PDUs, and the dummy header will add an header with 1 tag before our payload: the name of the payload that will follow. This will tell Wireshark that the payload that follows the header is to be dissected using the named dissector.

![payload.png](uploads/__moin_import__/attachments/dario/import_payload/payload.png "payload.png")

We are a one step only from dissection: just hit OK and Wireshark will open our payload using the dissector we want\!

---

Imported from https://wiki.wireshark.org/dario/import_payload on 2020-08-11 23:12:29 UTC
