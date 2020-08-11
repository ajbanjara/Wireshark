# Testing wireshark on a secondary display

Sometimes we want to run many tests on multiple captures using Wireshark instead of tshark. That's pretty annoying, but a useful solution can be adopted (on Linux). [Xephyr](https://www.freedesktop.org/wiki/Software/Xephyr/) is a secondary X-server that lives inside the main one. It can be resized and put wherever we like and it doesn't move. Now we can launch Wireshark targetting this new display. No matter how many and how fast we run Wireshark, we won't be bothered by new windows appearing all around.

    Xephyr :1
    DISPLAY=:1 ./run/wireshark

---

Imported from https://wiki.wireshark.org/dario/secondary-x-display on 2020-08-11 23:12:31 UTC
