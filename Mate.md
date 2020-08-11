# MATE: Meta Analysis and Tracing Engine

What is MATE? Well, to keep it very short, with MATE you can create user configurable extension(s) of the display filter engine.

MATE's goal is to enable users to filter frames based on information extracted from related frames or information on how frames relate to each other. MATE was written to help troubleshooting gateways and other systems where a "use" involves more protocols. However MATE can be used as well to analyze other issues regarding a interaction between packets like response times, incompleteness of transactions, presence/absence of certain attributes in a group of PDUs and more.

MATE is an wireshark plugin that allows the user to specify how different frames are related to each other. To do so, MATE extracts data from the frames's tree and then, using that information, tries to group the frames based on how MATE is configured. Once the PDUs are related MATE will create a "protocol" tree with fields the user can filter with. The fields will be almost the same for all the related frames, so one can filter a complete session spanning several frames containing more protocols based on an attribute appearing in some related frame. Other than that MATE allows to filter frames based on response times, number of pdus in a group and a lot more.

So far MATE has been used to:

  - Filter all packets of a call using various protocols knowing just the calling number. (MATE's original goal)
  - Filter all packets of all calls using various protocols based on the release cause of one of its "segments".
  - Extrapolate slow transactions from very "dense" captures. (finding requests that timeout)
  - Find incomplete transactions (no responses)
  - Follow requests through more gateways/proxies.
  - more...

You will find more information at the following pages:

  - [MATE Getting Started](/Mate/GettingStarted) how to start working with MATE

  - [MATE's Manual](/Mate/Manual) if you are new to MATE, this might be the best place to start learning MATE configuration

  - [MATE's Configuration Tutorial](/Mate/Tutorial) explanation of MATE configuration with some step-by-step examples

  - [MATE Configuration Examples](/Mate/Examples) various ready to go configuration examples

  - [MATE's Configuration Library](/Mate/Library) MATE library of frequently used configuration settings

  - [MATE Reference Manual](/Mate/Reference) the reference of all the configuration settings

  - [MATE's FAQ](/Mate/FAQ) Frequently asked questions and the corresponding answers

  - [MATE's discussion](/Mate/Discussion) things to be discussed (rename this to Mate/WishList?)

  - [MATE is an accident](/Mate/Accident). It was not planned to be what it is. Prior to its writing the goal was similar but not quite what it is now.

---

Imported from https://wiki.wireshark.org/Mate on 2020-08-11 23:16:29 UTC
