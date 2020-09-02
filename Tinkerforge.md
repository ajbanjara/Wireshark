# Tinkerforge Protocol (TFP)

TFP is developed by Tinkerforge for supporting so called [Bricks](https://www.tinkerforge.com/en/doc/Hardware/Bricks/Bricks.html) and [Bricklets](https://www.tinkerforge.com/en/doc/Hardware/Bricklets/Bricklets.html). Bricks and Bricklets are small hardware modules that can be used to control different motor types (stepper, dc, servo), read out lots of sensors (temperature, humidity, ambient light, air pressure, moisture, etc) and for interaction with humans (displays, potis, leds, buttons, joysticks, etc).

All of these modules are controlled from a PC, bindings are available for C/C++, C\#, Delphi, Java, PHP, Python, Ruby, Shell and VB.NET.

The protocol was first developed in 2010. It uses both, USB and TCP/IP. The above mentioned bindings use TCP/IP to communicate with a so called Brick Daemon, which translates the TCP/IP packages to USB to talk with the Bricks and Bricklets. With so called [Master Extensions](https://www.tinkerforge.com/en/doc/Hardware/Master_Extensions/Master_Extensions.html) it is also possible to directly communicate with the Bricks/Bricklets over TCP/IP via Ethernet or [WiFi](/wi-fi).

With the TFP dissector it is possible to debug the Brick Daemon (USB dissection) and the Bindings (TCP/IP dissection). The dissector also is very useful for developing a Binding for a new language.

## Protocol dependencies

  - [TCP](/TCP): TFP uses as its transport protocol. TCP port for TFP traffic is 4223.

  - [USB](/USB): TFP uses as its transport protocol. Bulk interface type and custom device class is used on USB.

## Information

  - For capturing and dissecting TFP over USB one must first start the capture on Wireshark and after that connect the Tinkerforge device to USB.

## Example payload

    Tinkerforge Protocol, UID: 6JJUT5, Len: 8, FID: 2, Seq: 12
        UID (String): 6JJUT5
        UID (Numeric): 3765449266
        Length: 8
        Function ID: 2
        1100 .... = Sequence Number: 12
        .... 1... = Response Expected: 1
        .... .0.. = Authentication: 0
        .... ..00 = Other Options: 0
        00.. .... = Error Code: 0
        ..00 0000 = Future Use: 0

## Wireshark

The TFP dissector is fully functional.

## Example capture file

Here is a sample capture file containing dissected TFP protocol over TCP/IP and USB.

  - [SampleCaptures/tfp\_capture\_tcp\_usb.pcapng](uploads/__moin_import__/attachments/SampleCaptures/tfp_capture_tcp_usb.pcapng)

## Display Filter

Show only the TFP based traffic:

``` 
 tfp
```

Show only the TFP based traffic based on UID (String) field:

``` 
 tfp.uid
```

Show only the TFP based traffic based on UID (Numeric) field:

``` 
 tfp.uid_numeric
```

Show only the TFP based traffic based on Length field:

``` 
 tfp.len
```

Show only the TFP based traffic based on Function ID field:

``` 
 tfp.fid
```

Show only the TFP based traffic based on Sequence Number field:

``` 
 tfp.seq
```

Show only the TFP based traffic based on R field:

``` 
 tfp.r
```

Show only the TFP based traffic based on A field:

``` 
 tfp.a
```

Show only the TFP based traffic based on OO (Other Options) field:

``` 
 tfp.oo
```

Show only the TFP based traffic based on E (Error) field:

``` 
 tfp.e
```

Show only the TFP based traffic based on Future Use field:

``` 
 tfp.future_use
```

## Capture Filter

Capture only the TFP based traffic:

``` 
 tfp
```

## External links

  - Details of the Tinkerforge protocol <http://www.tinkerforge.com/en/doc/Low_Level_Protocols/TCPIP.html#llproto-tcpip>

  - Source code of the Wireshark dissector <https://github.com/Tinkerforge/tf-wireshark-dissector>

---

Imported from https://wiki.wireshark.org/Tinkerforge on 2020-08-11 23:26:40 UTC
