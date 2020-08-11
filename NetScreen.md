# Juniper NetScreen snoop output

The Juniper NetScreen firewalls have a build-in snoop command. Unfortunately the only output format of the snoop command is a text-dump to the debug-buffer. On the bright side: it is possible to add the hex-data of all packets so that the packets can be re-constructed with Wireshark or Tshark.

## Programs supporting this file type

  - Wireshark, TShark (SVN-22533 or later)

## How to create this file type

To create the output files, use the following commands (issued on the console port):

    set console dbuf
    snoop detail
    snoop detail len <snaplen 1-1514>
    snoop filter ... (see the CLI-help for filter options)
    clear dbuf
    snoop

Stop the capture with \<ESC\> and then display the output with the command "get dbuf stream". Select the text and save it to a file. It is also possible to save the output directly to a tftp-server with the command "get dbuf stream \> tftp \<host\> \<filename\>"

## Timestamps

The timestamp resolution of the output is in tenth of seconds.

## Wireshark

The NetScreen-snoop handling is partially functional. It has been tested with files generated with ScreenOS 5.3 on a NS-5GT-WIRELESS-ADSL. Wireshark currently can dissect the ethernet, wifi and adsl packets.

## Example capture file

  - [SampleCaptures/NetScreen.txt.gz](uploads/__moin_import__/attachments/SampleCaptures/NetScreen.txt.gz)

## Discussion

---

Imported from https://wiki.wireshark.org/NetScreen on 2020-08-11 23:17:15 UTC
