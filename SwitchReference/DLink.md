# DLink

***Note: DGS-1216T Web Smart - use the admin web interface to set Mirror Settings. See page 50 of manual.***

## xStack Gigabit Managed Switches

#### (Including the DGS-3427, DGS-3450, and DGS-3324SRi)

Once logged into the switch (and if necessary in enable mode using `` `enable admin` ``), use the `` `show mirror` `` command to display any current port mirroring configuration:

``` 
    switch:4#show mirror
    Command: show mirror

    Current Settings
    Mirror Status: Disabled
    Target Port  : X
    Mirrored Port
               RX:
               TX:

    switch:4#
```

To actually configure port mirroring, use the `` `config mirror` `` command which takes various options including the port to mirror too, which port(s) to mirror (the "source" port(s)), and whether to mirror rx (received packets), tx (transmitted packets), or both. A basic example of the command format is as follows:

``` 
    switch:4#config mirror port 4 add source ports 12 both
    Command: config mirror port 4 add source ports 12 both

    Success.

    switch:4#show mirror
    Command: show mirror

    Current Settings
    Mirror Status: Disabled
    Target Port  : 4
    Mirrored Port
               RX: 12
               TX: 12

    switch:4#
```

and then enable the mirroring:

``` 
    switch:4#enable mirror
    Command: enable mirror

    Success.

    switch:4#
```

And that should just about do it.

---

Imported from https://wiki.wireshark.org/SwitchReference/DLink on 2020-08-11 23:26:07 UTC
