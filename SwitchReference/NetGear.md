# NETGEAR

Most NETGEAR switches usually automatically direct all traffic to port 1, and some models have a switch which lets you enable an "uplink" port, or might automatically make a port an uplink port (although you might have to plug another NETGEAR switch into the port to make that happen). The manuals for switches may have info on this topic.

In addition, some switches, at least with later versions of switch software, support port mirroring, where a particular port can be configured to receive all traffic for network traffic capture purposes. This includes the following switches:

GS108T - see the "Monitor" page in <ftp://downloads.netgear.com/files/gs108t_swadmin_30jun07.pdf>  
GS716T  
GSM712, GSM716T, GSM724T, GSM748T  
GSM7212, GSM7224 & GSM7248 - see chapter 17"Port Mirroring" <ftp://downloads.netgear.com/files/gsm7212_gsm7224_gsm7248_60015_adminguide.pdf>,  
GSM7324, GSM7328S, GSM7352S  
FS726T/FS726TP - see the "Monitor" page in <http://kbserver.netgear.com/pdf/fs726tp_user_manual.pdf>  
FS750T, FS750T2  
FS700TS series (728TS/752TS) - see "Configuring Port Mirroring" in <http://kbserver.netgear.com/pdf/fs728ts_fs752ts_sw_admin.pdf>  
FS752TPS  
FSM726/FSM726S - see references to "Port Mirroring" in <http://kbserver.netgear.com/pdf/fsm726v2_software_manual.pdf>  
FSM750S  
FSM7326P, FSM7328S, FSM7352S, FSM7352PS  

(The above list needs work, such as grouping switches into families, and more links to manuals.)

#### GS105E - configurable 5-port 10/100/1000 mini switch

Manufacturer product page: <http://www.netgear.com/Products/Switches/PlusSwitches/GS105E.aspx>  
GS105E Installation Guide: <http://kb.netgear.com/app/answers/detail/a_id/12046>  

  - Port mirroring: Up to four source ports and one destination port can be specified.

  - 802.1Q VLAN tags are duplicated on the mirror port.

  - It is possible to put the mirror port in a separate port based VLAN. This way, the sniffer PC goes undetected from the customer network.

  - Important: Relies on proprietary configuration software only available for Windows operating systems. (But the configuration is stored persistently, so can be configured once then used everywhere.)

  - Possible useful configuration: Mirror ports 1-4 to port 5. Put ports 1-4 in port based VLAN No.1. Put port 5 in port based VLAN No.5. =\> The mirroring PC will be VLAN-separated and thus undetectable from the customer network.

  - There are some other issues with this switch: <http://forum1.netgear.com/showthread.php?t=49571>. That ping issue was fixed with firmware beta version GS105E\_V1.00.09.HEX, and in release version V1.00.10 in June 2010.

  - The latest firmware as of November 2013 is V1.02.04 <http://downloadcenter.netgear.com/en/product/GS105E>

---

Imported from https://wiki.wireshark.org/SwitchReference/NetGear on 2020-08-11 23:26:11 UTC
