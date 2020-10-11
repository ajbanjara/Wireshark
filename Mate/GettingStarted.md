# MATE: Getting Started

MATE needs testers, modules for matelib, example files etc. So if you know the protocols you are working with and want to help making MATE work, you are welcome on board.

Other Ideas on what MATE should do might come from other people using it, see [Mate/Discussion](/Mate/Discussion).

These are the steps to try out MATE:

  - get a configuration file e.g. [tcp.mate](uploads/__moin_import__/attachments/Mate/GettingStarted/tcp.mate) (see [Mate/Examples](/Mate/Examples) for more) and place it somewhere on your harddisk (e.g. *D:\\tcp.mate* on win32)

  - go to Preferences-\>mate and set the config filename to the file you want to use (e.g. *D:\\tcp.mate* on win32), you don't have to restart Wireshark :smiley:

  - load a corresponding capture file (e.g. [SampleCaptures/http.cap](uploads/27707187aeb30df68e70c8fb9d614981/http.cap)) and see if MATE has added some new display filter fields, something like: *mate tcp\_pdu:1-\>tcp\_ses:1*

  - or, at prompt: *path\_to*`/wireshark -o "mate.config: tcp.mate" -r http.cap`

If anything went well, your packet details might look something like this:

![mate-tcp-output.png](uploads/__moin_import__/attachments/Mate/GettingStarted/mate-tcp-output.png "mate-tcp-output.png")

---

Imported from https://wiki.wireshark.org/Mate/GettingStarted on 2020-08-11 23:16:33 UTC
