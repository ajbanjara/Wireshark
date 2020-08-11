## Hardware/Software Requirements and Limitations

Port mirroring is available on all switch products beginning in AOS 8.01.00 code. The [NetVanta](/NetVanta) 1524ST only allows mirroring of Rx traffic. Rx and Tx traffic may be mirrored in all other ADTRAN switch products. Port Mirroring is available on AOS products with the Port Mirroring functionality as outlined in the AOS Feature Matrix- Product Feature Matrix, available online at <https://supportforums.adtran.com/docs/DOC-1115>.

### Configuration in CLI

To configure the CLI for port mirroring, there are actually very few steps that need to be taken. There are basically two commands needed to configure port mirroring:

1.  Specify which port to mirror (the source port)
2.  Specify which port is going to mirror the traffic (the destination port).

Use the ***monitor session*** command to configure a port mirroring session. Use the no form of this command to remove a port mirroring session or to remove a source or destination interface.

The following example will mirror all traffic from port 23 on port 15.

**Switch(config)\#monitor session 1 destination interface ethernet 0/15  
Switch(config)\#monitor session 1 source interface ethernet 0/23**

Variations of the monitor session command include the following:

**monitor session** *\<number\>* **destination interface** *\<interface\>* **no-isolate**

**monitor session** *\<number\>* **destination interface** *\<interface\>* **no-tag**

**monitor session** *\<number\>* **destination interface** *\<interface\>* **no-isolate no-tag**

**monitor session** *\<number\>* **destination interface** *\<interface\>* **no-tag no-isolate**

**monitor session** *\<number\>* **source interface** *\<interface\>*

**monitor session** *\<number\>* **source interface** *\<interface\>* **both**

**monitor session** *\<number\>* **source interface** *\<interface\>* **rx**

**monitor session** *\<number\>* **source interface** *\<interface\>* **tx**

The different options shown in the variations above are:

*\<number\>* Selects the monitor session number (only one is allowed).

**destination** - Selects the destination interface.

**source** - Selects the source interface(s). A range of interfaces is allowed.

**both** - Optional. Monitors both transmitted and received traffic.

**rx** - Optional. Monitors received traffic only.

**tx** - Optional. Monitors transmitted traffic only.

**no-tag** - In some situations, it may be important to monitor traffic on a trunk port. In this situation, it is important not to tag the VLAN traffic so that it is easier to analyze from a packet capture. This option removes the VLAN tag that is normally appended to mirrored traffic.

**no-isolate** - Allows native traffic to continue to pass on the port set as the mirroring session destination.

**Default Values**

By default, traffic is monitored in both directions. Also by default, the destination port is isolated from passing native traffic.

## Usage Examples

The following example sets Ethernet 0/1 as the destination interface and adds Ethernet 0/2, Ethernet 0/3 as source ports:

(config)\#**monitor session 1 destination interface eth 0/1** (config)\#**monitor session 1 source interface eth 0/2-3**

The following example sets Gigabit-Switchport 0/1 as the destination interface and removes the VLAN tag:

(config)\#**monitor session 1 destination interface gigabit-switchport 0/1 no-tag**

The following example sets Switchport 0/1 as the source interface and monitors both transmitted and received traffic:

(config)\#**monitor session 1 source interface switchport 0/1 both**

The following example sets Switchport 0/2 through Switchport 0/12 as source interfaces and monitors only received traffic: (config)\#**monitor session 1 source interface eth 0/2-12 rx**

## Configuration in Web GUI

To configure port mirroring from the Web GUI, navigate to the port mirroring sub-menu under Utilities

## Troubleshooting

A good command to verify the correct ports are being monitored is:

*Syntax*: **show monitor session** \[all | \<1-1\>\]

This command is available from the Enable mode context. Below is the output of a show monitor session where Switchport 0/1 is monitoring all traffic from Switchport 0/2:

Switch\#**show monitor session all**

---

Imported from https://wiki.wireshark.org/SwitchReference/Adtran on 2020-08-11 23:26:03 UTC
