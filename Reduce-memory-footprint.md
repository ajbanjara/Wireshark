# Reduce memory footprint

Wireshark uses a lot of memory to keep state do reasembly and whatever possibly not always in the most efficent maner. Collect ideas the might be worth exploring here.

## Find the stuff that uses up the memory

Today we think that the packet list, the reassembly functions the frame data and address resolution stuff are the main memory hogs. But do we know for sure?

### GUI code to show actual memory usage

In ui/gtk/memory\_dlg.c we have the beggining of code showing the actual memory usage perhaps that should be expanded.

  - Show wmem allocation
  - Design a registration function to register g\_hastable callbacks with hastable name aproximate memory usage per entry. This would make it possible to get the number of entries in the hastable and calculate a ruff estimate of the memory consumed by it.

### Address resolution

Address resolution consumes memory even when addreses isn't resolved as the IP address string is cashed. It's supposed to save memory for the packet list but I'm not sure if it works as intended. Should be reviewed.

### Reasembled data

Reasembled data is keept in memory. If it was saved on file instead it would save a lot of memory but might cost more in terms of time. Follow TCP stream does a better job of handling out of order packets so writing to file might have other benefits as well.

  - Write a tmp file with a "block" per reasmbled fragments and just keep a file pointer and length indicator in the table, much like current fdata?
  - Write a new file as we are reading in the original one and write the reasembled data in the block with the final fragment as a new pcapng option. Fragment Blocks needs to have a flag reasembled set. When first pass is made switch to the new file. The new file should be possible to save and use as a "pre reasembled file"
      - Will this work for live captures?
      - If we have a "reassembled file" where reasembly didn't work properly, can we reset and retry?

---

Imported from https://wiki.wireshark.org/Reduce%20memory%20footprint on 2020-08-11 23:23:52 UTC
