# Extreme Networks

See the "Switch Port-Mirroring" section of chapter 6 of the [Summit 200 Series Switch Installation and User Guide](http://www.extremenetworks.com/common/asp/frameHandler.asp?go=/services/documentation/Summit200User.pdf).

Extremeware 6.2.2 on the Extreme 3804 duplicates packets when running a port mirror. This may have been fixed in later versions.

Specific commands:

Switch\# **config mirroring add ports 1,2,5,8** Adds ports 1, 2, 5, and 8 to the mirrored port list

Switch\# **enable mirroring to 9 tagged** Configures mirror traffic to be sent to port 9, with VLAN tags intact

Switch\# **show mirroring** Displays current port mirroring information

This is for [ExtremeWare](/ExtremeWare) 7.0 and later.

---

Imported from https://wiki.wireshark.org/SwitchReference/ExtremeNetworks on 2020-08-11 23:26:07 UTC
