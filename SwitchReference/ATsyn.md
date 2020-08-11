# Allied Telesyn Reference

The function for port analyzing/monitoring is called Port Mirroring on the Allied Telesyn Switches.

Most of the managed switches support this function. To enable it you must connect to the switch either through Telnet, HTTP (these 2 options can only be used if the switch has an IP address allocated) or through the RS-232 (DB9) port.

## Allied Telesyn instructions

Connect to the switch through either one of the 3 methods specified above (Telnet, HTTP, RS-232). Default login: manager Default password: friend

Using the gui go to the Port administration menu. Select Port Mirroring. At the Mirror Port specify the port number of the Analyzing/Monitoring equipment. At the source port(s) specify the ports you want to analyze. NOTE: you can define a range of ports (ex: 2-24), selective ports (ex: 2,3,4) or mixed ports selection (2,4-24). The Mirror port cannot be included in the selection of ports to be analyzed/monitored. After entering the port selection, save the settings. You are ready to go.

Or from the command line, for example to mirror trafic bothways on ports 1 and 2 to port 11, mirror port (11 in this case) should be in vlan1 before starting

set switch mirror=11

enable switch mirror

set switch port=1,2 mirror=both

To turn it off use

disable switch mirror

set switch port=1,2 mirror=none

For the moment being, I found no bugs or problems. Please note that older versions of FIRMWARE can give you trouble as the switch has the bad tendency to "lock" and the only way to re-enable your network is to reboot it.

*NOTE: On the Switchblade series, you can (and should) specify which 'switch instance' you are referring to - in particular, 'enable switch mirror' will enable mirroring on all switch instances - probably not what you want. Instead do 'enable switch mirror instance=1.0 *****

---

Imported from https://wiki.wireshark.org/SwitchReference/ATsyn on 2020-08-11 23:26:04 UTC
