# Nortel Networks

(Maybe this page should be moved to Avaya since Avaya acquired the Nortel enterprise segment, which included Nortel Networks Switches and Routing Switches; if so, we should have this page redirect to the Avaya page, so that people who bought their switches from Nortel don't have to know that Avaya bought that part of Nortel.)

For details in configuring Port Mirrorings on previous Images please refer to the according documentation.

## BayStack 350

See the "Port Mirroring Configuration" section of chapter 3 of the [Using the BayStack 350 10/100/1000 Series Switch](http://www25.nortelnetworks.com/library/tpubs/pdf/switches/bstack/350F/04376C00.PDF) manual.

## BayStack 450

See the "Port Mirroring Configuration" section of chapter 3 of the [Using the BayStack 450 10/100/1000 Series Switch](http://www25.nortelnetworks.com/library/tpubs/pdf/switches/bstack/450/309978D00.PDF) manual.

## Nortel Networks (BayStack) ES 470

**Enable:** port-mirroring mode \<mode\> monitor-port \<port where sniffer\> mirror-port-X \<port where interesting traffic\>

**Disable:** no port mirroring

## Nortel Networks ERS 2500 series

Documentation: <http://support.avaya.com/css/P8/documents/100120358> (System Monitoring 2500 Series, **Page 24**)

**Enable:** port-mirroring mode \<mode\> monitor-port \<port where sniffer\> mirror-port-X \<port where interesting traffic\>

**Disable:** no port mirroring

## Nortel Networks ERS 4500 series

Documentation: <http://support.avaya.com/css/P8/documents/100097231> (System Monitoring 4500 Series only for EDM (Webinterface), **Page 75**)

**Enable:** port-mirroring \[allow-traffic\] mode \<mode\> monitor-port \<port where sniffer\> mirror-port-X \<port where interesting traffic\>

**Disable:** no port mirroring

  - \[allow-traffic\] keyword allows normal network access through the mirror port. This may mess up (or at least contaminate) your captures, so better don't use it.

## Nortel Networks ERS 5000 series

Documentation: <http://support.avaya.com/css/P8/documents/100122059> (System Monitoring 5000 Series, **Page 49**)

This covers all ERS 55XX and 56XX devices. **Enable:** port-mirroring \[allow-traffic\] mode \<mode\> monitor-port \<port where sniffer\> mirror-port-X \<port where interesting traffic\>

**Disable:** no port mirroring

  - \[allow-traffic\] keyword allows normal network access through the mirror port. This may mess up (or at least contaminate) your captures, so better don't use it.

## Nortel Networks ERS 8300 series

Documentation: <http://support.avaya.com/css/P8/documents/100103080> (Troubleshooting 8300 Series, **Page 86**)

**Enable:** config diag mirror-by-port \<mirror ID\> create in-port \<port where interesting traffic\> out-port \<port where sniffer\> mode \<mode\> enable

**Disable:** config diag mirror-by-port \<mirror ID\> delete

  - \<mirror ID\> is a Number. This designates the Mirror ID in the device since the device can handle more than one mirroring.

## Nortel Networks ERS 8600 series

Documentation: <http://support.avaya.com/css/P8/documents/100128513> (Troubleshooting 8600/8800 Series, **Page 140**)

### Classic Passport CLI

**Enable:** config diag mirror-by-port \<mirror ID\> create in-port 2/1 out-port 2/2 mode \<mode\> enable

**Disable:** config diag mirror-by-port \<mirror ID\> delete

  - \<mirror ID\> is a Number. This designates the Mirror ID in the device since the device can handle more than one mirroring.

---

Imported from https://wiki.wireshark.org/SwitchReference/NortelNetworks on 2020-08-11 23:26:11 UTC
