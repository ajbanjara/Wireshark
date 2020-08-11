# Digital Imaging and Communications in Medicine (DICOM)

Wikipedia has a very good high level description about DICOM and the protocol specifications can be found at the DICOM Homepage. This page will focus on wireshark specific topics.

    Disclaimer: 
    
    Wireshark is not a Medical Device and therefore exported files MUST NOT be used for any clinical processes. The exported file are solely for data and communication interpretation purposes, and the implementation does not claim to be a reference. For certain network captures, the different PDUs are not resembled in the correct order, i.e. leading to invalid DICOM files. So when looking at the files e.g. using a DICOM editor, apply the necessary care, as far as the interpretation of the results go.

## History

DICOM is the third version of a standard developed by American College of Radiology (ACR) and National Electrical Manufacturers Association (NEMA) and was released in 1993. Previous standards did not include network support. For more information about the history, please refer to [\[1](/Protocols/dicom#links)\] & [\[2](/Protocols/dicom#links)\]

## Protocol dependencies

  - [TCP](/TCP): Typically, DICOM uses [TCP](/TCP) as its transport protocol. The well known TCP port for DICOM traffic is 104.

## Example traffic

Following screenshot shows a DICOM communication containing a C-ECHO followed by C-STORE request.

![dicom\_assoc\_accept.png](uploads/__moin_import__/attachments/Protocols/dicom/dicom_assoc_accept.png "dicom_assoc_accept.png")

The accepted or rejected presentation contexts are decoded, to quickly identify negotiation issues.

## Example capture file

XXX - Add a simple example capture file to the [SampleCaptures](/SampleCaptures) page and link from here (see below). Keep this file short, it's also a good idea to gzip it to make it even smaller, as Wireshark can open gzipped files automatically.

  - [SampleCaptures/DICOM.pcap](uploads/__moin_import__/attachments/SampleCaptures/PROTO.pcap "SampleCaptures/DICOM.pcap")

## Wireshark

Starting with Wireshark 1.2.1, the DICOM dissector has many new features.

  - It should resemble almost all PDUs
  - It supports multiple PDVs per PDU
  - It decodes all tags defined in the standard 2008
  - It adds 'Expert Infos', e.g. if Associations are aborted
  - It can export captured DICOM objects as files
  - UIDs are shown in clear text

### Known issues

Currently, the biggest issue is still the proper reassembly of more than one PDU \[3\]. This also affects the export.

### Preference Settings

Following settings are available to influence DICOM dissection.

![dicom\_default\_pref.png](uploads/__moin_import__/attachments/Protocols/dicom/dicom_default_pref.png "dicom_default_pref.png")

  - **DICOM Ports:** Comma separated list with TCP ports to decode. A range can also be specified. Example: 104, 3200, 50000-51000

  - **Search on any TCP Port:** When enabled, the DICOM dissector will parse all TCP packets not handled by any other dissector and look for an association request. This is disabled by default, to preserve resources for the non DICOM community. If you frequently look at DICOM traffic, enable this setting. If despite this enabled, the communication is still not recognized as a DICOM stream, add the TCP port to the list above.

  - **Create Meta Header on Export:** For exported PDUs, create a DICOM File Meta Header according to part 10. If the captured PDV does not contain a SOP Class UID and SOP Instance UID (e.g. for command PDVs), wireshark specific ones will be created. Meta headers are common now-a-days.

  - **Min. item size in bytes to export:** Do not show items below this size in the export list. Set it to 0, to see DICOM commands and responses in the list. Set it higher, to just export DICOM IODs (i.e. CT Images, RT Structures). DICOM commands are prefixed with a Meta Header as well.

  - **Create subtrees for Sequences and Items:** This is a matter of personal taste. If enabled, each sequences and items are shown in a hierarchy as show next. Since IODs can span multiple PDUs, sequence items in subsequent PDUs, may appear as root object. For a few items, containing tags are summarized and shown as an item description. Deselect this option, if you prefer a flat display or e.g. when using TShark to create a text output. ![dicom\_seq\_tree.png](uploads/__moin_import__/attachments/Protocols/dicom/dicom_seq_tree.png "dicom_seq_tree.png")

  - **Create subtrees for DICOM Tags:** This is a matter of personal taste. By default it is disabled, as it does not add much information. However, when one wants to see, the detailed tag decoding, or more important, if one wants to search for very specific DICOM attributes, enable this setting. ![dicom\_tag\_tree.png](uploads/__moin_import__/attachments/Protocols/dicom/dicom_tag_tree.png "dicom_tag_tree.png")

### Display Filter

A complete list of DICOM display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/protofirstletter/proto.html)

Show only the DICOM based traffic:

``` 
 dicom
```

### Capture Filter

You cannot directly filter DICOM protocols while capturing. However, if you know the [TCP](/TCP) port used (see above), you can filter on that one.

Capture only the DICOM traffic over the default port (80):

``` 
 tcp port 104
```

### DICOM Export

First make sure to have a valid DICOM capture, including Association Request. Then, select File -\> Export -\> Objects -\> DICOM.

![dicom\_export.png](uploads/__moin_import__/attachments/Protocols/dicom/dicom_export.png "dicom_export.png")

Depending on the minimum size defined in the preferences, you will see more or less items in the list.

The Save all dialog is a little tricky, if the 'Browse for other folders' is expanded. Make sure to be in the parent directory and only highlight the target directory, don't open it.

![dicom\_export\_save\_all.png](uploads/__moin_import__/attachments/Protocols/dicom/dicom_export_save_all.png "dicom_export_save_all.png")

### Conformance statement

For the DICOM Export, following UIDs are used. Since the SOP Class UID (0008,0016) and SOP Instance UID (0008,0018) are mandatory elements in the meta header, they are created if needed.

Implementation UID (0002,0012)

    1.2.826.0.1.3680043.8.427.10

Artificial Media Storage SOP Class UID for exported command PDVs

    1.2.826.0.1.3680043.8.427.11.1

Artificial Media Storage SOP Instance UID for exported command PDVs

    1.2.826.0.1.3680043.8.427.11.2.nn.m

### Troubleshooting DICOM

Wireshark is an ideal *starting point* to troubleshoot DICOM connectivity problems. Most often, the involved DICOM devices run on different operating systems, are from different vendors and sometimes are rather closed devices. In addition, the log files on those devices and cannot show both ends.

Basic connectivity problems can be identified just by using Wireshark captures. If it is more than that, it should at least be possible to tell, at which end to start.

To help quickly identify common scenarios, the DICOM dissector is creating 'Expert Info' marks as shown next.

![dicom\_expert\_info.png](uploads/__moin_import__/attachments/Protocols/dicom/dicom_expert_info.png "dicom_expert_info.png")

In the Paket Details tree, warnings are highlighted as follows:

![dicom\_expert\_highlight.png](uploads/__moin_import__/attachments/Protocols/dicom/dicom_expert_highlight.png "dicom_expert_highlight.png")

#### Association Request & Response

If one can't get beyond this, it's most likely a DICOM configuration or network setup issue.

  - Make sure to check AE titles, host names or IP addresses and ports associated to those AE titles. Sometimes, additional connection need to be licensed and the licenses can be related to the AE titles.
  - If possible, perform a DICOM C-ECHO Request. This is an application level ping and this also issues an A-ASSOCIATE Request and Response
  - If a DICOM user is configured by hostname, a revers name lookup may take place, because the DICOM provider only gets it's IP in the A-ASSOCIATE request and may want to check, whether this IP is 'authorized' to create a connection.
  - Check you AE title again

#### Transfer Syntax

To better understand this topic, it is helpful to understand the term 'Presentation Context'. In modern terms, it can best be described as a channel. So, in a single TCP Session (association) one can have multiple channels (presentation context). Each channel has a particular purpose (abstract syntax) and an agreed encoding (transfer syntax). It's part of the association request and response, to agree on a single transfer syntax per presentation context. This can be seen pretty well in wireshark.

The device issuing the A-ASSOCIATE request, will put the most preferred syntax as first element in a presentation context. The provider will then make a decision based on the offered list and priority, which one to use and tell that in the A-ASSOCIATE reply. Since 'Implicit Little Endian' is the least common denominator, there should no be a problem here, unless there's an implementation error.

#### Query and Retrieve

This is the tricky part. Things can go wrong in the query part, or in the transition to the object transfer.

##### C-FIND Issues

The initiating party, sends C-FIND-RQ commands and data and the provider will return the requested tags (those ones that were empty). With the returned data, most likely, a new query is being created and sent to the provider. This is usually repeated, until the desire object or set of object was found. If no matching data was returned, this could indicate a problem. So to see what possibly goes wrong, one needs to compare the tags in the C-FIND-RQ with the ones in C-FIND-RSP, and then the following C-FIND-RQ. Over-defined queries, different tag parsing (esp. trailing spaces in strings) or compound elements '^' are things to pay attention to.

##### C-MOVE Issues

If the desired data was found in the query section, most likely a C-MOVE request is issued. The move request contains the AE title to be used (0000,0060) for the 'callback'. A new association (session) is being created, but from the 'server' to the 'client'. The callback is mostly based on the AE specific configuration settings on the QR service class provider. As an alternative, the same IP address and the default DICOM port may be used for the callback. With Wireshark, one can quickly see, what's going on during this transition. However, in today's switch networked environment, it may be needed to capture the traffic at the QR provider end.

#### Performance

Looking at the timestamps is by far the best method to figure out why a transfer is slow.

#### Tag Data

If things still don't work, despite of proper communication, it may be an issue of the actual data being transferred. Here Wireshark is only of limited use. For this purpose, the DICOM export was introduced, to see whether the data can be read from a file. If not, it time to contact the respective device vendor(s).

## External links

  - \[1\] DICOM Description on [Wikipedia](http://en.wikipedia.org/wiki/Digital_Imaging_and_Communications_in_Medicine)

  - \[2\] DICOM Homepage <http://medical.nema.org/>

  - \[3\] [Bug 4642 on DICOM reassembly not working](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4642)

## Discussion

---

Imported from https://wiki.wireshark.org/Protocols/dicom on 2020-08-11 23:19:30 UTC
