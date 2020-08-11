These are notes relating to the blocktype-trb disscetor.

# Function Calls

## On Wireshark Startup

  - proto\_register\_trb(void)
  - proto\_reg\_handoff\_trb(void)

## On File Open

  - init\_trb(void)
  - tdb\_read\_block
  - trb\_read\_block
  - dissect\_trb

Steps 3 and 4 execute four times for 1 packet

## On File Close

  - clean\_up(void)

## New File Open

  - init\_trb(void)
  - tdb\_read\_block
  - trb\_read\_block
  - dissect\_trb

## Apply Filter

  - trb\_read\_block
  - dissect\_trb

Last two steps execute four times for 1 packet

## Change Profile

  - tdb\_read\_block
  - clean\_up
  - init\_trb(void)
  - trb\_read\_block
  - dissect\_trb

Last two steps execute four times for 1 packet

---

Imported from https://wiki.wireshark.org/TRB%20Dissector on 2020-08-11 23:26:53 UTC
