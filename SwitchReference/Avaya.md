# Avaya

See <http://support.avaya.com/japple/css/japple?PAGE=Area&temp.bucketID=160257> for documentation on Avaya switches.

## Cajun P333T (and P333R running as switch)

set port mirror source-port 1/1 mirror-port 1/48 sampling always direction both

## Cajun P550/P220

See

  - the [Cajun P550/P220 Switch Operation Guide](http://support.avaya.com/elmodocs2/p550layer2/p550_r4_0_ug.pdf) and the [Cajun™ P550/P220 Command Line Interface Reference Guide Version 4.0](http://support.avaya.com/elmodocs2/avayapubs/P55x-P88x/Supervisor/p550_r4_0_crcli.pdf)

for information on port mirroring in those series of switches.

## Cajun P550R/P580/P880/P882

See

  - the [Cajun™ P550R®/P880/P882 Switch User Guide Version 5.0](ftp://ftp.avaya.com/incoming/Up1cku9/tsoweb/avayapubs/P55x-P88x/Supervisor/p550r_p88x_r5_0_ug.pdf) and the [Cajun™ P550R®/P880/P882 Command Line Interface Reference Guide Version v5.0](http://support.avaya.com/elmodocs2/avayapubs/P55x-P88x/Supervisor/p550r_p88x_r5_0_cr.pdf)

  - the [Avaya P550R®, P580, P880, and P882 Multiservice Switch User Guide, Version 5.3.1](http://support.avaya.com/elmodocs2/p880/v531/5.3.1UserGuide2.0.pdf)

  - the "Setting Up Port Monitoring" subsection of the "Using RMON and Ethernet Statistics to Analyze Network Performance" section of the [User Guide for the P580 and P882 Multiservice Switches, Software Version 6.0](http://support.avaya.com/elmodocs2/p882/v6/UG/100700_1/wwhelp/js/html/frames.htm)

  - the "Setting Up Port Monitoring" subsection of the "Using RMON and Ethernet Statistics to Analyze Network Performance" section of the [User Guide for the P580 and P882 Multiservice Switches, Software Version 6.1](http://support.avaya.com/elmodocs2/p882/v6.1/zydeco6_1/p580_p882ms/wwhelp/js/html/frames.htm), and the [Command Reference Guide for the Avaya P580 and P882 Multiservice Switches, Software Version 6.1](http://support.avaya.com/elmodocs2/p882/10_300090_1.pdf)

  - the "Setting Up Port Monitoring" subsection of the "Using RMON and Ethernet Statistics to Analyze Network Performance" section of the [User Guide for the P580 and P882 Multiservice Switches, Software Version 6.2](http://support.avaya.com/elmodocs2/p882/v6.2/p580_p882ms/wwhelp/js/html/frames.htm), and the [Command Reference Guide for the Avaya P580 and P882 Multiservice Switches, Software Version 6.2](http://support.avaya.com/elmodocs2/p882/10_300466_2.pdf)

for information on port mirroring in those series of switches.

set port mirror 1/1-12 source-port 1/1 mirror-port 1/24 sampling always

this command gives the following error message:

"Cajun 1 port mirroring not supported for Cajun 2"

on the P580.

any ideas ?

Yes - check the documentation above; perhaps "Cajun 1" refers to another line of switches, or to an earlier version of the software, and the syntax is different for the "set port mirror" command. -*Guy Harris*

---

Imported from https://wiki.wireshark.org/SwitchReference/Avaya on 2020-08-11 23:26:05 UTC
