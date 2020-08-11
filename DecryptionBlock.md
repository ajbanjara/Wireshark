# Pcapng Decryption Block

The idea comes from this [bug](https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9616), define a decryption block which can be used to store decryption data needed to decrypt packets in a file. If this is implemented "privacy" control probably should too; e.g. a setting of what will be written into a pcapng file.

It would be nice to do so in such a way that, for example, files saved without the SSL/TLS handshake packets can still be decrypted, for example if you export only specific packets of the stream. I.e., save the key and state info for the first saved packet of a stream, not the info currently put into the SSL key preferences. (if that's possible) This would also apply to decryption keys for 802.11 WPA/WPA2, so that you export only specific packets, and don't export the EAPOL handshake, the exported packets can be decrypted.

That way we can decrypt files saves when Wireshark writes to multiple output files in a ring, for example. And of course when export selected packets is used. (although this latter case may require saving the decryption info per frame, in the worst case)

There have been questions about this on [ask.wireshark.org](http://ask.wireshark.org), like: "why can't I see what's in this HTTPS session after I opened the file, when I could previously see it in the live capture?".

---

Imported from https://wiki.wireshark.org/DecryptionBlock on 2020-08-11 23:12:36 UTC
