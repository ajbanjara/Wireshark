# Sending Files To Wireshark

It's sometimes necessary to send files to one of the Wireshark [mailing lists](http://www.wireshark.org/lists/). This page will show you how to do so with a minimum of fuss.

[[_TOC_]]

## Do's and Don'ts

  - **Your attachments must be small**. The Wireshark mailing lists have a maximum message size of 512KB. Some of subscribers are on dialup connections. If you want to distribute a large file, either attach it to a [bug report](/ReportingBugs) or put it on the web and send a URL instead. Screenshots are often large files, so don't send them unless it's absolutely necessary. If you want to show a mis-dissected packet, saving the dissection as text and sending that would be preferable; if there's an error message in a window, sending the text of the message, rather than a picture of it, would be preferable.

  - :warning: **Don't send Microsoft Office documents such as Word documents (.doc), Excel spreadsheets (.xls), PowerPoint presentations (.ppt), ...)**. In particular, don't send screenshots in Word documents or PowerPoint presentations. There exist computers that don't have Word, Excel, or PowerPoint installed. Some of them are used by the developers of Wireshark.

  - **.ZIP attachments are not allowed**. Due to the volume of virus-laden ZIP attachments that bombard the mail server, attachments ending in .ZIP (and several other extensions) are not allowed. Either rename the attachment (such as .ZIP\_) or use another compression method (such as .tar.gz).

## Capture Files

If your capture file **does not** contain sensitive information it can be attached to a [bug report](/ReportingBugs), the [SampleCaptures](/SampleCaptures) page or sent to the wireshark-users or wireshark-dev mailing list.

If your capture file **does** contain sensitive information, it should be attached to a [bug report](/ReportingBugs) and marked *private* - the [SampleCaptures](/SampleCaptures) page and the Wireshark mailing lists are public, so if you attach a capture file to the [SampleCaptures](/SampleCaptures) page, anybody who can read that page can read your capture, and if you send it to one of the Wireshark mailing lists, everybody who is on that list will get a copy of your capture.
(See the [Tools](/Tools#capture-file-editors-andor-anonymizers) page for utilities to anonymize data in a capture before uploading)

Note also that if your capture file is large, you shouldn't send it to the list, as per the first item in the "Do's and Don'ts" list above.

Capture files attached to a [bug report](/ReportingBugs) are "harvested" for used in automated Wireshark testing ("fuzz-testing"). It is preferred that such capture files be attached as individual files (rather than collected into a .zip, .tar, etc). (gzipp'ing individual files is OK).

Please use filenames which are somewhat descriptive; E.G., `tcp_ack_dissect_fail.pcap` rather than `my_test.pcap`.

## Screenshots

We prefer PNGs or GIFs sent as MIME attachments. JPEGs are ok, but this format is intended to contain photos and is not well suited for line based graphics.

See the [Wikipedia screenshot entry](http://en.wikipedia.org/wiki/Screenshot) for more information about screenshots.

### MS Windows

1.  Take a screenshot of the foreground window in Windows using ALT+PrtSc, or of the entire desktop using PrtSc.

2.  Copy the image into Paint.

3.  Save the image as a PNG, GIF, or JPG.

4.  Attach the file to your message.

### macOS

1.  Take a screenshot of the window using the Capture \> Window menu item for Grab, in the Utilities subfolder of the Applications folder.

2.  Save the image. (XXX - at least in Panther, it's a TIFF; is that an adequately readable format?)

3.  Attach the file to your message.

### X Window System

1.  Take a screenshot:
      - Use the GIMP (File-\>Acquire-\>Screenshot).
    
      - Use KDE or GNOME's preferred screen shot feature of the week.
    
      - Use ImageMagick, XV, or a similar graphic utility.
2.  Save the image as a PNG, GIF, or JPG.
3.  Attach the file to your message.

## Source Code

For complete instructions on contributing code, see the [contribution section of the Developer's Guide](https://www.wireshark.org/docs/wsdg_html_chunked/ChSrcContribute.html).  
The page [Development/SubmittingPatches](/Development/SubmittingPatches) has complete information on the patch submission process.

---

Imported from https://wiki.wireshark.org/SendingFilesToWireshark on 2020-08-11 23:24:32 UTC