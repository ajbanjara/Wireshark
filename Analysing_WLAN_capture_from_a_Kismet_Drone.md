# Analysing WLAN capture from a Kismet Drone

From: Christopher Key `<xxxxx@cam.ac.uk>`

To: <wireshark-users@wireshark.org>,

Hello,

Whilst trying to debug a wireless connection issue recently, I needed a way to be able to capture and analyse raw 802.11 traffic in wireshark on running on my windows system, and thought my final solution might be of interest.

I had a spare WRT54G, which has a wireless interface that canbe put into monitor mode. I installed OpenWRT onto it, and then kismet-drone, a simple application that captures traffic from a wireless interface, wraps each packet in its own header, and streams the encapsulated packets out to any connected clients. The packet headers are not too dissimilar from those used by wireshark, and a few lines of perl, available from <http://www.srcf.ucam.org/~cjk32/kismet2pcap/>, is all thats required to convert from one to the other.

Hence, with kismet\_drone running on kismethost,

    nc kismethost 3501 | ./kismet2pcap.pl - ./capture.pcap

Will writes the packets in a format that wireshark will understand to capture.pcap.

I hope this is of use to someone, it certainly made my life rather easier\!

Regards,

---

Imported from https://wiki.wireshark.org/Analysing_WLAN_capture_from_a_Kismet_Drone on 2020-08-11 23:11:10 UTC
