# frame "protocol"

The frame protocol isn't a real protocol itself, but used by Wireshark as a base for all the protocols on top of it. It shows information from capturing, such as the exact time a specific frame was captured. You could think of it as a pseudo dissector.

## History

This feature has existed for a long time in Wireshark.

## Protocol dependencies

This pseudo-protocol doesn't run atop other protocols.

## Example traffic

All capture files include this pseudo-protocol, so specific examples aren't useful.

## Wireshark

The frame dissector is fully functional.

## Preference Settings

Configuration options are under Edit-\>Preferences-\>Frame.  
![201108_frame_preferences](uploads/8d708c782b23ad2f30718875fb95b72e/201108_frame_preferences.png)  
"Show File Offset" adds a file offset to the frame tree, and "Treat all frames as DOCSIS frames" forces each frame to be dissected as DOCSIS. See [CaptureSetup/DOCSIS](/CaptureSetup/DOCSIS) for more information.
  
Preferences also available by right clicking on a packet:  
![201108_frame_preferences_2](uploads/a6f61be75fc821fe89364dd03eafe43d/201108_frame_preferences_2.png)

## Example capture file

All capture files include this pseudo-protocol, so specific examples aren't useful.

## Display Filter

A complete list of frame display filter fields can be found in the [display filter reference](http://www.wireshark.org/docs/dfref/f/frame.html)

Examples:

Show only the frames from number 20 to 40:

``` 
 frame.number >= 20 && frame.number <= 40 
```

Hide all frames:

``` 
 not frame 
```

## Capture Filter

A capture filter for the frame pseudo protocol wouldn't make sense, as it would have to accept all packets and reject no packets.

## External links

  - there are no external links

## Discussion

---

Imported from https://wiki.wireshark.org/Protocols/frame on 2020-08-11 23:19:47 UTC
