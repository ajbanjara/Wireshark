The BlackBerry Server Routing Protocol (SRP) is a proprietary protocol used by BlackBerry smartphones, and the BlackBerry Enterprise Server to communicate with BlackBerry Routers, and the wider BlackBerry Infrastructure for electronic mail delivery, SMS-style messaging ("PIN" messaging), calendar synchronisation, and handset security policy/connectivity settings delivery, among other things.

It typically operates on TCP ports 3101 (BlackBerry Router), and 4101 (BlackBerry Desktop Client) - neither of which have been registered officially with IANA for this purpose.

Unfortunately, RIM/BlackBerry have not provided full protocol documentation for SRP; although a rough glimpse at its structure, and (inaccurate) payload type IDs have been [published](http://www.blackhat.com/presentations/bh-europe-06/bh-eu-06-fx.pdf) as a result of reverse-engineering; and a work-in-progress dissector is being developed as part of [GitLab Issue 8225](https://gitlab.com/wireshark/wireshark/-/issues/8225).

---

Imported from https://wiki.wireshark.org/BlackBerrySRP on 2020-08-11 23:11:33 UTC
