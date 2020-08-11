# Activate all Wireshark debug messages

To activate all the Wireshark debug messages, including the debug ones (that are not visible normally), you have to export a glib variable:

    export G_MESSAGES_DEBUG=all

Then, when launching the executable, add this option to raise the log level

    -oconsole.log.level:252

---

Imported from https://wiki.wireshark.org/dario/debug-messages on 2020-08-11 23:12:27 UTC
