Sliding Windows is a term used to describe the flow control mechanism that the TCP uses. To control the size of the payload per segment transmitted the TCP allows the receiver to specify the start and end sequence numbers it is prepared to receive.

This is important because if the segment received is larger than the current buffer allocated by the recipient then that segment will be discarded. Subsequently, without this mechanism systems which vary their buffer size to available resources would result in excessive retransmissions and systems with differing MTUs would be unable to communicate at all.

---

Imported from https://wiki.wireshark.org/Sliding_Windows on 2020-08-11 23:24:47 UTC
