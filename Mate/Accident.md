# MATE is an accident

Once upon a time a programmer turned troubleshooter turned sysadmin (That's me) found himself having to filter test calls made through the gateway system he worked on by some colleagues testing new mobile handsets.

Filtering calls using ISUP, MEGACO, Q931, H225, H245 was an obnoxious and slow job. I had to filter the setups based on the calling number once I knew which circuit was used then I had to create a new filter that added the other parts of the call; since capture files were huge all this filtering and refiltering was a very slow task. The task was quite a mechanical one, something a computer can be told how to do. Being a programmer the natural decision I took was to write a program to do that for me. I started in perl, I got few modules from CPAN, I wrote a very simple set of decoders for SCTP, Q931, MEGACO, and ISUP (shame on me because they are not in CPAN yet\!). Once I had the pieces I wrote a relatively simple application to split a large capture file into one-call files.

[ugly\_call\_splitter.pl](uploads/__moin_import__/attachments/Mate/Accident/ugly_call_splitter.pl)

The "ugly call splitter" did his job for few months, after a while It had been modified to do many things more (like calculating hold times for calls). One day a new service had the traffic through the gateway increased by about 100 times what it was until before that. At that point the ugly call splitter was overwhelmed (not to mention its author), many things made it fail, more ISUP PDUS in a single SCTP packet, same thing for Q931 in TCP; those were simple to solve but there was one problem the program had never had to deal on a per call basis: H225 RAS problems.

The ugly call splitter needed to decode RAS packets as well, I went fishing into CPAN and got Decode::BER. Unfortunately for me (luckily for others) I was simply not able to get the H225 syntax compiled by that module. By then I decided to rewrite the ugly call splitter into Wireshark because it already handled H225.

It was many years since I had written in C more than a few patches here and there. I had got my hands before into Wireshark source code to help a colleague that needed to filter radius packets based on few attributes which were not filterable at the time. Another thing I wanted to do was to recover my C, which I was losing as years passed without really using it.

The first attempt had no name. I took the same exact approach I had used for the ugly call splitter that was a whole set of hashes to keep the information that it collected using code in the dissectors that created the pdus as they were called. Starting on ISUP was easy adding Q931 was a little tougher, H225 make me understand that I needed a generalized approach that would fit every protocol I wanted to add, Then I decided to rewrite it for the first time.

The second attempt was called ECTAF (Ethereal Call Tracing and Analysis Facility); AVPs and AVPLs made "the generalized approach" that it needed; there was a single data structure that held the information regarding the PDUs and LEGs (I called that "thing" meanwhile until I found a good name for it) and most of the logic of it was made of AVPL operations between the PDUs and The LEGs. The next shift was due to adding MEGACO; I needed to give ECTAF a way to import the table of mappings between ISUP CICs and MEGACO Terminations, I wrote an AVPL parser for that purpose. By the time I was done with the parser I had noticed a thing: The matching logic is made with AVPLs, I have an AVPL parser... What if I import the matching logic from a configuration file?

The third attempt, called STTF (Session and Transaction Tracing Facility), was exactly about that: Import the matching logic from the configuration file. I went ahead hard coding the PDU extraction code directly into the dissectors involved until I was informed that I had to deal with SIP too, other than that at the time I was helping other colleagues with their systems and noticed that the generalized approach was usable outside the scope of VoIP as well, I just needed to be able to tell the program how to import the PDUs in the config file.

The fourth attempt, called TTT (Transaction Tracking Thing) and later just "Thing" was about that, using a config file to tell it how to import PDUs, tell it how PDUs of the same protocol relate together and how Groups of PDUs relate together. This was the first released version of the thing.

I came to like the name "Thing" so I released it as Thing. Later the named was changed to MATE (after a Ronnie Sahlberg's proposal). As the "Thing" got exposed I was told about some better ways to do it and thanks to few questions I noticed some issues it was missing so I got back to the code and added few features that would allow to use it for non telephony protocols.

To be continued...

*Luis Ontanon*

---

Imported from https://wiki.wireshark.org/Mate/Accident on 2020-08-11 23:16:30 UTC
