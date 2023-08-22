# Allied Telesis Reference

## Allied Ware Plus (AW+)

Switches running AW+ can mirror (or monitor) traffic in different ways, depending on your needs.\
Mirroring can be done by
- mirroring traffic from one or more ports to another
- selectively mirror traffic to a mirror port
- mirroring traffic of remote switches

### Basic Mirror Port

To mirror traffic from one or more ports to a mirror port on the same machine or stack use:

```
mirror interface <source-port-list> direction {both|receive|transmit}
```

Apply this command to the mirror port (the port which will re-transmit the mirrored port's traffic).\
Define the mirrored ports in `<source-port-list>` like `port1.0.15`, `port2.0.5-2.0.6` or `port1.0.15,port2.0.4`, along with the desired traffic direction.

To mirror any traffic passing `port3.1.7` or `port4.2.1` to the mirror port `port1.0.1`, see the following example:

```
awplus# configure terminal
awplus(config)# interface port1.0.1
awplus(config-if)# mirror interface port3.1.7,port4.2.1 direction both
```

To remove a mirrored port from a mirror port use the `no`-variant along with the port name. The mirror port will revert to a normal port after all `mirror` commands are removed.

```
no mirror interface <source-port-list>
```

### Selectively mirror traffic

If only certain traffic is of interest, it makes sense to not mirror everything that passes a port. Also, when mirroring multiple ports or both directions, the mirror port can easily be overloaded.

To selectively mirror traffic, define a mirror port with an empty source port list.
```
mirror interface none
```

Then, define an ACL that matches the traffic of interest and use `copy-to-mirror` as action parameter.

To mirror traffic on `port2.1.9` which is destined to the IP address 192.168.1.1 to the mirror port `port1.0.1`, see the following example:

```
awplus# configure terminal

awplus(config)# access-list hardware myTestAcl
awplus(config-ip-hw-acl)# 10 copy-to-mirror ip any 192.168.1.1/32
awplus(config-ip-hw-acl)# exit

awplus(config)# interface port1.0.1
awplus(config-if)# mirror interface none
awplus(config-if)# exit

awplus(config)# interface port2.1.9
awplus(config)# access-group myTestAcl
```

### Remote Mirroring

Remote mirroring can be complex. Please refer to vendor's _Mirroring Feature Overview and Configuration Guide_.

## Legacy AT-S Software

> NOTE: This is an old documentation.

Connect to the switch through either one of the 3 methods specified above (Telnet, HTTP, RS-232). Default login: manager Default password: friend

Using the GUI go to the Port administration menu. Select Port Mirroring. At the Mirror Port specify the port number of the Analyzing/Monitoring equipment. At the source port(s) specify the ports you want to analyze. NOTE: you can define a range of ports (ex: 2-24), selective ports (ex: 2,3,4) or mixed ports selection (2,4-24). The Mirror port cannot be included in the selection of ports to be analyzed/monitored. After entering the port selection, save the settings. You are ready to go.

Or from the command line, for example to mirror trafic bothways on ports 1 and 2 to port 11, mirror port (11 in this case) should be in vlan1 before starting

```
set switch mirror=11
enable switch mirror
set switch port=1,2 mirror=both
```

To turn it off use

```
disable switch mirror
set switch port=1,2 mirror=none
```

For the moment being, I found no bugs or problems. Please note that older versions of FIRMWARE can give you trouble as the switch has the bad tendency to "lock" and the only way to re-enable your network is to reboot it.

> NOTE: On the Switchblade series, you can (and should) specify which 'switch instance' you are referring to - in particular, 'enable switch mirror' will enable mirroring on all switch instances - probably not what you want. Instead do 'enable switch mirror instance=1.0 *****
